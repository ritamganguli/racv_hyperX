Feature: This feature validates AP3 generic features of the RACV web application

  @TestHomeContentsCalculatorIntegration-p3
  @TestHomeContentsCalculatorIntegration-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Integration-p3
  Scenario: Verify integration of Home contents calculator link from racv to homecontents domain
    Given I launch app page "URL/insurance/home-insurance/home-and-contents.html"
    And I dismiss GDPR notification if it exists
    And I scroll "lastStepperStep" element on "homeContentsInsurancePage" screen into view
    And I click "homeContentsCalculatorLink" on "homeContentsInsurancePage" screen
    And I wait for "loginButtonHomePage" to disappear on "racvHomePage" screen or "10" seconds before proceeding
    #And I switch to "new" browser tab
    Then I capture the address navigated to
    And I check the page address contains "https://homecontents.com.au/index.php?c=web_general&profile=IAG_partners_rwd"
    And I take a screenshot

  @TestHomeBuildingCalculatorIntegration-p3
  @TestHomeContentsCalculatorIntegration-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Integration-p3
  Scenario: Verify integration of Home building calculator link from racv to homebuilding domain
    Given I launch app page "URL/insurance/home-insurance/home-and-contents.html"
    And I dismiss GDPR notification if it exists
    And I scroll "lastStepperStep" element on "homeContentsInsurancePage" screen into view
    When I click "homeBuildingCalculatorLink" on "homeContentsInsurancePage" screen
    And I wait for "loginButtonHomePage" to disappear on "racvHomePage" screen or "10" seconds before proceeding
    #And I switch to "new" browser tab
    Then I capture the address navigated to
    And I check page address is "https://sumsure.cordell.com.au/#/products/7/profiles/125?partner=12503"
    And I take a screenshot
