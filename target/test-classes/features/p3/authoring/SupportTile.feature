#Author: Dheebanraj M
Feature: This feature tests the support tile component in AEM authoring and storybook

  @TestAuthoringSupportTile-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add support tile component and configure, publish and view the page in AEM then delete and page
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
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-support-tile-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-support-tile-RANDOM[0-8]-p3.html"
    When I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Add support tiles"
    #Search and add support tile
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "support" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "supportTileResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "supportTileResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Adding 2nd support tile
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "support" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "supportTileResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "supportTileResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Adding 3rd support tile
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "support" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "supportTileResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "supportTileResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author tiles"
    #Configure 1st Support tile
    When I click "firstSupportTile" on "aemTestSupportTilePage" screen
    And I click "configureButton" on "aemTestSupportTilePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemSupportTileComponentDialog" screen
    And I click "listFromDdn" on "aemSupportTileComponentDialog" screen
    And I select "Child pages of Current page" value for "listFromDdnResult" drop down in "aemSupportTileComponentDialog" screen using selection method "visibleText"
    And I click "layoutTab" on "aemSupportTileComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemSupportTileComponentDialog" screen
    And I click "doneButton" on "aemSupportTileComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSupportTileComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #configure Support tile with child pages of ...
    #Configure 2nd Support tile
    When I click "secondSupportTile" on "aemTestSupportTilePage" screen
    And I click "configureButton" on "aemTestSupportTilePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemSupportTileComponentDialog" screen
    And I click "listFromDdn" on "aemSupportTileComponentDialog" screen
    And I select "Child pages of..." value for "listFromDdnResult" drop down in "aemSupportTileComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/contact-us" details in "parentPageField" on "aemSupportTileComponentDialog" screen
    And I click "layoutTab" on "aemSupportTileComponentDialog" screen
    And I click "doneButton" on "aemSupportTileComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSupportTileComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 3rd Support tile
    When I click "thirdSupportTile" on "aemTestSupportTilePage" screen
    And I click "configureButton" on "aemTestSupportTilePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemSupportTileComponentDialog" screen
    And I click "listFromDdn" on "aemSupportTileComponentDialog" screen
    And I select "Child pages with Parent page" value for "listFromDdnResult" drop down in "aemSupportTileComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/home/emergency-home-assist" details in "parentPageField" on "aemSupportTileComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "descendantAllCheckBox" on "aemSupportTileComponentDialog" screen
    And I enter "3" details in "numberLimitField" on "aemSupportTileComponentDialog" screen
    And I click "layoutTab" on "aemSupportTileComponentDialog" screen
    And I click "doneButton" on "aemSupportTileComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSupportTileComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-support-tile-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "contactRACVTile" on "aemTestSupportTilePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "racvRetailStoresTile" element is visible on "aemTestSupportTilePublished" screen
    And I verify "emergencyElectrictionsTile" element is visible on "aemTestSupportTilePublished" screen
    And I verify "emergencyPlumbersTile" element is visible on "aemTestSupportTilePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on racvRetailStoresTile in the child pages of
    And I verify "data-event" attribute is "site interaction" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-type" attribute is "support tile" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-location" attribute is "help and support" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-description" attribute is "retail stores" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-details" attribute is "1" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    #Verify analytics attributes on emergencyElectrictionsTile in the child pages tile
    And I verify "data-event" attribute is "site interaction" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-type" attribute is "support tile" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-location" attribute is "help and support" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-description" attribute is "emergency electricians" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-details" attribute is "2" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen

  @TestPublishSupportTile-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Support tile post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-support-tile-p3.html"
    #Post publish checks
    And I wait for "contactRACVTile" on "aemTestSupportTilePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "racvRetailStoresTile" element is visible on "aemTestSupportTilePublished" screen
    And I verify "emergencyElectrictionsTile" element is visible on "aemTestSupportTilePublished" screen
    And I verify "emergencyPlumbersTile" element is visible on "aemTestSupportTilePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on racvRetailStoresTile in the child pages of
    And I verify "data-event" attribute is "site interaction" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-type" attribute is "support tile" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-location" attribute is "help and support" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-description" attribute is "retail stores" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-details" attribute is "1" on "racvRetailStoresTile" element on "aemTestSupportTilePublished" screen
    #Verify analytics attributes on emergencyElectrictionsTile in the child pages tile
    And I verify "data-event" attribute is "site interaction" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-type" attribute is "support tile" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-location" attribute is "help and support" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-description" attribute is "emergency electricians" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen
    And I verify "data-details" attribute is "2" on "emergencyElectrictionsTile" element on "aemTestSupportTilePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBSupportTile
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify support tile in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-support-tile--support-tile-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSupportTileNoHeading
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify support tile no heading in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:&id=components-support-tile--support-tile-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSupportTileNoDescription
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify support tile no description in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=description:&id=components-support-tile--support-tile-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSupportTile
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify support tile (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-support-tile--support-tile-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSupportTileNoHeading
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify support tile no heading (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:&id=components-support-tile--support-tile-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSupportTileNoDescription
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify support tile no description (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=description:&id=components-support-tile--support-tile-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"