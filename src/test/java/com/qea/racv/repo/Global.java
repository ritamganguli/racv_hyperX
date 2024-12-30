package com.qea.racv.repo;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.MediaEntityBuilder;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.model.Media;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import com.qea.racv.runner.AppTest;
import com.qea.racv.runner.driver.BaseDriver;
import com.qea.racv.runner.driver.LambdaDriver;
import com.qea.racv.runner.driver.LocalDriver;
import com.qea.racv.runner.driver.RemoteDriver;
import com.qea.racv.utils.AxeHtmlReporter;
import com.qea.racv.utils.GetScreenShot;
import com.qea.racv.utils.MapParser;
import com.qea.racv.utils.ReadConfigProps;
import io.github.lambdatest.SmartUISnapshot;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementClickInterceptedException;
import org.openqa.selenium.ElementNotInteractableException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 * This class implements the test operations/ actions for the StepDefinition class.
 *
 */
public class Global {

  /**
   * Statuses used for Clicks.
   *
   * @author viengcumm_thongvilu
   *
   */
  public static enum Click {
    SUCCESS, FAILED, ELEMENTNOTFOUND
  }

  /**
   * iFrame switching direction.
   *
   * @author viengcumm_thongvilu
   *
   */

  public static enum IframeDirection {
    TO, FROM, PARENT
  }
  /**
   * Statuses used for URL redirects.
   *
   * @author viengcumm_thongvilu
   *
   */

  public static enum Redirect {
    SUCCESS, FAILED, ERROR404
  }
  /**
   * Statuses used for text replacement.
   *
   * @author viengcumm_thongvilu
   *
   */

  public static enum ReplaceText {
    FAILED, SUCCESS, SEARCHTEXTNOTFOUND, OBJECTNOTFOUND
  }

  /**
   * Tab types.
   *
   * @author viengcumm_thongvilu
   *
   */
  public static enum TabType {
    NEW, PARENT
  }

  // Initialize logger
  private static final Logger LOGGER = LogManager.getLogger();
  // Static constants
  private static final String STORYBOOK_URI = "design-system-dev.racv.com.au";
  private static final Pattern RANDOM_KEYWORD_REGEX =
      Pattern.compile(".*RANDOM\\[([0-9]+)-([0-9]+)\\].*");
  private static final Pattern DATA_MAP_KEYWORD_REGEX = Pattern.compile(".*DATAMAP\\[(\\w+)\\].*");
  private static final Pattern URLENV_KEYWORD_REGEX = Pattern.compile(".*URLENV.*");

  private static final Pattern DATETIME_KEYWORD_REGEX = Pattern.compile(".*DATETIME.*");
  private static final String RUN_TIME =
      (new SimpleDateFormat("yyMMddHHmmss")).format(new Date(System.currentTimeMillis()));
  private static final String RANDOM_LOCAL_IDENTIFIER = UUID.randomUUID().toString();
  @SuppressWarnings({"checkstyle:LineLength"})
  // From https://github.com/bryc/code/blob/master/jshash/experimental/cyrb53.js
  private static final String JS_HASHCODE_FUNCTION =
      "const cyrb53a=function(e,$=0){let c=3735928559^$,a=1103547991^$;for(let _=0,l;_<e.length;_++)c=Math.imul(c^(l=e.charCodeAt(_)),2246822519),a=Math.imul(a^l,3266489917);return c^=Math.imul(c^a>>>15,1935289751),a^=Math.imul(a^c>>>15,3405138345),c^=a>>>16,2097152*((a^=c>>>16)>>>0)+(c>>>11)};";
  private static Map<String, String> aemErrorPages = Map.of("404",
      "Sorry, we couldn’t find that page | RACV", "500", "We're having technical issues | RACV");
  private static ThreadLocal<ExtentTest> threadLocalExtentTest = new ThreadLocal<ExtentTest>();
  private static ThreadLocal<ExtentTest> threadLocalParentTest = new ThreadLocal<ExtentTest>();
  private static long lastWrite = 0;

  public static String getRandomLocalIdentifier() {
    return RANDOM_LOCAL_IDENTIFIER;
  }

  public static String getRunTime() {
    return RUN_TIME;
  }

  // Create instance variables
  private MapParser mapParser;
  private ThreadLocal<WebDriver> threadLocalDriver = new ThreadLocal<WebDriver>();
  private WebDriver webDriver;

  private ExtentReports extentReport = AppTest.getExtent();

  private String currentBrowserName;

  private String currentBrowserPlatform;

  private String[] randomVariables = new String[16];

  private boolean isAuthoringTest = false;

  private List<LogEntry> browserLogs = new ArrayList<LogEntry>();

  private int clickReleaseElementHeight = 0;

  public Global() throws ParserConfigurationException, SAXException, IOException {
    mapParser = new MapParser(this);
  }

  /**
   * Accept the browsers dialog alert pop up.
   *
   * @return true if successful
   */
  public boolean acceptAlert() {
    try {
      LOGGER.info("Accepting alert");
      Alert alert = webDriver.switchTo().alert();
      alert.accept();
      waitForPageLoad();
      return true;

    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method validates if a key contains the expected value for the given JS object.
   *
   * @param key The object key to check
   * @param expectedValue The expected value
   * @param jsObject JavaScript object to check
   * @return non null value if mismatch or error occurred
   */
  public Result analyticsContains(String key, String expectedValue, String jsObject) {
    // Get the digitalData JS object
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    String actualValue = "";
    final String valueToCompare = parseTextToType(expectedValue);
    Result result = new Result();
    int tries = 0;
    while (tries++ < 10) {
      try {
        Object digitalDataResultObject = jse.executeScript("return " + jsObject + "");
        // Convert to JSON
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String actualDigitalDataJson = gson.toJson(digitalDataResultObject);
        LOGGER.info("JSON object: {}", actualDigitalDataJson);
        // Using JSON Path to extract value
        LOGGER.info("JSON path: {}", key);
        // Create Json context
        DocumentContext jsonContext = JsonPath.parse(actualDigitalDataJson);
        // convert the value to string
        actualValue = (jsonContext.read(key)).toString().trim();
        LOGGER.info("Value: {}", actualValue);

        // Trim [] for numerics/ int values. This happens since JS object is converted
        // to JSON
        if (actualValue.contains("[\"")) {
          actualValue = actualValue.replace("[\"", "");
          actualValue = actualValue.replace("\"]", "");
          LOGGER.info("Value trimmed: {}", actualValue);
        }

        result.setMessage(actualValue);

        if (valueToCompare.length() == 0) {
          // If expectedValue is empty then we check if actualValue has any value at all.
          // If actualValue length is 0 then actualValue is empty.
          // if actualValue length > 0 then actualValue is not empty.
          if (actualValue.length() > 0) {
            // actualValue is not empty
            result.setStatus(true);
            return result;
          }

          return result;
        } else if (valueToCompare.contains(actualValue)) {
          LOGGER.info("JSON contains the value");
          result.setStatus(true);
          return result;
        } else {
          LOGGER.info("Analytics values do not match, retrying {}/10", tries);
          Thread.sleep(1000);
          continue;
        }
      } catch (Exception e) {
        LOGGER.error("Error with analytics, retrying {}/10", tries);
        result.setMessage("Error occurred");
        try {
          Thread.sleep(1000);
        } catch (InterruptedException ie) {
          /* do nothing */
        }
        continue;
      }
    }
    LOGGER.info("Values do not match");
    return result;
  }

  /**
   * This method validates if a key starts with the expected value for the given JS object.
   *
   * @param key The object key to check
   * @param expectedValue The expected value
   * @param jsObject JavaScript object to check
   * @return non null value if mismatch or error occurred
   */
  public Result analyticsStartsWith(String key, String expectedValue, String jsObject) {
    // Get the digitalData JS object
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    String actualValue = "";
    final String valueToCompare = parseTextToType(expectedValue);
    Result result = new Result();
    int tries = 0;
    while (tries++ < 10) {
      try {
        Object digitalDataResultObject = jse.executeScript("return " + jsObject + "");
        // Convert to JSON
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String actualDigitalDataJson = gson.toJson(digitalDataResultObject);
        LOGGER.info("JSON object: {}", actualDigitalDataJson);
        // Using JSON Path to extract value
        LOGGER.info("JSON path: {}", key);
        // Create Json context
        DocumentContext jsonContext = JsonPath.parse(actualDigitalDataJson);
        // convert the value to string
        actualValue = (jsonContext.read(key)).toString().trim();
        LOGGER.info("Value: {}", actualValue);

        // Trim [] for numerics/ int values. This happens since JS object is converted
        // to JSON
        if (actualValue.contains("[\"")) {
          actualValue = actualValue.replace("[\"", "");
          actualValue = actualValue.replace("\"]", "");
          LOGGER.info("Value trimmed: {}", actualValue);
        }

        result.setMessage(actualValue);

        if (actualValue.startsWith(valueToCompare)) {
          LOGGER.info("JSON starts with the value");
          result.setStatus(true);
          return result;
        } else {
          LOGGER.info("Analytics does not start with, retrying {}/10", tries);
          Thread.sleep(1000);
          continue;
        }
      } catch (Exception e) {
        LOGGER.error("Error with analytics, retrying {}/10", tries);
        result.setMessage("Error occurred");
        try {
          Thread.sleep(1000);
        } catch (InterruptedException ie) {
          /* do nothing */
        }
        continue;
      }
    }
    LOGGER.info("Actual value does not start with");
    return result;
  }

  /**
   * This method checks if a default value exists for a particular field.
   *
   * @author Sumanta Roy
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if exists
   */
  public boolean attributeHasValue(String objectName, String screenName) {
    boolean hasValue = false;
    try {
      // Get String for element
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }

      // Check size of the text
      String currentValue = webelement.getAttribute("value");

      if (currentValue == null || currentValue.length() == 0) {
        LOGGER.info("Current value: null");
        hasValue = false;
      } else {
        LOGGER.info("Current value: {}", currentValue);
        hasValue = true;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return hasValue;
  }

  /**
   * Capitalize each word in the string.
   *
   * @param text String to capitalize
   * @return formatted string
   */
  public String capitalizeString(String text) {
    String output = "";
    for (String word : text.toLowerCase().split("\\s+")) {
      output += word.replaceFirst(".", word.substring(0, 1).toUpperCase()) + " ";
    }
    return output;
  }

  /**
   * Checks whether the current address of the page contains the reference string.
   *
   * @param refPageAddress The string to check
   * @return true if current address contains the reference string
   */
  public boolean checkPageAddressContains(String refPageAddress) {
    try {
      // Wait for address to change
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      wait.ignoring(WebDriverException.class).until(ExpectedConditions.urlContains(refPageAddress));
    } catch (TimeoutException te) {
      /* Do nothing if time out */
    }

    // Get the actual or current page address or URL
    String actualPageAddress = webDriver.getCurrentUrl();
    LOGGER.info("Current page address: {}", actualPageAddress);

    LOGGER.info("Reference page fragment: {}", refPageAddress);
    // Check if the actual matches the reference
    if (refPageAddress.trim().contentEquals(actualPageAddress.trim())) {
      return true;
    } else {
      return false;
    }

  }

  /**
   * Checks whether the current page address contains the reference string This will wait up to 10s
   * if it doesn't match.
   *
   * @param stringToLookFor The string to look for
   * @return true if address contains the reference string
   */
  public boolean checkPageAddressFragment(String stringToLookFor) {
    try {
      // Wait for address to change
      // Ignore WebDriverException as urlContains can fail
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      wait.ignoring(WebDriverException.class)
          .until(ExpectedConditions.urlContains(stringToLookFor));
    } catch (TimeoutException te) {
      /* Do nothing if time out */
    }

    // Get the actual or current page address or URL
    String actualPageAddress = "null";
    try {
      actualPageAddress = (webDriver).getCurrentUrl();
    } catch (Exception e) {
      LOGGER.error("Error with browser returning current url");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

    LOGGER.info("Current page URL: {}", actualPageAddress);
    LOGGER.info("Page URL fragment: {}", stringToLookFor);
    // return if the actual contains the reference
    return actualPageAddress.trim().contains(stringToLookFor.trim());
  }

  /**
   * This method checks the source and destination are redirecting.
   *
   * @returns Redirect status
   */
  public Redirect checkRedirect(String source, String destination) {
    webDriver.get(source);

    try {
      String title = webDriver.getTitle();
      if (title != null && title.contentEquals(aemErrorPages.get("404"))) {
        return Redirect.ERROR404;
      }
    } catch (Exception e) {
      return Redirect.FAILED;
    }

    try {
      URI finalUri = new URI(webDriver.getCurrentUrl());
      URI destinationUri = new URI(destination);

      String finalUriPath = finalUri.getPath();
      String destinationUriPath = destinationUri.getPath();

      // Need to transform the path in case it is empty
      if (finalUriPath.contentEquals("")) {
        finalUriPath = "/";
      }

      if (destinationUriPath.contentEquals("")) {
        destinationUriPath = "/";
      }

      // Check scheme (protocol) matches
      // Check hosts (domain) matches
      // Check paths matches
      // Parameters are ignored
      if (finalUri.getScheme().contentEquals(destinationUri.getScheme())
          && finalUri.getHost().contentEquals(destinationUri.getHost())
          && finalUriPath.contentEquals(destinationUriPath)) {
        return Redirect.SUCCESS;
      } else {
        return Redirect.FAILED;
      }
    } catch (URISyntaxException e) {
      return Redirect.FAILED;
    }
  }

  /**
   * Clear the contents of an element, mainly text input or area field.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if successful
   */
  public boolean clearContents(String objectName, String screenName) {
    try {
      // Get String for element
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;

      waitForPageLoad();

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting waiting for element to be clickable");
        return false;
      }

      // Clear contents of element
      if (webelement.getAttribute("type") != null && !(webelement.getAttribute("type").isEmpty())) {
        switch (webelement.getAttribute("type").toLowerCase()) {
          case "checkbox":
            if (webelement.isSelected()) {
              webelement.click();
            }
            return true;
          default:
            clearText(webelement);
            return true;
        }
      } else {
        clearText(webelement);
        return true;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method clears the text and waits for the text to be empty.
   *
   * @param webelement The web element to clear
   */
  private void clearText(WebElement webElement) {
    try {
      webElement.clear();

      // Wait for the element to be empty
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(1));
      final ExpectedCondition<Boolean> textIsEmpty = new ExpectedCondition<Boolean>() {
        @Override
        public Boolean apply(WebDriver driver) {
          final String text = getElementTextOrValue(webElement);
          return text != null && text.length() == 0;
        }
      };
      wait.ignoring(StaleElementReferenceException.class).until(textIsEmpty);
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * This method clicks and presses on the element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true if successful
   */
  public boolean clickAndHold(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }

      scrollToElement(xpath);

      // Click and hold on the element
      Actions clickAndHold = new Actions(webDriver);
      clickAndHold.clickAndHold(webelement).perform();

      // Get the element height to be used in releaseClick()
      clickReleaseElementHeight = webelement.getSize().getHeight();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Closes the drivers web browser.
   * 
   */
  public boolean closeBrowser() {
    try {
      LOGGER.info("Commanding browser to close");
      webDriver.quit();
    } catch (Exception e) {
      LOGGER.error("Error closing the browser");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

    webDriver = null;
    threadLocalDriver = new ThreadLocal<WebDriver>();
    return true;
  }

  /**
   * Use JS to close the emergency banner.
   *
   * @return True if found and closed, false if not found or error
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public boolean closeEmergencyBanner() {
    LOGGER.info("Inside checkCloseEmergencyBanner() method");
    try {
      // Get identifiers for Emergency Banner message
      final String emergencyBannerCloseButton =
          getXpathFromMap("closeEmergencyBanner", "racvHomePage");
      LOGGER.info("Emergency Banner Close String value: {}", emergencyBannerCloseButton);

      // Use javascript as we do not have to wait for a pass or fail
      ((JavascriptExecutor) webDriver).executeScript(
          "document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()",
          emergencyBannerCloseButton);

      LOGGER.info("Emergency Banner closed");
      return true;
    } catch (Exception e) {
      LOGGER.info("Emergency Banner was not found");
      return false;
    }
  }

  /**
   * Use JS to close the GDPR.
   *
   * @return True if found and closed, false if not found or error
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public boolean closeGdprNotification() {
    LOGGER.info("Inside checkCloseGdprNotification() method");
    try {
      // Get identifiers for GDPR message
      final String gdprCloseButton = getXpathFromMap("gdprNotificationCloseButton", "racvHomePage");
      LOGGER.info("GDPR Close String value: {}", gdprCloseButton);

      // Use javascript as we do not have to wait for a pass or fail
      ((JavascriptExecutor) webDriver).executeScript(
          "document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()",
          gdprCloseButton);

      LOGGER.info("GDPR message closed");
      return true;
    } catch (Exception e) {
      LOGGER.info("GDPR message was not found");
      return false;
    }
  }

  /**
   * This method configures the url and replaced URL or AEM with the values from config.properties.
   *
   * @param url The url to configure
   * @returns new url
   */
  public String configureUrl(final String url) {
    // Manipulate the URL to replace either AEM or URL to the config prop value
    String newUrl = parseTextToType(url);
    if (newUrl.startsWith("URL")) {
      // if new url is in format
      // https://publish1apsoutheast2.racv.adobecqms.net/content/racv/en/home.html/xxx
      // then remove the .html
      if (!newUrl.contentEquals("URL/") && ReadConfigProps.getUrl().startsWith("https://publish")) {
        newUrl = newUrl.replaceFirst("URL", ReadConfigProps.getUrl().replaceFirst(".html", ""));
      } else {
        newUrl = newUrl.replaceFirst("URL", ReadConfigProps.getUrl());
      }
      LOGGER.info("Configured URL: {}", newUrl);
    } else if (newUrl.startsWith("PURL")) {
      // Replace the first occurance of ^ with 1 or 2
      if (newUrl.startsWith("PURL1")) {
        newUrl = newUrl.replaceFirst("PURL1", ReadConfigProps.getPurl().replaceFirst("\\^", "1"));
      } else if (newUrl.startsWith("PURL2")) {
        newUrl = newUrl.replaceFirst("PURL2", ReadConfigProps.getPurl().replaceFirst("\\^", "2"));
      }
      LOGGER.info("Configured URL: {}", newUrl);
    } else if (newUrl.startsWith("AEM")) {
      newUrl = newUrl.replaceFirst("AEM", ReadConfigProps.getAemUrl());
      LOGGER.info("Configured URL: {}", newUrl);
    }
    return newUrl;
  }

  /**
   * Create extent node.
   *
   * @param nodeName Name of the node
   */
  public void createExtentNode(String nodeName) {
    LOGGER.info("Creating extent node named {}", nodeName);
    threadLocalExtentTest.set(threadLocalParentTest.get().createNode(nodeName));
  }

  /**
   * Create extent test.
   *
   * @param testName Name of the test
   * @param description Description of the test
   * @param device Device type
   * @param platform Platform type
   */
  public void createExtentTest(String testName, String description, String device,
      String platform) {
    LOGGER.info("Creating extent test for {}", testName);
    ExtentTest newTest = extentReport.createTest(testName, description);
    newTest.assignDevice(capitalizeString(device) + "/" + capitalizeString(platform));
    threadLocalParentTest.set(newTest);
    threadLocalExtentTest.set(newTest);
    threadLocalExtentTest.get().log(Status.INFO, "Started test: " + testName);
    LOGGER.info("Message {}", threadLocalExtentTest.get());
  }

  /**
   * Finds all pages by pagePattern for a given container, selects all of them and clicks delete.
   *
   * @param pageTitlePattern The title pattern to search for
   * @param pageContainerObject The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return List of pages deleted or status string "FAILED" or "NOTREQUIRED"
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public Object deleteAllTestPages(String pageTitlePattern, String pageContainerObject,
      String screenName) {
    try {
      // create single JavascriptExecutor to use for javascript actions
      JavascriptExecutor jse = (JavascriptExecutor) (webDriver);

      // Get String for element parent element
      final String xpath = getXpathFromMap(pageContainerObject, screenName);

      // Get the parent element so we can get all the children to iterate through to select the
      // icons to later delete
      final WebElement parentElement = webDriver.findElement(By.xpath(xpath));

      // Scroll to the bottom of the parent element and wait for more icons to load, if more icons
      // load then the scroll bar height will change. Keep scrolling until we dont see the scrollbar
      // height change
      long lastHeight = 0;
      boolean moreScroll = true;
      while (lastHeight == 0 || moreScroll) {
        long currentHeight =
            ((long) (jse.executeScript("return arguments[0].scrollHeight", parentElement)));
        if (lastHeight != currentHeight) {
          lastHeight = currentHeight;
        } else {
          moreScroll = false;
        }

        LOGGER.info("Scrolling to {}", currentHeight);
        jse.executeScript(
            "arguments[0].scroll({top: arguments[0].scrollHeight,left: 0,behavior: 'smooth'});",
            parentElement);
        waitForPageLoad();
      }

      // Get list of child pages from the parent element
      final List<WebElement> childPagesList = parentElement.findElements(By.xpath("./child::*"));

      final List<String> pagesToDelete = new ArrayList<>();
      final List<String> xpathsToDelete = new ArrayList<>();

      boolean pagesSelected = false;

      LOGGER.info("Page search pattern: {}", pageTitlePattern);
      LOGGER.info("Child pages list size: {}", childPagesList.size());
      LOGGER.info("Looping all pages and clicking pages to delete");
      // iterate child nodes
      for (WebElement i : childPagesList) {
        // filter by data-foundation-collection-item-id attribute
        final String currentPage = i.getAttribute("data-foundation-collection-item-id");
        if (currentPage != null) {
          // Clean up the attribute, replace everything up until the last /
          String cleanedPageName = currentPage.replaceAll(".*/", "");
          // filter pages starting with pagePattern
          if (cleanedPageName.startsWith(pageTitlePattern)) {
            // Add page to list so we can log it in in the extent report
            pagesToDelete.add(currentPage);

            // LOGGER.info("Node: {}", cleanedPageName);
            final String[] spiltRequiredVal = cleanedPageName.split(pageTitlePattern);
            final String strSplitVal = spiltRequiredVal[1];
            // LOGGER.info("Node split value: {}", strSplitVal);

            // Build the xpath icon and icon selected Strings based on current index
            final String[] xpathSplit = xpath.split("]");
            final String beginningXpath = xpathSplit[0].substring(0, xpathSplit[0].length() - 1)
                .replace("data-foundation-layout-columnview-columnid",
                    "data-foundation-collection-item-id")
                + "/test-automation-";
            final String iconString = xpathSplit[1].replace("coral-columnview-column-content",
                "coral-columnview-item-thumbnail");
            final String strPageXpathIcon = beginningXpath + strSplitVal + "\"]" + iconString;

            xpathsToDelete.add(strPageXpathIcon);

            /*
             * final String iconSelectedString =
             * xpathSplit[1].replace("coral-columnview-column-content",
             * "coral-columnview-item-accessibilitystate[text()=\", checked\"]"); final String
             * strPageXpathIconSelected = beginningXpath + strSplitVal + "\"]" + iconSelectedString;
             * 
             * LOGGER.info("Page icon xpath: {}", strPageXpathIcon);
             * LOGGER.info("Page icon selected xpath: {}", strPageXpathIconSelected);
             */

            try {
              WebElement webelementClick = webDriver.findElement(By.xpath(strPageXpathIcon));
              // Use JS to click the icons as icons may be off screen and obscured
              jse.executeScript("arguments[0].click();", webelementClick);
              // waitForPageLoad();
              pagesSelected = true;
            } catch (Exception e) {
              return "FAILED";
            }
          }
        }
      }

      if (pagesSelected) {
        waitForPageLoad();

        LOGGER.info("Pages selected for deletion:");
        LOGGER.info(pagesToDelete.toString());

        // delete button
        try {
          WebElement webelementClick = webDriver
              .findElement(By.xpath("//button[@data-foundation-command-label=\"Delete\"]"));
          jse.executeScript("arguments[0].click();", webelementClick);
          waitForPageLoad(30, webDriver);

          LOGGER.info("Delete button clicked");
        } catch (Exception e) {
          // We return failed here as we must click the first delete.
          return "FAILED";
        }

        // Archive option
        try {
          WebElement webelementClick =
              webDriver.findElement(By.xpath("//coral-checkbox[@name=\"archive\"][@checked]"));
          jse.executeScript("arguments[0].click();", webelementClick);
          waitForPageLoad(30, webDriver);
          LOGGER.info("Unticked archive pages before deletion");
        } catch (Exception e) {
          // do nothing, as this button may not be visible
        }

        // delete button on the dialog box
        try {
          WebElement webelementClick = webDriver.findElement(By.xpath(
              "//coral-dialog-footer/button[@is=\"coral-button\"]/coral-button-label[text()=\"Delete\"]"));
          jse.executeScript("arguments[0].click();", webelementClick);
          waitForPageLoad(300, webDriver);
          LOGGER.info("Confirm delete button clicked");
        } catch (Exception e) {
          // do nothing, as this button may not be visible
        }

        // force delete button
        try {
          WebElement webelementClick =
              webDriver.findElement(By.xpath("//coral-button-label[text()=\"Force Delete\"]"));
          jse.executeScript("arguments[0].click();", webelementClick);
          waitForPageLoad(300, webDriver);
          LOGGER.info("Force delete button clicked");
        } catch (Exception e) {
          // do nothing, as this button may not be visible
        }

        // wait for the first page icon to disappear
        LOGGER.info("Checking if first icon in the list disappeared from the DOM");
        if (elementDoesntExist(xpathsToDelete.get(0), "XPATH", "300")) {
          // icon disappeared so it looks like pages were deleted
          LOGGER.info("Icon is gone, deletion successful");
          return pagesToDelete;
        } else {
          // icon remains so it looks like deletion failed
          LOGGER.info("Icon remains, deletion failed");
          return "FAILED";
        }
      } else {
        return "NOT REQUIRED";
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Any exceptions return failed
      return "FAILED";
    }
  }

  /**
   * Navigates to and finds all pages by omni search for specified tag, deletes all results.
   *
   * @param tag The tag to search for
   * @param pageName The page names to search for
   * @param searchPath The path to search for pages
   * @param screenName The name of the screen which contains all the relevant paths
   * @return List of pages deleted or status string "FAILED" or "NOTREQUIRED"
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public Object deletePagesByTag(String tag, String pageName, String searchPath,
      String screenName) {
    try {
      // Ensure we are in AEM
      if (!webDriver.getCurrentUrl().contains("/sites.html/")) {
        LOGGER.error("We must be in AEM sites");
        return "FAILED";
      }

      // Click search
      if (!genericClick("searchButton", screenName, false).equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click search button");
        return "FAILED";
      }

      // Enter pageName search keyword
      if (typeTextIntoElement(pageName, "searchInputBox", screenName, false) == null) {
        LOGGER.error("Failed to enter page name");
        return "FAILED";
      }

      // Wait for the search result drop down to appear
      waitForElementOrSeconds("searchResultsDropDown", screenName, "20");
      if (!elementIsVisibleOnScreen("searchResultsDropDown", screenName)) {
        LOGGER.error("Failed to find search results");
        return "FAILED";
      }

      // Press enter
      if (typeTextIntoElement("keys:ENTER", "searchInputBox", screenName, false) == null) {
        LOGGER.error("Failed to search");
        return "FAILED";
      }

      waitForPageLoad();
      if (!elementIsVisibleOnScreen("searchSites", screenName)) {
        LOGGER.error("Search sites filter in omni search is missing");
        return "FAILED";
      }
      takeScreenshot("Page name searched");

      // Click filters
      if (!genericClick("filtersButton", screenName, false).equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click filters");
        return "FAILED";
      }

      // Enter search path keyword
      if (typeTextIntoElement(searchPath, "searchDirectoryPath", screenName, false) == null) {
        LOGGER.error("Failed to enter search path");
        return "FAILED";
      }

      // Click the search path result
      waitForElementOrSeconds("searchDirectoryResultsDropDown", screenName, "20");
      if (!genericClick("searchDirectoryResultsDropDown", screenName, false)
          .equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click search result");
        return "FAILED";
      }

      final String pathInputBoxXpath = getXpathFromMap("searchDirectoryPath", screenName);
      final WebElement pathInputBox = webDriver.findElement(By.xpath(pathInputBoxXpath));
      final String pathInputBoxValue = pathInputBox.getAttribute("value");

      if (!pathInputBoxValue.contentEquals(searchPath)) {
        LOGGER.error("Search path entered in field does not match");
        return "FAILED";
      }

      if (!elementIsVisibleOnScreen("searchPath", screenName)) {
        LOGGER.error("Search path filter in omni search is missing");
        return "FAILED";
      }

      waitForPageLoad();
      takeScreenshot("Search path filter entered");

      // Click tags accordion with JS
      if (!genericClickJs("tagsAccordion", screenName).equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click tags accordion");
        return "FAILED";
      }

      // Enter tags keyword
      if (typeTextIntoElement(tag, "tagsInputBox", screenName, false) == null) {
        LOGGER.error("Failed to enter tags");
        return "FAILED";
      }

      // Click tags result
      waitForElementOrSeconds("tagsResultsDropDown", screenName, "20");
      if (!genericClick("tagsResultsDropDown", screenName, false).equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click tags");
        return "FAILED";
      }

      waitForPageLoad();
      if (!elementIsVisibleOnScreen("searchTags", screenName)) {
        LOGGER.error("Search tag filter in omni search is missing");
        return "FAILED";
      }
      takeScreenshot("Tag filter entered");

      // Check for 0 of 0 results
      if (!elementIsInvisibleOnScreen("noResultsText", screenName)) {
        LOGGER.info("0 pages found, not required");
        return "NOT REQUIRED";
      }

      // Check the 3 filters applied once more
      if (!elementIsVisibleOnScreen("searchTags", screenName)) {
        LOGGER.error("Search tag in omni search is missing");
        return "FAILED";
      }
      if (!elementIsVisibleOnScreen("searchSites", screenName)) {
        LOGGER.error("Search sites filter in omni search is missing");
        return "FAILED";
      }
      if (!elementIsVisibleOnScreen("searchPath", screenName)) {
        LOGGER.error("Search path in omni search is missing");
        return "FAILED";
      }

      // Click select All
      if (!genericClick("selectAllButton", screenName, false).equals(Click.SUCCESS)) {
        LOGGER.error("Failed to click select all");
        return "FAILED";
      }

      waitForPageLoad();
      takeScreenshot("Select all clicked");

      // If we are partially displaying all the results, scroll the page to load all the results so
      // we can log the pages
      final String resultsTextXpath = getXpathFromMap("resultsText", screenName);
      final WebElement resultsTextElement = webDriver.findElement(By.xpath(resultsTextXpath));
      String current;
      String total;
      int count = 0;
      do {
        if (count++ <= 10) {
          scrollElement("searchResults", "100", "aemSitesPage");
          current = resultsTextElement.getAttribute("current");
          total = resultsTextElement.getAttribute("guesstotal");
        } else {
          LOGGER.error("Scrolled 10 times, maybe stuck in scrolling");
          return "FAILED";
        }
      } while (!current.contentEquals(total));

      // Get all the pages selected and log the card path
      final List<String> selectedPages = new ArrayList<>();
      final String selectedElementsTableRows =
          getXpathFromMap("selectedElementsTableCards", screenName);
      final List<WebElement> selectedElementCards =
          webDriver.findElements(By.xpath(selectedElementsTableRows));
      for (WebElement card : selectedElementCards) {
        final String cardPath = card.getAttribute("data-foundation-collection-item-id");
        if (!cardPath.contains(searchPath) && !cardPath.contains(pageName)) {
          LOGGER.error("Found a page that does not start contain \"{}\" and \"{}\" ({})",
              searchPath, pageName, cardPath);
          return "FAILED";
        }
        selectedPages.add(cardPath);
      }

      // Ensure we logged all the items selected
      if (selectedPages.size() != Integer.parseInt(total)) {
        LOGGER.error("Unable to log all pages {}/{}", selectedPages.size(), total);
        return "FAILED";
      }

      Gson gson = new GsonBuilder().setPrettyPrinting().create();
      LOGGER.debug(gson.toJson(selectedPages));

      takeScreenshot("Selected all pages after scrolling");

      // // delete button
      // try {
      // final String xpath = getXpathFromMap("deleteButton", screenName);
      // final WebElement webelementClick = webDriver.findElement(By.xpath(xpath));
      // jse.executeScript("arguments[0].click();", webelementClick);
      // waitForPageLoad(30, webDriver);
      //
      // LOGGER.info("Delete button clicked");
      // takeScreenshot("Delete button clicked");
      // } catch (Exception e) {
      // return "FAILED";
      // }
      //
      // // Archive option
      // try {
      // final String xpath = getXpathFromMap("archiveCheckbox", screenName);
      // final WebElement webelementClick = webDriver.findElement(By.xpath(xpath));
      // jse.executeScript("arguments[0].click();", webelementClick);
      // waitForPageLoad(30, webDriver);
      // LOGGER.info("Unticked archive pages before deletion");
      // takeScreenshot("Archive unchecked");
      // } catch (Exception e) {
      // return "FAILED";
      // }
      //
      // // delete button on the dialog box
      // try {
      // final String xpath = getXpathFromMap("deleteButtonDialog", screenName);
      // final WebElement webelementClick = webDriver.findElement(By.xpath(xpath));
      // jse.executeScript("arguments[0].click();", webelementClick);
      // waitForPageLoad(300, webDriver);
      // LOGGER.info("Confirm delete button clicked");
      // takeScreenshot("Delete button clicked");
      // } catch (Exception e) {
      // // do nothing, as this button may not be visible (eg. EF)
      // }
      //
      // // force delete button
      // try {
      // final String xpath = getXpathFromMap("forceDelete", screenName);
      // final WebElement webelementClick = webDriver.findElement(By.xpath(xpath));
      // jse.executeScript("arguments[0].click();", webelementClick);
      // waitForPageLoad(300, webDriver);
      // LOGGER.info("Force delete button clicked");
      // takeScreenshot("Force Delete button clicked");
      // } catch (Exception e) {
      // // do nothing, as this button may not be visible
      // }
      //
      // LOGGER.info("Waiting for last card to disappear to indicate deletion finished");
      // waitForPageLoad();
      //
      // // wait up to 5 mins for the last page card to disappear
      // try {
      // final WebElement lastCard = selectedElementCards.get(selectedElementCards.size() - 1);
      // final WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMinutes(5));
      // wait.until(ExpectedConditions.invisibilityOf(lastCard));
      // } catch (TimeoutException e) {
      // // Card is still visible after 5 minutes
      // return "FAILED";
      // }

      takeScreenshot("Pages deleted");

      // icon disappeared so it looks like pages were deleted
      LOGGER.info("Last card is gone, deletion successful");
      return selectedPages;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Any exceptions return failed
      return "FAILED";
    }
  }

  /**
   * This method left clicks, holds the click and moves the mouse from its current position by the
   * given offset.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param offsetX horizontal offset. A negative value means moving the mouse left.
   * @param offsetY vertical offset. A negative value means moving the mouse down.
   * @returns true if successful
   */
  public boolean dragMouseByOffset(String objectName, String screenName, String offsetX,
      String offsetY) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        // We cannot continue if element is not clickable
        LOGGER.info("Element is not clickable to resize");
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        LOGGER.error(e);
        return false;
      }

      int x = Integer.parseInt(offsetX);
      int y = Integer.parseInt(offsetY);
      // Click and hold on the element
      LOGGER.info("Dragging for resize");
      Actions action = new Actions(webDriver);
      action.clickAndHold(webelement).moveByOffset(x, y).release().perform();
      waitForPageLoad();

      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method checks if an element doesn't exist in the DOM.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if element doesn't exist
   */
  public boolean elementDoesntExist(String objectName, String screenName) {
    return elementDoesntExist(objectName, screenName, "10");
  }

  /**
   * This method checks if an element doesn't exist in the DOM.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param waitInSeconds The maximum amount of time to wait before failing
   * @return true if element exists
   */
  public boolean elementDoesntExist(String objectName, String screenName, String waitInSeconds) {
    try {
      LOGGER.info("in elementDoesntExist");
      String xpath = getXpathFromMap(objectName, screenName);

      long waitLong = Long.parseLong(waitInSeconds);

      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(waitLong));
      wait.until(ExpectedConditions
          .not(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xpath))));
      waitForPageLoad();
      return true;
    } catch (TimeoutException te) {
      return false;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method checks if an element exists in the DOM.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if element exists
   */
  public boolean elementExists(String objectName, String screenName) {
    try {
      LOGGER.info("in elementExists");
      String xpath = getXpathFromMap(objectName, screenName);

      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xpath)));
      waitForPageLoad();
      return true;
    } catch (TimeoutException te) {
      return false;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method checks if an element is invisible on screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if invisible
   */
  public boolean elementIsInvisibleOnScreen(String objectName, String screenName) {
    // Get String
    LOGGER.info("in elementIsInvisibleOnScreen");
    try {
      final String xpath = getXpathFromMap(objectName, screenName);

      // Wait for the element
      final WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      wait.ignoring(StaleElementReferenceException.class)
          .until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(xpath)));
    } catch (TimeoutException te) {
      LOGGER.error("timed out waiting for element to become invisible");
      return false;
    } catch (NoSuchElementException e) {
      LOGGER.error("Element does not exist on the page");
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
    LOGGER.info("element is invisible");
    return true;
  }

  /**
   * This method checks if an element is visible on screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if element is visible
   */
  public boolean elementIsVisibleOnScreen(String objectName, String screenName) {
    // Get String
    LOGGER.info("in elementIsVisibleOnScreen");
    try {
      final String xpath = getXpathFromMap(objectName, screenName);

      // Wait for the element
      final WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
          .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
    } catch (TimeoutException e) {
      LOGGER.error("timed out waiting for element to become visible");
      return false;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
    LOGGER.info("element is visible");
    return true;
  }

  /**
   * This method evaluates the specified date expression on the targeted element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param format Date format see
   *        https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html
   * @param operator Operator symbol (<, >, <=, >=, !=, ==)
   * @param expectedValue The expected value
   * @param screenName The name of the object's screen
   * @return true if match
   */
  public boolean evaluateDateExpression(String objectName, String format, String operator,
      String expectedValue, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }

      // If element is an input field get the text entered in the field
      // getText() for all other element types
      String elementTextString;
      if (webelement.getTagName().contentEquals("input")) {
        elementTextString = webelement.getAttribute("value");
        LOGGER.info("Element value: {}", elementTextString);
      } else {
        elementTextString = webelement.getText().trim();
        LOGGER.info("Element text: {}", elementTextString);
      }

      // Use the date format specified
      DateFormat formatter = new SimpleDateFormat(format);
      // Convert elementText to LocalDate object
      LocalDate elementValue = formatter.parse(elementTextString).toInstant()
          .atZone(ZoneId.systemDefault()).toLocalDate();

      // Calculate days elapsed between now and the specified date
      int daysAgo = Integer.parseInt(expectedValue);
      LocalDate compareDate = LocalDate.now();
      int daysElapsed = Period.between(compareDate, elementValue).getDays();

      LOGGER.info("Days calc: {} - {} = {}", compareDate.toString(), elementValue.toString(),
          daysElapsed);

      switch (operator) {
        case ">":
          return daysElapsed > daysAgo;
        case "<":
          return daysElapsed < daysAgo;
        case ">=":
          return daysElapsed >= daysAgo;
        case "<=":
          return daysElapsed <= daysAgo;
        case "!=":
          return daysElapsed != daysAgo;
        case "==":
          return daysElapsed == daysAgo;
        default:
          LOGGER.info("Unknown operator specified: {}", operator);
          return false;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method evaluates the specified number expression on the targeted element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param operator Operator symbol (<, >, <=, >=, !=, ==)
   * @param expectedValue The expected value
   * @param screenName The name of the object's screen
   * @return true if match
   */
  public boolean evaluateNumberExpression(String objectName, String operator, String expectedValue,
      String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }

      // If element is an input field get the text entered in the field
      // getText() for all other element types
      String elementTextString;
      if (webelement.getTagName().contentEquals("input")) {
        elementTextString = webelement.getAttribute("value");
        LOGGER.info("Element value: {}", elementTextString);
      } else {
        elementTextString = webelement.getText().trim();
        LOGGER.info("Element text: {}", elementTextString);
      }

      // Parse as doubles to handle decimal points
      double elementValue = Double.parseDouble(elementTextString);
      double compareValue = Double.parseDouble(expectedValue);

      switch (operator) {
        case ">":
          return elementValue > compareValue;
        case "<":
          return elementValue < compareValue;
        case ">=":
          return elementValue >= compareValue;
        case "<=":
          return elementValue <= compareValue;
        case "!=":
          return elementValue != compareValue;
        case "==":
          return elementValue == compareValue;
        default:
          LOGGER.info("Unknown operator specified: {}", operator);
          return false;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * Log a message to the extent report.
   *
   * @param status The type of status to log
   * @param message The message to log
   */
  public void extentTestLog(Status status, String message) {
    threadLocalExtentTest.get().log(status, message);
  }

  /**
   * Log a message to the extent report.
   *
   * @param status The type of status to log
   * @param message The message to log
   * @param media Any media to attach to the log
   */
  public void extentTestLog(Status status, String message, Media media) {
    threadLocalExtentTest.get().log(status, message, media);
  }

  /**
   * Flush the report. Will not flushed if flushed within last 30s.
   *
   */
  public synchronized void flushReport() {
    // Only write every 30s
    long now = System.currentTimeMillis();
    if (now - lastWrite >= 30000) {
      LOGGER.debug("Flushing extent report");
      lastWrite = now;
      extentReport.flush();
    }
  }

  /**
   * This method sets the focus on an element by pressing shift+tab and tabbing to the component.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true if successful
   */
  public boolean focusElement(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("time out waiting for element");
        return false;
      }

      // Press shift+tab on the component to focus the previous component
      // then press tab to re-focus the component
      Actions pressShift = new Actions(webDriver);
      pressShift.keyDown(Keys.SHIFT).perform();
      Thread.sleep(100);
      webelement.sendKeys(Keys.TAB);
      Thread.sleep(100);
      Actions releaseShift = new Actions(webDriver);
      releaseShift.keyUp(Keys.SHIFT).sendKeys(Keys.TAB).perform();
      waitForPageLoad();
      return webDriver.switchTo().activeElement().equals(webelement);
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method clicks on a webelement on screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param scroll Scroll the element into view before clicking
   * @return Click status
   */
  public Click genericClick(String objectName, String screenName, boolean scroll) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      if (scroll) {
        scrollToElement(xpath);
      }

      WebElement webelement;

      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException te) {
        LOGGER.error("Element is not clickable after 10 seconds");
        return Click.ELEMENTNOTFOUND;
      }

      int count = 0;
      boolean clicked = false;
      while (count < 4 && !clicked) {
        try {
          webelement = webDriver.findElement(By.xpath(xpath));
          webelement.click();
          clicked = true;
          LOGGER.info("Clicked element");
          break;
        } catch (StaleElementReferenceException sere) {
          LOGGER.error("Stale element, retrying click");
          count++;

          try {
            WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(1));
            webelement = wait.ignoring(StaleElementReferenceException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
          } catch (Exception e) {
            /* do nothing */
          }
        }
      }

      if (clicked) {
        waitForPageLoad();
        return Click.SUCCESS;
      } else {
        return Click.FAILED;
      }
    } catch (ElementClickInterceptedException e) {
      LOGGER.error("Element click intercepted");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return Click.FAILED;
    } catch (ElementNotInteractableException e) {
      LOGGER.error("Element not interactable");
      return Click.FAILED;
    } catch (NoSuchElementException e) {
      LOGGER.error("Element not found");
      return Click.ELEMENTNOTFOUND;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return Click.FAILED;
    }
  }

  /**
   * This method uses Action Class to perform a Click operation on a specific web-element on a
   * screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return Click status
   */
  public Click genericClickActionClass(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      scrollToElement(xpath);

      WebElement webElement = null;

      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webElement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException te) {
        LOGGER.error("Element is not clickable after 10 seconds");
        return Click.ELEMENTNOTFOUND;
      }

      int count = 0;
      boolean clicked = false;
      while (count < 4 && !clicked) {
        try {
          webElement = webDriver.findElement(By.xpath(xpath));
          Actions action = new Actions(webDriver);
          action.click(webElement).perform();
          clicked = true;
          break;
        } catch (StaleElementReferenceException sere) {
          LOGGER.error("Stale element, retrying click");
          count++;

          try {
            WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(1));
            webElement = wait.ignoring(StaleElementReferenceException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
          } catch (Exception e) {
            LOGGER.info("Error occured while retrying");
            /* do nothing */
          }
        }
      }

      if (clicked) {
        waitForPageLoad();
        return Click.SUCCESS;
      } else {
        return Click.FAILED;
      }
    } catch (NoSuchElementException nse) {
      return Click.ELEMENTNOTFOUND;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return Click.FAILED;
    }
  }

  /**
   * This method performs a click operation using java script executor This does not check if the
   * element is clickable or visible, JS can click it off screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return Click status
   */
  public Click genericClickJs(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement;

      // Wait for the element
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException te) {
        LOGGER.error("Failed waiting for element to be present inside genericClickJS");
        return Click.ELEMENTNOTFOUND;
      }

      JavascriptExecutor jse = (JavascriptExecutor) (webDriver);
      // 26 Feb 20 VT - refer to webelement instead of document.getElementById as
      // elements without an ID return null
      jse.executeScript("arguments[0].click();", webelement);
      waitForPageLoad();
      return Click.SUCCESS;
    } catch (NoSuchElementException nse) {
      return Click.ELEMENTNOTFOUND;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return Click.FAILED;
    }
  }

  /**
   * This performs a click operation post scrolling the element into view.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return Click status
   */
  public Click genericClickScrollIntoView(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      // SR 16 Aug 19 - Added below to get elements into focus

      scrollToElement(xpath);

      // Wait for the element to be visible and clickable
      // Use below dual conditions so we only wait a total of 5 seconds for both conditions
      ExpectedCondition<?>[] conditionsToEvaluate = new ExpectedCondition[2];
      conditionsToEvaluate[0] = ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath));
      conditionsToEvaluate[1] = ExpectedConditions.elementToBeClickable(By.xpath(xpath));

      boolean found = false;
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        found = wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
            .until(ExpectedConditions.and(conditionsToEvaluate));
      } catch (TimeoutException te) {
        found = false;
      }

      if (!found) {
        // no way to get individual results from conditionsToEvaluate so re run to determine correct
        // result to return
        try {
          WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
          wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.xpath(xpath)));
        } catch (Exception te) {
          LOGGER.error("element is not visible after 10 seconds");
          return Click.ELEMENTNOTFOUND;
        }

        try {
          WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
          wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
        } catch (Exception te) {
          LOGGER.error("element is not clickable after 10 seconds");
          return Click.FAILED;
        }
      }

      // refresh the String
      WebElement webelement = webDriver.findElement(By.xpath(xpath));

      webelement.click();
      waitForPageLoad();
      return Click.SUCCESS;
    } catch (NoSuchElementException nse) {
      return Click.ELEMENTNOTFOUND;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return Click.FAILED;
    }
  }

  /**
   * This method uses Action Class to perform a drag and drop operation from the source element to
   * the destination element.
   *
   * @param objectNameSource The name of the source object referencing the element in the map
   * @param screenNameSource The name of the source object's screen
   * @param objectNameDest The name of the dest object referencing the element in the map
   * @param screenNameDest The name of the dest object's screen
   * @return true if successful
   */
  public boolean genericDragAndDropActionClass(String objectNameSource, String screenNameSource,
      String objectNameDest, String screenNameDest) {
    try {
      LOGGER.info("drag and drop");

      String sourceElementString = getXpathFromMap(objectNameSource, screenNameSource);

      String destElementString = getXpathFromMap(objectNameDest, screenNameDest);

      // Wait for both elements to be visible and clickable
      // Use below dual conditions so we only wait a total of 10 seconds for both conditions
      ExpectedCondition<?>[] conditionsToEvaluate = new ExpectedCondition[2];
      conditionsToEvaluate[0] =
          ExpectedConditions.elementToBeClickable(By.xpath(sourceElementString));
      conditionsToEvaluate[1] =
          ExpectedConditions.elementToBeClickable(By.xpath(destElementString));

      boolean found = false;
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        found = wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
            .until(ExpectedConditions.and(conditionsToEvaluate));
      } catch (TimeoutException te) {
        found = false;
      }

      LOGGER.info("Wait finished");

      if (!found) {
        // no way to get individual results from conditionsToEvaluate so re run to determine correct
        // result to return
        try {
          WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
          wait.until(ExpectedConditions.elementToBeClickable(By.xpath(sourceElementString)));
        } catch (Exception e) {
          LOGGER.error("source element is not clickable after 10 seconds");
          return false;
        }

        try {
          WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
          wait.until(ExpectedConditions.elementToBeClickable(By.xpath(destElementString)));
        } catch (Exception e) {
          LOGGER.error("dest element is not clickable after 10 seconds");
          return false;
        }
      }
      WebElement source = webDriver.findElement(By.xpath(sourceElementString));
      WebElement dest = webDriver.findElement(By.xpath(destElementString));
      Actions actions = new Actions(webDriver);
      actions.dragAndDrop(source, dest).perform();
      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

  }

  /**
   * This method uses Action Class to perform a Hover operation on a specific web-element on a
   * screen.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if it was hovered
   */
  public boolean genericHoverActionClass(String objectName, String screenName) {
    try {
      LOGGER.info("Inside genericHoverActionClass method");
      String xpath = getXpathFromMap(objectName, screenName);

      scrollToElement(xpath);

      WebElement webelementClick = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelementClick =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException te) {
        LOGGER.error("Time out waiting to hover");
        return false;
      }

      Actions action = new Actions(webDriver);
      action.moveToElement(webelementClick).perform();
      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Gets the AEM build number and publisher from the source code.
   *
   * @param source Source code of the page
   * @return The build number
   */
  public String getAemBuildNumber(String source) {
    BufferedReader bufReader = null;
    try {
      bufReader = new BufferedReader(new StringReader(source));
      String currentLine = null;

      final String buildNumberRegExp =
          "\\<\\!\\-\\- [0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+ \\/\\/ p[0-9] \\-\\-\\>";
      while ((currentLine = bufReader.readLine()) != null) {
        if (currentLine.trim().matches(buildNumberRegExp)) {
          return currentLine;
        }
      }
      return null;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return null;
    } finally {
      try {
        if (bufReader != null) {
          bufReader.close();
        }
      } catch (IOException e) {
        /* do nothing */
      }
    }
  }

  /**
   * Gets the AEM build number and publisher from the source code for the provided URL.
   *
   * @param url the URL of the page
   * @return The build number
   */
  public String getAemBuildNumber(URI url) {
    LOGGER.info("Inside checkBuildNumberInPageSource()");

    // Load the url and check for DNS error to indicate url does not exist
    try {
      webDriver.get(url.toString());
    } catch (WebDriverException we) {
      LOGGER.error("WebDriverExecption occurred");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(we));
      if (we.toString().contains("ERR_NAME_NOT_RESOLVED")) {
        LOGGER.info("ERR_NAME_NOT_RESOLVED received");
        return "ERR_NAME_NOT_RESOLVED";
      }
    }
    try {
      String htmlSource = (webDriver).getPageSource();
      return getAemBuildNumber(htmlSource);
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return null;
    }
  }

  /**
   * Determine the AEM Environment from the URL.
   *
   * @param uri URL to look up
   * @return AEM Environment (eg. QA, Stage, Prod)
   */
  private String getAemEnvironment(URI uri) {
    final String domain = uri.getHost();

    if (domain == null) {
      return "unknown-env";
    }

    switch (domain) {
      // Hotfix
      case "publisher1-hotfix.racv.adobecqms.net":
      case "publisher2-hotfix.racv.adobecqms.net":
      case "racv-hotfix65.adobecqms.net":
      case "author1-hotfix.racv.adobecqms.net":
        return "hotfix";
      // Sandbox
      case "racv-sandbox65-01.adobecqms.net":
      case "dispatcher1-sandbox.racv.adobecqms.net":
      case "publisher1-sandbox.racv.adobecqms.net":
      case "author1-sandbox.racv.adobecqms.net":
      case "author-racv-sandbox65-01.adobecqms.net":
        return "sandbox";
      // Dev1
      case "racv-dev65-01.adobecqms.net":
      case "publish1-dev65.racv.adobecqms.net":
      case "author1-dev65.racv.adobecqms.net":
      case "author-racv-dev65-01.adobecqms.net":
        return "dev";
      // QA
      case "qa.racv.com.au":
      case "racv-qa-65.adobecqms.net":
      case "publish1-qa65.racv.adobecqms.net":
      case "publish2-qa65.racv.adobecqms.net":
      case "dispatcher1-qa65.racv.adobecqms.net":
      case "dispatcher2-qa65.racv.adobecqms.net":
      case "author1-qa65.racv.adobecqms.net":
        return "qa";
      // Staging
      case "staging65-cloudfront.racv.com.au":
      case "staging.arcline.com.au":
      case "staging.arevo.com.au":
      case "staging65.bourkestreetgreen.com.au":
      case "staging-smartplace.racv.com.au":
      case "staging.redspotsurvey.com.au":
      case "staging.redspotsurvey.racv.com.au":
      case "staging.racv.com.au":
      case "staging-cloudfront.racv.com.au":
      case "dispatcher1-stage65.racv.adobecqms.net":
      case "dispatcher2-stage65.racv.adobecqms.net":
      case "racv-stage65-01.adobecqms.net":
      case "publish2-stage65.racv.adobecqms.net":
      case "publish1-stage65.racv.adobecqms.net":
      case "author1-stage65.racv.adobecqms.net":
      case "aem65-staging.racv.com.au":
      case "aem-staging.racv.com.au":
        return "staging";
      // Prod
      case "publish1apsoutheast2.racv.adobecqms.net":
      case "publish2apsoutheast2.racv.adobecqms.net":
      case "racv-prod65-01.adobecqms.net":
      case "www.racv.com.au":
      case "smartplace.racv.com.au":
      case "wwww.bourkestreetgreen.com.au":
      case "wwww.redspotsurvey.com.au":
      case "wwww.arevo.com.au":
      case "author1apsoutheast2.racv.adobecqms.net":
      case "aem.racv.com.au":
        return "prod";
      default:
        LOGGER.debug("Unknown environment: {}", domain);
        return "unknown-env";
    }
  }

  /**
   * Returns console messages.
   *
   * @param minimumLevel The minimum level of messages to get
   * @returns List of console errors
   */
  public List<LogEntry> getConsoleMessages(Level minimumLevel) {
    // Keep record of the messages as calling get() clears it
    browserLogs.addAll(webDriver.manage().logs().get("browser").getAll());

    // Filter by minimumLevel
    Stream<LogEntry> filtered =
        browserLogs.stream().filter(log -> log.getLevel().intValue() >= minimumLevel.intValue());

    return filtered.collect(Collectors.toList());
  }

  public String getCurrentBrowserName() {
    return currentBrowserName;
  }

  public String getCurrentBrowserPlatform() {
    return currentBrowserPlatform;
  }

  /**
   * Get the current page URL.
   *
   * @return The current page URL
   */
  public String getCurrentUrl() {
    String actualPageAddress = null;
    try {
      LOGGER.info("Inside addressNavigatedTo()");
      // Get the actual or current page address or URL
      // Wait for address to change
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        wait.ignoring(WebDriverException.class).until(ExpectedConditions.urlContains("http"));
      } catch (TimeoutException te) {
        /* Do nothing if time out */
      }

      actualPageAddress = (webDriver).getCurrentUrl();
      LOGGER.info("Current page URL: {}", actualPageAddress);
      return actualPageAddress;
    } catch (Exception e) {
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return actualPageAddress;
    }
  }

  /**
   * Get the elements text.
   *
   * @author Jing Zuo
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return The value or null
   */
  public String getElementText(String objectName, String screenName) {
    String value = null;
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return value;
      }
      value = webelement.getText();
      return value;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      value = "Error";
      return value;
    }
  }

  /**
   * This method helps with getting the value or text value depending on the tag type.
   *
   * @param webelement The element to get the value from
   * @return element's value or text
   */
  private String getElementTextOrValue(WebElement webelement) {
    try {
      switch (webelement.getTagName()) {
        case "textarea":
        case "input":
          final String valueBefore = webelement.getAttribute("value");
          if (valueBefore == null) {
            return "";
          } else {
            return valueBefore;
          }
        default:
          return webelement.getText();
      }
    } catch (StaleElementReferenceException e) {
      return "";
    } catch (Exception e) {
      LOGGER.error("getElementTextOrValue threw an error");
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return "";
    }
  }

  /**
   * Gets the javascript object from the page in JSON format.
   *
   * @param jsObject The JS object
   * @return The object in JSON format
   */
  public String getJavaScriptObject(String jsObject) {
    // Get the digitalData JS object
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    try {
      Object digitalDataResultObject =
          jse.executeScript("return JSON.stringify(" + jsObject + ", null, 2)");
      if (digitalDataResultObject != null) {
        LOGGER.info("JSON object: {}", digitalDataResultObject);
        return digitalDataResultObject.toString();
      }

      LOGGER.info("JSON object: null");
      return null;
    } catch (Exception e) {
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      LOGGER.error(e);
      return null;
    }
  }

  public WebDriver getWebDriver() {
    return webDriver;
  }

  /**
   * Gets the xpath string from the object map. Prints the lookup result to console.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return xpath string
   */
  public String getXpathFromMap(String objectName, String screenName) {
    return getXpathFromMap(objectName, screenName, true);
  }

  /**
   * Gets the xpath string from the object map. Optionally print the lookup result to console.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param printLookup Print the result of the lookup to console.
   * @return xpath string
   */
  public String getXpathFromMap(String objectName, String screenName, boolean printLookup) {
    try {
      String xpath = mapParser.objectParser(objectName, screenName);
      if (printLookup) {
        LOGGER.info("Map lookup: {}/{}, result: {}", screenName, objectName, xpath);
      }
      return xpath;
    } catch (Exception e) {
      final String error =
          "Error with map lookup, screen name: " + screenName + ", object:" + objectName;
      LOGGER.error(error);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Stop and fail the test if any objects are not found
      threadLocalExtentTest.get().log(Status.FAIL, error);
      Assert.assertTrue(!true, error);
      return null;
    }
  }

  /**
   * Hide the map layer on Google maps using JS for visual test snapshots.
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public void hideGoogleMapLayer() {
    String xpath = getXpathFromMap("mapLayer", "googleMaps");
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    try {
      // Set the text
      jse.executeScript(
          "document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.display='none'",
          xpath);
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * Initializes the web driver.
   *
   * @param browser Browser name
   * @param platform Platform type
   * @param testName Test name
   * @return The newly created web driver
   */
  public boolean initializeObjDriver(String browser, String platform, String testName) {
    LOGGER.info("Initialize browser driver");
    currentBrowserName = browser;
    currentBrowserPlatform = platform;

    // Create a test log node every time we start the browser
    threadLocalExtentTest.set(threadLocalParentTest.get().createNode("Launch browser"));

    LOGGER.info("Target browser: {}, target platform: {}, Current os.name: {}, current test: {}",
        browser, platform, System.getProperty("os.name"), testName);
    BaseDriver driver;
    switch (ReadConfigProps.getExecutionPlatform().toUpperCase()) {
      case "LAMBDA":
      case "HYPEREXECUTE":
        driver = new LambdaDriver();
        break;
      case "AZURE":
      case "JENKINS":
        driver = new RemoteDriver();
        break;
      case "LOCAL":
        driver = new LocalDriver();
        break;
      default:
        // If EXECUTIONPLATFORM is blank
        driver = new RemoteDriver();
        break;
    }

    try {
      driver.startDriver(browser, platform, System.getProperty("os.name"), testName);
    } catch (Exception e) {
      LOGGER.error("Error starting the browser");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

    // get the current thread count
    LOGGER.info("threadName: {}", Thread.currentThread().getName());
    LOGGER.info("thread ID: {}", Thread.currentThread().getId());

    if (driver != null && driver.getDriver() != null) {
      LOGGER.info("Driver: {}", driver.getDriver().toString());
      threadLocalDriver.set(driver.getDriver());
      webDriver = threadLocalDriver.get();

      return true;
    } else {
      return false;
    }
  }

  /**
   * Check if the element is visible in the viewport.
   *
   * @param xpath The xpath of the element
   * @return true if visible
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  private Boolean isVisibleInViewport(String xpath) {
    LOGGER.info("Inside isVisibleInViewport");
    return (Boolean) ((JavascriptExecutor) webDriver).executeScript(
        "var el=document.evaluate(arguments[0],document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;if(null!=el)for(var box=el.getBoundingClientRect(),bx=box.left+box.width/2,by=box.top+box.height/2,e=document.elementFromPoint(bx,by);e;e=e.parentElement)if(e===el)return!0;return!1",
        xpath);
  }

  /**
   * This method launches the desired web application. Non 200 AEM page load will return false.
   */
  public boolean launchApp(String url) {
    return launchApp(url, false);
  }

  /**
   * This method launches the desired web application.
   *
   * @param url Url to launch
   * @param ignoreErrors Set to true to fail on non 200 AEM page load
   */
  public boolean launchApp(String url, boolean ignoreErrors) {
    try {
      LOGGER.info("Testing on {} Browser", currentBrowserName);

      if (url.isEmpty()) {
        return navigateToPage(ReadConfigProps.getUrl(), ignoreErrors);
      } else {
        return navigateToPage(url, ignoreErrors);
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method navigates back to the previous page.
   *
   * @return true if successful
   */
  public boolean navigateBackPage() {
    try {
      webDriver.navigate().back();
      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method launches the desired web application If AEM returns 404 - Page not found in the
   * title, it will retry 10 times every 1s. Will fail if non 200 AEM page is loaded.
   *
   * @param pageAddress Page address to navigate to
   * @return true if successful
   */
  public boolean navigateToPage(String pageAddress) {
    return navigateToPage(pageAddress, false);
  }

  /**
   * This method launches the desired web application If AEM returns 404 - Page not found in the
   * title, it will retry 10 times every 1s.
   *
   * @param pageAddress Page address to navigate to
   * @param ignoreErrors Set to true to return failure if non 200 page is loaded on AEM
   * @return true if successful
   */
  public boolean navigateToPage(String pageAddress, boolean ignoreErrors) {
    LOGGER.info("Inside navigateToPage()");
    final int maxRetry = 10;

    // Check if AEM returned 404 page and retry 10 times every 1s
    // This is for tests that publish on AEM and AEM has not published the page fast
    // enough.
    int tries = 0;
    String currentTitle = null;
    while (tries++ < maxRetry) {
      try {
        webDriver.get(pageAddress);
        waitForPageLoad();
      } catch (TimeoutException te) {
        LOGGER.warn("Page timed out trying to load, retrying after 1s, try {}/10", tries);
        waitForSeconds("1");
        continue;
      } catch (Exception e) {
        LOGGER.warn("Error getting page, retrying after 1s, try {}/10", tries);
        LOGGER.debug(e.toString());
        waitForSeconds("1");
        continue;
      }

      try {
        currentTitle = webDriver.getTitle();
        if (currentTitle == null) {
          LOGGER.warn("Page is returning null title, retrying after 1s, try {}/10", tries);
          waitForSeconds("1");
          continue;
        }
      } catch (Exception e) {
        LOGGER.warn("Error getting page title, retrying after 1s, try {}/10", tries);
        waitForSeconds("1");
        continue;
      }

      // Check for AEM error titles
      if (!ignoreErrors && currentTitle.contentEquals(aemErrorPages.get("404"))) {
        // If we are authoring test, wait longer as 404 means page may not be finished
        // publishing.
        if (isAuthoringTest) {
          LOGGER.warn("Page is returning {} in title, retrying after 3s, try {}/10", currentTitle,
              tries);
          waitForSeconds("3");
        } else {
          LOGGER.warn("Page is returning {} in title, retrying after 1s, try {}/10", currentTitle,
              tries);
          waitForSeconds("1");
        }
        continue;
      } else if (!ignoreErrors && currentTitle.contentEquals(aemErrorPages.get("500"))) {
        LOGGER.warn("Page is returning {} in title, retrying after 1s, try {}/10", currentTitle,
            tries);
        waitForSeconds("1");
        continue;
      } else {
        LOGGER.info("Current page title: {}", currentTitle);
      }

      if (pageAddress.contains(STORYBOOK_URI)) {
        try {
          // Storybook has loaded, check if window['STORIES'] is present
          String windowObject = getJavaScriptObject("window['STORIES']");
          if (windowObject != null) {
            return true;
          }
        } catch (Exception e) {
          // something went wrong, will retry below
        }

        LOGGER.warn("Storybook page did not load successfully, retrying after 1s, try {}/10",
            tries);
        waitForSeconds("1");
        continue;
      }

      // we made it this far so no errors occurred
      break;
    }

    // Try to get current AEM Build number and publisher and write to log.
    try {
      String currentUrl = webDriver.getCurrentUrl();
      String currentEnv = getAemEnvironment(new URI(currentUrl));
      if (currentUrl != null && !currentEnv.equals("unknown-env")) {
        String htmlSource = (webDriver).getPageSource();
        String aemBuildNumber = getAemBuildNumber(htmlSource);
        if (aemBuildNumber != null) {
          LOGGER.debug("AEM Page loaded, build number and publisher: {}", aemBuildNumber);
        }
      }
    } catch (Exception e) {
      LOGGER.error("Error getting AEM Build number");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

    if (currentTitle != null) {
      if (aemErrorPages.containsValue(currentTitle)) {
        LOGGER.error("Page is returning {} in title after {}/10", currentTitle, tries);
        if (ignoreErrors) {
          return true;
        } else {
          return false;
        }
      }
    }

    return true;

  }

  /**
   * Normalize digitalData analytics.
   *
   * @param jsonString The JSON string to normalize
   * @return normalized value
   */
  public String normalizeAnalyticsJson(String jsonString) {
    // Need to normalize the following values as they differ across environments:
    //
    // digitalData.page.pageInfo.pageLoadRules
    // digitalData.page.pageInfo.environment
    // digitalData.page.pageInfo.platformVersion

    Configuration suppressExceptionConfiguration =
        Configuration.defaultConfiguration().addOptions(Option.SUPPRESS_EXCEPTIONS);
    DocumentContext jsonData = JsonPath.using(suppressExceptionConfiguration).parse(jsonString);

    // Change or add the values (if they don't exist)
    jsonData.put("$.page.pageInfo", "pageLoadRules", "");
    jsonData.put("$.page.pageInfo", "environment", "test");
    jsonData.put("$.page.pageInfo", "platformVersion", "6.5 SP17");

    return jsonData.jsonString();
  }

  /**
   * Normalize the breadcrumb text by replacing it with "Test Text" for visual test snapshots.
   */
  public void normalizeBreadcrumb() {
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    try {
      // Set the text
      jse.executeScript(
          "document.querySelector('.cmp-breadcrumb__item--active span').innerHTML='Test Text'");
    } catch (Exception e) {
      /* do nothing */
    }
    try {
      // Set the hover state
      jse.executeScript(
          "document.querySelector('.cmp-breadcrumb__item--active span').dataset.text='Test Text'");
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * Normalize the salesforce chat button text by replacing it with "Chat with us!" if no agents are
   * available for visual test snapshots.
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public void normalizeSalesforceChatText() {
    final String xpath = "//span[@class=\"message\"]";
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    try {
      // get the current text
      final String currentValue = jse.executeScript(
          "return document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).innerHTML;",
          xpath).toString();
      if (currentValue.contains("No agents available")) {
        jse.executeScript(
            "document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).innerHTML='Chat with us!'",
            xpath);
      }
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * Normalize the salesforce reference number text by replacing it with "FMD00123456" for visual
   * test snapshots.
   */
  public void normalizeSalesforceReferenceNumber() {
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    try {
      // Set the text
      jse.executeScript("document.querySelector('.refNumber').innerHTML='FMD00123456'");
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * Normalize the HeroBanner H1 title by replacing it with "Test Text" for visual test snapshots.
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public void normalizeTemplateHeroBannerh1() {
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    // BAU
    try {
      // Standard template
      jse.executeScript("document.querySelector('.u-proxima-nova-xlarge').innerHTML='Test Text'");
    } catch (Exception e) {
      /* do nothing */
    }
    try {
      // RA+RAHUB
      jse.executeScript(
          "document.querySelector('.royal-auto-article .ra-article-section .article--headings').innerHTML='Test Text'");
    } catch (Exception e) {
      /* do nothing */
    }
    // AP3
    try {
      jse.executeScript(
          "document.querySelector('.cmp-basic-hero-banner .banner-text h1').innerHTML='Test Text'");
    } catch (Exception e) {
      /* do nothing */
    }
  }

  /**
   * Parses the string and looks for keywords to replace.
   *
   * @param text Original string to be manipulated
   * @return New string with RANDOM[x-y] replaced with random string
   */
  public String parseTextToType(String text) {
    final Matcher randomKeywordMatcher = RANDOM_KEYWORD_REGEX.matcher(text);
    if (randomKeywordMatcher.find()) {
      // Get the number for the index
      final int index = Integer.parseInt(randomKeywordMatcher.group(1));
      final int length = Integer.parseInt(randomKeywordMatcher.group(2));
      String randomString = randomVariables[index];
      // Check if a random variable has been generated for the current index already
      if (randomString == null || randomString.length() != length) {
        randomString = RandomStringUtils.random(length, "0123456789abcdef");
        randomVariables[index] = randomString;
      }
      // Replace all of the occurrences of the keyword with the random string
      text = text.replaceAll("RANDOM\\[[0-9]+-[0-9]+\\]", randomString);
    }

    final Matcher dataMapKeyworkMatcher = DATA_MAP_KEYWORD_REGEX.matcher(text);
    if (dataMapKeyworkMatcher.find()) {
      URI uri;
      try {
        uri = new URI(webDriver.getCurrentUrl());
      } catch (URISyntaxException e) {
        LOGGER.error(e);
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        return null;
      }
      final String currentEnvironment = getAemEnvironment(uri);
      try {
        // Replace all occurrences of the keyword
        final String dataMapValue =
            mapParser.dataMapParser(dataMapKeyworkMatcher.group(1), currentEnvironment);
        text = text.replaceAll("DATAMAP\\[[a-zA-Z]+\\]", dataMapValue);
      } catch (Exception e) {
        LOGGER.error(e);
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      }
    }

    final Matcher urlEnvKeywordMatcher = URLENV_KEYWORD_REGEX.matcher(text);
    if (urlEnvKeywordMatcher.find()) {
      URI uri = null;
      try {
        uri = new URI(webDriver.getCurrentUrl());
      } catch (URISyntaxException e) {
        LOGGER.error(e);
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        text = text.replaceAll("URLENV", "unknown-env");
      }

      final String currentEnvironment = getAemEnvironment(uri);

      // Replace all occurrences of the keyword with the random string
      text = text.replaceAll("URLENV", currentEnvironment);
    }

    final Matcher datetimeEnvKeywordMatcher = DATETIME_KEYWORD_REGEX.matcher(text);
    if (datetimeEnvKeywordMatcher.find()) {
      // Replace all occurrences of the keyword DATETIME with the current date time string
      LocalDateTime myDateObj = LocalDateTime.now();
      DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
      String formattedDate = myDateObj.format(myFormatObj);

      text = text.replaceAll("DATETIME", formattedDate);
    }

    return text;
  }

  /**
   * This method generates random email addresses.
   *
   * @return Random email string in format digitalqa@testXXXXXXXX.racv.com.au
   */
  public String randomEmailGen() {
    final String random = RandomStringUtils.random(8, true, true);
    // final String email = "digitalqa@test.".concat(random).concat(".racv.com.au");
    final String email = "digitalqa-".concat(random).concat("@racv.com.au");
    LOGGER.info("Random Email Generated: {}", email);
    return email;
  }

  /**
   * This method refreshes the current page.
   *
   * @return true if successful
   */
  public boolean refreshPage() {
    try {
      webDriver.navigate().refresh();
      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method releases the click off the currently clicked element (by offset from determined by
   * clickAndHold).
   *
   * @return true if successful
   */
  public boolean releaseClick() {
    try {
      // Get the document height
      final long height = ((long) ((JavascriptExecutor) webDriver)
          .executeScript("return document.documentElement.scrollHeight;"));
      int scrollOffset = -Integer.MAX_VALUE;
      // Determine to move the mouse up or down off depending if it will end off screen or not
      if (height - clickReleaseElementHeight > 0) {
        scrollOffset = -clickReleaseElementHeight;
      } else if (height + clickReleaseElementHeight < height) {
        scrollOffset = clickReleaseElementHeight;
      }

      // Move the mouse off the currently pressed element and release to cancel the click
      Actions releaseClick = new Actions(webDriver);
      releaseClick.moveByOffset(0, scrollOffset).release();
      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method searches and replaces the all occurrences of searchText with replaceText.
   *
   * @author ViengcummThongvilu
   * @param searchText The text to search for
   * @param replaceText The text to replace with
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * 
   * @return ReplaceText result
   */
  public ReplaceText replaceText(String searchText, String replaceText, String objectName,
      String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);
      WebElement webelement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Timeout waiting for element");
        return ReplaceText.OBJECTNOTFOUND;
      }

      if (webelement == null) {
        return ReplaceText.OBJECTNOTFOUND;
      }

      if (!webelement.getAttribute("value").contains(searchText)) {
        return ReplaceText.SEARCHTEXTNOTFOUND;
      }

      // Get value attribute and replace text
      String newText = webelement.getAttribute("value").replace(searchText, replaceText);
      clearText(webelement);
      // Re-type the whole new value into the text box
      LOGGER.info("Replacing text: {}", searchText);
      if (typeTextIntoElement(newText, objectName, screenName, false) == null) {
        return ReplaceText.FAILED;
      } else {
        return ReplaceText.SUCCESS;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return ReplaceText.FAILED;
    }
  }

  /**
   * This method scrolls an element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param scrollPercent Percentage of the scroll bar to scroll to
   * @param screenName The name of the object's screen
   * @return true if successful
   */
  public boolean scrollElement(String objectName, String scrollPercent, String screenName) {
    LOGGER.info("scrolling element to desired percentage");
    try {
      // Get the web element
      String xpath = getXpathFromMap(objectName, screenName);
      final WebElement webelement = webDriver.findElement(By.xpath(xpath));

      JavascriptExecutor jse = (JavascriptExecutor) (webDriver);

      // Get the height of the element
      final long height =
          ((long) (jse.executeScript("return arguments[0].scrollHeight", webelement)));
      final int scrollPercentage = Integer.parseInt(scrollPercent);
      final int finalPosition = Math.round(height * ((float) scrollPercentage / 100));
      LOGGER.info("Element height: {} scroll position: {}", height, finalPosition);

      // Generate the JS string to scroll the page in 250px steps with 250ms wait to allow lazy
      // loading
      // We need a single string as we queue the incremental scrolls
      final int scrollAmount = 250;
      int scrollPosition = 0;
      while (scrollPosition < finalPosition) {
        if (scrollPosition + scrollAmount <= finalPosition) {
          scrollPosition += scrollAmount;
        } else {
          scrollPosition = finalPosition;
        }

        jse.executeScript("arguments[0].scroll({top: arguments[1],left: 0,behavior: 'smooth'});",
            webelement, scrollPosition);
        waitForMilliSeconds(50);
      }

      waitForPageLoad();

      return true;
    } catch (Exception e) {
      LOGGER.error("error with scrolling element");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method scrolls the page to the desired percentage of its height.
   *
   * @param scrollPercent The position of the scroll bar of the page in percentage
   * @return true if successful
   */
  public boolean scrollPageTo(String scrollPercent) {
    if (webDriver == null) {
      return false;
    }

    LOGGER.info("scrolling page to desired percentage");
    try {
      JavascriptExecutor jse = (JavascriptExecutor) (webDriver);

      // Get the height of the element
      final long height =
          ((long) (jse.executeScript("return document.documentElement.scrollHeight;")));
      final int scrollPercentage = Integer.parseInt(scrollPercent);
      final int finalPosition = Math.round(height * ((float) scrollPercentage / 100));
      LOGGER.info("Page height: {} scroll position: {}", height, finalPosition);

      // Generate the JS string to scroll the page in 250px steps with 250ms wait to allow lazy
      // loading
      // We need a single string as we queue the incremental scrolls
      final int scrollAmount = 250;
      int scrollPosition = 0;
      while (scrollPosition < finalPosition) {
        if (scrollPosition + scrollAmount <= finalPosition) {
          scrollPosition += scrollAmount;
        } else {
          scrollPosition = finalPosition;
        }

        jse.executeScript("window.scrollTo({top: arguments[0],left: 0,behavior: 'smooth'});",
            scrollPosition);
        waitForMilliSeconds(50);
      }

      waitForPageLoad();

      return true;
    } catch (Exception e) {
      LOGGER.error("Error with scrolling page");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This scrolls the element into view.
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  private boolean scrollToElement(String xpath) {
    LOGGER.info("Inside scrollToElement String");
    try {
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      try {
        wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
            .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Cannot scroll to element, element doesnt exist");
        return false;
      }

      // Check if scroll is required
      if (!isVisibleInViewport(xpath)) {
        LOGGER.info("Scrolling element into view");
        ((JavascriptExecutor) webDriver).executeScript(
            "document.evaluate(arguments[0], document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null)"
                + ".singleNodeValue?.scrollIntoView({behaviour: 'smooth', block: 'end', inline: 'nearest'});",
            xpath);
        waitForPageLoad();
        LOGGER.info("Scrolled element into view");
      } else {
        LOGGER.info("Element is already in view, skipping scrollToElement");
      }

      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This scrolls the element into view.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true if successful
   */
  public boolean scrollToElement(String objectName, String screenName) {
    LOGGER.info("Inside scrollToElement element/screen");

    try {
      String xpath = getXpathFromMap(objectName, screenName);

      return scrollToElement(xpath);
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Selects all text using CTRL+A.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true if successful
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public boolean selectAllText(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);
      WebElement webElement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webElement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }
      if (currentBrowserPlatform.toLowerCase().contains("mac")
          || currentBrowserPlatform.toLowerCase().contains("ios")) {
        webElement.sendKeys(Keys.chord(Keys.COMMAND, "a"));
      } else {
        webElement.sendKeys(Keys.chord(Keys.CONTROL, "a"));
      }
      LOGGER.info("Selected all text");
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Selects all text using JS.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true if successful
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public boolean selectAllTextUsingJs(String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);
      WebElement webElement = null;
      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webElement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException e) {
        LOGGER.error("Time out waiting for element");
        return false;
      }
      JavascriptExecutor jse = (JavascriptExecutor) webDriver;
      jse.executeScript("window.getSelection().selectAllChildren(arguments[0])", webElement);
      LOGGER.info("Selected all text");
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method helps in selecting a value from drop downs.
   *
   * @param searchValue Actual value/index/HTML options tag value
   * @param objectName Select drop down element. See
   *        https://racvone.atlassian.net/wiki/spaces/RABX/pages/3115712704/Test+Step+Catalogue#select
   * @param screenName screen where the element is present
   * @param selectionType by index, by value, by visible text
   * @return true if successful
   */
  public boolean selectValueFromDropDown(String searchValue, String objectName, String screenName,
      String selectionType) {
    try {
      // Get String
      String xpath = getXpathFromMap(objectName, screenName);
      if (xpath == null) {
        return false;
      }

      List<WebElement> itemLists = null;

      // Wait for the element
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        // return a list of elements based on String type XPATH
        itemLists = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xpath)));
      } catch (TimeoutException te) {
        /* do nothing */
      }

      if (itemLists == null || itemLists.size() == 0) {
        return false;
      }

      if (itemLists.get(0).getTagName().startsWith("coral-select")) {
        // Coral-select handler
        return coralSelectHandler(searchValue, selectionType, itemLists);
      } else if (itemLists.get(0).getTagName().startsWith("input")
          && itemLists.get(0).getAttribute("class").equals("js-select-val")) {
        // AP3 div drop down handler
        return ap3FormDropDownHandler(searchValue, selectionType, itemLists);
      } else {
        // HTML Select handler
        return htmlSelectHandler(searchValue, selectionType, itemLists);
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * AP3 Form div drop down handler.
   *
   * @param searchValue The value to select
   * @param selectionType Selection type by index, by value, by visible text
   * @param selectElement The coral select item
   * @return True if successful
   */
  private boolean ap3FormDropDownHandler(String searchValue, String selectionType,
      List<WebElement> selectElement) {
    WebElement hiddenInput = selectElement.get(0);
    WebElement clickableDropDownArea =
        hiddenInput.findElement(By.xpath("./../div[@role='combobox']"));
    List<WebElement> dropDownOptions =
        hiddenInput.findElements(By.xpath("./../div[@role='listbox']/div[@role='option']"));

    LOGGER.debug("Waiting for clickable dropdown area");
    // Wait for the element to be clickable and open the drop down
    try {
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      // return a list of elements based on String type XPATH
      clickableDropDownArea = wait.ignoring(StaleElementReferenceException.class)
          .until(ExpectedConditions.elementToBeClickable(clickableDropDownArea));
      LOGGER.debug("Clicking dropdown area");
      clickableDropDownArea.click();
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

    // Wait for drop down options to appear
    LOGGER.debug("Waiting for drop down options to appear");
    try {
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      // return a list of elements based on String type XPATH
      wait.ignoring(StaleElementReferenceException.class)
          .until(ExpectedConditions.elementToBeClickable(dropDownOptions.get(0)));
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

    LOGGER.debug("Searching for option");

    try {
      WebElement optionToClick = null;

      int i = 0;
      forLoop: for (WebElement option : dropDownOptions) {
        switch (selectionType.toLowerCase()) {
          case "value":
            final String byValue = option.getAttribute("value");
            if (byValue != null && byValue.contentEquals(searchValue)) {
              LOGGER.info("The value of div dropdown is: {}", option.getText());
              optionToClick = option;
            }
            break;
          case "index":
            if (i == Integer.parseInt(searchValue)) {
              LOGGER.info("The value of div dropdown option #{} is: {}", i, option.getText());
              optionToClick = option;
              break forLoop;
            }
            i++;
            break;
          case "visibletext":
            if (option.getText().contentEquals(searchValue)) {
              LOGGER.info("The value of div dropdown is: {}", option.getText());
              optionToClick = option;
            }
            break;
          default:
            LOGGER.info(
                "Please pass a valid selection type for drop down (value, index, visibleText)");
            return false;
        }
      }

      if (optionToClick == null) {
        LOGGER.error("'{}' option was not found", searchValue);
        return false;
      }

      LOGGER.info("Scrolling element into view");
      ((JavascriptExecutor) webDriver).executeScript(
          "arguments[0].scrollIntoView({behaviour: 'smooth', block: 'end', inline: 'nearest'});",
          optionToClick);
      waitForPageLoad();
      LOGGER.info("Scrolled element into view");

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        // return a list of elements based on String type XPATH
        optionToClick = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(optionToClick));
      } catch (TimeoutException te) {
        /* do nothing */
      }

      optionToClick.click();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Coral Select/Coral Select Group handler.
   *
   * @param searchValue The value to select
   * @param selectionType Selection type by index, by value, by visible text
   * @param selectElement The coral select item
   * @return True if successful
   */
  private boolean coralSelectHandler(String searchValue, String selectionType,
      List<WebElement> selectElement) {
    try {
      List<WebElement> allOptions = selectElement;
      LOGGER.info("Total number of coral select items: {}", allOptions.size());

      WebElement optionToClick = null;

      int i = 0;
      forLoop: for (WebElement option : allOptions) {
        switch (selectionType.toLowerCase()) {
          case "value":
            final String byValue = option.getAttribute("value");
            if (byValue != null && byValue.contentEquals(searchValue)) {
              LOGGER.info("The value of coral select/group is: {}", option.getText());
              optionToClick = option;
            }
            break;
          case "index":
            if (i == Integer.parseInt(searchValue)) {
              LOGGER.info("The value of coral select/group option #{} is: {}", i, option.getText());
              optionToClick = option;
              break forLoop;
            }
            i++;
            break;
          case "visibletext":
            if (option.getText().contentEquals(searchValue)) {
              LOGGER.info("The value of coral select/group is: {}", option.getText());
              optionToClick = option;
            }
            break;
          default:
            LOGGER.info(
                "Please pass a valid selection type for drop down (value, index, visibleText)");
            return false;
        }
      }

      if (optionToClick == null) {
        LOGGER.error("'{}' option was not found", searchValue);
        return false;
      }

      LOGGER.info("Scrolling element into view");
      ((JavascriptExecutor) webDriver).executeScript(
          "arguments[0].scrollIntoView({behaviour: 'smooth', block: 'end', inline: 'nearest'});",
          optionToClick);
      waitForPageLoad();
      LOGGER.info("Scrolled element into view");

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        // return a list of elements based on String type XPATH
        optionToClick = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(optionToClick));
      } catch (TimeoutException te) {
        /* do nothing */
      }

      optionToClick.click();

      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Select function for simple HTML select.
   *
   * @param searchValue The value to search for
   * @param selectionType Selection type by index, by value, by visible text
   * @param webElement The element to click
   * @return true if successful
   */
  private boolean htmlSelectHandler(String searchValue, String selectionType,
      List<WebElement> webElement) {
    WebElement selectElement = webElement.get(0);

    // Wait for the element to be clickable
    try {
      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
      // return a list of elements based on String type XPATH
      selectElement = wait.ignoring(StaleElementReferenceException.class)
          .until(ExpectedConditions.elementToBeClickable(selectElement));
    } catch (TimeoutException te) {
      /* do nothing */
    }

    Select drpDwnBox = new Select(selectElement);

    try {
      switch (selectionType.toLowerCase()) {
        case "value":
          drpDwnBox.selectByValue(searchValue);
          return true;
        case "index":
          drpDwnBox.selectByIndex(Integer.parseInt(searchValue));
          return true;
        case "visibletext":
          // Need to loop through all the options and skip disabled options that are used for
          // group decorators
          int i = 0;
          List<WebElement> options = drpDwnBox.getOptions();
          for (WebElement option : options) {
            if (option.isEnabled() && option.getText().contentEquals(searchValue)) {
              // Click by index
              drpDwnBox.selectByIndex(i);
              return true;
            }
            // Count the current index
            i++;
          }
          return false;
        default:
          LOGGER
              .info("Please pass a valid selection type for drop down (value, index, visibleText)");
          return false;
      }
    } catch (NoSuchElementException e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method sends keys to the web element.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param textToType The text to type
   * @param uploadFile Boolean to specify whether we are typing or uploading a file into the text
   *        field
   * @param javaScript Use JS to type
   */
  private void sendKeys(WebElement webElement, String textToType, boolean uploadFile,
      boolean javaScript) {
    // If javaScript then use javascript to set the value property
    if (javaScript) {
      LOGGER.info("SendKeys JavaScript");
      JavascriptExecutor js = (JavascriptExecutor) webDriver;
      // Set focus on the element
      js.executeScript("arguments[0].focus();", webElement);
      waitForMilliSeconds(100);
      // Set the value
      js.executeScript("arguments[0].value=arguments[1];", webElement, textToType);
      waitForMilliSeconds(100);
      // Send change event to trigger any JS
      js.executeScript("arguments[0].dispatchEvent(new Event('change', { 'bubbles': true }));",
          webElement);
      waitForMilliSeconds(100);
      // remove focus
      js.executeScript("arguments[0].blur();", webElement);
      waitForMilliSeconds(100);
      return;
    }

    // Upload file send keys directly to the input element
    if (uploadFile) {
      webElement.sendKeys(textToType);
      LOGGER.info("File is uploaded");
      return;
    }

    // If text contains slash use JS to type. This is to work around AEM text field bug where
    // slash is sometimes missing when typing text containing slashes
    if (webDriver.getCurrentUrl().contains(ReadConfigProps.getAemUrl())
        && textToType.indexOf('/') > -1 && currentBrowserPlatform.contentEquals("desktop")) {
      // Use JS to paste the value with extra z, press backspace to delete the z to trigger any
      // events
      sendKeys(webElement, textToType + "z", false, true);
      webElement.sendKeys(Keys.BACK_SPACE);
      return;
    }

    try {
      LOGGER.info("SendKeys normal");

      final String beforeTextValue = getElementTextOrValue(webElement);
      final int newExpectedLength = beforeTextValue.length() + textToType.length();

      webElement.sendKeys(textToType);

      // Custom wait condition (wait for last char in text field to equal last typed
      // char)
      final ExpectedCondition<Boolean> textLengthMatches = new ExpectedCondition<Boolean>() {
        @Override
        public Boolean apply(WebDriver driver) {
          final String text = getElementTextOrValue(webElement);
          if (text == null) {
            return false;
          }
          return text.length() >= newExpectedLength;
        }
      };

      // wait max 1s for the text to be input
      if (!webElement.getTagName().contentEquals("body")) {
        final WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMillis(1000));
        wait.ignoring(StaleElementReferenceException.class).until(textLengthMatches);
      }
    } catch (TimeoutException te) {
      /* ok to proceed */
    }

    // Safari mobile workaround for analytics
    if ((ReadConfigProps.getExecutionPlatform().contentEquals("LAMBDA")
        || ReadConfigProps.getExecutionPlatform().contentEquals("HYPEREXECUTE"))
        && currentBrowserPlatform.contentEquals("ios-mobile")) {
      LOGGER.info("Applying LT IOS Analytics workaround");
      JavascriptExecutor js = (JavascriptExecutor) webDriver;
      // Fire change event manually to trigger any analytics
      js.executeScript("arguments[0].dispatchEvent(new Event('change', { 'bubbles': true }));",
          webElement);
    }
  }

  /**
   * This method sends keys to the webelement using Action Class If we are in AEM authoring, custom
   * method is used.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param textToType The text to type
   * @param uploadFile Specify whether we are uploading a file or typing into the element
   */
  private void sendKeysActionClass(WebElement webElement, String textToType, boolean uploadFile) {
    if (uploadFile) {
      Actions sendKeys = new Actions(webDriver);
      sendKeys.sendKeys(textToType).perform();
      LOGGER.info("File is uploaded using Action class");
    } else {
      final String beforeTextValue = getElementTextOrValue(webElement);
      final int newExpectedLength = beforeTextValue.length() + textToType.length();

      // If text contains slash use JS to type. This is to work around AEM text field bug where
      // slash is sometimes missing when typing text containing slashes
      if (webDriver.getCurrentUrl().contains(ReadConfigProps.getAemUrl())
          && textToType.indexOf('/') > -1 && currentBrowserPlatform.contentEquals("desktop")) {
        // Use JS to paste the value with extra z, press backspace to delete the z to trigger any
        // events
        sendKeys(webElement, textToType + "z", false, true);
        Actions sendKeys = new Actions(webDriver);
        sendKeys.sendKeys(Keys.BACK_SPACE).perform();
      } else {
        LOGGER.info("SendKeys normal action class");
        Actions sendKeys = new Actions(webDriver);
        sendKeys.sendKeys(textToType).perform();
        // Custom wait condition (wait for last char in text field to equal last typed
        // char)
        final ExpectedCondition<Boolean> textLengthMatches = new ExpectedCondition<Boolean>() {
          @Override
          public Boolean apply(WebDriver driver) {
            final String text = getElementTextOrValue(webElement);
            if (text == null) {
              return false;
            }
            return text.length() >= newExpectedLength;
          }
        };
        try {
          // wait for the text to be typed to appear
          if (!webElement.getTagName().contentEquals("body")) {
            final WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMillis(1000));
            wait.ignoring(StaleElementReferenceException.class).until(textLengthMatches);
          }
        } catch (TimeoutException te) {
          /* ok to proceed */
        }
      }
    }
  }

  public void setCurrentBrowserName(String browserName) {
    currentBrowserName = browserName;
  }

  public void setCurrentBrowserPlatform(String browserPlatform) {
    currentBrowserPlatform = browserPlatform;
  }

  public void setIsAuthoringTest(boolean isAuthoring) {
    isAuthoringTest = isAuthoring;
  }

  /**
   * This method helps switching between new and parent tabs within a browser instance.
   *
   * @param tabType NEW or PARENT
   * @return true if successful
   */
  public boolean switchBrowserTab(TabType tabType) {
    try {
      if (currentBrowserName.toLowerCase().contentEquals("safari")
          || (currentBrowserPlatform.toLowerCase().contentEquals("ios-mobile")
              && (ReadConfigProps.getExecutionPlatform().toLowerCase()
                  .contentEquals("hyperexecute"))
              || (ReadConfigProps.getExecutionPlatform().toLowerCase().contentEquals("lambda")))) {
        if (!switchBrowserTabSafari(tabType)) {
          return false;
        }
      } else {
        if (!switchBrowserTabGeneric(tabType)) {
          return false;
        }
      }

      // Check tab is ready by reading the URL, if not wait for 1s and try again
      for (int i = 0; i < 10; i++) {
        try {
          if (webDriver.getCurrentUrl() != null) {
            break;
          }
        } catch (WebDriverException ignore) {
          // ignore the error to try again
        }
        LOGGER.info("Tab has not loaded, waiting 1s and retrying");
        waitForSeconds("1");
      }

      waitForPageLoad();
      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Generic method for switching tabs (Chrome + Firefox).
   *
   * @param tabType NEW, PARENT
   * @return true if successful
   */
  private boolean switchBrowserTabGeneric(TabType tabType) {
    final ArrayList<String> tabs = new ArrayList<String>(webDriver.getWindowHandles());
    final int currentTabIndex = tabs.indexOf(webDriver.getWindowHandle());

    switch (tabType) {
      case NEW:
        webDriver.switchTo().window(tabs.get(currentTabIndex + 1));
        break;
      case PARENT:
        // Close the current tab before switching to parent
        webDriver.switchTo().window(tabs.get(currentTabIndex)).close();
        // Switch to old(Parent) tab.
        webDriver.switchTo().window(tabs.get(currentTabIndex - 1));
        break;
      default:
        LOGGER.error("Please pass a valid value. Acceptable arguments are NEW, PARENT");
        return false;
    }
    return true;
  }

  /**
   * Switch tabs on Safari (only supports max 2 tabs).
   *
   * @param tabType NEW, PARENT
   * @return true if successful
   */
  private boolean switchBrowserTabSafari(TabType tabType) {
    final String currentWindow = getWebDriver().getWindowHandle();

    final ArrayList<String> tabs = new ArrayList<String>(webDriver.getWindowHandles());

    LOGGER.debug("Tab count: {}", tabs.size());

    switch (tabType) {
      case NEW:
        for (String tab : tabs) {
          if (!currentWindow.equals(tab)) {
            webDriver.switchTo().window(tab);
          }
        }
        break;
      case PARENT:
        // Close the current tab before switching to parent
        webDriver.switchTo().window(currentWindow).close();
        // Switch to last remaining tab.
        webDriver.switchTo().window(webDriver.getWindowHandles().toArray(new String[0])[0]);
        break;
      default:
        LOGGER.error("Please pass a valid value. Acceptable arguments are NEW, PARENT");
        return false;
    }
    return true;
  }

  /**
   * This method helps switching between an iFrame and it's absolute parent.
   *
   * @param direction Direction to switch frames (TO, FROM, PARENT)
   * @return true if successful
   */
  public boolean switchIframe(IframeDirection direction, String frameElement, String screen) {
    try {
      // Get String for iFrame
      String xpath = getXpathFromMap(frameElement, screen);

      WebElement webelement = webDriver.findElement(By.xpath(xpath));
      // Switch to iFrame
      switch (direction) {
        case TO:
          (webDriver).switchTo().frame(webelement);
          return true;
        case FROM:
          // Switch to absolute parent
          (webDriver).switchTo().defaultContent();
          return true;
        case PARENT:
          // Switch to immediate parent
          (webDriver).switchTo().parentFrame();
          return true;
        default:
          LOGGER.info("Please pass a valid value. Acceptable arguments are TO, FROM ");
          return false;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

  }

  /**
   * Takes a screenshot and saves it to the report.
   */
  private void takeScreenshot(String description) {
    this.extentTestLog(Status.INFO, description,
        MediaEntityBuilder
            .createScreenCaptureFromBase64String(GetScreenShot.getScreenshotBase64(webDriver, this))
            .build());
  }

  /**
   * This method will enter values into an element on the application screen.
   *
   * @param textToType text to be entered
   * @param objectName element in the object map
   * @param screenName screen name in object map
   * @return null on failure, text typed if successful
   */
  public String typeTextIntoElement(String textToType, String objectName, String screenName,
      boolean javaScript) {
    String finalTextToType = null;

    try {
      LOGGER.info("Inside typeTextIntoElement");

      final String xpath = getXpathFromMap(objectName, screenName);

      WebElement webElement = null;

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webElement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException te) {
        /* if the element is not found or clickable, return false; otherwise the step will pass */
        LOGGER.error("Element is not found or clickable after 10 seconds");
        return null;
      }

      // Handle keys: keyword for key press
      if (textToType.startsWith("keys:")) {
        String[] stringSplit = textToType.split(":");
        String key = stringSplit[1].toUpperCase();
        // finalTextToType is only used to provide feed back on what was typed
        finalTextToType = textToType;
        webElement.sendKeys(Keys.valueOf((key)));
        Thread.sleep(500);
        return finalTextToType;
      }

      if (textToType.contentEquals("randomEmailGen")) {
        // Check if random email needs to be entered
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = randomEmailGen();
        sendKeys(webElement, finalTextToType, false, javaScript);
        return finalTextToType;
      }

      if (objectName.toLowerCase().contains("username") && textToType.length() == 0) {
        // If element is a username or password field
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = ReadConfigProps.getAemUsername();
        sendKeys(webElement, finalTextToType, false, javaScript);
        // Mask the username so we dont print it in the log
        return "*****";
      }

      if (objectName.toLowerCase().contains("password") && textToType.length() == 0) {
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = ReadConfigProps.getAemPassword();
        sendKeys(webElement, finalTextToType, false, javaScript);
        // Mask the password so we dont print it in the log
        return "*****";
      }

      finalTextToType = parseTextToType(textToType);

      sendKeys(webElement, finalTextToType, false, javaScript);
      return finalTextToType;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return null;
    }
  }

  /**
   * This method will enter values into the currently active element using Action Class. objectName
   * is provided to check whether the element is interactable.
   *
   * @param textToType text to be entered
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return null on failure, text typed if successful
   */
  public String typeTextIntoElementActionClass(String textToType, String objectName,
      String screenName) {
    String finalTextToType = null;
    try {
      final String xpath = getXpathFromMap(objectName, screenName);

      WebElement webElement = null;

      // Wait for the element to be clickable
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webElement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
      } catch (TimeoutException te) {
        /* if the element is not found or clickable, return false; otherwise the step will pass */
        LOGGER.error("Element is not found or clickable after 10 seconds");
        return null;
      }

      if (textToType.startsWith("keys:")) {
        String[] stringSplit = textToType.split(":");
        String key = stringSplit[1].toUpperCase();
        // finalTextToType is only used to provide feed back on what was typed
        finalTextToType = textToType;
        Actions sendKeys = new Actions(webDriver);
        sendKeys.sendKeys(Keys.valueOf(key)).perform();
        Thread.sleep(500);
        return finalTextToType;
      }

      // Check if random email needs to be entered
      if (textToType.contentEquals("randomEmailGen")) {
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = randomEmailGen();
        sendKeysActionClass(webElement, finalTextToType, false);
        return finalTextToType;
      }

      if (objectName.toLowerCase().contains("username") && textToType.length() == 0) {
        // If element is a username or password field
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = ReadConfigProps.getAemUsername();
        sendKeysActionClass(webElement, finalTextToType, false);
        // Mask the username so we dont print it in the log
        return "*****";
      } else if (objectName.toLowerCase().contains("password") && textToType.length() == 0) {
        if (!xpath.contentEquals("//body")) {
          clearText(webElement);
        }
        finalTextToType = ReadConfigProps.getAemPassword();
        sendKeysActionClass(webElement, finalTextToType, false);
        // Mask the password so we dont print it in the log
        return "*****";
      }

      finalTextToType = parseTextToType(textToType);

      sendKeysActionClass(webElement, finalTextToType, false);
      return finalTextToType;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return null;
    }
  }

  /**
   * This method updates the elements attribute value.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param attrName The name of the attribute to update
   * @param attrValue The new value of the attribute
   * @param screenName The name of the object's screen
   * @returns true or false
   */
  public boolean updateElementAttrValue(String objectName, String attrName, String attrValue,
      String screenName) {
    try {
      LOGGER.info("Update element's attribute");

      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be present
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        // We cannot continue if element is not present
        LOGGER.info("Element does not exist");
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        LOGGER.error(e);
        return false;
      }

      LOGGER.info("Old attribute: {}", webelement.getAttribute(attrName));

      JavascriptExecutor js = (JavascriptExecutor) webDriver;

      js.executeScript("arguments[0].setAttribute(arguments[1], arguments[2])", webelement,
          attrName, attrValue);

      LOGGER.info("New attribute: {}", webelement.getAttribute(attrName));

      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method updates the elements innerHTML.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param innerHtml The new innerHTML to update to
   * @param screenName The name of the object's screen
   * @returns true or false
   */
  public boolean updateElementsInnerHtml(String objectName, String innerHtml, String screenName) {
    try {
      LOGGER.info("Update element's innerHTML");

      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be present
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        // We cannot continue if element is not present
        LOGGER.info("Element does not exist");
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        LOGGER.error(e);
        return false;
      }

      JavascriptExecutor js = (JavascriptExecutor) webDriver;

      js.executeScript("arguments[0].innerHTML = arguments[1]", webelement, innerHtml);

      return true;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This method helps in uploading a file on a webpage Ensure to verify element is visible before
   * this step.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param filePath The text string representing the file path
   * @return true if successful
   */
  public boolean uploadFile(String objectName, String screenName, String filePath) {
    try {
      LOGGER.info("Typing filePath into webelement: {}", filePath);

      if (!filePath.isEmpty()) {
        File file = new File(filePath);
        if (!file.exists() || file.isDirectory()) {
          LOGGER.error("Invalid file path provided");
          return false;
        }

        if (!file.canRead()) {
          LOGGER.error("Unable to read file");
          return false;
        }

        final String xpath = getXpathFromMap(objectName, screenName);

        WebElement webelement = null;

        // Ensure element is present so we can directly send the filepath to it
        try {
          WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
          webelement = wait.ignoring(StaleElementReferenceException.class)
              .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
        } catch (TimeoutException te) {
          /* if the element is not found or clickable, return false; otherwise the step will pass */
          LOGGER.info("Element is not found or clickable after 10 seconds");
          return false;
        }

        sendKeys(webelement, filePath, true, false);
        return true;
      } else {
        return false;
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * This checks the current page for WCAG 2.1 AA compliance and returns the failure report If Phase
   * 3 GDPR is showing, this method will hide it before performing the check to prevent false
   * positives
   *
   * @returns Report of axe scan
   */
  public String verifyAccessibility() {
    // The list of rules to check
    final List<String> targetStandards = Arrays.asList("wcag21aa", "wcag21a", "wcag2aa", "wcag2a");
    // List of exclusions
    final List<String> targetExclusions = Arrays.asList("color-contrast", "meta-viewport");
    // List of CSS elements to ignore
    // Filter map google map
    final List<String> cssExclusions = Arrays.asList(".gm-style");

    String result = null;
    try {
      // Check if we are on story book or not
      if (!webDriver.getCurrentUrl().contains(STORYBOOK_URI)) {
        LOGGER.info("We are not on storybook, need to check if P3 GDPR is showing");
        // If GDPR is showing then we need to modify the class atribute to hide it
        String gdprShowing = getXpathFromMap("gdprDivShowing", "racvHomePage");
        String gdprHide = getXpathFromMap("gdprDivHide", "racvHomePage");
        LOGGER.info("GDPR Showing String value: {}", gdprShowing);
        LOGGER.info("GDPR Hide String value: {}", gdprHide);

        WebElement webelement = null;
        try {
          webelement = webDriver.findElement(By.xpath(gdprShowing));
        } catch (Exception e) {
          // do nothing
        }

        if (webelement != null) {
          LOGGER.info("P3 GDPR is showing, we need to hide it");
          final String previousDivClass = webelement.getAttribute("class");
          // GDPR is showing, set class to hide it and then perform accessibility check
          ((JavascriptExecutor) webDriver)
              .executeScript("arguments[0].setAttribute('class','" + gdprHide + "')", webelement);
          // Perform the accessiblity check
          LOGGER.info("P3 GDPR hidden, performing accessibility check");
          result =
              AxeHtmlReporter.createAxeHtmlReport(webDriver, "src/test/resources/Reports/test.html",
                  true, true, targetStandards, targetExclusions, cssExclusions);
          // Reset the div class back to the previous value
          LOGGER.info("Accessibility check complete, resetting P3 GDPR div");
          ((JavascriptExecutor) webDriver).executeScript(
              "arguments[0].setAttribute('class','" + previousDivClass + "')", webelement);
        } else {
          // P3 GDPR is not showing, perform accessibility check as normal
          LOGGER.info("P3 GDPR is not shown, performing accessibility check");
          result =
              AxeHtmlReporter.createAxeHtmlReport(webDriver, "src/test/resources/Reports/test.html",
                  true, true, targetStandards, targetExclusions, cssExclusions);
        }
      } else {
        // We are on storybook, perform accessibility check as normal
        LOGGER.info("Current page is storybook, performing accessibility check");
        result =
            AxeHtmlReporter.createAxeHtmlReport(webDriver, "src/test/resources/Reports/test.html",
                true, true, targetStandards, targetExclusions, cssExclusions);
      }

      return result;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return null;
  }

  /**
   * This method verifies copy text is visible.
   *
   * @author Sumanta Roy
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if copy text is visible
   */
  public boolean verifyCopyTextIsVisible(String objectName, String screenName) {
    try {
      // Get String
      String xpath = getXpathFromMap(objectName, screenName);

      // Get reference copy text from Copy Map
      String strRefCopyText = mapParser.copyParser(objectName, screenName);
      LOGGER.info("Copy map value: {}", strRefCopyText);

      // Wait for the element
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException te) {
        /* do nothing */
      }

      final WebElement webElement = webDriver.findElement(By.xpath(xpath));

      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));

      // wait for text to match
      ExpectedCondition<Boolean> waitForTextMatch = new ExpectedCondition<Boolean>() {
        @Override
        public Boolean apply(WebDriver driver) {
          try {
            String strActualText;
            // Get on screen Copytext
            // Encode string using charset if found in the meta tag otherwise string compare
            // will not work
            // Get charset meta tag
            WebElement metaTag = null;
            try {
              metaTag = (driver).findElement(By.xpath("//meta[@charset]"));
            } catch (org.openqa.selenium.NoSuchElementException ne) {
              /* OK to continue on error */
            }

            if (metaTag != null) {
              strActualText = new String(webElement.getText().trim()
                  .getBytes(Charset.forName(metaTag.getAttribute("charset"))));
            } else {
              strActualText = webElement.getText().trim();
            }
            return strActualText.trim().contentEquals(strRefCopyText.trim());
          } catch (Exception e) {
            // error occured
            return false;
          }
        }
      };
      boolean result = false;
      try {
        result = wait.ignoring(StaleElementReferenceException.class).until(waitForTextMatch);
      } catch (TimeoutException te) {
        /* do nothing */
      }
      if (webElement != null) {
        if (webElement.getText() != null) {
          LOGGER.info("Copy text is visible, value: {}", webElement.getText().trim());
          return result;
        }
      }
      LOGGER.info("Copy text was null");
      return false;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Verifies css attribute matches the value for a web element.
   *
   * @param cssAttribute The CSS attribute to check
   * @param expectedAttributeValue The expected value
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if matches
   */
  public boolean verifyCssAttribute(String cssAttribute, String expectedAttributeValue,
      String objectName, String screenName) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);
      WebElement webelement = webDriver.findElement(By.xpath(xpath));
      String cssAttributeValue = webelement.getCssValue(cssAttribute);
      LOGGER.info("Attribute: {}, value: {}, expected: {}", cssAttribute, cssAttributeValue,
          expectedAttributeValue);
      return cssAttributeValue.contentEquals(expectedAttributeValue);
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

  }

  /**
   * This method finds and matches either of 2 text messages passed to it for a given screen.
   *
   * @param objectName1 The name of copytext object1 referencing the element in the map
   * @param objectName2 The name of copytext object2 referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if matching
   */
  public boolean verifyEitherCopyText(String objectName1, String objectName2, String screenName) {

    try {
      LOGGER.info("Inside verifyEitherCopyText()");

      // Get String for copyRef1
      String xpath1 = getXpathFromMap(objectName1, screenName);
      LOGGER.info("String1 value:{}", xpath1);

      // Get String for copyRef2
      String xpath2 = getXpathFromMap(objectName2, screenName);
      LOGGER.info("String2 value:{}", xpath2);

      ExpectedCondition<?>[] conditionsToEvaluate = new ExpectedCondition[2];
      conditionsToEvaluate[0] = ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath1));
      conditionsToEvaluate[1] = ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath2));

      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
            .until(ExpectedConditions.or(conditionsToEvaluate));
      } catch (TimeoutException te) {
        LOGGER.error("No match for ref1 or ref 2");
        return false;
      }

      // Check the first copy ref
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
        WebElement webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath1)));
        // Get on screen Copytext
        String strActualText = webelement.getText().trim();
        LOGGER.info("Actual text 1: {}", strActualText);

        // Get reference copy text from Copy Map
        String strRefCopyText = mapParser.copyParser(objectName1, screenName);
        LOGGER.info("Reference text 1: {}", strRefCopyText);

        if (strActualText.trim().contentEquals(strRefCopyText.trim())) {
          LOGGER.info("Match for reference text 1");
          return true;
        }
      } catch (Exception e) {
        LOGGER.error("No match for reference text 1");
      }

      // Check the second copy ref
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofNanos(1));
        WebElement webelement = wait.ignoring(StaleElementReferenceException.class)
            .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath2)));
        // Get on screen Copytext
        String strActualText = webelement.getText().trim();
        LOGGER.info("Actual text 2: {}", strActualText);

        // Get reference copy text from Copy Map
        String strRefCopyText = mapParser.copyParser(objectName2, screenName);
        LOGGER.info("Reference text 2: {}", strRefCopyText);

        if (strActualText.trim().contentEquals(strRefCopyText.trim())) {
          LOGGER.info("Match for reference text 2");
          return true;
        }
      } catch (Exception e) {
        LOGGER.error("No match for reference text 2");
      }
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }

    LOGGER.info("No match for reference 1 or reference 2");
    return false;
  }

  /**
   * Verify elements attribute value is equal to the reference.
   *
   * @param attrName The name of the attribute
   * @param attrValue The expected value of the attribute, if empty string, ensure attribute exists
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @returns true or false
   */
  public Result verifyElementAttributeEquals(String attrName, String attrValue, String objectName,
      String screenName) {
    Result result = new Result();
    try {
      LOGGER.info("Verify element's attribute equals");

      String xpath = getXpathFromMap(objectName, screenName);

      WebElement webelement = null;
      // Wait for the element to be present
      try {
        WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(10));
        webelement =
            wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
      } catch (TimeoutException e) {
        // We cannot continue if element is not present
        LOGGER.info("Element does not exist");
        LOGGER.error(e);
        LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
        result.setMessage("Element does not exist");
        return result;
      }

      String attribute = webelement.getAttribute(attrName);
      LOGGER.info("The expected attribute of {} equals: {}", attrName, attrValue);
      LOGGER.info("The actual attribute of {} equals: {}", attrName, attribute);

      result.setMessage(attribute);

      if (attribute == null) {
        LOGGER.info("The attribute {} does not exist", attrName);
        result.setMessage("Attribute does not exist");
        return result;
      }

      // Check if expected value is "" which means we want to ensure attribute is present and has
      // any value including empty
      if (attrValue.contentEquals("")) {
        LOGGER.info("The attribute {} exists and has a value", attrName);
        result.setStatus(true);
        return result;
      }

      if (!attribute.contentEquals(attrValue)) {
        LOGGER.info("The actual attribute of {} is not as expected", attrName);
        return result;
      }

      result.setStatus(true);

      return result;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      result.setMessage("Error occurred");
      return result;
    }
  }

  /**
   * This method validates if a JSON string equals the expected value for the given JS object which
   * is converted to JSON.
   *
   * @param expectedValue The expected value
   * @param jsObject The javascript Object
   * @return non null value if mismatch or error occurred
   */
  public Result verifyJavaScriptJsonStringEquals(String expectedValue, String jsObject) {
    // Get the digitalData JS object
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    Result result = new Result();
    int tries = 0;
    while (tries++ < 10) {
      try {
        String jsonObject = jse.executeScript("return JSON.stringify(" + jsObject + ")").toString();

        // Normalize digitaldata values that differ across environments
        if (jsObject.toLowerCase().equals("digitaldata")) {
          jsonObject = normalizeAnalyticsJson(jsonObject);
          // Normalize input
          expectedValue = normalizeAnalyticsJson(expectedValue);
        }

        result.setMessage(jsonObject.toString());

        if (expectedValue.contentEquals((jsonObject.toString()))) {
          // Compare actual and expected values and return
          LOGGER.info("Values match");
          result.setStatus(true);
          return result;
        } else {
          LOGGER.info("Analytics values do not match, retrying {}/10", tries);
          Thread.sleep(1000);
          continue;
        }
      } catch (Exception e) {
        LOGGER.error("Error with analytics, retrying {}/10", tries);
        result.setMessage("Error occurred");
        try {
          Thread.sleep(1000);
        } catch (InterruptedException ie) {
          /* do nothing */
        }
        continue;
      }
    }
    LOGGER.info("Values do not match");
    return result;

  }

  /**
   * This method validates if a key equals the expected value for the given JS object.
   *
   * @param key The key of the object
   * @param expectedValue The expected value
   * @param jsObject The javascript Object
   * @return non null value if mismatch or error occurred
   */
  public Result verifyJavaScriptObjectEquals(String key, String expectedValue, String jsObject) {
    // Get the digitalData JS object
    JavascriptExecutor jse = (JavascriptExecutor) webDriver;
    String actualValue = "";
    final String valueToCompare = parseTextToType(expectedValue);
    Result result = new Result();
    int tries = 0;
    while (tries++ < 10) {
      try {
        Object digitalDataResultObject = jse.executeScript("return " + jsObject + "");
        // Convert to JSON
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String actualDigitalDataJson = gson.toJson(digitalDataResultObject);
        LOGGER.info("JSON object: {}", actualDigitalDataJson);
        // Using JSON Path to extract value
        LOGGER.info("JSON path: {}", key);
        // Create Json context
        DocumentContext jsonContext = JsonPath.parse(actualDigitalDataJson);
        // convert the value to string
        actualValue = (jsonContext.read(key)).toString().trim();
        LOGGER.info("Value: {}", actualValue);

        // Trim [] for numerics/ int values. This happens since JS object is converted
        // to JSON
        if (actualValue.contains("[\"")) {
          actualValue = actualValue.replace("[\"", "");
          actualValue = actualValue.replace("\"]", "");
          LOGGER.info("Value trimmed: {}", actualValue);
        }

        result.setMessage(actualValue);

        if (valueToCompare.contentEquals((actualValue))) {
          // Compare actual and expected values and return
          LOGGER.info("Values match");
          result.setStatus(true);
          return result;
        } else {
          LOGGER.info("Analytics values do not match, retrying {}/10", tries);
          Thread.sleep(1000);
          continue;
        }
      } catch (Exception e) {
        LOGGER.error("Error with analytics, retrying {}/10", tries);
        result.setMessage("Error occurred");
        try {
          Thread.sleep(1000);
        } catch (InterruptedException ie) {
          /* do nothing */
        }
        continue;
      }
    }
    LOGGER.info("Values do not match");
    return result;
  }

  /**
   * This verifies the xml exists node by xpath.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @return true if xml mode it exists
   */
  public boolean verifyXmlNode(String objectName, String screenName) {
    try {
      LOGGER.info("In verifyXMLNode");
      String xpathValue = getXpathFromMap(objectName, screenName);

      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
      String source = (webDriver).getPageSource();

      InputStream inputStream = new ByteArrayInputStream(source.getBytes());
      Document doc = builder.parse(inputStream);
      XPathFactory xpathFactory = XPathFactory.newInstance();
      XPath xpath = xpathFactory.newXPath();
      XPathExpression expr = xpath.compile(xpathValue);
      String output = expr.evaluate(doc);

      return output != null;

    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
    return false;
  }

  /**
   * This method waits for the element to be visible or timeout, whichever occurs first.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param waitInSeconds Number of seconds to wait
   */
  public void waitForElementOrSeconds(String objectName, String screenName, String waitInSeconds) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      long waitLong = Long.parseLong(waitInSeconds) * 1000;

      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMillis(waitLong));
      wait.ignoring(StaleElementReferenceException.class, NoSuchElementException.class)
          .until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));

      waitForPageLoad();
    } catch (TimeoutException e) {
      return;
    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }
  }

  /**
   * This method waits for the element to disappear or timeout, whichever occurs first.
   *
   * @param objectName The name of the object referencing the element in the map
   * @param screenName The name of the object's screen
   * @param waitInSeconds Duration to wait in seconds
   */
  public void waitForElementToDisappearOrSeconds(String objectName, String screenName,
      String waitInSeconds) {
    try {
      String xpath = getXpathFromMap(objectName, screenName);

      long waitLong = Long.parseLong(waitInSeconds) * 1000;

      WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMillis(waitLong));
      wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(xpath)));
    } catch (TimeoutException | NoSuchElementException | IllegalArgumentException e) {
      // If element does not exist then we dont need to wait

    } catch (Exception e) {
      LOGGER.error(e);
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

    waitForPageLoad();
  }

  /**
   * This method waits for the specified time.
   *
   * @param milliseconds wait time in milliseconds
   */
  public void waitForMilliSeconds(long milliseconds) {
    try {
      Thread.sleep(milliseconds);
    } catch (InterruptedException e) {
      // do nothing
    }
  }

  /**
   * Waits for page to finish loading.
   *
   * @return time waited in ms
   * 
   */
  private int waitForPageLoad() {
    return waitForPageLoad(10, webDriver);
  }

  /**
   * Waits for page to finish loading.
   *
   * @param duration max wait duration in seconds
   * @param webDriver the web driver
   * @return time waited in ms
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  public int waitForPageLoad(int duration, WebDriver webDriver) {
    final long now = System.currentTimeMillis();

    // We need to wait a bit for any JS or loading actions to actually begin before we can actually
    // monitor if they are still running or not
    waitForPageToStartLoading(100, webDriver);

    WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofSeconds(duration));
    List<ExpectedCondition<?>> conditionsToEvaluate = new ArrayList<>();

    // Take a snapshot of the current dom and store it
    String initialHash = null;
    try {
      initialHash = ((JavascriptExecutor) webDriver)
          .executeScript(
              JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
          .toString();
    } catch (Exception e) {
      // Exception is thrown when page is still loading and document.documentElement.outerHTML
      // returns null
    }
    final String[] hashes = new String[] {initialHash, initialHash};
    final long[] sleepTime = new long[] {System.currentTimeMillis()};
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          if (hashes[0] == null) {
            hashes[0] = ((JavascriptExecutor) webDriver)
                .executeScript(
                    JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
                .toString();
            return false;
          }

          // Get the hash of the dom as it currently is and compare the hashes
          hashes[1] = ((JavascriptExecutor) webDriver)
              .executeScript(
                  JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
              .toString();
          if (!hashes[0].contentEquals(hashes[1])) {
            // Page has changed, reset timer and hash
            sleepTime[0] = System.currentTimeMillis();
            hashes[0] = hashes[1];
          }

          if (System.currentTimeMillis() - sleepTime[0] >= 400) {
            // Page DOM has not changed for 400ms, consider it
            // loaded
            return true;
          }

          return false;
        } catch (Exception e) {
          // Exception is thrown when page is still loading and document.documentElement.outerHTML
          // returns null
          return false;
        }
      }
    });

    // wait for images to load
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          return ((Long) ((JavascriptExecutor) webDriver).executeScript(
              "for (let i of document.images) {if(!i.complete && (i.height>0||i.width>0))return !1;}return 1;") == 1);
        } catch (Exception e) {
          return true;
        }
      }
    });

    // wait for jQuery to finish
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          return ((Long) ((JavascriptExecutor) webDriver)
              .executeScript("return jQuery.active") == 0);
        } catch (Exception e) {
          // no jQuery present
          return true;
        }
      }
    });

    // wait for Javascript to finish
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        return ((JavascriptExecutor) webDriver).executeScript("return document.readyState")
            .toString().contentEquals("complete");
      }
    });

    try {
      String coralWaits = getXpathFromMap("aemEditorLoadingAnimation", "aemSitesPage", false);
      List<WebElement> coralWaitElements = webDriver.findElements(By.xpath(coralWaits));
      if (!coralWaitElements.isEmpty()) {
        conditionsToEvaluate.add(ExpectedConditions.invisibilityOfAllElements(coralWaitElements));
      }
    } catch (Exception e) {
      /* do nothing */
    }

    try {
      wait.until(ExpectedConditions.and(conditionsToEvaluate.toArray(new ExpectedCondition<?>[0])));
    } catch (TimeoutException te) {
      LOGGER.warn("Time out waiting for page load (more than {}s)", duration);
    } catch (Exception e) {
      LOGGER.error("Error with wait for conditionsToEvaluate");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

    long finished = System.currentTimeMillis();
    int time = (int) (finished - now);

    LOGGER.info("Page load wait time: {}ms", time);

    return time;
  }

  /**
   * Waits for page to begin loading.
   *
   * @param duration max wait duration in ms
   * @param webDriver web driver object
   * @return page is loading
   */
  public boolean waitForPageToStartLoading(long duration, WebDriver webDriver) {
    WebDriverWait wait = new WebDriverWait(webDriver, Duration.ofMillis(duration));
    List<ExpectedCondition<?>> conditionsToEvaluate = new ArrayList<>();

    // Take a snapshot of the current dom and store it
    String initialHash = null;
    try {
      initialHash = ((JavascriptExecutor) webDriver)
          .executeScript(
              JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
          .toString();
    } catch (Exception e) {
      // Exception is thrown when page is still loading and document.documentElement.outerHTML
      // returns null
    }
    final String[] hashes = new String[] {initialHash, initialHash};
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          if (hashes[0] == null) {
            hashes[0] = ((JavascriptExecutor) webDriver)
                .executeScript(
                    JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
                .toString();
            return false;
          }

          // Get the hash of the dom as it currently is and compare the hashes
          hashes[1] = ((JavascriptExecutor) webDriver)
              .executeScript(
                  JS_HASHCODE_FUNCTION + " return cyrb53a(document.documentElement.outerHTML);")
              .toString();
          if (!hashes[0].contentEquals(hashes[1])) {
            // Page has changed
            return true;
          }

          return false;
        } catch (Exception e) {
          // Exception is thrown when page is still loading and document.documentElement.outerHTML
          // returns null
          return false;
        }
      }
    });

    // wait for images loading
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          @SuppressWarnings("checkstyle:LineLength")
          final String js =
              "for (let i of document.images) {if(!i.complete && (i.height>0||i.width>0))return !1;}return 1;";
          return ((Long) ((JavascriptExecutor) webDriver).executeScript(js) != 1);
        } catch (Exception e) {
          return false;
        }
      }
    });

    // wait for jQuery (connections > 1)
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        try {
          return ((Long) ((JavascriptExecutor) webDriver)
              .executeScript("return jQuery.active") > 1);
        } catch (Exception e) {
          // no jQuery present
          return true;
        }
      }
    });

    // wait for Javascript (document.readyState != complete)
    conditionsToEvaluate.add(new ExpectedCondition<Boolean>() {
      @Override
      public Boolean apply(WebDriver driver) {
        return !((JavascriptExecutor) webDriver).executeScript("return document.readyState")
            .toString().contentEquals("complete");
      }
    });

    try {
      String waitAnimation = getXpathFromMap("aemEditorLoadingAnimation", "aemSitesPage", false);
      List<WebElement> waitElements = webDriver.findElements(By.xpath(waitAnimation));
      if (!waitElements.isEmpty()) {
        for (WebElement currentElement : waitElements) {
          conditionsToEvaluate.add(ExpectedConditions.visibilityOf(currentElement));
        }
      }
    } catch (Exception e) {
      /* do nothing */
    }

    try {
      // Check for any of the conditions is true (or) to determine if something is loading
      wait.ignoring(StaleElementReferenceException.class)
          .until(ExpectedConditions.or(conditionsToEvaluate.toArray(new ExpectedCondition<?>[0])));
    } catch (TimeoutException te) {
      LOGGER.warn("Page is not loading");
      return false;
    } catch (Exception e) {
      LOGGER.error("Error waiting for conditionsToEvaluate");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
    }

    LOGGER.info("Page is loading");
    return true;
  }

  /**
   * This method waits for the specified time.
   *
   * @param seconds Wait time in seconds
   */
  public void waitForSeconds(String seconds) {
    final long waitInMilliSeconds = Long.parseLong(seconds) * 1000;
    waitForMilliSeconds(waitInMilliSeconds);
  }

  /**
   * Take a Lambda snapshot.
   *
   * @param snapshotName The name of the current snapshot
   * @return True if successful
   */
  public boolean takeLambdaSnapshot(String snapshotName) {
    try {

      Thread.sleep(60000);
      Map<String, Object> options = new HashMap<>();
      options.put("loadDomContent", true);
      SmartUISnapshot.smartuiSnapshot(webDriver, snapshotName, options);
      waitForSeconds("60");
      return true;
    } catch (Exception e) {
      LOGGER.error("Error taking lambda snapshot");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }

  /**
   * Take a Lambda snapshot.
   *
   * @param snapshotName The name of the current snapshot
   * @param cssString is an array of css selector
   * @return True if successful
   */
  public boolean takeLambdaSnapshotCss(String snapshotName, String[] cssString) {
    try {

      List<String> selector = Arrays.asList(cssString);
      Map<String, Object> options = new HashMap<>();
      Map<String, List<String>> select = new HashMap<>();
      select.put("cssSelector", selector);
      options.put("selectDOM", select);

      Thread.sleep(30000);
      SmartUISnapshot.smartuiSnapshot(webDriver, snapshotName, options);
      waitForSeconds("60");
      return true;
    } catch (Exception e) {
      LOGGER.error("Error taking lambda snapshot");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
  }
}
