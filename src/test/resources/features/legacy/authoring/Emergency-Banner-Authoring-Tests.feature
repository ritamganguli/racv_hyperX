#Author: Jing Zuo
#Date created - 15 July 2022
Feature: This feature tests the Emergency Banner component and its variants from authoring regression perspective.

  #JZ 15 July 2022 DAC-10438
  @TestEmergencyBannerComponent
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, drop and configure Emergency Banner and verify published changes
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
    When I click "createButton" on "aemLandingPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-emergency-banner-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-emergency-banner-1.html"
    #Search and add Feature Table component
    When I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Emergency Banner" details in "searchInputField" on "aemInsertCompDialog" screen
    Then I wait for "componentSearchEmergencyBanner" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "componentSearchEmergencyBanner" on "aemInsertCompDialog" screen
    #Configure Feature Table component
    When I click "sidePanelButton" on "aemEmergencyBannerCompPage" screen
    And I click "contentTreeButton" on "aemEmergencyBannerCompPage" screen
    And I click "EBComponent" on "aemEmergencyBannerCompPage" screen
    And I click "configureEBButton" on "aemEmergencyBannerCompPage" screen
    Then I take a screenshot
    #Configure Component Configuration Tab
    When I click "compConfigTab" on "aemEmergencyBannerCompDialog" screen
    And I select "Notification Content" value for "notificationType" drop down in "aemEmergencyBannerCompDialog" screen using selection method "visibleText"
    Then I take a screenshot
    #Configure Component Content Configuration Tab
    When I click "compContentConfigTab" on "aemEmergencyBannerCompDialog" screen
    And I enter "Emergency Banner Testing 1" details in "eventId" on "aemEmergencyBannerCompDialog" screen
    And I select "Exclamation" value for "iconType" drop down in "aemEmergencyBannerCompDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "doneButton" on "aemEmergencyBannerCompDialog" screen
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Configure RTE
    When I click "rteComponent" on "aemEmergencyBannerCompPage" screen
    And I take a screenshot
    And I click "editComponent" on "aemEmergencyBannerCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemEmergencyBannerCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemEmergencyBannerCompPage" screen
    And I enter "Emergency Banner testing" details in "rteEditorFullScreen" on "aemEmergencyBannerCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemEmergencyBannerCompPage" screen
    And I click "rteEditorSaveIcon" on "aemEmergencyBannerCompPage" screen
    Then I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Configure Button/Link
    Then I click "BTComponent" on "aemEmergencyBannerCompPage" screen
    And I click "configureBTButton" on "aemEmergencyBannerCompPage" screen
    Then I take a screenshot
    When I click "compConfigTab" on "aemEmergencyBannerBTCompDialog" screen
    And I enter "https://www.racv.com.au/" details in "linkPath" on "aemEmergencyBannerBTCompDialog" screen
    And I enter "Find out more" details in "linkText" on "aemEmergencyBannerBTCompDialog" screen
    Then I take a screenshot
    When I click "compStyleTab" on "aemEmergencyBannerBTCompDialog" screen
    And I select "Button" value for "buttonLinkType" drop down in "aemEmergencyBannerBTCompDialog" screen using selection method "visibleText"
    And I select "Primary" value for "buttonStyle" drop down in "aemEmergencyBannerBTCompDialog" screen using selection method "visibleText"
    And I select "No Icon" value for "iconPosition" drop down in "aemEmergencyBannerBTCompDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemEmergencyBannerCompDialog" screen
    And I take a screenshot
    #Publish the page
    When I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-emergency-banner-1.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I refresh the page
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Post publish checks
    And I verify "iconEB" element exists on "aemEmergencyBannerPublished" screen
    And I verify "rteEB" element exists on "aemEmergencyBannerPublished" screen
    And I verify "buttonEB" element exists on "aemEmergencyBannerPublished" screen
    When I click "buttonEB" on "aemEmergencyBannerPublished" screen
    Then I navigate to "https://www.racv.com.au"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestEmergencyBannerComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot