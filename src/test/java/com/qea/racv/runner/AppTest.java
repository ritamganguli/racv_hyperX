package com.qea.racv.runner;

import com.aventstack.extentreports.ExtentReports;
import com.lambdatest.tunnel.Tunnel;
import com.qea.racv.repo.Global;
import com.qea.racv.utils.ExtentReport;
import com.qea.racv.utils.ReadConfigProps;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.CucumberPropertiesProvider;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.ITestContext;
import org.testng.ITestListener;
import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import org.testng.internal.BaseTestMethod;
import org.testng.xml.XmlTest;

/**
 * AppTest class.
 *
 */
public class AppTest implements ITestListener {
  // Randomly shuffle the test order to prevent the default execution order
  private static final boolean SHUFFLE_TESTS = true;

  private static final Logger LOGGER = LogManager.getLogger();

  private TestNGCucumberRunner testNgCucumberRunner;
  private static ExtentReports extent;
  private static int snapshotCount = 0;
  private static List<String> failedTests = new ArrayList<>();
  private static List<String> passedTests = new ArrayList<>();
  private Tunnel ltTunnel;
  private static String lambdaUsername;
  private static String lambdaKey;

  /**
   * Add a test to the passed tests list.
   *
   * @param test Name of the test
   */
  public static void addPassedTest(String test) {
    passedTests.add(test);
  }

  /**
   * Add a test to the failed tests list.
   *
   * @param test Name of the test
   */
  public static void addFailedTest(String test) {
    failedTests.add(test);
  }

  /**
   * Get the number of smartui screenshots for each breakpoint and device currently taken during
   * this execution.
   *
   * @return Number of smartui screenshots
   */
  public static int getSmartuiSnapshotsCount() {
    return snapshotCount;
  }

  /**
   * Increment the visual test screenshot counter.
   *
   * @param i Number to screenshots increment by
   */
  public static void incrementSnapshotsCount(int i) {
    snapshotCount += i;
  }

  /**
   * Get the extent report.
   *
   * @return Extent report object
   */
  public static ExtentReports getExtent() {
    return extent;
  }

  /**
   * Constructor method.
   *
   * @throws Exception Throws exception when config.properties fails
   */
  public AppTest() throws Exception {
    Thread.currentThread().setName("MAIN");
    LOGGER.info("Constructer");
    if (!ReadConfigProps.readConfigProperties()) {
      throw new Exception("Fatal error with config.properties");
    }
  }

  /**
   * Set up the cucumber runner.
   */
  @BeforeClass(alwaysRun = true)
  public void setUpCucumber(ITestContext context) {
    Thread.currentThread().setName("MAIN");
    LOGGER.info("Before class");

    // Get tags from config.properties file
    String tags = ReadConfigProps.getTags();
    LOGGER.info("Tags: {}", tags);

    Class<?> testClass = this.getClass();
    // add "tags" option and value into @CucumberOptions
    try {
      changeCucumberAnnotation(testClass, "tags", tags.trim());
    } catch (Exception e) {
      LOGGER.error("Failed to inject tags");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return;
    }

    try {
      extent = ExtentReport.createExtent();
    } catch (Exception e) {
      LOGGER.error("Error creating extent report");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return;
    }

    if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("LAMBDA")) {
      lambdaUsername = ReadConfigProps.getLambdaUsername();
      lambdaKey = ReadConfigProps.getLambdaKey();
    } else if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("HYPEREXECUTE")) {
      lambdaUsername = System.getenv("LT_USERNAME");
      lambdaKey = System.getenv("LT_ACCESS_KEY");
    }

    if (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")) {
      try {
        // Creates an instance of Lambda Local Tunnel
        ltTunnel = new Tunnel();
        LOGGER.info("logging....");
        HashMap<String, String> ltLocalArgs = new HashMap<String, String>();

        ltLocalArgs.put("user", lambdaUsername);
        ltLocalArgs.put("key", lambdaKey);
        ltLocalArgs.put("tunnelName", "MavenParallel");
        ltLocalArgs.put("logFile",
            "src/test/resources/logs/" + Global.getRunTime() + "/ltLocal.log");
        ltTunnel.start(ltLocalArgs);
        // Check if Lambda local instance is running
        LOGGER.info("Lambda Local is running: {}", ltTunnel.toString());
      } catch (Exception e) {
        LOGGER.error("Failed to start Lambda local");
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        e.printStackTrace();
      }
    }

    // Load the @CucumberOptions from TestNG XML
    XmlTest currentXmlTest = context.getCurrentXmlTest();
    CucumberPropertiesProvider properties = currentXmlTest::getParameter;

    testNgCucumberRunner = new TestNGCucumberRunner(this.getClass(), properties);
  }

  /**
   * this method is for updating @CucumberOptions in TestNgRunner.java.
   *
   * @param className Name of the class
   * @param key Name of the key to replace
   * @param newValue New value to replace with
   * @throws NoSuchFieldException On error
   * @throws SecurityException On error
   * @throws IllegalArgumentException On error
   * @throws IllegalAccessException On error
   */
  private static void changeCucumberAnnotation(Class<?> className, String key, String newValue)
      throws NoSuchFieldException, SecurityException, IllegalArgumentException,
      IllegalAccessException {
    // get the CucumberOptions annotation
    Annotation options = className.getAnnotation(CucumberOptions.class);
    // setup handler so we can update Annotation using reflection. Basically creates a proxy for the
    // Cucumber Options class
    InvocationHandler proxyHandler = Proxy.getInvocationHandler(options);
    // the annotation key/values are stored in the memberValues field
    Field f = proxyHandler.getClass().getDeclaredField("memberValues");
    f.setAccessible(true); // suppress any access issues when looking at f
    LOGGER.info("Current annotations: {}", f.get(proxyHandler));

    // get the key-value map for the proxy
    @SuppressWarnings("unchecked")
    Map<String, String> memberValues = (Map<String, String>) f.get(proxyHandler);
    memberValues.remove(key); // renove the key entry...don't worry, we'll add it back
    memberValues.put(key, newValue); // add the new key-value pair. The annotation is now updated.
    LOGGER.info("Updated annotations: {}", f.get(proxyHandler));
  }

  /**
   * Function to concatenate all the tests into a string to be used by the TAGS property.
   *
   * @returns @Test1 or @Test2 or @Test3
   */
  private static String printTestString(List<String> resultList) {
    String string = "";
    int count = resultList.size();
    for (String test : resultList) {
      if (count-- > 1) {
        string += test + " or ";
      } else {
        string += test;
      }
    }
    return string;
  }

  @Test(groups = "cucumber", description = "Run Cucumber Features.", dataProvider = "scenarios")
  public void scenario(PickleWrapper pickleWrapper, FeatureWrapper featureWrapper) {
    try {
      // Set the thread name for logging purposes
      Thread.currentThread().setName(pickleWrapper.getPickle().getTags().get(0));
      LOGGER.info("Pickle wrapper: {}", pickleWrapper.getPickle().getName());
      testNgCucumberRunner.runScenario(pickleWrapper.getPickle());
    } catch (Exception e) {
      LOGGER.error("Error starting the scenario");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * Data Provider to execute Parallel scenarios. Randomly shuffle the scenarios so they are
   * executed in random order.
   */
  @DataProvider(parallel = true)
  public Object[][] scenarios() {
    if (testNgCucumberRunner == null) {
      return new Object[0][0];
    }

    if (SHUFFLE_TESTS) {
      LOGGER.debug("SHUFFLE_TESTS set to true, shuffling test execution order");
      LOGGER.debug("Starting scenarios order: {}",
          Arrays.deepToString(testNgCucumberRunner.provideScenarios()));

      Object[][] originalScenarios = testNgCucumberRunner.provideScenarios();

      // Convert the Object[][] to ArayList so we can shuffle it
      ArrayList<Object[]> scenariosList = new ArrayList<Object[]>(originalScenarios.length);
      for (Object[] foo : originalScenarios) {
        scenariosList.add(foo);
      }

      // Randomly shuffle it
      Collections.shuffle(scenariosList);

      // Convert back to Object[][] for the data provider
      Object[][] scenariosArray = new Object[scenariosList.size()][];
      for (int i = 0; i < scenariosList.size(); i++) {
        Object[] row = scenariosList.get(i);
        scenariosArray[i] = row;
      }

      LOGGER.debug("Shuffled scenarios order: {}", Arrays.deepToString(scenariosArray));
      return scenariosArray;
    } else {
      LOGGER.debug("SHUFFLE_TESTS set to false");
      return testNgCucumberRunner.provideScenarios();
    }
  }

  /**
   * Runs after method finishes.
   */
  @AfterMethod(alwaysRun = true)
  public void tearDownMethod(ITestResult result, ITestContext context, Object[] params) {
    LOGGER.info("tear down");
    try {
      // The below renames the test name for azure reporting to the first tag
      BaseTestMethod baseTestMethod = (BaseTestMethod) result.getMethod().clone();

      String tag = ((PickleWrapper) params[0]).getPickle().getTags().get(0);

      Field f = baseTestMethod.getClass().getSuperclass().getDeclaredField("m_methodName");
      f.setAccessible(true);
      f.set(baseTestMethod, tag);

      f = result.getClass().getDeclaredField("m_method");
      f.setAccessible(true);
      f.set(result, baseTestMethod);
    } catch (Exception e) {
      LOGGER.error("Error tearing down method");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    LOGGER.info("tear finished");
  }

  /**
   * Runs after class finishes.
   */
  @AfterClass(alwaysRun = true)
  public void tearDownClass() {
    try {
      LOGGER.info("tear down class");
      if (testNgCucumberRunner != null) {
        testNgCucumberRunner.finish();
      }

      if (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")) {
        if (ltTunnel != null) {
          ltTunnel.stop();
        }
      }

      LOGGER.info("Passed tests: {}", printTestString(passedTests));
      LOGGER.info("Failed tests: {}", printTestString(failedTests));
      extent.setSystemInfo("Passed Tests",
          "<textarea>" + printTestString(passedTests) + "</textarea>");
      extent.setSystemInfo("Failed Tests",
          "<textarea>" + printTestString(failedTests) + "</textarea>");
      extent.flush();
      LOGGER.info("tear down class finished");
    } catch (Exception e) {
      LOGGER.error("Error tearing down class");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * Runs after suite finishes.
   */
  @AfterSuite(alwaysRun = true)
  public void tearDownSuite() {
    try {
      LOGGER.info("tear down suite");
    } catch (Exception e) {
      LOGGER.error("Error tearing down suite");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }
}
