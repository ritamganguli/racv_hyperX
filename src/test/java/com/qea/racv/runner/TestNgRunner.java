package com.qea.racv.runner;

import io.cucumber.testng.CucumberOptions;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * TestNgRunner class.
 *
 */
@CucumberOptions() // Blank options required to inject the tags
public class TestNgRunner extends AppTest {
  @SuppressWarnings("unused")
  private static final Logger LOGGER = LogManager.getLogger();

  // Need this here to be able to crash and exit the program if ReadConfigProps fails
  public TestNgRunner() throws Exception {
    super();
  }
}
