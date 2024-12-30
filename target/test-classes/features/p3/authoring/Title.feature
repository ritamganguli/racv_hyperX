Feature: This feature tests the title component AEM authoring and storybook

  @TestAuthoringTitle-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add fixed-width container with text and use the various text features, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-title-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-title-RANDOM[0-8]-p3.html"
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
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Title 1"
    #Add Title component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Title" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "titleResult" on "aemInsertNewComponent" screen
    And I wait for "titleResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Title component
    When I click "firstTitle" on "aemTestTitlePage" screen
    And I click "configureButton" on "aemTestTitlePage" screen
    And I take a screenshot
    #Properties tab
    And I enter "Lorem ipsum dolor sit amet" details in "titleField" on "aemTitleComponentDialog" screen
    And I click "typeDropDown" on "aemTitleComponentDialog" screen
    And I select "h2" value for "typeDropDownResults" drop down in "aemTitleComponentDialog" screen using selection method "visibleText"
    And I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Copy paste"
    #Copy and paste component multiple times
    When I click "firstTitle" on "aemTestTitlePage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "secondTitle" on "aemTestTitlePage" screen or "20" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "thirdTitle" on "aemTestTitlePage" screen or "20" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "fourthTitle" on "aemTestTitlePage" screen or "20" seconds before proceeding
    #Check all 4 titles have been inserted otherwise fail the test
    And I verify "fourthTitle" element exists on "aemTestTitlePage" screen
    And I take a screenshot
    #Configure the copied titles
    #See matrix: https://racvone.atlassian.net/wiki/spaces/DAC/pages/3340076593/Title+Matrix
    #Second title via styles tab
    ###############
    ## NODE
    ###############
    And I create a new test log node "Title 2"
    When I click "secondTitle" on "aemTestTitlePage" screen
    And I click "stylesButton" on "aemTestTitlePage" screen
    And I take a screenshot
    #Default value for top spacing is medium, click medium to be unselected
    And I click "mediumTopSpacing" on "aemTestTitlePage" screen
    And I take a screenshot
    And I select "Centre" value for "titleAlignmentStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I take a screenshot
    And I select "Small" value for "bottomSpacingStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestTitlePage" screen
    And I wait for "applyStyle" to disappear on "aemTestTitlePage" screen or "5" seconds before proceeding
    Then I click "configureButton" on "aemTestTitlePage" screen
    And I click "typeDropDown" on "aemTitleComponentDialog" screen
    And I select "h3" value for "typeDropDownResults" drop down in "aemTitleComponentDialog" screen using selection method "visibleText"
    And I enter "my-title-id" details in "idField" on "aemTitleComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    #Third title via quick style
    ###############
    ## NODE
    ###############
    And I create a new test log node "Title 3"
    When I click "thirdTitle" on "aemTestTitlePage" screen
    And I click "configureButton" on "aemTestTitlePage" screen
    And I click "typeDropDown" on "aemTitleComponentDialog" screen
    And I select "h3" value for "typeDropDownResults" drop down in "aemTitleComponentDialog" screen using selection method "visibleText"
    When I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    When I click "thirdTitle" on "aemTestTitlePage" screen
    And I click "stylesButton" on "aemTestTitlePage" screen
    And I select "Base" value for "topSpacingStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I select "Large" value for "bottomSpacingStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I take a screenshot
    When I click "applyStyle" on "aemTestTitlePage" screen
    And I wait for "applyStyle" to disappear on "aemTestTitlePage" screen or "5" seconds before proceeding
    #Fourth title via quick style
    ###############
    ## NODE
    ###############
    And I create a new test log node "Title 4"
    When I click "fourthTitle" on "aemTestTitlePage" screen
    And I click "configureButton" on "aemTestTitlePage" screen
    And I click "typeDropDown" on "aemTitleComponentDialog" screen
    And I select "h4" value for "typeDropDownResults" drop down in "aemTitleComponentDialog" screen using selection method "visibleText"
    When I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    When I click "fourthTitle" on "aemTestTitlePage" screen
    And I click "stylesButton" on "aemTestTitlePage" screen
    And I select "Centre" value for "titleAlignmentStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I select "X Large" value for "topSpacingStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I select "XX Large" value for "bottomSpacingStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    And I take a screenshot
    When I click "applyStyle" on "aemTestTitlePage" screen
    And I wait for "applyStyle" to disappear on "aemTestTitlePage" screen or "5" seconds before proceeding
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-title-RANDOM[0-8]-p3.html"
    And I wait for "firstTitle" on "aemTestTitlePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstTitle" element exists on "aemTestTitlePublished" screen
    And I verify "secondTitle" element exists on "aemTestTitlePublished" screen
    And I verify "thirdTitle" element exists on "aemTestTitlePublished" screen
    And I verify "fourthTitle" element exists on "aemTestTitlePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishTitle-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Title post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-title-p3.html"
    And I wait for "firstTitle" on "aemTestTitlePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstTitle" element exists on "aemTestTitlePublished" screen
    And I verify "secondTitle" element exists on "aemTestTitlePublished" screen
    And I verify "thirdTitle" element exists on "aemTestTitlePublished" screen
    And I verify "fourthTitle" element exists on "aemTestTitlePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBTitleBasic
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify various text on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-title--text-link-comp&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTitleCenter
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text cross unordered list on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=type:text-center&id=atom-title--text-link-comp&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTitleBasic
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify various text (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-title--text-link-comp&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTitleCenter
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text cross unordered list (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=type:text-center&id=atom-title--text-link-comp&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"