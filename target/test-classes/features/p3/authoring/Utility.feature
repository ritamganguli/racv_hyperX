Feature: Utility authoring tests for various house keeping functions

  @TestDeleteAutomationPagesByTag-p3
  @Authoring-cleanup-p3.chrome.desktop
  Scenario: This script cleans the pages created by automation tests using the search tag feature
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    And I delete all test pages starting with "test-automation-" with tag "testautomation" under "/content/racv/en/home/racv-home/utility/qa" path on "aemSitesPage" screen

  @TestDeleteAutomationEFByTag-p3
  @Authoring-cleanup-p3.chrome.desktop
  Scenario: This script cleans the experience fragments created by automation tests using the search tag feature
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    And I delete all test pages starting with "test-automation-" with tag "testautomation" under "/content/experience-fragments/racv/qa" path on "aemSitesPage" screen
