#Author: Viengcumm Thongvilu
#Date Created : 18 Aug 22
Feature: This feature tests the Separator in AEM authoring and storybook

  @TestAuthoringSeparatorJourneyLine-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author separator component (journey line variant) and verify published dispatcher component, accessibility and visually
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
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-separator-journeyline-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-separator-journeyline-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring"
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to simple full width
    And I click "lastContainerInTree" on "aemTestSeparatorPage" screen
    And I click "stylesButton" on "aemTestSeparatorPage" screen
    And I select "Full Width" value for "containerStylesWidthList" drop down in "aemTestSeparatorPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestSeparatorPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    #Add separator component and configure
    And I click "insertComponentButton" on "aemTestSeparatorPage" screen
    And I enter "Separator" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "separatorResult" on "aemInsertNewComponent" screen
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "separatorInTree" on "aemTestSeparatorPage" screen
    And I click "configureButton" on "aemTestSeparatorPage" screen
    #configuration
    And I enter "my-journeyline-id" details in "idField" on "aemSeparatorDialog" screen
    And I click "typeDropDown" on "aemSeparatorDialog" screen
    And I click "typeJourneyLine" on "aemSeparatorDialog" screen
    And I take a screenshot
    And I click "saveButton" on "aemSeparatorDialog" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish + check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-separator-journeyline-RANDOM[0-8]-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine" on "aemTestSeparatorPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine" element exists on "aemTestSeparatorPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishSeparatorJourneyLine-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Separator journey line post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-separator-journeyline-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine" on "aemTestSeparatorPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine" element exists on "aemTestSeparatorPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringSeparatorHorizontal-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author separator component (horizontal line variant) in responsive fixed width container and verify published dispatcher component, accessibility and visually
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
    And I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    And I capture the address navigated to
    #Create a page
    And I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-separator-horizontal-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-separator-horizontal-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring"
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
    #Configure newly added container to responsive fixed width
    And I click "lastContainerInTree" on "aemTestSeparatorPage" screen
    And I click "stylesButton" on "aemTestSeparatorPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestSeparatorPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestSeparatorPage" screen
    And I click "configureButton" on "aemTestSeparatorPage" screen
    And I take a screenshot
    And I click "saveButton" on "aemContainerDialog" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    #Add separator component and configure
    And I click "insertComponentButton" on "aemTestSeparatorPage" screen
    And I enter "Separator" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "separatorResult" on "aemInsertNewComponent" screen
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "separatorInTree" on "aemTestSeparatorPage" screen
    And I click "configureButton" on "aemTestSeparatorPage" screen
    #configuration
    And I enter "my-horizontal-id" details in "idField" on "aemSeparatorDialog" screen
    And I take a screenshot
    And I click "saveButton" on "aemSeparatorDialog" screen
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
    And I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-separator-horizontal-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "horizontalLine" on "aemTestSeparatorPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "horizontalLine" element exists on "aemTestSeparatorPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishSeparatorHorizontal-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Separator horizontal post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-separator-horizontal-p3.html"
    #Post publish checks
    And I wait for "horizontalLine" on "aemTestSeparatorPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "horizontalLine" element exists on "aemTestSeparatorPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBSeparatorJourneyLine-p3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify journey line visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-journey-line&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSeparatorHorizontalLine-p3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify separator horizontal line visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-horizontal&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSeparatorVerticalLine-p3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify separator vertical line visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-vertical&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSeparatorJourneyLine-p3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify journey line visually (club theme) in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-journey-line&viewMode=story&globals=theme:club"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSeparatorHorizontalLine-p3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify separator horizontal line visually (club theme) in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-horizontal&viewMode=story&globals=theme:club"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSeparatorVerticalLine-p3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify separator vertical line visually (club theme) in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-separator--separator-vertical&viewMode=story&globals=theme:club"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"