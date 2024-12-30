#Author: Sumanta Roy
#Date created - 22 Feb 2021
Feature: This feature tests the Grid control Component and it's variants.

  #SR 22 Feb 2021 DAC-6866
  #Dry run completed on QA
  #SR 9 Sep 21 - DAC-9308 - Fixed selection issue in dropdown for columns in configuration tab
  @TestGridControlTwoColsComponent1
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 50-50 two columns, with Base side padding and XXXSmall Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "u-1/2,u-1/2" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "value"
    #Select Side padding
    And I select "Base (16px)" value for "sidePaddingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "XXXSmall (2px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-grid-control-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp1Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "16px" for "firstBannerContainer" on "aemGridControlComp1Published"
    And I verify css attribute "padding-right" is "16px" for "firstBannerContainer" on "aemGridControlComp1Published"
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp1Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "16px" for "secondBannerContainer" on "aemGridControlComp1Published"
    And I verify css attribute "padding-right" is "16px" for "secondBannerContainer" on "aemGridControlComp1Published"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 23 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlTwoColsComponent2
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 25-75 two columns, with no side padding and no Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-2.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Two Column [25%, 75%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select Side padding
    And I select "No padding (Default)" value for "sidePaddingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "No spacing" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    #Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp2Published" screen
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp2Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 23 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlTwoColsComponent3
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 75-25 two columns, with Medium side padding and Small Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-3.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Two Column [75%, 25%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select Side padding
    And I select "Medium (32px)" value for "sidePaddingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "Small (15px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-3.html"
    And I dismiss GDPR notification if it exists
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp3Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "32px" for "firstBannerContainer" on "aemGridControlComp3Published"
    And I verify css attribute "padding-right" is "32px" for "firstBannerContainer" on "aemGridControlComp3Published"
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp3Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "32px" for "secondBannerContainer" on "aemGridControlComp3Published"
    And I verify css attribute "padding-right" is "32px" for "secondBannerContainer" on "aemGridControlComp3Published"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 23 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlTwoColsComponent4
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 33-67 two columns, with Large side padding and Base Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-4.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Two Column [33%, 67%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select Side padding
    And I select "Large (40px)" value for "sidePaddingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "Base (20px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-4.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp4Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "40px" for "firstBannerContainer" on "aemGridControlComp4Published"
    And I verify css attribute "padding-right" is "40px" for "firstBannerContainer" on "aemGridControlComp4Published"
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp4Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "40px" for "secondBannerContainer" on "aemGridControlComp4Published"
    And I verify css attribute "padding-right" is "40px" for "secondBannerContainer" on "aemGridControlComp4Published"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 24 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlTwoColsComponent5
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 67-33 two columns, with Base side padding and Medium Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-5" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-5.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Two Column [67%, 33%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select Side padding
    And I select "Base (16px)" value for "sidePaddingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "Medium (30px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-5.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp5Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "16px" for "firstBannerContainer" on "aemGridControlComp5Published"
    And I verify css attribute "padding-right" is "16px" for "firstBannerContainer" on "aemGridControlComp5Published"
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp5Published" screen
    #verify side padding
    And I verify css attribute "padding-left" is "16px" for "secondBannerContainer" on "aemGridControlComp5Published"
    And I verify css attribute "padding-right" is "16px" for "secondBannerContainer" on "aemGridControlComp5Published"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp5PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 24 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlThreeColsComponent6
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 33-33-33 three columns, with Large Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-6" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-6.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Three Column [33%, 33%, 33%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #There is no Side padding in 3 col variant
    #Select vertical spacing
    And I select "Large (50px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add third banner to grid
    And I click "col3Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-6.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp6Published" screen
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp6Published" screen
    #Third component on grid
    And I verify "thirdBannerContainer" element exists on "aemGridControlComp6Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp6PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 24 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlThreeColsComponent7
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 25-50-25 three columns, with Small Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-7" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-7.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Three Column [25% 50% 25%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #There is no Side padding in 3 col variant
    #Select vertical spacing
    And I select "Small (15px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add third banner to grid
    And I click "col3Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-7.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp7Published" screen
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp7Published" screen
    #Third component on grid
    And I verify "thirdBannerContainer" element exists on "aemGridControlComp7Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp7PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 24 Feb 2021 DAC-6866
  #Dry run completed on QA
  @TestGridControlFourColsComponent8
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 25-25-25-25 four columns, with Medium Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-8" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-8.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Four Column [25%, 25%, 25%, 25%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #There is no Side padding in 3 col variant
    #Select vertical spacing
    And I select "Medium (30px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add third banner to grid
    And I click "col3Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add fourth banner to grid
    And I click "col4Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-8.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp8Published" screen
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp8Published" screen
    #Third component on grid
    And I verify "thirdBannerContainer" element exists on "aemGridControlComp8Published" screen
    #Third component on grid
    And I verify "fourthBannerContainer" element exists on "aemGridControlComp8Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp8PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 25 Feb 2021 DAC-6866
  #Dry run completed
  @TestGridControlFiveColsComponent9
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Grid control component, configure as 20-20-20-20-20 five columns, with Small Vertical padding, publish and verify published changes
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
    And I enter "test-automation-grid-control-9" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-grid-control-9.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Grid Control component first
    And I enter "Grid" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemGridControlCompPage" screen
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Five Column [20% 20% 20% 20% 20%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #There is no Side padding in 3 col variant
    #Select vertical spacing
    And I select "Small (15px)" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemGridControlCompPage" screen
    And I verify "targetDivIdField" element exists on "aemGridControlCompPage" screen
    And I take a screenshot
    ####Check this contains a default value
    And I verify "targetDivIdField" field contains a value on "aemGridControlCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add first banner to grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add second banner to grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add third banner to grid
    And I click "col3Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add fourth banner to grid
    And I click "col4Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add fifth banner to grid
    And I click "col5Parsys" on "aemGridControlCompPage" screen
    And I click "insertComponentButton" on "aemGridControlCompPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "bannerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-grid-control-9.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #First component on grid
    And I verify "firstBannerContainer" element exists on "aemGridControlComp9Published" screen
    #Second component on grid
    And I verify "secondBannerContainer" element exists on "aemGridControlComp9Published" screen
    #Third component on grid
    And I verify "thirdBannerContainer" element exists on "aemGridControlComp9Published" screen
    #fourth component on grid
    And I verify "fourthBannerContainer" element exists on "aemGridControlComp9Published" screen
    #fifth component on grid
    And I verify "fifthBannerContainer" element exists on "aemGridControlComp9Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGridControlComp9PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot