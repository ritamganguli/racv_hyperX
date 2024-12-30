package com.qea.racv.runner.driver;

import com.qea.racv.repo.Global;
import io.github.bonigarcia.wdm.WebDriverManager;
import java.util.HashMap;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;

/**
 * Local driver handling.
 *
 * @author viengcumm_thongvilu
 *
 */
public class LocalDriver implements BaseDriver {
  // Change below variable for easy headless mode toggle for debugging
  private static final boolean HEADLESS = true;

  private static final Logger LOGGER = LogManager.getLogger();

  private WebDriver driver;

  public WebDriver getDriver() {
    return driver;
  }

  /**
   * Starts the driver.
   *
   * @param browserName The browser to start
   * @param platform The platform to start the browser on
   * @param executionPlatform The current platform the automation is running on
   * @param testName The name of the current test
   */
  public void startDriver(String browserName, String platform, String executionPlatform,
      String testName) throws Exception {
    LOGGER.info("Current browser: {}", browserName);
    LOGGER.info("Current platform: {}", platform);
    LOGGER.info("Current executionPlatform: {}", executionPlatform);

    switch (browserName) {
      case "firefox":
        firefoxHandler(platform, testName);
        break;

      case "chrome":
        chromeHandler(platform, testName);
        break;

      case "safari":
        chromeHandler(platform, testName);
        break;

      default:
        throw new IllegalArgumentException("Invalid BROWSER passed in config.properties !!");
    }
  }

  /**
   * Handles starting of firefox.
   *
   * @param platform The platform to start the browser on
   * @param driverExtension The file extension of the driver
   * @param testName The name of the current test
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  private void firefoxHandler(String platform, String testName) throws Exception {
    WebDriverManager.firefoxdriver().setup();

    FirefoxOptions firefoxOptions = new FirefoxOptions();
    if (HEADLESS) {
      firefoxOptions.addArguments("--headless=new");
    }

    firefoxOptions.addArguments("--width=" + DESKTOP_BROWSER_WIDTH);
    firefoxOptions.addArguments("--height=" + DESKTOP_BROWSER_HEIGHT);

    driver = new FirefoxDriver(firefoxOptions);
    // We cant maximize as screen size may not match desired browser size
    // driver.manage().window().maximize();
    LOGGER.info("Browser window size: {}", driver.manage().window().getSize().toString());
  }

  /**
   * Handles starting of chrome.
   *
   * @param platform The platform to start the browser on
   * @param driverExtension The file extension of the driver
   * @param testName The name of the current test
   */
  @SuppressWarnings({"checkstyle:LineLength"})
  private void chromeHandler(String platform, String testName) throws Exception {
    final Map<String, Object> deviceMetrics = new HashMap<>();
    final Map<String, Object> mobileEmulation = new HashMap<>();

    ChromeOptions chromeOptions = new ChromeOptions();

    WebDriverManager.chromedriver().setup();

    // Default chrome options across all device types
    if (HEADLESS) {
      chromeOptions.addArguments("--headless=new");
    }
    chromeOptions.addArguments("--disable-crash-reporter");
    // To fix Org.openqa.selenium.remote.http.WebSocket$Listener onError
    chromeOptions.addArguments("--remote-allow-origins=*");
    chromeOptions.setAcceptInsecureCerts(true);

    // Custom chrome options by device type
    switch (platform) {
      case "desktop":
        LOGGER.info("Running tests on - Desktop Chrome");
        chromeOptions
            .addArguments("--window-size=" + DESKTOP_BROWSER_WIDTH + "," + DESKTOP_BROWSER_HEIGHT);
        break;
      case "ios-mobile":
        LOGGER.info("Running tests on - iPhone 12 Pro Max Chrome");
        deviceMetrics.put("width", 428);
        deviceMetrics.put("height", 926);
        deviceMetrics.put("pixelRatio", 3);
        deviceMetrics.put("touch", true);
        deviceMetrics.put("mobile", true);
        mobileEmulation.put("deviceMetrics", deviceMetrics);
        mobileEmulation.put("userAgent",
            "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.2 Mobile/15E148 Safari/604.1");
        chromeOptions.setExperimentalOption("mobileEmulation", mobileEmulation);
        break;
      case "android-mobile":
        LOGGER.info("Running tests on - Galaxy S20 Ultra Chrome");
        deviceMetrics.put("width", 412);
        deviceMetrics.put("height", 915);
        deviceMetrics.put("pixelRatio", 3.5);
        deviceMetrics.put("touch", true);
        deviceMetrics.put("mobile", true);
        mobileEmulation.put("deviceMetrics", deviceMetrics);
        mobileEmulation.put("userAgent",
            "Mozilla/5.0 (Linux; Android 12; SM-G988U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%s Mobile Safari/537.36");
        chromeOptions.setExperimentalOption("mobileEmulation", mobileEmulation);
        break;
      case "android-tablet":
        LOGGER.info("Running tests on - Nexus 10 Chrome");
        mobileEmulation.put("deviceName", "Nexus 10");
        chromeOptions.setExperimentalOption("mobileEmulation", mobileEmulation);
        break;

      default:
        LOGGER.info("Invalid PLATFORM passed in config.properties !!");
        break;
    }

    driver = new ChromeDriver(chromeOptions);
    // We cant maximize as screen size may not match desired browser size
    // driver.manage().window().maximize();
    LOGGER.info("Browser window size: {}", driver.manage().window().getSize().toString());
  }

  @Override
  public String getSessionId() {
    // Return the runTime to be able to trace execution
    return Global.getRunTime();
  }
}
