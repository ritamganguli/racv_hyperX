#Author: Viengcumm Thongvilu
Feature: This feature tests the Breadcrumb in AEM authoring and storybook

  @TestAuthoringBreadcrumb-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author breadcrumb component and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    And I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-breadcrumb-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-breadcrumb-RANDOM[0-8]-p3.html"
    #Edit properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    Then I click "basicTab" on "aemPageProperties" screen
    And I click "enableBreadcrumb" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring components"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Breadcrumb component
    When I click "breadcrumbInTree" on "aemTestBreadcrumbPage" screen
    And I click "configureButton" on "aemTestBreadcrumbPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemBreadcrumbComponentDialog" screen
    Then I clear contents of "startLevel" element on "aemBreadcrumbComponentDialog" screen
    And I enter "3" details in "startLevel" on "aemBreadcrumbComponentDialog" screen
    And I click "showHiddenItems" on "aemBreadcrumbComponentDialog" screen
    And I click "doneButton" on "aemBreadcrumbComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBreadcrumbComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-breadcrumb-RANDOM[0-8]-p3.html"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, normalize-breadcrumb"
    #Verify analytics attributes on level2
    And I verify "data-event" attribute is "site interaction" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-type" attribute is "breadcrumb" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-location" attribute is "breadcrumb" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-description" attribute is "racv home" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I click "level2" on "aemTestBreadcrumbPublished" screen using Action class
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"

  @TestPublishBreadcrumb-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Breadcrumb post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-breadcrumb-p3.html"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, normalize-breadcrumb"
    #Verify analytics attributes on level2
    And I verify "data-event" attribute is "site interaction" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-type" attribute is "breadcrumb" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-location" attribute is "breadcrumb" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I verify "data-description" attribute is "racv home" on "level2" element on "aemTestBreadcrumbPublished" screen
    And I click "level2" on "aemTestBreadcrumbPublished" screen using Action class
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBBreadCrumbTruncatedNo
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify breadcrumb non truncated on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-breadcrumb--breadcrumb-comp&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBreadCrumbTruncatedYes
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify breadcrumb truncated on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Truncated:Yes&id=components-breadcrumb--breadcrumb-comp&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBreadCrumbTruncatedNo
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify breadcrumb non truncated (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-breadcrumb--breadcrumb-comp&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBreadCrumbTruncatedYes
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify breadcrumb truncated (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Truncated:Yes&id=components-breadcrumb--breadcrumb-comp&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"