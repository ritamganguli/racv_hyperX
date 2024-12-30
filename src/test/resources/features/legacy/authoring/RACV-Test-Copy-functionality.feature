#Author: Karan Kapur
#Date Created : 10 May 2021
Feature: This feature tests the Copy of Components

  #Dry run completed on 12th May 2021
  #NOTE - This test is specific to QA since parameterization is not possible
  @TestCopyofComponents
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to copy the components
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-Copy-Components" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-copy-components.html"
    #Add a component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #Search and add canvas component
    And I enter "Canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Adding button/link component Inside Canvas
    And I click "canvasAddComponentParsys" on "aemTestComponentPage" screen
    And I click "canvasAddComponentParsysPlusIcon" on "aemTestComponentPage" screen
    And I wait for "searchInputField" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I enter "Button/Link" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "buttonLinkOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "newButtonLink" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "copyoption" on "aemLandingPage" screen
    And I take a screenshot
    #Paste the component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "pasteoption" on "aemLandingPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemCopyComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "moreIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "noarchivecheckbox" on "deleteWindow" screen using JavaScript
    And I click "DeleteConfirmatioButton" on "deleteWindow" screen using JavaScript
    And I wait for "DeleteConfirmatioButton" to disappear on "deleteWindow" screen or "5" seconds before proceeding
    And I take a screenshot