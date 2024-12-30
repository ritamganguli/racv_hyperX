package com.qea.racv.utils;

import com.qea.racv.repo.Global;
import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.MemoryCacheImageOutputStream;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

/**
 * This class helps reporting with screenshots.
 */
@SuppressWarnings({"checkstyle:LineLength"})
public class GetScreenShot {

  public WebDriver driver;

  private static final Logger LOGGER = LogManager.getLogger();
  private static final String FAILED_SS_IMAGE =
      "data:image/png;base64,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";

  public static String getFailedScreenshotImage() {
    return FAILED_SS_IMAGE;
  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver) {
    return getScreenshotBase64(driver, 0.2f, 0.75f);
  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @param quality Quality percentage
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver, float quality) {
    return getScreenshotBase64(driver, quality, 0.75f);
  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @param global Global object
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver, Global global) {
    return getScreenshotBase64(driver, 0.2f, 0.75f, global);

  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @param global Global object
   * @param scale Result Percentage size of image
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver, float scale, Global global) {
    return getScreenshotBase64(driver, 0.2f, scale, global);
  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @param quality JPEG Quality percent
   * @param scale Result Percentage size of image
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver, float quality, float scale) {
    return getScreenshotBase64(driver, quality, scale, null);
  }

  /**
   * This method takes screen shots and returns the screenshot in a compressed JPG base64 encoded
   * string.
   *
   * @param driver Web driver
   * @param quality JPEG Quality percent
   * @param scale Result Percentage size of image
   * @param global Global object
   * @return base64 encoded image
   */
  public static String getScreenshotBase64(WebDriver driver, float quality, float scale,
      Global global) {
    // Sleep to lazy load images
    // TODO: Fix the screenshot render timeout issue
    // if(global != null)
    // global.waitForJSandJQueryToLoad(5, driver);

    if (driver == null) {
      LOGGER.info("webdriver is null, returning error screenshot");
      return FAILED_SS_IMAGE;
    }

    try {
      // Driver to take screenshot
      TakesScreenshot ts = (TakesScreenshot) driver;
      String base64 = ts.getScreenshotAs(OutputType.BASE64).replaceAll("[\n\r]", "");

      byte[] bytes = Base64.getDecoder().decode(base64);

      // Read byte[] into buffered image
      ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
      BufferedImage bufferedImage = ImageIO.read(bais);
      BufferedImage newBufferedImage =
          new BufferedImage(Math.round(bufferedImage.getWidth() * scale),
              Math.round(bufferedImage.getHeight() * scale), BufferedImage.TYPE_INT_RGB);
      if (scale != 1) {
        Image resultingImage =
            bufferedImage.getScaledInstance(Math.round(bufferedImage.getWidth() * scale),
                Math.round(bufferedImage.getHeight() * scale), Image.SCALE_SMOOTH);
        newBufferedImage.createGraphics().drawImage(resultingImage, 0, 0, Color.WHITE, null);
      } else {
        newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
      }

      // Convert from PNG to JPG for size reduction
      ImageWriter jpgWriter = ImageIO.getImageWritersByFormatName("jpg").next();
      ImageWriteParam jpgWriteParam = jpgWriter.getDefaultWriteParam();
      jpgWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
      // JPEG image quality set here
      jpgWriteParam.setCompressionQuality(quality);

      // Write new JPG back into newBufferedImage
      ByteArrayOutputStream baos = new ByteArrayOutputStream();
      jpgWriter.setOutput(new MemoryCacheImageOutputStream(baos));
      IIOImage outputImage = new IIOImage(newBufferedImage, null, null);
      jpgWriter.write(null, outputImage, jpgWriteParam);

      // Return ByteArrayOutputStream as base64 string suitable for embedding in HTML
      final String encoded = new String(Base64.getEncoder().encode(baos.toByteArray()));

      jpgWriter.dispose();
      newBufferedImage.flush();
      bufferedImage.flush();
      baos.close();

      return "data:image/jpg;base64," + encoded;
    } catch (Exception e) {
      LOGGER.error("Failed to take a screenshot - Returning custom failed image");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      // Return a base64 failed screenshot image so the report does not break
      return FAILED_SS_IMAGE;
    }
  }

  /**
   * This method takes full page screen shots and returns the screenshot in a compressed JPG base64
   * encoded string.
   *
   * @param driver Web driver
   * @return base64 encoded image
   */
  public static String getFullPageScreenshotBase64(WebDriver driver) {
    return getFullPageScreenshotBase64(driver, null);
  }

  /**
   * This method takes full page screen shots and returns the screenshot in a compressed JPG base64
   * encoded string.
   *
   * @param driver Web Driver
   * @param global Global Object
   * @return base64 encoded image
   */
  public static String getFullPageScreenshotBase64(WebDriver driver, Global global) {
    if (driver == null) {
      LOGGER.info("webdriver is null, returning error screenshot");
      return FAILED_SS_IMAGE;
    }

    try {
      final int oldHeight = driver.manage().window().getSize().getHeight();
      final int oldWidth = driver.manage().window().getSize().getWidth();

      // Get document height for full page screenshot
      int bodyHeight = (int) (long) ((JavascriptExecutor) driver)
          .executeScript("return document.body.clientHeight");
      // Set minimum height to original window height
      if (bodyHeight < oldHeight) {
        bodyHeight = oldHeight;
      }

      // Resize Window to height of document body for full page ss
      final Dimension newSize = new Dimension(oldWidth, bodyHeight);
      driver.manage().window().setSize(newSize);

      // Sleep to lazy load images
      // TODO: Fix the screenshot render timeout issue
      // if(global == null) {
      try {
        Thread.sleep(5000);
      } catch (Exception e) {
        /* Do nothing */
      }
      // }
      // else
      // global.waitForJSandJQueryToLoad(5, driver);

      final String base64Image = getScreenshotBase64(driver, 0.2f);

      // Resize window height back to original value
      final Dimension oldSize = new Dimension(oldWidth, oldHeight);
      driver.manage().window().setSize(oldSize);

      return base64Image;
    } catch (Exception e) {
      LOGGER.error("Failed to take a screenshot - Returning custom failed image");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return FAILED_SS_IMAGE;
    }
  }

  /**
   * This method takes full page screen shots for AEM page properties and returns the screenshot in
   * a compressed JPG base64 encoded string.
   *
   * @param driver Web driver
   * @return base64 encoded image
   */
  public static String getFullPageScreenshotBase64Properties(WebDriver driver) {
    return getFullPageScreenshotBase64Properties(driver, null);
  }

  /**
   * This method takes full page screen shots for AEM page properties and returns the screenshot in
   * a compressed JPG base64 encoded string.
   *
   * @param driver Web driver
   * @param global Global object
   * @return base64 encoded image
   */
  public static String getFullPageScreenshotBase64Properties(WebDriver driver, Global global) {
    if (driver == null) {
      LOGGER.info("webdriver is null, returning error screenshot");
      return FAILED_SS_IMAGE;
    }

    try {
      final int oldHeight = driver.manage().window().getSize().getHeight();
      final int oldWidth = driver.manage().window().getSize().getWidth();

      // Get entire height for element scrolled within the page
      int scrollHeight = (int) (long) ((JavascriptExecutor) driver).executeScript(
          "return document.querySelector(\".foundation-layout-panel-content.foundation-layout-form.foundation-layout-form-mode-edit\").scrollHeight");
      LOGGER.info("Scroll down height: {}", scrollHeight);
      // Set minimum height to original window height
      if (scrollHeight < oldHeight) {
        scrollHeight = oldHeight;
      }

      // Resize Window to height of document body for full page ss
      final Dimension newSize = new Dimension(oldWidth, scrollHeight + 100);
      driver.manage().window().setSize(newSize);

      // Sleep to lazy load images
      // TODO: Fix the screenshot render timeout issue
      // if(global == null) {
      try {
        Thread.sleep(5000);
      } catch (Exception e) {
        /* do nothing */
      }
      // }
      // else
      // global.waitForJSandJQueryToLoad(5, driver);

      final String base64Image = getScreenshotBase64(driver, 0.2f);

      // Resize window height back to original value
      final Dimension oldSize = new Dimension(oldWidth, oldHeight);
      driver.manage().window().setSize(oldSize);

      return base64Image;
    } catch (Exception e) {
      LOGGER.error("Failed to take a screenshot - Returning custom failed image");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return FAILED_SS_IMAGE;
    }
  }
}
