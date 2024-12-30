#Author: Jing Zuo
Feature: This feature tests the Wayfinder in AEM authoring and storybook

  @TestAuthoringWayfinder-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author wayfinder component and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-wayfinder-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-wayfinder-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Wayfinder" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "wayfinderResult" on "aemInsertNewComponent" screen
    And I wait for "wayfinderResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Wayfinder component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Way finder config"
    When I click "wayfinderInTree" on "aemTestWayfinderPage" screen
    And I click "configureButton" on "aemTestWayfinderPage" screen
    And I take a screenshot
    Then I click "configurationsTab" on "aemWayfinderComponentDialog" screen
    And I click "wayfinderTheme" on "aemWayfinderComponentDialog" screen
    And I select "Product action" value for "wayfinderThemeList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I click "headingLevel" on "aemWayfinderComponentDialog" screen
    And I select "H2" value for "headingLevelList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I enter "Titles are short succinct and focused on providing value" details in "heading" on "aemWayfinderComponentDialog" screen
    And I enter "product action theme" details in "description" on "aemWayfinderComponentDialog" screen
    And I take a screenshot
    When I click "addButton" on "aemWayfinderComponentDialog" screen
    #Configure multifields - wayfinder links
    #Tile 1 - no icon and title only
    And I enter "Tile 1" details in "tile1Title" on "aemWayfinderComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road/buying-a-car/car-loans" details in "tile1Link" on "aemWayfinderComponentDialog" screen
    Then I take a screenshot
    #Tile 2 - no icon and title with description
    When I click "addButton" on "aemWayfinderComponentDialog" screen
    And I enter "Tile 2" details in "tile2Title" on "aemWayfinderComponentDialog" screen
    And I enter "Tile 2 - no enabled icon" details in "tile2Description" on "aemWayfinderComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road/buying-a-car/car-loans" details in "tile2Link" on "aemWayfinderComponentDialog" screen
    Then I take a screenshot
    #Tile 3 - information icon and title only
    When I click "addButton" on "aemWayfinderComponentDialog" screen
    And I enter "Tile 3" details in "tile3Title" on "aemWayfinderComponentDialog" screen
    And I click "tile3EnableIcon" on "aemWayfinderComponentDialog" screen
    And I click "tile3Icon" on "aemWayfinderComponentDialog" screen
    And I select "Alarm Clock" value for "tile3IconList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I click "tile3IconThemes" on "aemWayfinderComponentDialog" screen
    And I select "Information" value for "tile3IconThemesList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/in-your-home/home-security" details in "tile3Link" on "aemWayfinderComponentDialog" screen
    Then I take a screenshot
    #Tile 4 - benefits icon and title with description
    When I click "addButton" on "aemWayfinderComponentDialog" screen
    And I enter "Tile 4" details in "tile4Title" on "aemWayfinderComponentDialog" screen
    And I enter "Tile 4 - benefits icon theme" details in "tile4Description" on "aemWayfinderComponentDialog" screen
    And I click "tile4EnableIcon" on "aemWayfinderComponentDialog" screen
    And I click "tile4Icon" on "aemWayfinderComponentDialog" screen
    And I select "Alarm Clock" value for "tile4IconList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I click "tile4IconThemes" on "aemWayfinderComponentDialog" screen
    And I select "Benefits" value for "tile4IconThemesList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/about-racv/corporate-governance" details in "tile4Link" on "aemWayfinderComponentDialog" screen
    Then I take a screenshot
    And I click "doneButton" on "aemWayfinderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemWayfinderComponentDialog" screen or "5" seconds before proceeding
    #Copy and paste component multiple times
    When I click "wayfinderInTree" on "aemTestWayfinderPage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "secondWayfinder" on "aemTestWayfinderPage" screen or "20" seconds before proceeding
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "thirdWayfinder" on "aemTestWayfinderPage" screen or "20" seconds before proceeding
    #Configure Wayfinder component 2
    ###############
    ## NODE
    ###############
    And I create a new test log node "Way finder 2"
    When I click "secondWayfinder" on "aemTestWayfinderPage" screen
    And I click "configureButton" on "aemTestWayfinderPage" screen
    And I take a screenshot
    Then I click "configurationsTab" on "aemWayfinderComponentDialog" screen
    And I click "wayfinderTheme" on "aemWayfinderComponentDialog" screen
    And I select "Digital communication" value for "wayfinderThemeList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I clear contents of "description" element on "aemWayfinderComponentDialog" screen
    And I enter "digital communication theme" details in "description" on "aemWayfinderComponentDialog" screen
    And I take a screenshot
    And I click "layoutTab" on "aemWayfinderComponentDialog" screen
    And I enter "2" details in "targetIdFiled" on "aemWayfinderComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemWayfinderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemWayfinderComponentDialog" screen or "5" seconds before proceeding
    #Configure Wayfinder component 3
    ###############
    ## NODE
    ###############
    And I create a new test log node "Way finder 3"
    When I click "thirdWayfinder" on "aemTestWayfinderPage" screen
    And I click "configureButton" on "aemTestWayfinderPage" screen
    And I take a screenshot
    Then I click "configurationsTab" on "aemWayfinderComponentDialog" screen
    And I click "wayfinderTheme" on "aemWayfinderComponentDialog" screen
    And I select "Support and help" value for "wayfinderThemeList" drop down in "aemWayfinderComponentDialog" screen using selection method "visibleText"
    And I clear contents of "description" element on "aemWayfinderComponentDialog" screen
    And I enter "support and help theme" details in "description" on "aemWayfinderComponentDialog" screen
    And I take a screenshot
    And I click "layoutTab" on "aemWayfinderComponentDialog" screen
    And I enter "3" details in "targetIdFiled" on "aemWayfinderComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemWayfinderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemWayfinderComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-wayfinder-RANDOM[0-8]-p3.html"
    When I dismiss GDPR notification if it exists
    Then I verify "description1" element exists on "aemTestWayfinderPagePublished" screen
    And I verify "description2" element exists on "aemTestWayfinderPagePublished" screen
    And I verify "description3" element exists on "aemTestWayfinderPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

  @TestPublishWayfinder-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Wayfinder post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-wayfinder-p3.html"
    When I dismiss GDPR notification if it exists
    Then I verify "description1" element exists on "aemTestWayfinderPagePublished" screen
    And I verify "description2" element exists on "aemTestWayfinderPagePublished" screen
    And I verify "description3" element exists on "aemTestWayfinderPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBWayfinder1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder test 1 on storybook
    #Product action wayfinder theme, H2 heading with description, 2 tiles, no icons
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTiles:2;showIcon:false&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdr"

  @TestSBWayfinder2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder test 2 on storybook
    #Product action wayfinder theme, H2 heading with description, 3 tiles without tile description and alternate tile description, no icons
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTiles:3;tileDescription:;showIcon:false;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder test 3 on storybook
    #Diginal communication wayfinder theme, H3 heading with no description, 4 tiles, Information icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:digi-com;headingLevel:h3;description:;numberOfTiles:4&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder test 4 on storybook
    #Digital communication wayfinder theme, H3 heading with no description, 5 tiles without alternate tile description, Information icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:digi-com;headingLevel:h3;numberOfTiles:5;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder test 5 on storybook
    #Support and help wayfinder theme, H4 heading with description, 6 tiles without tile description, Benefits icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:supp-help;headingLevel:h4;tileDescription:;iconType:benefit&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder6
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Wayfinder on test 6 storybook
    #Support and help wayfinder theme, H4 heading with description, 7 tiles without tile description and alternate tile description, Benefit icon types
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:supp-help;headingLevel:h4;numberOfTiles:7;tileDescription:;iconType:benefit;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Wayfinder test 1 (club theme) on storybook
    #Product action wayfinder theme, H2 heading with description, 2 tiles, no icons
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTiles:2;showIcon:false&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdr"

  @TestSBWayfinder2
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify Wayfinder test 2 (club theme) on storybook
    #Product action wayfinder theme, H2 heading with description, 3 tiles without tile description and alternate tile description, no icons
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTiles:3;tileDescription:;showIcon:false;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Wayfinder test 3 (club theme) on storybook
    #Diginal communication wayfinder theme, H3 heading with no description, 4 tiles, Information icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:digi-com;headingLevel:h3;description:;numberOfTiles:4&id=components-wayfinder--wayfinder-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Wayfinder test 4 (club theme) on storybook
    #Digital communication wayfinder theme, H3 heading with no description, 5 tiles without alternate tile description, Information icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:digi-com;headingLevel:h3;numberOfTiles:5;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Wayfinder test 5 (club theme) on storybook
    #Support and help wayfinder theme, H4 heading with description, 6 tiles without tile description, Benefits icon type
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:supp-help;headingLevel:h4;tileDescription:;iconType:benefit&id=components-wayfinder--wayfinder-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBWayfinder6
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Wayfinder on test 6 (club theme) storybook
    #Support and help wayfinder theme, H4 heading with description, 7 tiles without tile description and alternate tile description, Benefit icon types
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=wayFinderTheme:supp-help;headingLevel:h4;numberOfTiles:7;tileDescription:;iconType:benefit;longDescription:&id=components-wayfinder--wayfinder-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"