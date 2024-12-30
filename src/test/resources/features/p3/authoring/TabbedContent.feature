#Author: Viengcumm Thongvilu
Feature: This feature tests the tabbed component in AEM authoring and storybook

  @TestAuthoringTabbedContent-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author tabbed content component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-tabbed-content-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-tabbed-content-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
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
    And I create a new test log node "Add tabbed component"
    #Add 1 st Tabbed Content component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Tabbed Content" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "tabbedContentResult" on "aemInsertNewComponent" screen
    And I wait for "tabbedContentResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 1st Tabbed Content
    When I click "tabbedContentInTree" on "aemTestTabbedContentPage" screen
    And I click "configureButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Items tab"
    #Items tab
    And I click "itemsTab" on "aemTabbedContentComponentDialog" screen
    Then I click "addTab" on "aemTabbedContentComponentDialog" screen
    And I click "containerResult" on "aemTabbedContentComponentDialog" screen
    And I wait for "containerResult" to disappear on "aemTabbedContentComponentDialog" screen or "5" seconds before proceeding
    And I click "tabTitle3" on "aemTabbedContentComponentDialog" screen
    And I enter "Tab 3" details in "tabTitle3" on "aemTabbedContentComponentDialog" screen
    And I take a screenshot
    And I click "addTab" on "aemTabbedContentComponentDialog" screen
    And I click "containerResult" on "aemTabbedContentComponentDialog" screen
    And I wait for "containerResult" to disappear on "aemTabbedContentComponentDialog" screen or "5" seconds before proceeding
    And I click "tabTitle4" on "aemTabbedContentComponentDialog" screen
    And I enter "Tab 4" details in "tabTitle4" on "aemTabbedContentComponentDialog" screen
    And I take a screenshot
    And I click "addTab" on "aemTabbedContentComponentDialog" screen
    And I click "containerResult" on "aemTabbedContentComponentDialog" screen
    And I wait for "containerResult" to disappear on "aemTabbedContentComponentDialog" screen or "5" seconds before proceeding
    And I click "tabTitle5" on "aemTabbedContentComponentDialog" screen
    And I enter "Tab 5" details in "tabTitle5" on "aemTabbedContentComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTabbedContentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTabbedContentComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tab 1"
    #Add Text under Tab 1
    And I wait for "addComponentsInContainerParsys1" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "addComponentsInContainerParsys1" on "aemTestTabbedContentPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I click "searchInputField" on "aemInsertNewComponent" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text 1
    When I click "textInContainer" on "aemTestTabbedContentPage" screen
    And I wait for "editButton" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    And I enter "Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details using Action class
    And I click "textSaveIcon" on "aemTestTabbedContentPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tab 2"
    #Add Text under Tab 2
    When I click "tabbedContentInTree" on "aemTestTabbedContentPage" screen
    And I click "configureButton" on "aemTestTabbedContentPage" screen
    #Properties tab
    When I click "propertiesTab" on "aemTabbedContentComponentDialog" screen
    And I click "activeItem" on "aemTabbedContentComponentDialog" screen
    Then I select "Container: Tab 2" value for "activeItemList" drop down in "aemTabbedContentComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTabbedContentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTabbedContentComponentDialog" screen or "2" seconds before proceeding
    And I wait for "addComponentsInContainerParsys2" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "addComponentsInContainerParsys2" on "aemTestTabbedContentPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I click "searchInputField" on "aemInsertNewComponent" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text 2
    When I click "textInContainer" on "aemTestTabbedContentPage" screen
    And I wait for "editButton" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    And I enter "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old." details using Action class
    And I click "textSaveIcon" on "aemTestTabbedContentPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tab 3"
    #Add Text under Tab 3
    When I click "tabbedContentInTree" on "aemTestTabbedContentPage" screen
    And I click "configureButton" on "aemTestTabbedContentPage" screen
    #Properties tab
    When I click "propertiesTab" on "aemTabbedContentComponentDialog" screen
    And I click "activeItem" on "aemTabbedContentComponentDialog" screen
    Then I select "Container: Tab 3" value for "activeItemList" drop down in "aemTabbedContentComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTabbedContentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTabbedContentComponentDialog" screen or "2" seconds before proceeding
    And I wait for "addComponentsInContainerParsys3" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "addComponentsInContainerParsys3" on "aemTestTabbedContentPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I click "searchInputField" on "aemInsertNewComponent" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text 3
    When I click "textInContainer" on "aemTestTabbedContentPage" screen
    And I wait for "editButton" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    And I enter "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout." details using Action class
    And I click "textSaveIcon" on "aemTestTabbedContentPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tab 4"
    #Add Text under Tab 4
    When I click "tabbedContentInTree" on "aemTestTabbedContentPage" screen
    And I click "configureButton" on "aemTestTabbedContentPage" screen
    #Properties tab
    When I click "propertiesTab" on "aemTabbedContentComponentDialog" screen
    And I click "activeItem" on "aemTabbedContentComponentDialog" screen
    Then I select "Container: Tab 4" value for "activeItemList" drop down in "aemTabbedContentComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTabbedContentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTabbedContentComponentDialog" screen or "2" seconds before proceeding
    And I wait for "addComponentsInContainerParsys4" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "addComponentsInContainerParsys4" on "aemTestTabbedContentPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I click "searchInputField" on "aemInsertNewComponent" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text 4
    When I click "textInContainer" on "aemTestTabbedContentPage" screen
    And I wait for "editButton" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    And I enter "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable." details using Action class
    And I click "textSaveIcon" on "aemTestTabbedContentPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tab 5"
    #Add Text under Tab 5
    When I click "tabbedContentInTree" on "aemTestTabbedContentPage" screen
    And I click "configureButton" on "aemTestTabbedContentPage" screen
    #Properties tab
    When I click "propertiesTab" on "aemTabbedContentComponentDialog" screen
    And I click "activeItem" on "aemTabbedContentComponentDialog" screen
    Then I select "Container: Tab 5" value for "activeItemList" drop down in "aemTabbedContentComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTabbedContentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTabbedContentComponentDialog" screen or "2" seconds before proceeding
    And I wait for "addComponentsInContainerParsys5" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "addComponentsInContainerParsys5" on "aemTestTabbedContentPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I click "searchInputField" on "aemInsertNewComponent" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text 5
    When I click "textInContainer" on "aemTestTabbedContentPage" screen
    And I wait for "editButton" on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestTabbedContentPage" screen
    And I take a screenshot
    And I enter "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet." details using Action class
    And I click "textSaveIcon" on "aemTestTabbedContentPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTabbedContentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-tabbed-content-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    Then I click "tab1" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab1
    And I verify "data-event" attribute is "site interaction" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 1" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 1" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab2" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab2
    And I verify "data-event" attribute is "site interaction" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 2" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 2" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab3" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab3
    And I verify "data-event" attribute is "site interaction" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 3" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 3" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab4" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab4
    And I verify "data-event" attribute is "site interaction" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 4" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 4" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant

  @TestPublishTabbedContent-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Tabbed Content post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-tabbed-content-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    Then I click "tab1" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab1
    And I verify "data-event" attribute is "site interaction" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 1" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 1" on "tab1" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab2" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab2
    And I verify "data-event" attribute is "site interaction" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 2" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 2" on "tab2" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab3" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab3
    And I verify "data-event" attribute is "site interaction" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 3" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 3" on "tab3" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I click "tab4" on "aemTestTabbedContentPublished" screen
    #Verify analytics attributes on tab4
    And I verify "data-event" attribute is "site interaction" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-type" attribute is "tab links" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-location" attribute is "tab 4" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I verify "data-description" attribute is "tab 4" on "tab4" element on "aemTestTabbedContentPublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBTabbedComponent1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tabbed component 1 tab(s) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:1&id=components-tabbed-content--tabbed-content-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTabbedComponent2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tabbed component 2 tab(s) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:2&id=components-tabbed-content--tabbed-content-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTabbedComponent3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tabbed component 3 tab(s) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent3.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify tabbed component 3 tab(s) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tabbed component 4 tab(s) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent4.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify tabbed component 4 tab(s) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tabbed component 5 tab(s) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent5.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify tabbed component 5 tab(s) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tabbed component 1 tab(s) (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:1&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTabbedComponent2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tabbed component 2 tab(s) (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:2&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTabbedComponent3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tabbed component 3 tab(s) (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent3.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify tabbed component 3 tab(s) (club theme) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:3&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tabbed component 4 tab(s) (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent4.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify tabbed component 4 tab(s) (club theme) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfTabs:4&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tabbed component 5 tab(s) (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "desktop"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    Then I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBTabbedComponent5.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify tabbed component 5 tab(s) (club theme) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tabbed-content--tabbed-content-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"