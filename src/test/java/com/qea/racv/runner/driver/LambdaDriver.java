package com.qea.racv.runner.driver;

import com.qea.racv.utils.ReadConfigProps;
import java.net.URL;
import java.util.HashMap;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.MutableCapabilities;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebDriver;

/**
 * Lambda driver handling.
 *
 * @author viengcumm_thongvilu
 *
 */
public class LambdaDriver implements BaseDriver {

  private static final Logger LOGGER = LogManager.getLogger();

  private RemoteWebDriver driver;
  private String lambdaBuildDefinitionName;
  private String sessionIdentifier = "";

  private static final String LT_SELENIUM_VERSION = "4.12.0";
  private static String lambdaUsername;
  private static String lambdaKey;
  private static final String LT_HUB = "@hub.lambdatest.com/wd/hub";
  private static final String LT_HUB_MOBILE = "@mobile-hub.lambdatest.com/wd/hub";
  private static String LT_URL;
  private static String LT_URL_MOBILE;

  public RemoteWebDriver getDriver() {
    return driver;
  }

  /**
   * Starts the driver.
   *
   * @param browserName The browser to start
   * @param platform The platform to start the browser on
   * @param executionPlatform The current platform the automation is running on
   * @param testName The name of the current test
   * @throws Exception Thrown when driver failed to start
   */
  public void startDriver(String browserName, String platform, String executionPlatform,
      String testName) throws Exception {
    LOGGER.info("Current browser: {}", browserName);
    LOGGER.info("Current platform: {}", platform);
    LOGGER.info("Current executionPlatform: {}", executionPlatform);

    // Use azure pipeline predefined variable Build.DefinitionName if set
    if (System.getenv("$BUILD_DEFINITIONNAME") == null
        || System.getenv("$BUILD_DEFINITIONNAME").isEmpty()) {
      // If this is not set then it means we are running locally, use computer
      // username to group executions
      lambdaBuildDefinitionName = System.getProperty("user.name");
      LOGGER.debug("Local BuildDefinitionName: {}", lambdaBuildDefinitionName);
    } else {
      lambdaBuildDefinitionName =
          System.getenv("$BUILD_DEFINITIONNAME") + " (" + System.getenv("$BUILD_BUILDID") + ")";
      LOGGER.debug("Azure BuildDefinitionName: {}", lambdaBuildDefinitionName);
    }

    if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("LAMBDA")) {
      lambdaUsername = ReadConfigProps.getLambdaUsername();
      lambdaKey = ReadConfigProps.getLambdaKey();
    } else if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("HYPEREXECUTE")) {
      lambdaUsername = System.getenv("LT_USERNAME");
      lambdaKey = System.getenv("LT_ACCESS_KEY");
    }
    LT_URL = "https://" + lambdaUsername + ":" + lambdaKey + LT_HUB;
    LT_URL_MOBILE = "https://" + lambdaUsername + ":" + lambdaKey + LT_HUB_MOBILE;

    switch (browserName) {
      case "firefox":
        firefoxHandler(platform, testName);
        break;

      case "chrome":
        if (platform.equals("ios-mobile")) {
          safariHandler(platform, testName);
        } else {
          chromeHandler(platform, testName);
        }
        break;

      case "safari":
        safariHandler(platform, testName);
        break;

      default:
        throw new IllegalArgumentException("Invalid BROWSER passed in config.properties !!");
    }
  }

  /**
   * Handles Safari driver.
   *
   * @param platform The platform to start the browser on
   * @param testName The name of the current test
   * @throws Exception Thrown when driver fails to start
   */
  private void safariHandler(String platform, String testName) throws Exception {
    LOGGER.info("Lambda safari session");

    MutableCapabilities capabilities = new MutableCapabilities();
    HashMap<String, Object> lambdaOptions = new HashMap<String, Object>();
    HashMap<String, Object> safariOptions = new HashMap<String, Object>();

    capabilities.setCapability("acceptInsecureCerts", true);

    if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("LAMBDA")) {
      lambdaOptions.put("tunnel", true); // Lambda true; HyperExecute false
    } else if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("HYPEREXECUTE")) {
      lambdaOptions.put("tunnel", false); // Lambda true; HyperExecute false
    }

    switch (platform) {
      case "ios-mobile":
        LOGGER.info("Safari ios-mobile");

        lambdaOptions.put("platformVersion", "(15.*),(16.*),(17.*)");
        lambdaOptions.put("platformName", "ios");
        lambdaOptions.put("deviceName", "(iPhone 1[36].*)");
        lambdaOptions.put("isRealMobile", true);
        lambdaOptions.put("build", lambdaBuildDefinitionName);
        lambdaOptions.put("name", testName);
        lambdaOptions.put("timezone", "Melbourne");
        lambdaOptions.put("console", true);
        lambdaOptions.put("w3c", true);
        lambdaOptions.put("visual", true);
        lambdaOptions.put("network", true);
        lambdaOptions.put("dedicatedProxy", true);
        // Below 2 options required for iOS tab switching
        //
        safariOptions.put("safariAllowPopups", true);
        safariOptions.put("autoAcceptAlerts", true);
        lambdaOptions.put("safari", safariOptions);
        capabilities.setCapability("LT:options", lambdaOptions);

        if (!createDriverOnLambda("ios-mobile", capabilities)) {
          throw new Exception("Cannot start the lambda driver");
        }

        break;
      case "desktop":
        LOGGER.info("Safari desktop");
        capabilities.setCapability("browserName", "Safari");
        capabilities.setCapability("browserVersion", "latest");

        lambdaOptions.put("os", "OS X");
        // lambdaOptions .put("osVersion", "Monterey");
        lambdaOptions.put("build", lambdaBuildDefinitionName);
        lambdaOptions.put("name", testName);
        lambdaOptions.put("resolution", DESKTOP_BROWSER_WIDTH + "x" + DESKTOP_BROWSER_HEIGHT);
        lambdaOptions.put("selenium_version", LT_SELENIUM_VERSION);
        lambdaOptions.put("timezone", "Melbourne");
        lambdaOptions.put("console", true);
        lambdaOptions.put("w3c", true);
        lambdaOptions.put("visual", true);
        lambdaOptions.put("network", true);
        lambdaOptions.put("dedicatedProxy", true);
        safariOptions.put("allowAllCookies", "true");
        // safariOptions.put("enablePopups", "true");
        // safariOptions.put("driver", "2.48");
        lambdaOptions.put("safari", safariOptions);
        capabilities.setCapability("LT:options", lambdaOptions);

        if (!createDriverOnLambda("desktop", capabilities)) {
          throw new Exception("Cannot start the lambda driver");
        }

        this.driver.manage().window().maximize();
        // Set file detector so it can upload files to lambda instance for form
        // file upload submissions
        this.driver.setFileDetector(new LocalFileDetector());

        break;
      default:
        break;
    }
  }

  /**
   * Handles Firefox driver.
   *
   * @param platform The platform to start the browser on
   * @param testName The name of the current test
   * @throws Exception Thrown when driver fails to start
   */
  private void firefoxHandler(String platform, String testName) throws Exception {
    LOGGER.info("Lambda firefox session");

    MutableCapabilities capabilities = new MutableCapabilities();
    capabilities.setCapability("browserName", "Firefox");
    capabilities.setCapability("browserVersion", "latest");
    capabilities.setCapability("acceptInsecureCerts", true);

    HashMap<String, Object> lambdaOptions = new HashMap<String, Object>();
    if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("LAMBDA")) {
      lambdaOptions.put("tunnel", true); // Lambda true; HyperExecute false
    } else if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("HYPEREXECUTE")) {
      lambdaOptions.put("tunnel", false); // Lambda true; HyperExecute false
    }

    lambdaOptions.put("os", "Windows");
    lambdaOptions.put("osVersion", "10");

    lambdaOptions.put("resolution", DESKTOP_BROWSER_WIDTH + "x" + DESKTOP_BROWSER_HEIGHT);
    lambdaOptions.put("selenium_version", LT_SELENIUM_VERSION);
    lambdaOptions.put("build", lambdaBuildDefinitionName);
    lambdaOptions.put("name", testName);
    lambdaOptions.put("timezone", "Melbourne");
    lambdaOptions.put("console", true);
    lambdaOptions.put("w3c", true);
    lambdaOptions.put("visual", true);
    lambdaOptions.put("network", true);
    lambdaOptions.put("dedicatedProxy", true);

    capabilities.setCapability("LT:options", lambdaOptions);

    LOGGER.info("The platform is: ", platform);
    if (!createDriverOnLambda("desktop", capabilities)) {
      throw new Exception("Cannot start the lambda driver");
    }

    this.driver.manage().window().maximize();
    // Set file detector so it can upload files to lambda instance for form
    // file upload submissions
    this.driver.setFileDetector(new LocalFileDetector());
  }

  /**
   * Handles chrome driver.
   *
   * @param platform The platform to start the browser on
   * @param testName The name of the current test
   * @throws Exception Thrown when driver fails to start
   */
  private void chromeHandler(String platform, String testName) throws Exception {
    LOGGER.info("Lambda chrome session");

    MutableCapabilities capabilities = new MutableCapabilities();
    capabilities.setCapability("acceptInsecureCerts", true);
    capabilities.setCapability("browserName", "Chrome");
    capabilities.setCapability("browserVersion", "latest");

    HashMap<String, Object> lambdaOptions = new HashMap<String, Object>();
    if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("LAMBDA")) {
      lambdaOptions.put("tunnel", true); // Lambda true; HyperExecute false
    } else if (ReadConfigProps.getExecutionPlatform().toUpperCase().equals("HYPEREXECUTE")) {
      lambdaOptions.put("tunnel", false); // Lambda true; HyperExecute false
    }

    switch (platform) {
      case "desktop":
        lambdaOptions.put("os", "Windows");
        lambdaOptions.put("osVersion", "10");
        lambdaOptions.put("selenium_version", LT_SELENIUM_VERSION);
        lambdaOptions.put("resolution", DESKTOP_BROWSER_WIDTH + "x" + DESKTOP_BROWSER_HEIGHT);
        lambdaOptions.put("build", lambdaBuildDefinitionName);
        lambdaOptions.put("name", testName);
        lambdaOptions.put("timezone", "Melbourne");
        lambdaOptions.put("console", true);
        lambdaOptions.put("w3c", true);
        lambdaOptions.put("visual", true);
        lambdaOptions.put("network", true);
        lambdaOptions.put("dedicatedProxy", true);

        capabilities.setCapability("LT:options", lambdaOptions);

        if (!createDriverOnLambda("desktop", capabilities)) {
          throw new Exception("Cannot start the lambda driver");
        }

        break;

      case "android-mobile":
        lambdaOptions.put("w3c", true);
        lambdaOptions.put("platformName", "android");
        lambdaOptions.put("deviceName", "(Galaxy S2[24].*)");
        lambdaOptions.put("platformVersion", "(13.*),(14.*),(15.*)");
        lambdaOptions.put("build", lambdaBuildDefinitionName);
        lambdaOptions.put("name", testName);
        lambdaOptions.put("isRealMobile", true);
        lambdaOptions.put("visual", true);
        lambdaOptions.put("network", true);
        lambdaOptions.put("timezone", "Melbourne");
        lambdaOptions.put("console", true);
        lambdaOptions.put("dedicatedProxy", true);

        capabilities.setCapability("LT:options", lambdaOptions);

        if (!createDriverOnLambda("android-mobile", capabilities)) {
          throw new Exception("Cannot start the lambda driver");
        }

        break;

      default:
        LOGGER.info("Invalid browser or device !!");
        break;
    }

    switch (platform) {
      case "desktop":
        // this.driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(60));
        this.driver.manage().window().maximize();

        // Set file detector so it can upload files to lambda instance for form
        // file upload submissions
        this.driver.setFileDetector(new LocalFileDetector());
        break;
      default:
        break;
    }

    LOGGER.info("Web driver started");
  }

  private boolean createDriverOnLambda(String platform, MutableCapabilities capabilities) {
    // Try start the driver 3 times if we get an error
    int count = 0;
    while (true) {
      try {
        LOGGER.info("capabilities: {}", capabilities);

        if (platform == "desktop") {
          this.driver = new RemoteWebDriver(new URL(LT_URL), capabilities, false);
        } else {
          this.driver = new RemoteWebDriver(new URL(LT_URL_MOBILE), capabilities, false);
        }

        LOGGER.info("Successfully created lambda driver");
        break;
      } catch (Exception e) {
        LOGGER.info("Failed created lambda driver");
        // Retry 3 times if we time out
        if (count++ >= 3) {
          LOGGER.error("Error starting the lambda driver");
          LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
          return false;
        }
        LOGGER.info("Error creating lambda driver, retrying");
      }
    }

    sessionIdentifier = driver.getSessionId().toString();
    return true;
  }

  @Override
  public String getSessionId() {
    return sessionIdentifier;
  }
}
