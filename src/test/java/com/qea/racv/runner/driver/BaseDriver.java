package com.qea.racv.runner.driver;

import org.openqa.selenium.WebDriver;

/**
 * Abstract definitions for BaseDriver.
 *
 * @author viengcumm_thongvilu
 *
 */
public abstract interface BaseDriver {
  final String DESKTOP_BROWSER_WIDTH = "1600";
  final String DESKTOP_BROWSER_HEIGHT = "1200";

  abstract WebDriver getDriver();

  abstract void startDriver(String browserName, String platform, String executionPlatform,
      String testName) throws Exception;

  abstract String getSessionId();
}
