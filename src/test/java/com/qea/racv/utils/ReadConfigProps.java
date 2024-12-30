package com.qea.racv.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Read properties from Config.properties.
 *
 * @author Sumanta Roy
 *
 */
public class ReadConfigProps {

  // Initialize logger
  private static final Logger LOGGER = LogManager.getLogger();

  private static Map<String, String> propertyMap = new HashMap<>();
  private static ResourceBundle objResBundle = ResourceBundle.getBundle("properties.config");

  public static String getUrl() {
    return propertyMap.get("URL");
  }

  public static String getPurl() {
    return propertyMap.get("PURL");
  }

  public static String getAemUsername() {
    return propertyMap.get("AEMUSERNAME");
  }

  public static String getAemPassword() {
    return propertyMap.get("AEMPASSWORD");
  }

  public static String getExtentReportPath() {
    return propertyMap.get("EXTENTREPORTPATH");
  }

  public static String getObjectMapPath() {
    return propertyMap.get("OBJECTMAPPATH");
  }

  public static String getCopyMapPath() {
    return propertyMap.get("COPYTEXTMAPATH");
  }

  public static String getDataMapPath() {
    return propertyMap.get("DATAMAPPATH");
  }

  public static String getReportPath() {
    return propertyMap.get("REPORTPATH");
  }

  public static String getImagePath() {
    return propertyMap.get("IMAGEPATH");
  }

  public static String getExecutionPlatform() {
    return propertyMap.get("EXECUTIONPLATFORM");
  }

  public static String getBuildNumber() {
    return propertyMap.get("BUILDNUMBER");
  }

  public static String getAemUrl() {
    return propertyMap.get("AEM");
  }

  public static String getTags() {
    return propertyMap.get("TAGS");
  }

  public static String getLambdaKey() {
    return propertyMap.get("LTKEY");
  }

  public static String getLambdaUsername() {
    return propertyMap.get("LTUSERNAME");
  }

  /**
   * Read properties from Config.properties.
   */
  public static boolean readConfigProperties() {
    try {
      readProperty("AEM");
      readProperty("AEMPASSWORD");
      readProperty("AEMUSERNAME");
      readProperty("BUILDNUMBER");
      readProperty("COPYTEXTMAPATH");
      readProperty("DATAMAPPATH");
      readProperty("EXECUTIONPLATFORM");
      readProperty("IMAGEPATH");
      readProperty("OBJECTMAPPATH");
      readProperty("PURL");
      readProperty("REPORTPATH");
      readProperty("TAGS");
      readProperty("URL");
      readProperty("LTKEY");
      readProperty("LTUSERNAME");
    } catch (Exception e) {
      LOGGER.error("Error with config.properties");
      LOGGER.debug("Stacktrace: {}", ExceptionUtils.getStackTrace(e));
      return false;
    }
    return true;
  }

  /**
   * Read the given property and store it in the map.
   *
   * @param property The property to read
   * @throws Exception Exception thrown when property does not exist in the config properties file
   */
  private static void readProperty(String property) throws Exception {
    final String value = (String) objResBundle.getObject(property);
    if (value == null) {
      throw new Exception(property + " was not found in the config properties file");
    }
    propertyMap.put(property, value);
    // Log the property but mask any private values like passwords
    switch (property) {
      case "LTKEY":
      case "LTUSERNAME":
      case "AEMUSERNAME":
      case "AEMPASSWORD":
        LOGGER.info("{}: {}", property, "*****");
        break;
      default:
        LOGGER.info("{}: {}", property, value);
        break;
    }
  }
}
