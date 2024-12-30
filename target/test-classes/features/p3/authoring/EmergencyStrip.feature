#Author: Viengcumm Thongvilu
Feature: This feature tests the Emergency Strip in AEM authoring and storybook

  #Author: Jing Zuo
  #Date Created : 08 Nov 22
  @TestAuthoringEmergencyStrip-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Emergency Strip component and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to experience fragment to create an emergency strip XF here
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa/emergency-strip"
    And I capture the address navigated to
    #Create a Emergency Strip experience fragment
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "variation" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I enter "test-automation-RANDOM[0-8]-p3-emergency-strip" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createVariationButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/emergency-strip/test-automation-RANDOM[0-8]-p3-emergency-strip.html"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Emergency Strip component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Emergency Strip" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "emergencyResult" on "aemInsertNewComponent" screen
    And I wait for "emergencyResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Emergency Strip component in Experience Fragment
    And I click "emergencyStripInTree" on "aemExperienceFragmentsEmergencyStrip" screen
    And I click "configureButton" on "aemExperienceFragmentsEmergencyStrip" screen
    And I take a screenshot
    #Configuration Tab
    When I click "configurationsTab" on "aemEmergencyStripComponentDialog" screen
    And I click "notificationType" on "aemEmergencyStripComponentDialog" screen
    Then I select "Notification Content" value for "notificationList" drop down in "aemEmergencyStripComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Content Configurations Tab
    When I click "contentTab" on "aemEmergencyStripComponentDialog" screen
    And I click "emergencyThemes" on "aemEmergencyStripComponentDialog" screen
    Then I select "Level 3" value for "themesList" drop down in "aemEmergencyStripComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "emergency-strip-id" details in "eventId" on "aemEmergencyStripComponentDialog" screen
    And I click "iconType" on "aemEmergencyStripComponentDialog" screen
    And I select "Warning Illustration" value for "iconTypeList" drop down in "aemEmergencyStripComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemEmergencyStripComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemEmergencyStripComponentDialog" screen or "5" seconds before proceeding
    #Edit Text componenet
    When I click "textInTree" on "aemExperienceFragmentsEmergencyStrip" screen
    And I click "editButton" on "aemExperienceFragmentsEmergencyStrip" screen
    And I take a screenshot
    And I enter "Testing Emergency strip Level 3 with the test link call 123456" details using Action class
    And I click "textSaveIcon" on "aemExperienceFragmentsEmergencyStrip" screen
    And I wait for "textSaveIcon" to disappear on "aemExperienceFragmentsEmergencyStrip" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the emergency strip EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Page"
    #Navigate to racv-home/utility to create the emergency strip testing page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-emergency-strip-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "doneButton" on "aemCreatePageWizard" screen
    And I wait for "doneButton" to disappear on "aemCreatePageWizard" screen or "5" seconds before proceeding
    #Create the emergency banner manager testing page here
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-emergency-banner-manager-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-emergency-banner-manager-RANDOM[0-8]-p3.html"
    And I take a screenshot
    #Search and add Emergency Strip component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Emergency Strip" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "emergencyResult" on "aemInsertNewComponent" screen
    And I wait for "emergencyResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Emergency Strip component in Emergency Banner Manager page
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "emergencyStripInTree" on "aemEmergencyBannerManagerPage" screen
    And I wait for "configureButton" on "aemEmergencyBannerManagerPage" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemEmergencyBannerManagerPage" screen
    And I take a screenshot
    #Configuration Tab
    When I click "configurationsTab" on "aemEmergencyStripComponentDialog" screen
    And I click "notificationType" on "aemEmergencyStripComponentDialog" screen
    Then I select "Notification Manager" value for "notificationList" drop down in "aemEmergencyStripComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Notification Configurations Tab
    When I click "notificationTab" on "aemEmergencyStripComponentDialog" screen
    And I click "addNotificationPath" on "aemEmergencyStripComponentDialog" screen
    #Add Emergency Strip EF path into Notification Path field
    Then I enter "/content/experience-fragments/racv/qa/emergency-strip/test-automation-RANDOM[0-8]-p3-emergency-strip/jcr:content/root/container/emergencystrip" details in "notificationPath" on "aemEmergencyStripComponentDialog" screen
    And I click "addNotificationPage" on "aemEmergencyStripComponentDialog" screen
    #Add Emergency Strip testing page path into Notification Page field
    And I enter "/content/racv/en/home/racv-home/utility/qa/test-automation-emergency-strip-RANDOM[0-8]-p3" details in "notificationPage" on "aemEmergencyStripComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemEmergencyStripComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemEmergencyStripComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the Emergency Banner Manager page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Navigate to Emergency Strip editor page
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-emergency-strip-RANDOM[0-8]-p3.html"
    Then I capture the address navigated to
    And I take a screenshot
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/racv/en/home/racv-home/utility/qa/test-automation-emergency-banner-manager-RANDOM[0-8]-p3" details in "notificationManagerPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "5" seconds before proceeding
    #Publish the Emergency Strip page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    When I navigate to "URL/racv-home/utility/qa/test-automation-emergency-strip-RANDOM[0-8]-p3.html"
    And I wait for "emergencyStrip" on "aemTestEmergencyStripPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emergencyStrip" element exists on "aemTestEmergencyStripPagePublished" screen
    And I verify "emergencyText" element exists on "aemTestEmergencyStripPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    And I click "dismissButton" on "aemTestEmergencyStripPagePublished" screen
    And I wait for "dismissButton" to disappear on "aemTestEmergencyStripPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "emergencyText" element is not visible on "aemTestEmergencyStripPagePublished" screen
    And I take a screenshot

  @TestPublishEmergencyStrip-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Emergency Strip post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-emergency-strip-p3.html"
    And I wait for "emergencyStrip" on "aemTestEmergencyStripPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emergencyStrip" element exists on "aemTestEmergencyStripPagePublished" screen
    And I verify "emergencyText" element exists on "aemTestEmergencyStripPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    And I click "dismissButton" on "aemTestEmergencyStripPagePublished" screen
    And I wait for "dismissButton" to disappear on "aemTestEmergencyStripPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "emergencyText" element is not visible on "aemTestEmergencyStripPagePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBEmergencyStrip1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 1 found on confluence on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;hideInfoIcon:true;hideCrossButton:true&id=components-emergency-strip--emergency-strip-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBEmergencyStrip2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 2 found on confluence on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=level:2;emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;emergencyMessageLink:;hideCrossButton:true&id=components-emergency-strip--emergency-strip-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBEmergencyStrip3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 3 found on confluence on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=level:3;emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;emergencyMessageLink:&id=components-emergency-strip--emergency-strip-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBEmergencyStrip1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 1 found on confluence (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;hideInfoIcon:true;hideCrossButton:true&id=components-emergency-strip--emergency-strip-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBEmergencyStrip2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 2 found on confluence (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=level:2;emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;emergencyMessageLink:;hideCrossButton:true&id=components-emergency-strip--emergency-strip-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBEmergencyStrip3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Emergency strip according to Matrix test 3 found on confluence (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=level:3;emergencyMessage:Lorem%20ipsum%20dolor%20sit%20amet%20consectetur%20adipiscing%20elit%20Nunc%20cursus;emergencyMessageLink:&id=components-emergency-strip--emergency-strip-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"