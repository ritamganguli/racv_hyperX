#Author: Viengcumm Thongvilu
#Date created - 19 Mar 2021
Feature: This feature tests the Footer Component

  #VT 19 Mar 2021 DAC-6865
  #Dry run completed on QA
  @TestFooterComponentAuthoring
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Footer component, configure, publish and verify published changes
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
    And I enter "test-automation-footer-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-footer-1.html"
    #open page properties and select change footer
    And I click "pageInfoButton" on "aemLandingPage" screen
    And I click "openPropertiesOption" on "aemLandingPage" screen
    And I click "advancedTabLink" on "aemAuthoringPageProperties" screen
    And I click "changeFooter" on "aemAuthoringPageProperties" screen
    And I take a screenshot
    And I click "saveAndCloseButton" on "aemAuthoringPageProperties" screen
    #Open Content tree to disable inheritance on existing footer
    And I wait for "sidePanelButton" on "aemFooterCompPage" screen or "10" seconds before proceeding
    And I click "sidePanelButton" on "aemFooterCompPage" screen
    And I click "contentTreeButton" on "aemFooterCompPage" screen
    And I click "inheritanceParagraphSystem" on "aemFooterCompPage" screen
    And I click "configureIcon" on "aemFooterCompPage" screen
    And I click "disableInheritance" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    #add footer component
    And I click "newInheritanceParagraphSystem" on "aemFooterCompPage" screen
    And I click "insertComponentButton" on "aemFooterCompPage" screen
    And I enter "Footer" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "footerOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "footerOption" on "aemInsertCompDialog" screen using Action class
    #refresh the page before clicking configure because aem takes too long
    And I refresh the page
    And I wait for "contentTreeButton" on "aemFooterCompPage" screen or "10" seconds before proceeding
    And I click "contentTreeButton" on "aemFooterCompPage" screen
    And I take a screenshot
    #Configure footer properties
    And I click "footerComponent" on "aemFooterCompPage" screen using Action class
    And I wait for "configureButton" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemFooterCompPage" screen
    And I click "configurationTab" on "aemFooterCompPage" screen
    And I clear contents of "disclaimerText" element on "aemFooterCompPage" screen
    And I enter "Copyright 2020 RACV" details in "disclaimerText" on "aemFooterCompPage" screen
    And I click "addField" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemFooterCompPage" screen or "5" seconds before proceeding
    #configure components inside footer
    #link list 1
    And I click "linkList1" on "aemFooterCompPage" screen using Action class
    And I click "configureButton" on "aemFooterCompPage" screen
    And I wait for "listFrom" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I select "Child pages" value for "listFrom" drop down in "aemFooterCompPage" screen using selection method "visibleText"
    And I clear contents of "parentPage" element on "aemFooterCompPage" screen
    And I enter "/content/racv/en/home" details in "parentPage" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "layoutTab" on "aemFooterCompPage" screen
    And I verify "targetDivId" field contains a value on "aemFooterCompPage" screen
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemFooterCompPage" screen or "5" seconds before proceeding
    #link list 2
    And I click "linkList2" on "aemFooterCompPage" screen using Action class
    And I click "configureButton" on "aemFooterCompPage" screen
    And I wait for "listFrom" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I select "Fixed list" value for "listFrom" drop down in "aemFooterCompPage" screen using selection method "visibleText"
    And I click "addField" on "aemFooterCompPage" screen
    And I enter "Google" details in "linkTitle" on "aemFooterCompPage" screen
    And I clear contents of "linkPagePath" element on "aemFooterCompPage" screen
    And I enter "https://www.google.com" details in "linkPagePath" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "layoutTab" on "aemFooterCompPage" screen
    And I verify "targetDivId" field contains a value on "aemFooterCompPage" screen
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemFooterCompPage" screen or "5" seconds before proceeding
    #link list 3
    And I click "linkList3" on "aemFooterCompPage" screen using Action class
    And I click "configureButton" on "aemFooterCompPage" screen
    And I wait for "listFrom" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I select "Child pages with Parent page" value for "listFrom" drop down in "aemFooterCompPage" screen using selection method "visibleText"
    And I clear contents of "parentPage" element on "aemFooterCompPage" screen
    And I enter "/content/racv/en/home/about-racv" details in "parentPage" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "layoutTab" on "aemFooterCompPage" screen
    And I verify "targetDivId" field contains a value on "aemFooterCompPage" screen
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemFooterCompPage" screen or "5" seconds before proceeding
    #Navigation list
    And I click "navigationLinks" on "aemFooterCompPage" screen using Action class
    And I click "configureButton" on "aemFooterCompPage" screen
    And I clear contents of "facebookPath" element on "aemFooterCompPage" screen
    And I enter "https://www.facebook.com" details in "facebookPath" on "aemFooterCompPage" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemFooterCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-footer-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "googleLink" copy text on "aemFooterCompPublishedPage" screen
    And I click "exploreRACV" on "aemFooterCompPublishedPage" screen
    And I verify "aboutRACVHeading" element exists on "aemFooterCompPublishedPage" screen
    And I verify "aboutRACVSubLink" element exists on "aemFooterCompPublishedPage" screen
    And I verify "facebookLink" element exists on "aemFooterCompPublishedPage" screen
    And I verify "copyrightLabel" copy text on "aemFooterCompPublishedPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestFooterComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot