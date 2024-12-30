package com.qea.racv.tests;

import com.aventstack.extentreports.MediaEntityBuilder;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.markuputils.ExtentColor;
import com.aventstack.extentreports.markuputils.MarkupHelper;
import com.aventstack.extentreports.model.Media;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.qea.racv.repo.Global;
import com.qea.racv.repo.Global.Click;
import com.qea.racv.repo.Global.IframeDirection;
import com.qea.racv.repo.Global.Redirect;
import com.qea.racv.repo.Global.ReplaceText;
import com.qea.racv.repo.Global.TabType;
import com.qea.racv.repo.Result;
import com.qea.racv.runner.AppTest;
import com.qea.racv.runner.TestNgRunner;
import com.qea.racv.utils.GetScreenShot;
import com.qea.racv.utils.ReadConfigProps;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.testng.CucumberOptions;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jsoup.Jsoup;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.Assert;
import org.xml.sax.SAXException;

/**
 * Step definition class to bind Cucumber to functions.
 *
 */
public class StepDefinition {

  // Initialize logger
  private static final Logger LOGGER = LogManager.getLogger();

  private static String[] getStringIntersection(String[] array1, String[] array2) {
    Set<String> s1 = new HashSet<>(Arrays.asList(array1));
    Set<String> s2 = new HashSet<>(Arrays.asList(array2));
    s1.retainAll(s2);

    return s1.toArray(new String[0]);
  }

  private Global globalObj;
  private String testName;

  private boolean testHasFailed = false;

  /**
   * Fails the test with the provided message.
   *
   * @param message The message to log in the debug logs.
   */
  public void assertFailure(String message) {
    testHasFailed = true;
    final String strippedMessage = Jsoup.parse(message).text();
    Assert.assertTrue(false, strippedMessage);
  }

  /**
   * Before method which runs before new every scenario.
   *
   * @param scenario The current scenario to run
   * @throws ParserConfigurationException n/a
   * @throws SAXException n/a
   * @throws IOException n/a
   */
  @Before
  public void before(Scenario scenario)
      throws ParserConfigurationException, SAXException, IOException {
    final String[] scenarioTags = scenario.getSourceTagNames().toArray(new String[] {});
    // First tag is the test name
    testName = scenarioTags[0];

    // Initialize variables
    globalObj = new Global();

    final String[] optionsTags = getTagsFromAnnotations(TestNgRunner.class);
    final String[] runningTag = getStringIntersection(scenarioTags, optionsTags);
    // Running tag is the tag used to start the automation, not the currently running test tag
    final String testRunningTag = runningTag[0];

    String testPlatform = null;
    String testBrowser = null;

    // Set variables based on tag name
    if (testRunningTag.contains(".")) {
      final String[] splitTags = testRunningTag.split("\\.");
      final int numTags = splitTags.length;
      if (numTags == 3) {
        // 3 tags @test.chrome.mobile
        testPlatform = splitTags[numTags - 1];
        testBrowser = splitTags[numTags - 2];
      }
    } else {
      // Single tag @test default to chrome desktop
      testPlatform = "desktop";
      testBrowser = "chrome";
    }

    if (testPlatform == null || testBrowser == null) {
      // Fail the test if incorrect tag format given
      LOGGER.info("Invalid tag format specified: {}", testRunningTag);
      globalObj.createExtentTest(testName, scenario.getName(), "", "");
      reportFailure("Invalid tag format specified " + testRunningTag);
    }

    // If we are on an authoring test, set the flag which is used for certain functions
    if (testName.toLowerCase().contains("authoring")) {
      globalObj.setIsAuthoringTest(true);
    }
    globalObj.setCurrentBrowserName(testBrowser);
    globalObj.setCurrentBrowserPlatform(testPlatform);
    globalObj.createExtentTest(testName, scenario.getName(), testBrowser, testPlatform);
  }

  /**
   * This step definition captures and reports the current page address.
   * 
   */
  @Then("I capture the address navigated to")
  public void captureAddressNavigatedTo() {
    LOGGER.info("Inside i_capture_the_address_navigated_to()");
    String addressNavigatedTo = globalObj.getCurrentUrl();
    LOGGER.info("Address navigated to: {}", addressNavigatedTo);
    // Log into the Report
    globalObj.extentTestLog(Status.INFO, "Address navigated to: " + wrapInHref(addressNavigatedTo));
  }

  /**
   * This method captures the text of an element.
   *
   * @author Jing Zuo
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I capture the text of {string} on {string} screen")
  public void captureTheTextOnScreen(String objectName, String screenName) {
    String value;
    try {
      value = globalObj.getElementText(objectName, screenName);
      // Report as passed or failed
      if (value != null) {
        LOGGER.info("Capture text succussfully");
        reportSuccess("The value of " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " is " + value);
      } else {
        LOGGER.info("Capture text failed");
        reportFailure("The value of " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " is NOT being displayed");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("The " + wrapInLabel(screenName) + " screen does not exist in the objectmap");
    }

  }

  /**
   * This step checks the console for errors and deprecated warnings.
   * 
   */
  @Then("I check the console for errors")
  public void checkAndClearConsoleErrors() {
    // Cannot get console logs from lambda mobile
    if ((ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
        || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE"))
        && (globalObj.getCurrentBrowserPlatform().contentEquals("ios-mobile")
            || globalObj.getCurrentBrowserPlatform().contentEquals("android-mobile"))) {
      globalObj.extentTestLog(Status.PASS,
          "Skipping console error check, not supported on lambdatest mobile");
      return;
    }

    List<LogEntry> consoleErrors = globalObj.getConsoleMessages(Level.WARNING);
    String consoleErrorString = "";
    // If we have severe errors or deprecated warnings we fail the step
    boolean severeErrors = false;
    boolean deprecatedWarnings = false;
    if (consoleErrors.size() != 0) {
      for (LogEntry logEntry : consoleErrors) {
        if (logEntry.getLevel().equals(Level.SEVERE)) {
          consoleErrorString += logEntry.toString() + System.lineSeparator();
          severeErrors = true;
          break;
        }

        if (logEntry.getLevel().equals(Level.WARNING)
            && logEntry.getMessage().toLowerCase().contains("deprecate")) {
          consoleErrorString += logEntry.toString() + System.lineSeparator();
          deprecatedWarnings = true;
          break;
        }
      }

      if (severeErrors) {
        LOGGER.info("Current tab has console errors");
        globalObj.extentTestLog(Status.FAIL,
            "Current tab has console errors<br><br>" + wrapInCodeBlock(consoleErrorString));
        assertFailure("Current tab has console errors");
        return;
      }

      if (deprecatedWarnings) {
        LOGGER.info("Current tab has deprecated warnings");
        globalObj.extentTestLog(Status.WARNING,
            "Current tab has deprecated warnings<br><br>" + wrapInCodeBlock(consoleErrorString));
        return;
      }
    }

    globalObj.extentTestLog(Status.PASS, "Current tab console is error free");
    LOGGER.info("Current tab console is error free");

  }

  /**
   * This step validates if a user has navigated to the desired page address/URL.
   *
   * @param url The url to check
   */
  @Then("I check page address is {string}")
  public void checkPageAddressIs(String url) {
    LOGGER.info("Inside checkPageAddress() method");
    // Invoke helper method
    final String newUrl = globalObj.configureUrl(url);
    final boolean result = globalObj.checkPageAddressContains(newUrl);
    // Capture the actual address
    String actualPageAddress = globalObj.getWebDriver().getCurrentUrl();
    // Report as passed or failed
    if (result) {
      LOGGER.info("Page navigation correct");
      reportSuccess("User has navigated to correct page: " + wrapInHref(newUrl));
    } else {
      LOGGER.info("Page navigation NOT correct");
      reportFailure("User has NOT navigated to correct page. Actual Address is: "
          + wrapInHref(actualPageAddress));
    }
  }

  /**
   * This step verifies if part/specific bits of an address matches to the passed value.
   *
   * @param urlFragment Fragment or url to check for
   */
  @Then("I check the page address contains {string}")
  public void checkThePageAddressContains(String urlFragment) {
    LOGGER.info("Inside i_check_the_page_address_contains() method");
    // Need to replace AEM/URL with config property
    final String newFragment = globalObj.configureUrl(urlFragment);
    // Invoke helper method
    final boolean result = globalObj.checkPageAddressFragment(newFragment);
    // Capture the actual address
    String actualPageAddress = "null";
    try {
      actualPageAddress = globalObj.getWebDriver().getCurrentUrl();
    } catch (Exception e) {
      /* do nothing */
    }
    // Report as passed or failed
    if (result) {
      LOGGER.info("Page navigation correct");
      reportSuccess("Current url " + wrapInHref(actualPageAddress) + " contains "
          + wrapInCodeBlock(newFragment));
    } else {
      LOGGER.info("Page navigation NOT correct");
      reportFailure("Current url " + wrapInHref(actualPageAddress) + " does not contain "
          + wrapInCodeBlock(newFragment));
    }
  }

  /**
   * This step selects all test pages left behind (if any) by component authoring suite.
   *
   * @param pagePattern The pattern to look for when selecting by page name eg, test-automation-
   * @param pageContainerObjectName The name of the page container object in the map
   * @param screenName The name of the page container object's screen name in the map
   */
  @Then("I delete all test pages starting with {string} under {string} tree on {string} screen")
  public void cleanUpTheTestPagesStartingWithUnderTreeOnScreen(String pagePattern,
      String pageContainerObjectName, String screenName) {
    final Object result =
        globalObj.deleteAllTestPages(pagePattern, pageContainerObjectName, screenName);

    if (result instanceof String) {
      String resultString = (String) result;
      // Report as passed or failed
      switch (resultString) {
        case "FAILED":
          LOGGER.info("Failed to delete test pages");
          reportFailure("Failed to delete test pages");
          break;
        case "NOT REQUIRED":
          globalObj.extentTestLog(Status.INFO, "Test pages not found, nothing to delete");
          LOGGER.info("Test pages not found, nothing to delete");
          break;
        default:
          LOGGER.info("Unknown result string");
          reportFailure("Unknown result string");
          break;
      }
    } else {
      @SuppressWarnings("unchecked")
      List<String> resultList = (List<String>) result;
      String deleteList = "";
      for (String s : resultList) {
        deleteList += s + System.lineSeparator();
      }
      LOGGER.info("Test pages have been deleted successfully");
      reportSuccess(
          "Test pages " + wrapInCodeBlock(deleteList) + " have been deleted successfully");
    }
  }

  /**
   * This step clears the contents for a web element, mainly test input or area.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I clear contents of {string} element on {string} screen")
  public void clearContentsOfElementOnScreen(String objectName, String screenName) {
    LOGGER.info("Inside i_clear_contents_of_element_on_screen()");
    final boolean result = globalObj.clearContents(objectName, screenName);
    if (result) {
      LOGGER.info("Contents cleared successfully for {}", objectName);
      globalObj.extentTestLog(Status.INFO, "Clear content for " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " page ");
    } else {
      LOGGER.info("Failed to clear contents for {}", objectName);
      reportFailure("Failed to clear contents for " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " page ");
    }
  }

  /**
   * This method clicks and presses on the element, I release click step def should be called when
   * finished.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I click and hold {string} on {string} screen")
  public void clickAndHoleElement(String objectName, String screenName) {
    LOGGER.info("inside i_clickandhold_element");
    boolean result = globalObj.clickAndHold(objectName, screenName);
    if (result) {
      reportSuccess(objectName + " element was click and held");
    } else {
      reportFailure(objectName + " element was not click and held");
    }
  }

  /**
   * Clicking an element on application screen, element is scrolled into view before clicking.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} on {string} screen")
  public void clickElement(String objectName, String screenName) {
    LOGGER.info("Inside clickElement()");
    final Click status = globalObj.genericClick(objectName, screenName, true);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    if (status == Click.SUCCESS) {
      LOGGER.info("Click success");
      reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen");
    } else {
      LOGGER.info("Click failed");
      reportFailure("User is NOT able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * Clicking an element if found on application screen, will not fail the test if element does not
   * exist.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} if found on {string} screen")
  public void clickElementIfFound(String objectName, String screenName) {
    LOGGER.info("Inside clickElementIfFound()");
    final Click status = globalObj.genericClick(objectName, screenName, true);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    switch (status) {
      case SUCCESS:
        LOGGER.info("Click success");
        reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen");
        break;
      case FAILED:
        LOGGER.info("Click failed");
        reportFailure("User is NOT able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen");
        break;
      case ELEMENTNOTFOUND:
        LOGGER.info("Click element not found");
        globalObj.extentTestLog(Status.INFO, "Element not found - User is NOT able to click "
            + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        break;
      default:
        break;
    }
  }

  /**
   * Attempt to click an element on application screen without scrolling.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} without scrolling on {string} screen")
  public void clickElementNoScroll(String objectName, String screenName) {
    LOGGER.info("Inside clickElementNoScroll()");
    final Click status = globalObj.genericClick(objectName, screenName, false);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    if (status == Click.SUCCESS) {
      LOGGER.info("Click success");
      reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen");
    } else {
      LOGGER.info("Click failed");
      reportFailure("User is NOT able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * This step is a variation to the Click statement and needs to be used when selenium click fails,
   * will not fail if element not found.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} if found on {string} screen using Action class")
  public void clickIfFoundOnScreenUsingActionClass(String objectName, String screenName) {
    LOGGER.info("Inside clickElementIfFound() Action Class");
    final Click status = globalObj.genericClickActionClass(objectName, screenName);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    switch (status) {
      case SUCCESS:
        LOGGER.info("Click success");
        reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen");
        break;
      case FAILED:
        LOGGER.info("Click failed");
        reportFailure("User is NOT able to click using Action Class "
            + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        break;
      case ELEMENTNOTFOUND:
        LOGGER.info("Click element not found");
        globalObj.extentTestLog(Status.INFO,
            "Element not found - User is NOT able to click using Action Class "
                + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        break;
      default:
        break;
    }
  }

  /**
   * This step clicks on an element if found using the java script executor, will not fail the test
   * if element does not exist.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} if found on {string} screen using JavaScript")
  public void clickIfFoundOnScreenUsingJavaScript(String objectName, String screenName) {
    LOGGER.info("Inside clickElementIfFound() JavaScript");
    final Click status = globalObj.genericClickJs(objectName, screenName);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    switch (status) {
      case SUCCESS:
        LOGGER.info("Click success");
        reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen using JavaScript");
        break;
      case FAILED:
        LOGGER.info("Click failed");
        reportFailure("User is NOT able to click using JavaScript "
            + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        break;
      case ELEMENTNOTFOUND:
        LOGGER.info("Click element not found");
        globalObj.extentTestLog(Status.INFO,
            "Element not found - User is NOT able to click using JavaScript "
                + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        break;
      default:
        break;
    }
  }

  /**
   * Clicking an element without scrolling if found on application screen, will not fail the test if
   * element does not exist.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} without scrolling if found on {string} screen")
  public void clickNoScrollElementIfFound(String objectName, String screenName) {
    LOGGER.info("Inside clickElementIfFound()");
    final Click status = globalObj.genericClick(objectName, screenName, false);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    switch (status) {
      case SUCCESS:
        LOGGER.info("Click success");
        reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen");
        break;
      case FAILED:
        LOGGER.info("Click failed");
        reportFailure("User is NOT able to click " + wrapInLabel(objectNameFormatted) + " on "
            + wrapInLabel(screenName) + " screen");
        break;
      case ELEMENTNOTFOUND:
        globalObj.extentTestLog(Status.INFO, "Element not found - User is NOT able to click "
            + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
        LOGGER.info("Click element not found");
        break;
      default:
        break;
    }
  }

  /**
   * This step is a variation to the Click statement and needs to be used when selenium click fails.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} on {string} screen using Action class")
  public void clickOnScreenUsingActionClass(String objectName, String screenName) {
    LOGGER.info("Inside clickElement() Action Class");
    final Click status = globalObj.genericClickActionClass(objectName, screenName);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    if (status == Click.SUCCESS) {
      LOGGER.info("Click success");
      reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen using Action class");
    } else {
      LOGGER.info("Click failed");
      reportFailure("User is NOT able to click using Action Class "
          + wrapInLabel(objectNameFormatted) + " on " + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * This step clicks on an element using the java script executor.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I click {string} on {string} screen using JavaScript")
  public void clickOnScreenUsingJavaScript(String objectName, String screenName) {
    LOGGER.info("Inside clickElement() JavaScript");
    final Click status = globalObj.genericClickJs(objectName, screenName);

    // Shorten the object name if it's too long
    String objectNameFormatted = globalObj.parseTextToType(objectName);
    if (objectNameFormatted.length() > 30) {
      objectNameFormatted = objectNameFormatted.substring(0, 30) + "...";
    }

    // Report as passed or failed
    if (status == Click.SUCCESS) {
      LOGGER.info("Click success");
      reportSuccess("User is able to click " + wrapInLabel(objectNameFormatted) + " on "
          + wrapInLabel(screenName) + " screen using JavaScript");
    } else {
      LOGGER.info("Click failed");
      reportFailure("User is NOT able to click using JavaScript " + wrapInLabel(objectNameFormatted)
          + " on " + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * Closes the browser/driver.
   */
  @Then("I close the browser")
  public void closeTheBrowser() {
    try {
      // Close driver
      if (globalObj.getWebDriver() != null) {

        // LT - mark test as passed if testHasFailed is false
        // we dont need to handle failures because the failure status should be set the failing
        // method
        if (!testHasFailed && (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
            || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE"))) {
          markLambdaTestStatus("passed", "Browser closed successfully on Lambda",
              globalObj.getWebDriver());
        }

        if (globalObj.closeBrowser()) {
          LOGGER.info("Browser successfully closed");
        }
      } else {
        LOGGER.info("Browser object was null");
      }

      globalObj.extentTestLog(Status.PASS, "Browser closed successfully");
    } catch (Exception e) {
      LOGGER.error("Failed to close the Browser");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Failed to close the Browser");
    }
  }

  /**
   * Create a fold-able extent node.
   *
   * @param nodeName Name of the node
   */
  @Then("I create a new test log node {string}")
  public void createExtentNode(String nodeName) {
    globalObj.createExtentNode(nodeName);
  }

  /**
   * Navigates to omni search and deletes all pages by tag search.
   *
   * @param tag The tag to search for
   * @param pageName Page name to search for
   * @param searchPath The path to search under
   * @param screenName The name of the page container object's screen name in the map
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  @Then("I delete all test pages starting with {string} with tag {string} under {string} path on {string} screen")
  public void deletePagesByTag(String pageName, String tag, String searchPath, String screenName) {
    final Object result = globalObj.deletePagesByTag(tag, pageName, searchPath, screenName);

    if (result instanceof String) {
      String resultString = (String) result;
      // Report as passed or failed
      switch (resultString) {
        case "FAILED":
          LOGGER.info("Failed to delete test pages by tag");
          reportFailure("Failed to delete test pages by tag, check the error log");
          break;
        case "NOT REQUIRED":
          globalObj.extentTestLog(Status.INFO, "Test pages not found, nothing to delete");
          LOGGER.info("Test pages not found, nothing to delete");
          break;
        default:
          LOGGER.info("Unknown result string by tag");
          reportFailure("Unknown result string, check the error log");
          break;
      }
    } else {
      @SuppressWarnings("unchecked")
      List<String> resultList = (List<String>) result;
      String deleteList = "";
      for (String s : resultList) {
        deleteList += s + System.lineSeparator();
      }
      LOGGER.info("Test pages have been deleted successfully");
      reportSuccess(
          "Test pages " + wrapInCodeBlock(deleteList) + " have been deleted successfully");
    }
  }

  /**
   * This step checks if Emergency Banner is displayed and then closes the same for smooth
   * execution.
   * 
   */
  @Given("I dismiss emergency banner if it exists")
  public void dismissEmergencyBannerIfItExists() {
    LOGGER.info("Inside i_dismiss_emergency_banner_if_it_exists() method");
    // Take a screenshot of the page before any action
    final Media screenshot = MediaEntityBuilder.createScreenCaptureFromBase64String(
        GetScreenShot.getScreenshotBase64(globalObj.getWebDriver())).build();
    final boolean result = globalObj.closeEmergencyBanner();
    // Report as passed or failed
    if (result) {
      LOGGER.info("Emergency banner close successful");
      // If we closed the banner then we use the screenshot in the report
      globalObj.extentTestLog(Status.PASS,
          "Emergency banner notification exists and has been closed", screenshot);
    } else {
      LOGGER.info("Emergency banner was not being displayed");
      globalObj.extentTestLog(Status.INFO, "Emergency banner notification was not being displayed");
    }
  }

  /**
   * This step checks if GDPR notification is displayed and then closes the same for smooth
   * execution.
   * 
   */
  @Given("I dismiss GDPR notification if it exists")
  public void dismissGdprNotificationIfItExists() {
    LOGGER.info("Inside i_dismiss_GDPR_notification_if_it_exists() method");
    // Take a screenshot of the page before any action
    final Media screenshot = MediaEntityBuilder.createScreenCaptureFromBase64String(
        GetScreenShot.getScreenshotBase64(globalObj.getWebDriver())).build();
    final boolean result = globalObj.closeGdprNotification();
    // Report as passed or failed
    if (result) {
      LOGGER.info("GDPR close successful");
      globalObj.extentTestLog(Status.PASS, "GDPR notification exists and has been closed",
          screenshot);
    } else {
      LOGGER.info("GDPR was not being displayed");
      globalObj.extentTestLog(Status.INFO, "GDPR notification was not being displayed");
    }
  }

  /**
   * This method drags the element by moving the mouse from its current position by the given
   * offset.
   *
   * @author Jing Zuo
   * @param objectName The name of the object referencing the element in the map
   * @param offsetX Horizontal offset. A negative value means moving the mouse left.
   * @param offsetY Vertical offset. A negative value means moving the mouse down
   * @param screenName The name of the object's screen
   */
  @Then("I drag {string} element {string},{string} on {string} screen")
  public void dragElementByOffset(String objectName, String offsetX, String offsetY,
      String screenName) {
    LOGGER.info("inside i_resize_element");
    boolean result = globalObj.dragMouseByOffset(objectName, screenName, offsetX, offsetY);
    if (result) {
      reportSuccess(objectName + " element was dragged by " + offsetX
          + "px in the horizontal direction and " + offsetY + "px in the veritical direction");
    } else {
      reportFailure(objectName + " element was not dragged");
    }
  }

  /**
   * This step is to drag and drop the file in a field on a given screen.
   *
   * @author Dheeban Raj
   * @param sourceObjectName Name of the source object in the map
   * @param sourceScreenName Name of the sources object's screen in the map
   * @param destObjectName Name of the destination object in the map
   * @param destScreenName Name of the destination object's screen in the map
   */
  @Then("I drag {string} from {string} screen and drop in {string} on  {string} screen")
  public void dragFromScreenAndDropInOnScreen(String sourceObjectName, String sourceScreenName,
      String destObjectName, String destScreenName) {
    LOGGER.info("Inside clickElement() Action Class");
    final boolean result = globalObj.genericDragAndDropActionClass(sourceObjectName,
        sourceScreenName, destObjectName, destScreenName);
    // Report as passed or failed
    if (result) {
      LOGGER.info("Drag and Drop passed");
      reportSuccess("User is able to drag " + wrapInLabel(sourceObjectName) + " on "
          + wrapInLabel(sourceScreenName) + " screen and drop in " + wrapInLabel(destObjectName)
          + " on " + wrapInLabel(destScreenName) + " screen");
    } else {
      LOGGER.info("Drag and Drop failed");
      reportFailure("User is NOT able to drag and drop using Action Class "
          + wrapInLabel(sourceObjectName) + " on " + wrapInLabel(sourceScreenName) + " screen");
    }

  }

  /**
   * Enter details in a field on application screen.
   *
   * @param text Text to enter into the field
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I enter {string} details in {string} on {string} screen")
  public void enterElement(String text, String objectName, String screenName) {
    final String textTyped = globalObj.typeTextIntoElement(text, objectName, screenName, false);

    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully");
      reportSuccess("Successfully typed " + wrapInCodeBlock(textTyped) + " in "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName) + " screen");
    } else {
      LOGGER.info("Failed to enter details");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text)) + " in "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * Sets the value property in a field on application screen using javascript.
   *
   * @param text Text to enter into the field
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I enter {string} details in {string} on {string} screen using JavaScript")
  public void enterElementJavaScript(String text, String objectName, String screenName) {
    final String textTyped = globalObj.typeTextIntoElement(text, objectName, screenName, true);
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully");
      reportSuccess(
          "Successfully typed " + wrapInCodeBlock(textTyped) + " in " + wrapInLabel(objectName)
              + " on " + wrapInLabel(screenName) + " screen using JavaScript");
    } else {
      LOGGER.info("Failed to enter details");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text)) + " in "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
          + " screen using JavaScript");
    }
  }

  /**
   * Sets the value property in a field on application screen using javascript.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param multiLine multi line text to enter
   */
  @Then("I enter below details in {string} on {string} screen using JavaScript")
  public void enterElementMultiLineJavaScript(String objectName, String screenName,
      String multiLine) {
    final String textTyped = globalObj.typeTextIntoElement(multiLine, objectName, screenName, true);
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully");
      reportSuccess(
          "Successfully typed " + wrapInCodeBlock(textTyped) + " in " + wrapInLabel(objectName)
              + " on " + wrapInLabel(screenName) + " screen using JavaScript");
    } else {
      LOGGER.info("Failed to enter details");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(multiLine))
          + " in " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
          + " screen using JavaScript");
    }
  }

  /**
   * This step evaluates an expression on the elements value/text as a date.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param operator Operator (<, >, >=, <=, !=, ==)
   * @param expectedValue Number of days from now as the expected value
   * @param screenName The name of the object's screen
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  @Then("I evaluate {string} as date in format {string} is {string} {string} days from now on {string} screen")
  public void evaluateAsDateExpression(String objectName, String format, String operator,
      String expectedValue, String screenName) {
    try {
      final boolean result =
          globalObj.evaluateDateExpression(objectName, format, operator, expectedValue, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("Evaluate date expression passed");
        reportSuccess("The " + wrapInLabel(objectName) + " date value is " + wrapInLabel(operator)
            + " " + wrapInLabel(expectedValue) + " days from now on " + wrapInLabel(screenName)
            + " screen");
      } else {
        LOGGER.info("Evaluate date expression failed");
        reportFailure("The " + wrapInLabel(objectName) + " date value is NOT "
            + wrapInLabel(operator) + " " + wrapInLabel(expectedValue) + " days from now on "
            + wrapInLabel(screenName) + " screen");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This step evaluates an expression on the elements value/text as a number.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param operator Operator (<, >, >=, <=, !=, ==)
   * @param expectedValue The expected value
   * @param screenName Name of the object's screen in the map
   */
  @Then("I evaluate {string} as number is {string} {string} on {string} screen")
  public void evaluateAsNumberExpression(String objectName, String operator, String expectedValue,
      String screenName) {
    try {
      final boolean result =
          globalObj.evaluateNumberExpression(objectName, operator, expectedValue, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("Evaluate number expression passed");
        reportSuccess("The " + wrapInLabel(objectName) + " number value is " + wrapInLabel(operator)
            + " " + wrapInLabel(expectedValue) + " on " + wrapInLabel(screenName) + " screen");
      } else {
        LOGGER.info("Evaluate number expression failed");
        reportFailure(
            "The " + wrapInLabel(objectName) + " number value is NOT " + wrapInLabel(operator) + " "
                + wrapInLabel(expectedValue) + " on " + wrapInLabel(screenName) + " screen");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This step ends the test by closing the browser and flushing the report. Does not explicitly
   * need to be called as it will always run due to @after tag.
   */
  @After
  @Then("I end the test")
  public void finalizeTheTest(Scenario scenario) {
    if (scenario.isFailed()) {
      AppTest.addFailedTest(testName);
    } else {
      AppTest.addPassedTest(testName);
    }
    closeTheBrowser();
    globalObj.flushReport();
  }

  /**
   * This method sets the focus on the desired element.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I focus {string} element on {string} screen")
  public void focusElement(String objectName, String screenName) {
    LOGGER.info("inside i_focus_element");
    boolean result = globalObj.focusElement(objectName, screenName);
    if (result) {
      reportSuccess(objectName + " element was focussed");
    } else {
      reportFailure(objectName + " element was not focussed");
    }
  }

  /**
   * This step definition gets the object in JSON string.
   *
   * @param jsObject Name of JS object e.g. digitalData
   */
  @When("I get object data for {string}")
  public void getAnalyticsDataFor(String jsObject) {
    String jsonResult = globalObj.getJavaScriptObject(jsObject);
    if (jsonResult != null) {
      LOGGER.info("Object data for {}: {}", jsObject, jsonResult);
      reportSuccess(
          "Object data for " + wrapInLabel(jsObject) + " - " + wrapInCodeBlock(jsonResult));
    } else {
      LOGGER.info("Failed to get object data for {}: {}", jsObject, jsonResult);
      reportFailure("Failed to get object data for - " + wrapInLabel(jsObject) + " - "
          + wrapInCodeBlock(jsonResult));
    }
  }

  private String[] getTagsFromAnnotations(Class<?> clazz) {
    CucumberOptions options = clazz.getAnnotation(CucumberOptions.class);
    String tags = options.tags();

    // Strip 'and not @xxxx' as it cannot be a running tag as it is a exclusion keyword
    tags = tags.replaceAll(" and not \\(?[. @\\-A-Za-z0-9]+\\)?", "");
    // Strip any curved brackets
    tags = tags.replaceAll("[()]", "");

    if (tags.contains(" or ")) {
      return tags.split(" or ");
    }

    return new String[] {tags};
  }

  /**
   * Navigate back to the previous page.
   *
   * @author Jing Zuo
   */
  @Then("I navigate back to the previous page")
  public void goBackToLastPage() {
    try {
      // Navigate back to the previous page and log as a Pass
      globalObj.navigateBackPage();
      reportSuccess("Succeed to navigate back to the previous page");
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Log a fail if there was an exception with refreshing
      reportFailure("Fail to navigate back to the previous page");
    }
  }

  /**
   * This method to handle alert by accepting it.
   *
   * @author Dheebanraj
   */

  @Then("I handle the alert by accepting")
  public void handleTheAlertByAccepting() {
    try {
      boolean result = globalObj.acceptAlert();
      // Report as passed or failed
      if (result) {
        reportSuccess("Alert handled");
      } else {
        reportFailure("Alert NOT found on screen");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This step definition helps perform a hover action on a specific element on a screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @When("I hover on {string} on {string} screen using Action class")
  public void hoverOnScreenUsingActionClass(String objectName, String screenName) {
    LOGGER.info("Inside hoverActionClass()");
    final boolean result = globalObj.genericHoverActionClass(objectName, screenName);
    // Report as passed or failed
    if (result) {
      LOGGER.info("Hover action successful");
      reportSuccess("User is able to Hover on " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " screen");
    } else {
      LOGGER.info("Hover action Failed");
      reportFailure("User is NOT able to hover using Action Class " + wrapInLabel(objectName)
          + " on " + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * Generic launch app function used by launch app step definitions.
   */
  private void launchApp() {
    final String testBrowser = globalObj.getCurrentBrowserName();
    final String testPlatform = globalObj.getCurrentBrowserPlatform();

    // Only turn the link into an anchor link in the report if it starts with http
    String message;
    if (ReadConfigProps.getUrl().startsWith("http")) {
      message = testBrowser + " on " + testPlatform + " launched with URL: "
          + wrapInHref(ReadConfigProps.getUrl());
    } else {
      message =
          testBrowser + " on " + testPlatform + " launched with URL: " + ReadConfigProps.getUrl();
    }

    try {
      if (globalObj.launchApp("")) {
        if ((ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("Lambda")
            || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("Hyperexecute"))) {
          message +=
              "<br>Lambda Session <a href='https://automation.lambdatest.com/logs/?sessionID="
                  + ((RemoteWebDriver) globalObj.getWebDriver()).getSessionId() + "'>"
                  + ((RemoteWebDriver) globalObj.getWebDriver()).getSessionId() + "</a>";
        }

        globalObj.extentTestLog(Status.INFO, message);
        LOGGER.info("App launched");
      } else {
        reportFailure("Failed to launch: " + message);
      }
    } catch (Exception e) {
      LOGGER.error("Failed to launch app: {}", message);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Failed to launch: " + message);
    }
  }

  /**
   * Launch browser on specified browser and platform.
   *
   * @param browser browser name
   * @param platform platform name
   */
  @Given("I launch app on {string} on {string}")
  public void launchAppOnBrowserPlatform(String browser, String platform) {
    if (!launchDriver(browser, platform)) {
      reportFailure(
          "Failed to launch driver for " + wrapInLabel(browser) + " on " + wrapInLabel(platform));
    }
    launchApp();
  }

  /**
   * Launch chrome desktop for given url. If non 200 page on AEM is loaded, failure is returned.
   *
   * @param url url to launch
   */
  @Given("I launch app page {string}")
  public void launchAppPage(String url) {
    if (!launchDriver()) {
      reportFailure("Failed to launch driver");
    }
    launchPage(url);
  }

  /**
   * Launch url on specified browser and plaform. Non 200 AEM page load will return an error.
   *
   * @param url url of page
   * @param browser browser to launch the url on
   * @param platform platform to run the browser on
   */
  @Given("I launch app page {string} on {string} on {string}")
  public void launchAppPageBrowserPlatform(String url, String browser, String platform) {
    if (!launchDriver(browser, platform)) {
      reportFailure(
          "Failed to launch driver for " + wrapInLabel(browser) + " on " + wrapInLabel(platform));
    }
    launchPage(url);
  }

  /**
   * Launch url on specified browser and plaform ignoring AEM page load errors.
   *
   * @param url url of page
   * @param browser browser to launch the url on
   * @param platform platform to run the browser on
   */
  @Given("I launch app page {string} on {string} on {string} ignoring errors")
  public void launchAppPageBrowserPlatformIgnoringErrors(String url, String browser,
      String platform) {
    if (!launchDriver(browser, platform)) {
      reportFailure(
          "Failed to launch driver for " + wrapInLabel(browser) + " on " + wrapInLabel(platform));
    }
    launchPage(url, true);
  }

  /**
   * Launch chrome desktop for given url. Ignores any page load errors on AEM.
   *
   * @param url url to launch
   */
  @Given("I launch app page {string} ignoring errors")
  public void launchAppPageIgnoreErrors(String url) {
    if (!launchDriver()) {
      reportFailure("Failed to launch driver");
    }
    launchPage(url, true);
  }

  /**
   * Launch browser on chrome desktop.
   * 
   */
  @Given("I launch app")
  public void launchAppStandard() {
    if (!launchDriver()) {
      reportFailure("Failed to launch driver");
    }
    launchApp();
  }

  /**
   * This method launches the web driver based on the tag name (default chrome windows).
   */
  private boolean launchDriver() {
    return launchDriver(globalObj.getCurrentBrowserName(), globalObj.getCurrentBrowserPlatform());
  }

  /**
   * This method launches the web driver for the given browser and platform.
   *
   * @param browser browser name
   * @param platform platform name
   * @return true if successful
   */
  private boolean launchDriver(String browser, String platform) {
    LOGGER.info("Launching driver for {} on {}", browser, platform);

    if (!globalObj.initializeObjDriver(browser, platform, testName)) {
      return false;
    }

    return true;
  }

  /**
   * Generic launch app page function used by launch app page step definitions.
   */
  private void launchPage(String url) {
    launchPage(url, false);
  }

  /**
   * Generic launch app page function used by launch app page step definitions.
   *
   * @param ignoreErrors Set to true to fail if non 200 page is loaded
   */
  private void launchPage(String url, boolean ignoreErrors) {
    // Manipulate the URL to replace either AEM or URL to the config prop value
    final String newUrl = globalObj.configureUrl(url);

    final String testBrowser = globalObj.getCurrentBrowserName();
    final String testPlatform = globalObj.getCurrentBrowserPlatform();

    String message;
    // Only turn the link into an anchor link in the report if it starts with http
    if (newUrl.startsWith("http")) {
      message = testBrowser + " on " + testPlatform + " launched with URL: " + wrapInHref(newUrl);
    } else {
      message = testBrowser + " on " + testPlatform + " launched with URL: " + newUrl;
    }

    try {
      if (globalObj.launchApp(newUrl, ignoreErrors)) {
        if ((ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("Lambda")
            || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("Hyperexecute"))) {
          message +=
              "<br>Lambda Session <a href='https://automation.lambdatest.com/logs/?sessionID="
                  + ((RemoteWebDriver) globalObj.getWebDriver()).getSessionId() + "'>"
                  + ((RemoteWebDriver) globalObj.getWebDriver()).getSessionId() + "</a>";
        }

        LOGGER.info("App launched");
        reportSuccess(message);
      } else {
        reportFailure("Failed to launch: " + message);
      }
    } catch (Exception e) {
      LOGGER.error("Failed to launch app: {}", message);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Failed to launch: " + message);
    }
  }

  /**
   * This method marks Lambda test status as passed or failed.
   *
   * @param status the status to set in lambda
   * @param reason reason description
   * @param driver driver object
   */
  private void markLambdaTestStatus(String status, String reason, WebDriver driver) {
    if (driver != null) {
      try {
        final String testPlatform = globalObj.getCurrentBrowserPlatform();
        LOGGER.info("The current test platform is : {}", testPlatform);
        LOGGER.info("Updating lambda test status and messsage");

        JavascriptExecutor jse = (JavascriptExecutor) driver;
        String statusEscaped = StringEscapeUtils.escapeEcmaScript(status);
        String remarkEscaped = StringEscapeUtils.escapeEcmaScript(Jsoup.parse(reason).text());

        if (testPlatform.equals("desktop")) {
          Map<String, String> action = new HashMap();
          action.put("status", statusEscaped);
          action.put("reason", remarkEscaped);

          jse.executeScript("lambda-action", action);

        } else {
          String script = "lambda-hook: {\"action\": \"setTestStatus\", \"arguments\": "
              + "{\"status\": \"" + statusEscaped + "\", \"remark\": \"" + remarkEscaped + "\"}}";

          jse.executeScript(script);

        }


      } catch (Exception e) {
        LOGGER.error("Failed to update lambda test status and messsage");
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      }
    }
  }

  /**
   * This step helps in navigating to a desired address. Step will fail if 400 or 500 error is
   * returned by AEM.
   *
   * @param url Url of page
   */
  @Then("I navigate to {string}")
  public void navigateTo(String url) {
    navigateTo(url, false);
  }

  /**
   * This step helps in navigating to a desired address.
   *
   * @param url Url of page
   * @param ignoreErrors Fail on error if ignoreErrors is false
   */
  public void navigateTo(String url, boolean ignoreErrors) {
    LOGGER.info("Inside I_navigate_to()");

    final String newUrl = globalObj.configureUrl(url);
    // Invoke helper method
    final boolean result = globalObj.navigateToPage(newUrl, ignoreErrors);
    // Report as passed or failed
    if (result) {
      LOGGER.info("Page navigation successful");
      reportSuccess("User has navigated to: " + wrapInHref(newUrl) + " page successfully");
    } else {
      LOGGER.info("Page navigation Failed");
      reportFailure("User was NOT able to navigate to:" + wrapInHref(newUrl));
    }
  }

  /**
   * This step helps in navigating to a desired address.
   *
   * @param url Url of page
   * @param ignoreErrors Fail on error if ignoreErrors is false
   */
  @Then("I navigate to {string} ignoring errors")
  public void navigateToIgnoringErrors(String url, boolean ignoreErrors) {
    navigateTo(url, true);
  }

  /**
   * This method opens AEM properties page by manipulating the current pages URL.
   *
   * @author Jing Zuo
   */
  @Then("I open the AEM properties page")
  public void openPropertiesPage() {
    String currentPageAddress = globalObj.getWebDriver().getCurrentUrl();
    LOGGER.info("The current page address: {}", currentPageAddress);

    String propertyMode = "mnt/overlay/wcm/core/content/sites/properties.html?item=";
    String newPageAddress;

    int indexHtml = currentPageAddress.indexOf(".html");

    if (currentPageAddress.contains("tmp")) {
      // when current address contains "tmp"
      int indexTmp = currentPageAddress.indexOf("tmp");
      newPageAddress = currentPageAddress.substring(0, indexTmp) + propertyMode + "/"
          + currentPageAddress.substring(indexTmp, indexHtml);
    } else if (currentPageAddress.contains("editor.html")) {
      // when current address contains "editor.html"
      newPageAddress = currentPageAddress.replace("editor.html", propertyMode);
    } else {
      // when current address contains "sites.html"
      newPageAddress = currentPageAddress.replace("sites.html", propertyMode);
    }

    LOGGER.info("The new page address is: {}", newPageAddress);

    final boolean result = globalObj.navigateToPage(newPageAddress);
    // Report as passed or failed
    if (result) {
      LOGGER.info("Page navigation successful");
      reportSuccess("User has navigated to " + wrapInHref(newPageAddress) + " page successfully");
    } else {
      LOGGER.info("Page navigation Failed");
      reportFailure("User was NOT able to navigate to " + wrapInHref(newPageAddress));
    }
  }

  /**
   * Refresh the current page.
   *
   * @author Viengcumm Thongvilu
   */
  @Then("I refresh the page")
  public void refreshThePage() {
    try {
      // Refresh the page and log as a Pass
      globalObj.refreshPage();
      reportSuccess("Page refreshed");
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Log a fail if there was an exception with refreshing
      reportFailure("Page failed to refresh");
    }
  }

  /**
   * This method releases the click press off the element that was clicked down.
   *
   * @author Viengcumm Thongvilu
   */
  @Then("I release click")
  public void releaseClick() {
    boolean result = globalObj.releaseClick();
    if (result) {
      reportSuccess("Click press was released");
    } else {
      reportFailure("Release click press reported an error");
    }
  }

  /**
   * This method searches and replaces all occurrences of search text with replace text.
   *
   * @author Viengcumm Thongvilu
   * @param searchText The text to search for
   * @param replaceText The text to replace with
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I replace {string} details with {string} in {string} on {string} screen")
  public void replaceText(String searchText, String replaceText, String objectName,
      String screenName) {
    try {
      replaceText = globalObj.configureUrl(replaceText);
      ReplaceText status = globalObj.replaceText(searchText, replaceText, objectName, screenName);

      // Report as passed or failed
      switch (status) {
        case SUCCESS:
          LOGGER.info("replace successfully");
          reportSuccess("Replaced first occurrence of" + wrapInCodeBlock(screenName) + " with"
              + wrapInCodeBlock(replaceText) + " in " + wrapInLabel(objectName) + " on "
              + wrapInLabel(screenName) + " screen");
          break;
        case SEARCHTEXTNOTFOUND:
          LOGGER.info("search text not found");
          reportFailure("Search text" + wrapInCodeBlock(screenName) + " NOT found in object "
              + wrapInLabel(objectName) + " on " + wrapInLabel(screenName) + " screen");
          break;
        case OBJECTNOTFOUND:
          LOGGER.info("object not found");
          reportFailure("Object " + wrapInLabel(objectName) + " NOT found on "
              + wrapInLabel(screenName) + " screen");
          break;
        case FAILED:
          LOGGER.info("replace failed");
          reportFailure("Failed to type search text into object " + wrapInLabel(objectName) + " on "
              + wrapInLabel(screenName) + " screen");
          break;
        default:
          LOGGER.info("Unknown status");
          reportFailure("Unknown status returned when typing search text into object "
              + wrapInLabel(replaceText) + " on " + wrapInLabel(screenName) + " screen");
          break;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This method searches and replaces all occurrences of search text if found, with replace text
   * (always passes).
   *
   * @author Viengcumm Thongvilu
   * @param searchText The text to search for
   * @param replaceText The text to replace with
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I replace {string} details if found with {string} in {string} on {string} screen")
  public void replaceTextIfFound(String searchText, String replaceText, String objectName,
      String screenName) {
    try {
      replaceText = globalObj.configureUrl(replaceText);
      ReplaceText status = globalObj.replaceText(searchText, replaceText, objectName, screenName);

      // Report as passed or failed
      switch (status) {
        case SUCCESS:
          LOGGER.info("replace successfully");
          reportSuccess("Replaced first occurrence of" + wrapInCodeBlock(searchText) + " with"
              + wrapInCodeBlock(replaceText) + " in " + wrapInLabel(objectName) + " on "
              + wrapInLabel(screenName) + " screen");
          break;
        case SEARCHTEXTNOTFOUND:
          globalObj
              .extentTestLog(Status.INFO,
                  "Search text" + wrapInCodeBlock(searchText) + " NOT found in object "
                      + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
                      + " screen, continuing",
                  MediaEntityBuilder
                      .createScreenCaptureFromBase64String(
                          GetScreenShot.getFullPageScreenshotBase64(globalObj.getWebDriver()))
                      .build());
          LOGGER.info("search text not found");
          break;
        case OBJECTNOTFOUND:
          LOGGER.info("object not found");
          reportFailure("Object " + wrapInLabel(objectName) + " NOT found on "
              + wrapInLabel(screenName) + " screen");
          break;
        case FAILED:
          LOGGER.info("replace failed");
          reportFailure("Failed to type text into object " + wrapInLabel(objectName) + " on "
              + wrapInLabel(screenName) + " screen");
          break;
        default:
          LOGGER.info("Unknown status");
          reportFailure("Unknown status returned when typing search text into object "
              + wrapInLabel(replaceText) + " on " + wrapInLabel(screenName) + " screen");
          break;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * Helper method to log failures and take a screenshot for the extent report file. Calls
   * assertFailure to fail the test.
   */
  private void reportFailure(String message) {
    testHasFailed = true;
    String screenshot;
    try {
      // Try to log the console warnings/errors to file
      final List<LogEntry> consoleLogs = globalObj.getConsoleMessages(Level.WARNING);
      List<String> consoleMessages = new ArrayList<>();
      if (consoleLogs.size() > 0) {
        for (LogEntry log : consoleLogs) {
          consoleMessages.add(log.toString());
        }
        final Gson gson = new GsonBuilder().setPrettyPrinting().create();
        LOGGER.info("Console logs: ");
        LOGGER.info(gson.toJson(consoleMessages));
      }
    } catch (Exception e) {
      // do nothing
    }

    try {
      // Mobile does not support full page screenshot
      if (globalObj.getCurrentBrowserPlatform().contentEquals("ios-mobile")
          || globalObj.getCurrentBrowserPlatform().contentEquals("android-mobile")) {
        screenshot = GetScreenShot.getScreenshotBase64(globalObj.getWebDriver());
      } else {
        screenshot = GetScreenShot.getFullPageScreenshotBase64(globalObj.getWebDriver());
      }
    } catch (Exception e) {
      // if something fails with the screenshot, use the default error image
      screenshot = GetScreenShot.getFailedScreenshotImage();
    }

    // LT Specific commands
    if (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
        || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE")) {
      // Scroll the whole page down so we can see the error messages in video recording
      try {
        globalObj.scrollPageTo("100");
      } catch (Exception e) {
        // do nothing
      }

      // Mark test as failed
      try {
        markLambdaTestStatus("failed", message, globalObj.getWebDriver());
      } catch (Exception e) {
        // do nothing
      }
    }

    try {
      // log failures and take a screenshot for the extent report file
      Media mediaScreenshot =
          MediaEntityBuilder.createScreenCaptureFromBase64String(screenshot).build();
      globalObj.extentTestLog(Status.FAIL, message, mediaScreenshot);
    } catch (Exception e) {
      // Screenshot failed, log message only
      globalObj.extentTestLog(Status.FAIL, message);
    }

    assertFailure(message);
  }

  /**
   * Helper method to mark test as passed for the extent report file and lambda.
   */
  private void reportSuccess(String message) {
    // log Pass for the extent report file
    globalObj.extentTestLog(Status.PASS, message);
  }

  /**
   * Scroll the element so it's in view in the window.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I scroll {string} element on {string} screen into view")
  public void scroll_element_into_view(String objectName, String screenName) {
    LOGGER.info("Checking redirect");

    boolean result = globalObj.scrollToElement(objectName, screenName);
    if (result) {
      reportSuccess("Successfully scrolled " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " into view");
    } else {
      reportFailure("Failed to scroll " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
          + " into view");
    }
  }

  /**
   * This method scrolls the element to the desired percentage.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param scrollPercent Position of the elements scroll bar to scroll to in percentage
   * @param screenName The name of the object's screen
   */
  @Then("I scroll {string} element by {string} percent on {string} screen")
  public void scrollElementByPercent(String objectName, String scrollPercent, String screenName) {
    boolean result = globalObj.scrollElement(objectName, scrollPercent, screenName);
    if (result) {
      reportSuccess(objectName + " element was scrolled to " + wrapInLabel(scrollPercent + "%"));
    } else {
      reportFailure(
          objectName + " element failed to scroll to " + wrapInLabel(scrollPercent + "%"));
    }
  }

  /**
   * This method the window to the desired percentage.
   *
   * @author Viengcumm Thongvilu
   * @param scrollPercent Position of the windows scroll bar to scroll to in percentage
   */
  @Then("I scroll the window to {string} percent")
  public void scrollPageToPercent(String scrollPercent) {
    boolean result = globalObj.scrollPageTo(scrollPercent);
    if (result) {
      reportSuccess("Window was scrolled to " + wrapInLabel(scrollPercent + "%"));
    } else {
      reportFailure("Failed to scroll Window to " + wrapInLabel(scrollPercent + "%"));
    }
  }

  /**
   * Selects all text using CTRL+A for the given element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I select all text on {string} element on {string} screen")
  public void selectAllText(String objectName, String screenName) {
    final boolean result = globalObj.selectAllText(objectName, screenName);
    if (result) {
      reportSuccess("Successfully selected all text " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName));
    } else {
      reportFailure("Failed to select all text " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName));
    }
  }

  /**
   * Selects all text using JS for the given element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I select all text on {string} element on {string} screen using JavaScript")
  public void selectAllTextJs(String objectName, String screenName) {
    final boolean result = globalObj.selectAllTextUsingJs(objectName, screenName);
    if (result) {
      reportSuccess("Successfully selected all text using JS " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName));
    } else {
      reportFailure("Failed to select all text using JS " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName));
    }
  }

  /**
   * This step helps in selecting a value from drop down or coral-select-item/group.
   *
   * @param valueToSelect Value to select
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param selectionType value, index or visibletext
   */
  @SuppressWarnings("checkstyle:LineLength")
  @Then("I select {string} value for {string} drop down in {string} screen using selection method {string}")
  public void selectValueForDropDownInScreenUsingSelectionMethod(String valueToSelect,
      String objectName, String screenName, String selectionType) {
    // Call method to select a value from dropdown
    final boolean result =
        globalObj.selectValueFromDropDown(valueToSelect, objectName, screenName, selectionType);
    // Compare and report
    // Report as passed or failed
    if (result) {
      LOGGER.info("Selection successful from dropdown");
      reportSuccess("Value - " + valueToSelect + " has been selected from - "
          + wrapInLabel(objectName) + " drop down successfuly");
    } else {
      LOGGER.info("Selection NOT successful from dropdown");
      reportFailure("Could not select the desired value - " + valueToSelect + " from - "
          + wrapInLabel(objectName) + " dropdown");
    }
  }

  /**
   * This step definition helps switch to an iFrame or back to absolute parent.
   *
   * @param direction Valid values: TO, FROM, PARENT
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Given("I switch {string} iFrame {string} on {string} screen")
  public void switchIframeOnScreen(String direction, String objectName, String screenName) {
    LOGGER.info("Inside switch_iFrame() method");
    // Invoke helper method
    final boolean result = globalObj.switchIframe(IframeDirection.valueOf(direction.toUpperCase()),
        objectName, screenName);
    // Report as passed or failed
    if (result) {
      LOGGER.info("User has switched to iFrame");
      reportSuccess("User has switched to " + wrapInLabel(objectName) + " iFrame/page");
    } else {
      LOGGER.info("User could NOT switche to iFrame");
      reportFailure("User was NOT able to switch to " + wrapInLabel(objectName) + " iFrame/page");
    }
  }

  /**
   * This step facilitates switching between new and parent tabs within a browser.
   *
   * @param tabType Valid values: NEW or PARENT
   */
  @When("I switch to {string} browser tab")
  public void switchToBrowser_tab(String tabType) {
    LOGGER.info("Inside switch_to_browser_tab() method");
    // Invoke helper method
    final boolean result = globalObj.switchBrowserTab(TabType.valueOf(tabType.toUpperCase()));
    // Report as passed or failed
    if (result) {
      LOGGER.info("Switch to browser tab successful");
      reportSuccess("User has switched to " + wrapInLabel(tabType) + " tab");
    } else {
      LOGGER.info("Switch to browser tab Failed");
      reportFailure("User was NOT able to switch to " + wrapInLabel(tabType) + " tab");
    }
  }

  /**
   * This step takes full-page screen-shot.
   *
   * @param pageType Type of page
   */
  @Then("I take a full-page screenshot for {string}")
  public void takeFullPageScreenshot(String pageType) {
    try {
      if (pageType.equals("page properties")) {
        final String screenshot = GetScreenShot
            .getFullPageScreenshotBase64Properties(globalObj.getWebDriver(), globalObj);
        if (screenshot.equals(GetScreenShot.getFailedScreenshotImage())) {
          throw new Exception("Error while taking Full-page screenshot for page properties");
        }
        globalObj.extentTestLog(Status.INFO, "Full-page screenshot for page properties",
            MediaEntityBuilder.createScreenCaptureFromBase64String(screenshot).build());
        LOGGER.info("Full Screenshot for page properties taken");
      } else {
        final String screenshot =
            GetScreenShot.getFullPageScreenshotBase64(globalObj.getWebDriver(), globalObj);
        if (screenshot.equals(GetScreenShot.getFailedScreenshotImage())) {
          throw new Exception("Error while taking Full-page screenshot for reference");
        }
        globalObj.extentTestLog(Status.INFO, "Full-page screenshot for reference",
            MediaEntityBuilder.createScreenCaptureFromBase64String(screenshot).build());
        LOGGER.info("Full Screenshot taken");
      }
    } catch (Exception e) {
      LOGGER.error("Failed to take screenshot");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Failed to take screenshot");
    }
  }

  /**
   * This step takes screen-shot.
   * 
   */
  @Then("I take a screenshot")
  public void takeScreenshot() {
    try {
      final String screenshot =
          GetScreenShot.getScreenshotBase64(globalObj.getWebDriver(), globalObj);

      if (screenshot.equals(GetScreenShot.getFailedScreenshotImage())) {
        // Dont fail the test if the screenshot fails
        LOGGER.info("Error while taking screenshot");
        globalObj.extentTestLog(Status.INFO, "Error while taking screenshot",
            MediaEntityBuilder.createScreenCaptureFromBase64String(screenshot).build());
      } else {
        globalObj.extentTestLog(Status.INFO, "Screenshot for reference",
            MediaEntityBuilder.createScreenCaptureFromBase64String(screenshot).build());
        LOGGER.info("Screenshot taken");
      }
    } catch (Exception e) {
      LOGGER.error("Failed to take screenshot");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Failed to take screenshot");
    }
  }

  /**
   * Enter details on the browser directly using Action class.
   *
   * @param text text to enter
   */
  @Then("I enter below details using Action class")
  public void typeMultiLineTextActionClassDirect(String text) {
    // Typing onto the body is the same is typing directly onto the browser
    final String textTyped = globalObj.typeTextIntoElementActionClass(text, "//body", "XPATH");
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess("Successfully typed " + wrapInCodeBlock(textTyped) + " using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text))
          + " using Action class");
    }
  }

  /**
   * Enter multiline details on the browser directly.
   *
   * @param text text to enter
   */
  @Then("I enter below details")
  public void typeMultiLineTextDirect(String text) {
    // Typing onto the body is the same is typing directly onto the browser
    String textTyped = globalObj.typeTextIntoElement(text, "//body", "XPATH", false);
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess("Successfully typed " + wrapInCodeBlock(textTyped) + " using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text))
          + " using Action class");
    }
  }

  /**
   * Enter details in a field on application screen using Action class.
   *
   * @param text Text to enter into the screen
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I enter {string} details in {string} on {string} screen using Action class")
  public void typeTextActionClass(String text, String objectName, String screenName) {
    final String textToType =
        globalObj.typeTextIntoElementActionClass(text, objectName, screenName);
    // Report as passed or failed
    if (textToType != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess(
          "Successfully typed " + wrapInCodeBlock(textToType) + " in " + wrapInLabel(objectName)
              + " on " + wrapInLabel(screenName) + " screen using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text)) + " in "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
          + " screen using Action class");
    }
  }

  /**
   * Enter details on the browser directly using Action class.
   *
   * @param text text to enter
   */
  @Then("I enter {string} details using Action class")
  public void typeTextActionClassDirect(String text) {
    // Typing onto the body is the same is typing directly onto the browser
    final String textToType = globalObj.typeTextIntoElementActionClass(text, "//body", "XPATH");
    // Report as passed or failed
    if (textToType != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess("Successfully typed " + wrapInCodeBlock(textToType) + " using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text))
          + " using Action class");
    }
  }

  /**
   * Enter details on the browser directly.
   *
   * @param text text to type
   */
  @Then("I enter {string} details")
  public void typeTextDirect(String text) {
    // Typing onto the body is the same is typing directly onto the browser
    final String textTyped = globalObj.typeTextIntoElement(text, "//body", "XPATH", false);
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess("Successfully typed " + wrapInCodeBlock(textTyped) + " using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(text))
          + " using Action class");
    }
  }

  /**
   * Enter multiline string using Action class.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param multiLine multiline text to enter
   */
  @Then("I enter below details in {string} on {string} screen using Action class")
  public void typeTextMultiLineActionClass(String objectName, String screenName, String multiLine) {
    final String textTyped =
        globalObj.typeTextIntoElementActionClass(multiLine, objectName, screenName);
    // Report as passed or failed
    if (textTyped != null) {
      LOGGER.info("Details entered successfully using Action class");
      reportSuccess(
          "Successfully typed " + wrapInCodeBlock(textTyped) + " in " + wrapInLabel(objectName)
              + " on " + wrapInLabel(screenName) + " screen using Action class");
    } else {
      LOGGER.info("Failed to enter details using Action class");
      reportFailure("Failed to type" + wrapInCodeBlock(globalObj.parseTextToType(multiLine))
          + " in " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
          + " screen using Action class");
    }
  }

  /**
   * Update elements attribute.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param attrName Name of the attribute to update
   * @param attrValue New value to set on the attribute
   * @param screenName The name of the object's screen
   * 
   */
  @Then("I update {string} attributes {string} to {string} value on {string} screen")
  public void updateAttributes(String objectName, String attrName, String attrValue,
      String screenName) {
    LOGGER.info("Update attribute of an element");

    boolean result = globalObj.updateElementAttrValue(objectName, attrName, attrValue, screenName);
    if (result) {
      reportSuccess("Object " + wrapInLabel(objectName) + " " + wrapInLabel(attrName)
          + " attribute was updated with value " + wrapInLabel(attrValue));
    } else {
      reportFailure("Object " + wrapInLabel(objectName) + " " + wrapInLabel(attrName)
          + " attribute failed to update with value " + wrapInLabel(attrValue));
    }
  }

  /**
   * Update elements innerHTML.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param innerHtml The new innerHTML to replace with
   * @param screenName The name of the object's screen
   * 
   */
  @Then("I update {string} innerHTML to {string} on {string} screen")
  public void updateInnerHtml(String objectName, String innerHtml, String screenName) {
    LOGGER.info("Update innerHTML to xpath of an element");
    boolean result = globalObj.updateElementsInnerHtml(objectName, innerHtml, screenName);
    if (result) {
      reportSuccess(wrapInLabel(objectName) + " innerHTML was updated");
    } else {
      reportFailure(wrapInLabel(objectName) + " innerHTML was not updated");
    }
  }

  /**
   * This method updates the page address by adding suffix.
   *
   * @author Jing Zuo
   * @param suffix The suffix to add to the end of the URL
   */
  @Then("I update the page address by suffixing {string}")
  public void updatePageAddressBySuffixing(String suffix) {
    String currentPageAddress = globalObj.getWebDriver().getCurrentUrl();
    LOGGER.info("The current page address is {}", currentPageAddress);

    // Add prefix to current page address
    String newPageAddress = currentPageAddress + suffix;
    LOGGER.info("The new page address is {}", newPageAddress);

    final boolean result = globalObj.navigateToPage(newPageAddress);
    // Report as passed or failed
    if (result) {
      LOGGER.info("Page navigation successful");
      reportSuccess("User has navigated to " + wrapInHref(newPageAddress) + " page successfully");
    } else {
      LOGGER.info("Page navigation Failed");
      reportFailure("User was NOT able to navigate to " + wrapInHref(newPageAddress));
    }
  }

  /**
   * This step uploads a file into a web page.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param fileName - filename found in IMAGEPATH directory
   */
  @Given("I upload an attachment for {string} on {string} from {string}")
  public void uploadAnAttachmentForOnFrom(String objectName, String screenName, String fileName) {
    LOGGER.info("Inside upload attachment");

    // Get current working directory to turn relative path to absolute path
    final Path cwd = FileSystems.getDefault().getPath("").toAbsolutePath();
    final String absolutePath = cwd + ReadConfigProps.getImagePath() + "/" + fileName;

    final boolean passed = globalObj.uploadFile(objectName, screenName, absolutePath);

    // Report as passed or failed
    if (passed) {
      reportSuccess("File " + wrapInLabel(fileName) + " uploaded successfully for "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName) + " screen");
    } else {
      LOGGER.info("File {} upload Failed", fileName);
      reportFailure("File " + wrapInLabel(fileName) + " upload failed for "
          + wrapInLabel(objectName) + " on " + wrapInLabel(screenName) + " screen");
    }
  }

  /**
   * Verifies the current page is accessibility compliant (WCAG 2.1AA).
   */
  @Then("I verify page is accessibility compliant")
  public void verifyAccessibilityCompliance() {
    // Skip check if we are on IOS
    if (globalObj.getCurrentBrowserPlatform().contentEquals("ios-mobile")) {
      globalObj.extentTestLog(Status.PASS,
          "Skipping accessibility check, lambda does not support axe core on IOS");
      return;
    }

    final String currentUrl = globalObj.getWebDriver().getCurrentUrl();
    final String accessibilityCheck = globalObj.verifyAccessibility();

    if (accessibilityCheck.contains("Violations: 0")) {
      if (accessibilityCheck.contains("Incomplete: 0")) {
        globalObj.extentTestLog(Status.PASS, wrapInHref(currentUrl) + " is WCAG 2.1 AA compliant");
        globalObj.extentTestLog(Status.INFO, accessibilityCheck);
      } else {
        globalObj.extentTestLog(Status.WARNING,
            wrapInHref(currentUrl) + " requires some manual validation for WCAG 2.1 AA compliance");
        globalObj.extentTestLog(Status.WARNING, accessibilityCheck);
      }
    } else {
      // Cannot use reportFailure() here
      globalObj.extentTestLog(Status.FAIL,
          wrapInHref(currentUrl) + " is NOT WCAG 2.1 AA compliant");
      globalObj.extentTestLog(Status.FAIL, accessibilityCheck);
      // LT - mark test as failed
      if (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
          || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE")) {
        markLambdaTestStatus("failed", wrapInHref(currentUrl) + " is NOT WCAG 2.1 AA compliant",
            globalObj.getWebDriver());
      }
      reportFailure(wrapInHref(currentUrl) + " is NOT WCAG 2.1 AA compliant");
    }
  }

  /**
   * This step definition helps to validates if a key equals the expected value for the given
   * analytics JS object.
   *
   * @param key - Json path e.g. cart.item[:1].productDelivery.productId Use this to find JSON Paths
   *        easily - https://jsonpath.com/
   * @param value - expected value - e.g. 88
   * @param jsObject - analytics object, e.g. digitalData
   */
  @When("I verify {string} value equals {string} for {string}")
  public void verifyAnalyticsEqualsValueFor(String key, String value, String jsObject) {
    final Result result = globalObj.verifyJavaScriptObjectEquals(key, value, jsObject);
    if (result.pass()) {
      LOGGER.info("Analytics data for {} within {} is correct: {}", key, jsObject, value);
      reportSuccess("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " is correct: " + wrapInLabel(value));
    } else {
      LOGGER.info("Analytics data for {} within {} is INCORRECT", key, jsObject);
      reportFailure("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " does NOT match " + wrapInLabel(value) + ", got " + wrapInLabel(result.message()));
    }
  }

  /**
   * This step definition helps to validates if a key contains the expected value for the given
   * analytics JS object.
   *
   * @param key - Json path e.g. cart.item[:1].productDelivery.productId Use this to find JSON Paths
   *        easily - https://jsonpath.com/
   * @param value - expected value - e.g. 88
   * @param jsObject - analytics object, e.g. digitalData
   */
  @When("I verify {string} value contains {string} for {string}")
  public void verifyAnalyticsValueContainsFor(String key, String value, String jsObject) {
    final Result result = globalObj.analyticsContains(key, value, jsObject);
    if (result.pass()) {
      LOGGER.info("Analytics data for {} within {} is correct: {}", key, jsObject, value);
      reportSuccess("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " contains: " + wrapInLabel(value));
    } else {
      LOGGER.info("Analytics data for {} within {} is INCORRECT", key, jsObject);
      reportFailure("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " does NOT contain " + wrapInLabel(value) + ", got " + wrapInLabel(result.message()));
    }
  }

  /**
   * This step definition helps to validates if a key contains the expected value for the given
   * analytics JS object.
   *
   * @param key - Json path e.g. cart.item[:1].productDelivery.productId Use this to find JSON Paths
   *        easily - https://jsonpath.com/
   * @param value - expected value - e.g. 88
   * @param jsObject - analytics object, e.g. digitalData
   */
  @When("I verify {string} value starts with {string} for {string}")
  public void verifyAnalyticsValueStartsWithFor(String key, String value, String jsObject) {
    final Result result = globalObj.analyticsStartsWith(key, value, jsObject);
    if (result.pass()) {
      LOGGER.info("Analytics data for {} within {} is correct: {}", key, jsObject, value);
      reportSuccess("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " starts with: " + wrapInLabel(value) + ", got: " + wrapInLabel(result.message()));
    } else {
      LOGGER.info("Analytics data for {} within {} is INCORRECT", key, jsObject);
      reportFailure("Analytics data for " + wrapInLabel(key) + " within " + wrapInLabel(jsObject)
          + " does NOT start with " + wrapInLabel(value) + ", got "
          + wrapInLabel(result.message()));
    }
  }

  /**
   * Verify attributes on a web element.
   *
   * @param attrName Name of the attribute to update
   * @param attrValue The expected value of the attribute, if empty string, ensure attribute exists
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * 
   */
  @Then("I verify {string} attribute is {string} on {string} element on {string} screen")
  public void verifyAttributes(String attrName, String attrValue, String objectName,
      String screenName) {
    LOGGER.info("Verify attribute on a web element");

    Result result =
        globalObj.verifyElementAttributeEquals(attrName, attrValue, objectName, screenName);
    if (result.pass()) {
      if (attrValue.contentEquals("")) {
        reportSuccess(wrapInLabel(objectName) + " attribute " + wrapInLabel(attrName) + " on "
            + wrapInLabel(screenName) + " exists");
      } else {
        reportSuccess(wrapInLabel(objectName) + " attribute " + wrapInLabel(attrName) + " on "
            + wrapInLabel(screenName) + " matches " + wrapInLabel(attrValue));
      }
    } else {
      reportFailure(wrapInLabel(objectName) + " attribute " + wrapInLabel(attrName) + " on "
          + wrapInLabel(screenName) + " does NOT match, got " + wrapInLabel(result.message()));
    }
  }

  /**
   * This step helps verify on screen copy texts.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} copy text on {string} screen")
  public void verifyCopyTextOnScreen(String objectName, String screenName) {

    final boolean result = globalObj.verifyCopyTextIsVisible(objectName, screenName);
    // Compare and report
    // Report as passed or failed
    if (result) {
      globalObj.extentTestLog(Status.PASS,
          "The " + wrapInLabel(objectName) + " copy text on " + wrapInLabel(screenName)
              + " screen is being displayed correctly",
          MediaEntityBuilder.createScreenCaptureFromBase64String(
              GetScreenShot.getScreenshotBase64(globalObj.getWebDriver())).build());
      LOGGER.info("Copy text verified successfully");
    } else {
      LOGGER.info("Copy text NOT verified successfully");
      reportFailure("The " + wrapInLabel(objectName) + " copy text on " + wrapInLabel(screenName)
          + " screen is NOT being displayed correctly");
    }

  }

  /**
   * This step verifies CSS attributes for an given element.
   *
   * @param cssAttribute The CSS attribute name
   * @param attributevValue The Expected attribute value
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify css attribute {string} is {string} for {string} on {string}")
  public void verifyCssAttribute(String cssAttribute, String attributevValue, String objectName,
      String screenName) {
    LOGGER.info("Inside i_verify_css_attribute_is_for_on()");
    final boolean result =
        globalObj.verifyCssAttribute(cssAttribute, attributevValue, objectName, screenName);
    // Report as passed or failed
    if (result) {
      LOGGER.info("CSS Attribute is correct");
      reportSuccess("CSS attribute" + cssAttribute + " for " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " is correct with value " + wrapInLabel(attributevValue));
    } else {
      LOGGER.info("CSS Attribute is NOT correct");
      reportFailure("CSS attribute" + cssAttribute + " for " + wrapInLabel(objectName) + " on "
          + wrapInLabel(screenName) + " is not correct. Actual value is different");
    }
  }


  /**
   * This step helps verify either of 2 on screen copy texts Step - I verify either "searchSuccess"
   * or "bookingUnavailable" copy text on "resortsPage2" screen.
   *
   * @param objectName1 The name of the first object referencing the element in the map
   * @param objectName2 The name of the second object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify either {string} or {string} copy text on {string} screen")
  public void verifyEitherOrCopyTextOnScreen(String objectName1, String objectName2,
      String screenName) {

    final boolean result = globalObj.verifyEitherCopyText(objectName1, objectName2, screenName);
    // Compare and report
    // Report as passed or failed
    if (result) {
      globalObj.extentTestLog(Status.PASS,
          "The copy text on " + wrapInLabel(screenName) + " screen is being displayed correctly",
          MediaEntityBuilder.createScreenCaptureFromBase64String(
              GetScreenShot.getScreenshotBase64(globalObj.getWebDriver())).build());
      LOGGER.info("Copy text verified successfully from verifyEitherCopyText");
    } else {
      LOGGER.info("Copy text NOT verified successfully from verifyEitherCopyText");
      reportFailure("The copy text on " + wrapInLabel(screenName)
          + " screen is NOT being displayed correctly");
    }
  }

  /**
   * This step verifies if a particular element doesn't exist in the DOM.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} element doesnt exist on {string} screen")
  public void verifyElementDoesntExist(String objectName, String screenName) {
    try {
      final boolean result = globalObj.elementDoesntExist(objectName, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("Element doesnt exist in the DOM");
        reportSuccess("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is not present in DOM");
      } else {
        LOGGER.info("Element does exist in the DOM");
        reportFailure("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is present in DOM when it shouldn't");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("The " + wrapInLabel(screenName) + " screen does not exist in the objectmap");
    }
  }

  /**
   * This step verifies if a particular element exists in the DOM.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} element exists on {string} screen")
  public void verifyElementExists(String objectName, String screenName) {
    try {
      final boolean result = globalObj.elementExists(objectName, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("Element exists");
        reportSuccess("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is present in DOM");
      } else {
        LOGGER.info("Element does NOT exist");
        reportFailure("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is NOT present in DOM when it should be");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("The " + wrapInLabel(screenName) + " screen does not exist in the objectmap");
    }
  }

  /**
   * This step verifies if a particular element is not visible on screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} element is not visible on {string} screen")
  public void verifyElementIsNotVisible(String objectName, String screenName) {
    try {
      final boolean invisible = globalObj.elementIsInvisibleOnScreen(objectName, screenName);
      // Report as passed or failed
      if (invisible) {
        LOGGER.info("Element is NOT displayed");
        reportSuccess("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is NOT visible");
      } else {
        LOGGER.info("Element is displayed");
        reportFailure("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is visible");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("The " + wrapInLabel(screenName) + " screen does not exist in the objectmap");
    }
  }

  /**
   * This step verifies if a particular element is visible on screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} element is visible on {string} screen")
  public void verifyElementIsVisible(String objectName, String screenName) {
    try {
      final boolean visible = globalObj.elementIsVisibleOnScreen(objectName, screenName);
      // Report as passed or failed
      if (visible) {
        LOGGER.info("Element is visible");
        reportSuccess("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is visible");
      } else {
        LOGGER.info("Element is NOT visible");
        reportFailure("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen is NOT visible");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("The " + wrapInLabel(screenName) + " screen does not exist in the objectmap");
    }
  }

  /**
   * This step verifies a value exists in a field on a given screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} field contains a value on {string} screen")
  public void verifyFieldContainsValue(String objectName, String screenName) {
    try {
      final boolean result = globalObj.attributeHasValue(objectName, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("Field contains a value");
        reportSuccess("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen consists a value");
      } else {
        LOGGER.info("Field does not contain a value");
        reportFailure("The " + wrapInLabel(objectName) + " on " + wrapInLabel(screenName)
            + " screen does NOT consist a value");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This step definition helps to validates if a value equals the expected value for the given
   * analytics JS object.
   *
   * @param jsonString - expected value (get by using JSON.stringify in console)
   * @param objectName - analytics object, e.g. digitalData
   */
  @When("I verify below JSON equals for object {string}")
  public void verifyJsonBelowObjectEquals(String objectName, String jsonString) {
    final Result result = globalObj.verifyJavaScriptJsonStringEquals(jsonString, objectName);
    jsonString = globalObj.normalizeAnalyticsJson(jsonString);
    if (result.pass()) {
      LOGGER.info("Analytics data (normalized) for {} within {} is correct: {}", objectName,
          jsonString);
      reportSuccess("Analytics data (normalized) for " + " within " + wrapInCodeBlock(objectName)
          + " is correct: " + wrapInCodeBlock(result.message()));
    } else {
      LOGGER.info("Analytics data (normalized) for {} within {} is INCORRECT", objectName);
      reportFailure("Analytics data (normalized) for " + " within " + wrapInLabel(objectName)
          + " does NOT match " + wrapInCodeBlock(jsonString) + ", got "
          + wrapInCodeBlock(result.message()));
    }
  }

  /**
   * This step definition helps to validates if a value equals the expected value for the given
   * analytics JS object.
   *
   * @param jsonString - expected value (get by using JSON.stringify in console)
   * @param objectName - analytics object, e.g. digitalData
   */
  @When("I verify {string} JSON equals for object {string}")
  public void verifyJsonObjectEquals(String objectName, String jsonString) {
    final Result result = globalObj.verifyJavaScriptJsonStringEquals(jsonString, objectName);
    jsonString = globalObj.normalizeAnalyticsJson(jsonString);
    if (result.pass()) {
      LOGGER.info("Analytics data (normalized) for {} within {} is correct: {}", objectName,
          jsonString);
      reportSuccess("Analytics data (normalized) for " + " within " + wrapInLabel(objectName)
          + " is correct: " + wrapInCodeBlock(result.message()));
    } else {
      LOGGER.info("Analytics data (normalized) for {} within {} is INCORRECT", objectName);
      reportFailure("Analytics data (normalized) for " + " within " + wrapInLabel(objectName)
          + " does NOT match " + wrapInCodeBlock(jsonString) + ", got "
          + wrapInCodeBlock(result.message()));
    }
  }

  /**
   * This step checks the source redirects to the destination.
   * 
   */
  @Then("I verify {string} redirects to {string}")
  public void verifyRedirect(String source, String destination) {
    LOGGER.info("Checking redirect");
    source = globalObj.configureUrl(source).toLowerCase();
    destination = globalObj.configureUrl(destination).toLowerCase();
    Redirect result = globalObj.checkRedirect(source, destination);
    switch (result) {
      case SUCCESS:
        reportSuccess("Redirect passed, " + wrapInLabel(source) + " is redirecting to "
            + wrapInLabel(destination));
        break;
      case FAILED:
        reportFailure("Redirect failed, " + wrapInLabel(source) + " is not redirecting to "
            + wrapInLabel(destination));
        break;
      case ERROR404:
        reportFailure("Redirect failed, " + wrapInLabel(source) + " is returning 404 error");
        break;
      default:
        reportFailure("Redirect failed, " + wrapInLabel(source) + " is returning unknown error");
        break;
    }
  }

  /**
   * This step verifies the build number from page source against the one specified in
   * Config.properties.
   *
   * @param url Url of page to verify
   */
  @Then("I verify the build number for {string}")
  public void verifyTheBuildNumberFromPageSource(String url) {
    LOGGER.info("Inside i_verify_the_build_number_from_page_source() method");
    final String newUrl = globalObj.configureUrl(url);
    // Invoke helper method
    String result = globalObj.getAemBuildNumber(newUrl);
    // Report as passed or failed
    if (result == null) {
      LOGGER.info("Build number check is null");
      reportFailure("Build number is incorrect");
    } else if (result.equals("ERR_NAME_NOT_RESOLVED")) {
      globalObj.extentTestLog(Status.WARNING,
          "Page returned DNS_PROBE_FINISHED_NXDOMAIN, verify " + newUrl + " exists");
      LOGGER.info("Build number check warning, DNS_PROBE_FINISHED_NXDOMAIN returned");
    } else if (result.contains(ReadConfigProps.getBuildNumber().trim())) {
      LOGGER.info("Build number check successful");
      reportSuccess(
          "Build number for " + newUrl + " is correct: " + StringEscapeUtils.escapeHtml4(result));
    } else {
      LOGGER.info("Build number check failed");
      reportFailure("Build number for " + newUrl + " is incorrect. Got: "
          + StringEscapeUtils.escapeHtml4(result) + ", config: "
          + ReadConfigProps.getBuildNumber().trim());
    }
  }

  /**
   * This verifies the xml node exists by xpath.
   *
   * @author Viengcumm Thongvilu
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   */
  @Then("I verify {string} xml node on {string} screen")
  public void verifyXmlNode(String objectName, String screenName) {
    try {
      final boolean result = globalObj.verifyXmlNode(objectName, screenName);
      // Report as passed or failed
      if (result) {
        LOGGER.info("xml node successfully");
        reportSuccess("XML Node " + wrapInLabel(objectName) + " found on " + wrapInLabel(screenName)
            + " screen");
      } else {
        LOGGER.info("xml node NOT successfully");
        reportFailure("XML Node " + wrapInLabel(objectName) + " NOT found on "
            + wrapInLabel(screenName) + " screen");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

  }

  /**
   * This step waits for the element to appear or a max of the specified seconds.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param seconds Maximum wait time
   */
  @When("I wait for {string} on {string} screen or {string} seconds before proceeding")
  public void waitForElementOrSecondsBeforeProceeding(String objectName, String screenName,
      String seconds) {
    LOGGER.info("Inside wait for element for seconds () ");
    globalObj.waitForElementOrSeconds(objectName, screenName, seconds);
    LOGGER.info("Waited for element: {}", objectName);
    // Log into the Report
    globalObj.extentTestLog(Status.INFO, "Waited for element: " + wrapInLabel(objectName));
  }

  /**
   * This step waits for the element to disappear or a max of the specified seconds.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param seconds Maximum wait time
   */
  @When("I wait for {string} to disappear on {string} screen or {string} seconds before proceeding")
  public void waitForElementToDisappearOrSecondsBeforeProceeding(String objectName,
      String screenName, String seconds) {
    LOGGER.info("Inside wait for element for seconds () ");
    globalObj.waitForElementToDisappearOrSeconds(objectName, screenName, seconds);
    LOGGER.info("Waited for element to disappear: {}", objectName);
    // Log into the Report
    globalObj.extentTestLog(Status.INFO,
        "Waited for element to disappear: " + wrapInLabel(objectName));
  }

  /**
   * This step adds wait for the specified seconds.
   *
   * @param seconds Number of seconds to wait
   */
  @When("I wait for {string} seconds before proceeding")
  public void waitForSecondsBeforeProceeding(String seconds) {
    LOGGER.info("Inside wait for seconds () ");
    globalObj.waitForSeconds(seconds);
    LOGGER.info("Waited for: {} seconds", seconds);
    // Log into the Report
    globalObj.extentTestLog(Status.INFO, "Waited for " + seconds + " seconds");
  }

  /**
   * Formats the given text in a code block for the extent report.
   *
   * @param text The text to wrap
   * @return The text wrapped in code block
   */
  private String wrapInCodeBlock(String text) {
    return MarkupHelper.createCodeBlock(StringEscapeUtils.escapeHtml4(text)).getMarkup();
  }

  /**
   * Formats the given text in a code block for the extent report.
   *
   * @param text The text to wrap
   * @return The text wrapped in Href tags
   */
  private String wrapInHref(String text) {
    return "<a href='" + text + "' target='_blank'>" + text + "</a>";
  }

  /**
   * Formats the given text in a grey label tag for the extent report.
   *
   * @param text The text to wrap
   * @return The text wrapped in label block
   */
  private String wrapInLabel(String text) {
    return MarkupHelper.createLabel(StringEscapeUtils.escapeHtml4(text), ExtentColor.TEAL)
        .getMarkup();
  }

  /**
   * This step is to initiate visual check for a given page on RACV viewports with configurable CSS
   * options.
   *
   * @param ssName Snapshot name (duplicate names will overwrite the previous screenshot)
   * @param ssPlatform Desktop or Mobile
   * @param ssCss Lambda CSS string to pass to BrowsersStack
   */
  private void takeSnapshotSmartui(String testNamePostFix, String ssName, String[] ssCss) {
    String snapshotName = testName + "/" + ssName;
    if (testNamePostFix != null && testNamePostFix != "") {
      snapshotName = testName + "-" + testNamePostFix + "/" + ssName;
    }

    try {
      if (!ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
          && !ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE")) {
        globalObj.extentTestLog(Status.PASS,
            "Smartui snapshot only supported on LAMBDA platform, skipping snapshot");
        return;
      }

      if (ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("LAMBDA")
          || ReadConfigProps.getExecutionPlatform().equalsIgnoreCase("HYPEREXECUTE")) {

        if (ssCss != null) {

          globalObj.takeLambdaSnapshotCss(snapshotName, ssCss);
          reportSuccess("Smartui snapshot (" + snapshotName + ") taken with Smartui CSS options: {}"
              + ssCss + "\"");

        } else {

          globalObj.takeLambdaSnapshot(snapshotName);
          reportSuccess(
              "Smartui snapshot (" + snapshotName + ") taken with Smartui CSS options: none");
        }

        // LOGGER.info("Smartui snapshot count: {}", AppTest.getSmartuiSnapshotsCount());
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      reportFailure("Smartui snapshot failed");
    }
  }


  /**
   * This step is to initiate visual check for a given page on RACV viewports without hiding the
   * GDPR.
   *
   * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
   */
  @Then("I take a lambda snapshot {string}")
  public void takeLambdaSnapshot(String ssName) {
    LOGGER.info("take lambda snapshot");
    takeSnapshotSmartui(null, ssName, null);

    LOGGER.info("take lambda snapshot complete");
  }

  /**
   * This step is to initiate visual check for a given page on RACV viewports without hiding the
   * GDPR.
   *
   * @param testNamePostFix The test name post fix to be appended
   * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
   */
  @Then("I take a lambda snapshot with {string} appended named {string}")
  public void takeLambdaSnapshotPostfix(String testNamePostFix, String ssName) {
    LOGGER.info("take lambda snapshot");
    takeSnapshotSmartui(testNamePostFix, ssName, null);

    LOGGER.info("take lambda snapshot complete");
  }

  // /**
  // * This step is to initiate visual check for a given page on RACV viewports without hiding the
  // * GDPR.
  // *
  // * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
  // */
  // @Then("I take a lambda snapshot {string} for desktop")
  // public void takeLambdaSnapshotDesktop(String ssName) {
  // LOGGER.info("take lambda snapshot");
  // takeSnapshotSmartui(null, ssName, null);
  //
  // globalObj.waitForSeconds("60");
  // LOGGER.info("take lambda snapshot complete");
  // }
  //
  //
  // /**
  // * This step is to initiate visual check for a given page on RACV viewports without hiding the
  // * GDPR.
  // *
  // * @param testNamePostFix The test name post fix to be appended
  // * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
  // */
  // @Then("I take a lambda snapshot with {string} appended named {string} for desktop")
  // public void takeLambdaSnapshotPostfixDesktop(String testNamePostFix, String ssName) {
  // LOGGER.info("take lambda snapshot");
  // takeSnapshotSmartui(testNamePostFix, ssName, null);
  //
  // globalObj.waitForSeconds("60");
  // LOGGER.info("take lambda snapshot complete");
  // }

  /**
   * This step is to initiate visual check for a given page on RACV viewports with configurable CSS
   * options.
   *
   * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
   * @param options Lambda css options (see step catalog)
   */
  @Then("I take a lambda snapshot {string} {string}")
  public void takeLambdaSnapshotCss(String ssName, String options) {
    LOGGER.info("take lambda snapshot");


    String[] cssArray = manipulateLambdaDom(options);
    takeSnapshotSmartui(null, ssName, cssArray);

    LOGGER.info("take lambda snapshot complete");
  }

  /**
   * This step is to initiate visual check for a given page on RACV viewports with configurable CSS
   * options.
   *
   * @param testNamePostFix The test name post fix to be appended
   * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
   * @param options Lambda css options (see step catalog)
   */
  @Then("I take a lambda snapshot with {string} appended named {string} {string}")
  public void takeLambdaSnapshotPostfixCss(String testNamePostFix, String ssName, String options) {
    LOGGER.info("take lambda snapshot");

    String[] cssArray = manipulateLambdaDom(options);
    takeSnapshotSmartui(testNamePostFix, ssName, cssArray);

    LOGGER.info("take lambda snapshot complete");
  }

  // /**
  // * This step is to initiate visual check for a given page on RACV viewports with configurable
  // CSS
  // * options for desktop.
  // *
  // * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
  // * @param options Lambda css options (see step catalog)
  // */
  // @Then("I take a lambda snapshot {string} {string} for desktop")
  // public void takeLambdaSnapshotCssDesktop(String ssName, String options) {
  // LOGGER.info("take lambda snapshot");
  // String[] cssArray = manipulateLambdaDom(options);
  // takeSnapshotSmartui(null, ssName, cssArray);
  //
  // globalObj.waitForSeconds("60");
  // LOGGER.info("take lambda snapshot complete");
  // }
  //
  // /**
  // * This step is to initiate visual check for a given page on RACV viewports with configurable
  // CSS.
  // *
  // * @param testNamePostFix The test name post fix to be appended
  // * @param ssName ssName name (duplicate names will overwrite the previous screenshot)
  // * @param options Lambda css options (see step catalog)
  // */
  // @SuppressWarnings("checkstyle:LineLength")
  // @Then("I take a lambda snapshot with {string} appended named {string} {string} for desktop")
  // public void takeLambdaSnapshotPostfixCssDesktop(String testNamePostFix, String ssName,
  // String options) {
  // LOGGER.info("take lambda snapshot");
  // String[] cssArray = manipulateLambdaDom(options);
  // takeSnapshotSmartui(testNamePostFix, ssName, cssArray);
  //
  // globalObj.waitForSeconds("60");
  // LOGGER.info("take lambda snapshot complete");
  // }

  /**
   * Builds the Lambda CSS/JS option string to pass to Smartui.
   *
   * @param ltOptions Lambda smartui option string (see step catalog)
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  private String[] manipulateLambdaDom(String ltOptions) {
    // Wait for the page to stop loading
    globalObj.waitForPageLoad(10, globalObj.getWebDriver());

    final String[] options = ltOptions.split(",");
    String[] cssString = new String[0];
    List<String> addCssString = new ArrayList<>(Arrays.asList(cssString));

    // Always inject CSS to enable mobile mega menu animations so it will display
    addCssString.add(
        ".navigation.show-menu {animation: slide-in steps(1, end) forwards !important; -webkit-animation: slide-in steps(1, end) forwards !important;}"
            + System.lineSeparator());

    for (String option : options) {
      switch (option.trim()) {
        case "hide-gdpr":
          // Hide the GDPR by setting the CSS
          addCssString.add(
              ".gdpr--show { display: none !important; transition: none !important; max-height: 0px !important; }"
                  + System.lineSeparator() + ".gdpr-wrapper { display: none !important; }"
                  + System.lineSeparator());
          break;
        case "hide-emergency-banner":
          // Hide the emergency banner by setting the CSS
          addCssString.add(
              ".cmp-emergencybanner { display: none !important; transition: none !important; max-height: 0px !important; }"
                  + System.lineSeparator());
          // Set the line to 55px to reposition the grey horizontal separator
          addCssString.add(".horizontalLine { top: 55px; }" + System.lineSeparator());
          break;
        case "normalize-template-hero-banner-h1":
          // Use JS to replace the text of the element to make it consistent in smartui
          globalObj.normalizeTemplateHeroBannerh1();
          addCssString
              .add("/* Normalize Template Hero Banner H1 (JavaScript) */" + System.lineSeparator());
          break;
        case "normalize-breadcrumb":
          // Use JS to replace the text of the element to make it consistent in smartui
          globalObj.normalizeBreadcrumb();
          addCssString.add("/* Normalize Breadcrumb (JavaScript) */" + System.lineSeparator());
          break;
        case "hide-google-map-layer":
          globalObj.hideGoogleMapLayer();
          addCssString.add("/* Hide Google map layer (JavaScript) */" + System.lineSeparator());
          break;
        case "normalize-salesforce-chat-button-text":
          globalObj.normalizeSalesforceChatText();
          addCssString.add(
              "/* Normalize salesforce chat button text (JavaScript) */" + System.lineSeparator());
          break;
        case "normalize-salesforce-reference-number":
          globalObj.normalizeSalesforceReferenceNumber();;
          addCssString.add("/* Normalize salesforce reference number text (JavaScript) */"
              + System.lineSeparator());
          break;
        default:
          break;
      }
    }

    return cssString;
  }

}
