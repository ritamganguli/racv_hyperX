#Author: Sumanta Roy
#Date created - 1 Oct 2021
Feature: This feature verifies the Generic list template from a regression perspective

  #SR 1 Oct 2021 DAC-9198
  #Dry run completed on - 4 Oct 2021
  @TestGenericListTemplate1
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page using Generic List Template and configure RACV Generic List Item
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
    #select generic list page template
    And I click "genericListTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Basic tab
    And I click "basicTabHeader" on "genericListTempPage" screen
    And I verify "nameField" element exists on "genericListTempPage" screen
    #reusing object
    And I enter "test-automation-generic-list-template-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I verify "tagsField" element exists on "genericListTempPage" screen
    And I verify "enableBreadCrumbCheckbox" element exists on "genericListTempPage" screen
    And I verify "pageTitleField" element exists on "genericListTempPage" screen
    And I verify "pageCategoryField" element exists on "genericListTempPage" screen
    And I verify "searchTitleField" element exists on "genericListTempPage" screen
    And I take a screenshot
    #Advanced tab
    And I click "advancedTabHeader" on "genericListTempPage" screen
    And I verify "enableSvgDisplayCheckbox" element exists on "genericListTempPage" screen
    And I verify "aliasField" element exists on "genericListTempPage" screen
    And I verify "authorNameField" element exists on "genericListTempPage" screen
    And I verify "latitudeField" element exists on "genericListTempPage" screen
    And I verify "longitudeField" element exists on "genericListTempPage" screen
    And I verify "contactNumberField" element exists on "genericListTempPage" screen
    And I verify "openingTimeField" element exists on "genericListTempPage" screen
    And I verify "firstCtaLabelField" element exists on "genericListTempPage" screen
    And I verify "firstCtaPathField" element exists on "genericListTempPage" screen
    And I verify "secondCtaLabelField" element exists on "genericListTempPage" screen
    And I verify "secondCtaPathField" element exists on "genericListTempPage" screen
    And I take a screenshot
    #Navigation tab
    And I click "navigationTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #Meta Tags tab
    And I click "metaTagsTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #Membership tab
    And I click "membershipTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #Reminder email tab
    And I click "reminderEmailTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #GDPR Popup tab
    And I click "gdprPopupTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #Analytics tab
    And I click "analyticsTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    #CSP Config tab
    And I click "cspConfigTabHeader" on "genericListTempPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-generic-list-template-1.html"
    #Add list after verifying the options available
    And I click "parsysRoot" on "genericListTempPage" screen
    And I click "addButton" on "genericListTempPage" screen
    And I verify "insertComponentDialog" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem1" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem2" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem3" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem4" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem5" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem6" element exists on "genericListTempPage" screen
    And I verify "insertComponentDialogListItem7" element exists on "genericListTempPage" screen
    And I take a screenshot
    And I click "insertComponentDialogListItem6" on "genericListTempPage" screen
    And I click "genericListItem" on "genericListTempPage" screen
    And I click "configureButton" on "genericListTempPage" screen
    And I enter "List-Item-1" details in "listTitleField" on "genericListTempPage" screen
    And I enter "List-Item-1-Value" details in "listValueField" on "genericListTempPage" screen
    And I take a screenshot
    And I click "saveButton" on "genericListTempPage" screen
    And I take a screenshot
    #Verify key values are displayed after adding them
    And I verify "listItem1" element exists on "genericListTempPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemGenericListTemplate1PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot