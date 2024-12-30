#Author: Jing Zuo
#Date created - 24 Feb 2022
Feature: This feature tests the Single Entry Point component and it's variants from authoring regression perspective.

  #JZ 24 Feb 2022 DAC-9840
  @TestSingleEntryPointComponent
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, drop and configure Single Entry Point and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-single-entry-point-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-single-entry-point-1.html"
    #Search and add Single Entry Point component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Single Entry Point" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "singleEntryPointOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "singleEntryPointOption" on "aemInsertCompDialog" screen using Action class
    #Configure Single Entry Point
    And I click "sidePanelButton" on "aemSingleEntryPointCompPage" screen
    And I click "contentTreeButton" on "aemSingleEntryPointCompPage" screen
    And I click "SEPComponent" on "aemSingleEntryPointCompPage" screen
    And I click "configureSEPButton" on "aemSingleEntryPointCompPage" screen
    And I take a screenshot
    #Configure Component Configuration Tab
    And I click "compConfigTab" on "aemSingleEntryPointCompDialog" screen
    And I enter "!" details in "title" on "aemSingleEntryPointCompDialog" screen
    And I enter "?" details in "label" on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    And I enter "1 Type" details in "typeOfUser1" on "aemSingleEntryPointCompDialog" screen
    And I clear contents of "tile1Message" element on "aemSingleEntryPointCompDialog" screen
    And I enter "Tile 1 Info" details in "tile1Message" on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    And I enter "2 Type" details in "typeOfUser2" on "aemSingleEntryPointCompDialog" screen
    And I clear contents of "tile2Message" element on "aemSingleEntryPointCompDialog" screen
    And I enter "Tile 2 Info" details in "tile2Message" on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    And I enter "3 Type" details in "typeOfUser3" on "aemSingleEntryPointCompDialog" screen
    And I clear contents of "tile3Message" element on "aemSingleEntryPointCompDialog" screen
    And I enter "Tile 3 Info" details in "tile3Message" on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    And I enter "#" details in "linkText" on "aemSingleEntryPointCompDialog" screen
    And I enter "https://my.racv.com.au/s/home-insurance" details in "linkPath" on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    #Configure layout tab
    And I click "layoutTab" on "aemTradesCompDialog" screen
    And I verify "targetDivId" field contains a value on "aemSingleEntryPointCompDialog" screen
    And I take a screenshot
    #Save changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-single-entry-point-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "title" element exists on "aemSingleEntryPointPublished" screen
    And I verify "label" element exists on "aemSingleEntryPointPublished" screen
    And I verify "typeOneUser" element exists on "aemSingleEntryPointPublished" screen
    And I verify "typeTwoUser" element exists on "aemSingleEntryPointPublished" screen
    And I verify "typeThreeUser" element exists on "aemSingleEntryPointPublished" screen
    And I take a screenshot
    When I click "typeOneUser" on "aemSingleEntryPointPublished" screen
    Then I verify "ownerAccommodation" element exists on "aemSingleEntryPointPublished" screen
    And I select "Free standing house" value for "ownerBuilding" drop down in "aemSingleEntryPointPublished" screen using selection method "visibletext"
    And I take a screenshot
    And I verify "ownerInsurance" element exists on "aemSingleEntryPointPublished" screen
    When I click "ownerCombined" on "aemSingleEntryPointPublished" screen
    And I click "getQuote" on "aemSingleEntryPointPublished" screen
    And I take a screenshot
    Then I check the page address contains "https://my.racv.com.au/s/home-insurance"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestSingleEntryPointComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot