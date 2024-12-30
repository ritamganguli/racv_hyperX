#Author: Dheebanraj M
#Date created - 8 Oct 2021
Feature: This feature verifies the Standard template from a regression perspective

  #DM 8 Oct 2021 DAC-9198
  #Dry run completed on - 11 Oct 2021
  @TestStandardTemplate
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page using Standard Template and configure
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Basic tab
    And I click "basicTabHeader" on "standardTempPage" screen
    And I verify "nameField" element exists on "standardTempPage" screen
    #reusing object
    And I enter "test-automation-std-template-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I verify "tagsField" element exists on "standardTempPage" screen
    And I verify "enableBreadCrumbCheckbox" element exists on "standardTempPage" screen
    And I verify "pageTitleField" element exists on "standardTempPage" screen
    And I verify "pageCategoryField" element exists on "standardTempPage" screen
    And I verify "searchTitleField" element exists on "standardTempPage" screen
    And I take a screenshot
    #Advanced tab
    And I click "advancedTabHeader" on "standardTempPage" screen
    And I verify "aliasField" element exists on "standardTempPage" screen
    And I verify "authorNameField" element exists on "standardTempPage" screen
    And I verify "latitudeField" element exists on "standardTempPage" screen
    And I verify "longitudeField" element exists on "standardTempPage" screen
    And I verify "contactNumberField" element exists on "standardTempPage" screen
    And I verify "openingTimeField" element exists on "standardTempPage" screen
    And I verify "firstCtaLabelField" element exists on "standardTempPage" screen
    And I verify "firstCtaPathField" element exists on "standardTempPage" screen
    And I verify "secondCtaLabelField" element exists on "standardTempPage" screen
    And I verify "secondCtaPathField" element exists on "standardTempPage" screen
    And I take a screenshot
    #Navigation tab
    And I click "navigationTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #Meta Tags tab
    And I click "metaTagsTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #Membership tab
    And I click "membershipTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #Reminder email tab
    And I click "reminderEmailTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #GDPR Popup tab
    And I click "gdprPopupTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #Analytics tab
    And I click "analyticsTabHeader" on "standardTempPage" screen
    And I take a screenshot
    #CSP Config tab
    And I click "cspConfigTabHeader" on "standardTempPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-std-template-1.html"
    #Add list after verifying the options available
    And I wait for "parsysRoot" on "standardTempPage" screen or "5" seconds before proceeding
    And I click "parsysRoot" on "standardTempPage" screen
    And I click "addButton" on "standardTempPage" screen
    And I wait for "addButton" to disappear on "standardTempPage" screen or "5" seconds before proceeding
    And I verify "title" element exists on "standardTempPage" screen
    And I verify "insertComponentDialog" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem1" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem2" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem3" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem4" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem5" element exists on "standardTempPage" screen
    And I verify "insertComponentDialogListItem6" element exists on "standardTempPage" screen
    And I take a screenshot
    And I click "insertComponentDialogListItem1" on "standardTempPage" screen
    #Configure accordion
    And I click "sidePanel" on "standardTempPage" screen
    And I click "contentTreeButton" on "standardTempPage" screen
    And I click "contentTreeAccordion" on "standardTempPage" screen
    And I click "configureAccordionButton" on "standardTempPage" screen
    #Configuration tab
    And I click "configurationTab" on "standardTempPage" screen
    And I clear contents of "accordionTitle" element on "standardTempPage" screen
    And I enter "Standard Template" details in "accordionTitle" on "standardTempPage" screen
    And I take a screenshot
    And I click "saveButton" on "standardTempPage" screen
    And I take a screenshot
    #edit RTE
    And I click "contentTreeRteAccordion" on "standardTempPage" screen
    And I click "editRteButton" on "standardTempPage" screen
    And I switch "to" iFrame "editRteIFrame" on "standardTempPage" screen
    And I enter "Test standard template " details in "rteComponentEditor" on "standardTempPage" screen
    And I switch "from" iFrame "rteComponentEditor" on "standardTempPage" screen
    And I click "rteEditorSaveIcon" on "standardTempPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemStandardTemplatePageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot