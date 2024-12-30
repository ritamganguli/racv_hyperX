package com.qea.racv.utils;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.JsonFormatter;
import com.qea.racv.repo.Global;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Extent Report handling.
 */
public class ExtentReport {
  private static final Logger LOGGER = LogManager.getLogger();


  /**
   * Creates the extent report file on disk.
   */
  public static ExtentReports createExtent() throws IOException, SecurityException, Exception {
    String executionPlatform = ReadConfigProps.getExecutionPlatform();

    // Change the execution text on the report for aesthetic purposes
    switch (executionPlatform) {
      case "LAMBDA":
        executionPlatform = "LAMBDA";
        break;
      case "HYPEREXECUTE":
        executionPlatform = "HYPEREXECUTE";
        break;
      case "LOCAL":
        executionPlatform = "LOCAL";
        break;
      case "REMOTE":
        executionPlatform = "REMOTE";
        break;
      default:
        executionPlatform = "UNKNOWN";
        break;
    }

    String reportName = "/extentReportFile.html";
    // Add current date time to report file name to prevent overwriting for local executions
    if (executionPlatform.equals("LOCAL")) {
      String currentDateTime = Global.getRunTime();
      reportName = reportName.replace(".html", "-" + currentDateTime + ".html");
    }

    final String reportPath = ReadConfigProps.getReportPath() + reportName;
    final String envUrl = ReadConfigProps.getUrl();
    final String authorUrl = ReadConfigProps.getAemUrl();
    final String tags = ReadConfigProps.getTags();
    final String os = System.getProperty("os.name");
    String hostname;
    BufferedReader br = null;
    try {
      br = new BufferedReader(
          new InputStreamReader(Runtime.getRuntime().exec("hostname").getInputStream()));
      hostname = br.readLine();
    } catch (IOException e) {
      hostname = "N/A";
    } finally {
      if (br != null) {
        br.close();
      }
    }

    // Create the report file using File class since ExtentSparkReporter does not
    // throw any exceptions
    LOGGER.info("Creating extent report file");
    File reportFile = new File(reportPath);
    reportFile.delete();
    reportFile.createNewFile();
    if (!reportFile.canRead() || !reportFile.canWrite()) {
      throw new Exception("Extent Report file is not read/writable");
    } else {
      LOGGER.info("New extent report file is readable and writeable");
    }

    final ExtentSparkReporter reporter = new ExtentSparkReporter(reportFile);
    reporter.config().setReportName("TestNG Automation Report");
    reporter.config().setDocumentTitle("Test Results");
    reporter.config().thumbnailForBase64(true);
    reporter.config().setTimelineEnabled(true);

    JsonFormatter jsonReporter =
        new JsonFormatter(ReadConfigProps.getReportPath() + "/extentReport.json");

    final ExtentReports extent = new ExtentReports();
    extent.attachReporter(jsonReporter, reporter);
    // Add execution details to report
    extent.setSystemInfo("Hostname", hostname);
    extent.setSystemInfo("OS", os);
    extent.setSystemInfo("Execution Platform", executionPlatform);
    extent.setSystemInfo("AEM Environment URL", envUrl);
    extent.setSystemInfo("AEM Authoring URL", authorUrl);
    extent.setSystemInfo("Tags", tags);

    return extent;
  }
}
