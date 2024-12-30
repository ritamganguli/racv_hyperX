#Author: Dheebanraj M
Feature: This feature tests the icon text illustration variation in AEM authoring and storybook.

  @TestAuthoringIconTextIllustration-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author icon text component illustration variation and verify published dispatcher component, accessibility and visually.
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
    And I enter "test-automation-icon-text-illustration-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-icon-text-illustration-RANDOM[0-8]-p3.html"
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
    And I create a new test log node "Add 3 icon text components"
    #Add 1 st Icon Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Icon Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "iconTextResult" on "aemInsertNewComponent" screen
    And I wait for "iconTextResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Add 2nd Icon Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Icon Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "iconTextResult" on "aemInsertNewComponent" screen
    And I wait for "iconTextResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Add 3rd Icon Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Icon Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "iconTextResult" on "aemInsertNewComponent" screen
    And I wait for "iconTextResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author icon text 1"
    #Configure 1st Icon Text
    When I click "firstIconText" on "aemTestIconTextPage" screen
    And I click "configureButton" on "aemTestIconTextPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemIconTextComponentDialog" screen
    Then I click "type" on "aemIconTextComponentDialog" screen
    And I select "Illustration" value for "typeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "illustrationType" on "aemIconTextComponentDialog" screen
    And I select "House With Dog Hero" value for "illustrationTypeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I click "illustrationAlignment" on "aemIconTextComponentDialog" screen
    And I select "Left" value for "illustrationAlignmentList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Icon Text 1" details in "heading" on "aemIconTextComponentDialog" screen
    And I enter "/content/racv/en/home/cars-transport" details in "linkUrl" on "aemIconTextComponentDialog" screen
    And I click "linkLabel" on "aemIconTextComponentDialog" screen
    And I enter "Get a quote" details in "linkLabel" on "aemIconTextComponentDialog" screen
    And I take a screenshot
    And I click "linkIcon" on "aemIconTextComponentDialog" screen
    And I select "No Icon" value for "linkIconList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemIconTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemIconTextComponentDialog" screen or "2" seconds before proceeding
    #Configure 1st Text component
    When I wait for "firstText" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "firstText" on "aemTestIconTextPage" screen
    And I wait for "editButton" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestIconTextPage" screen
    And I enter "Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details using Action class
    And I click "textSaveIcon" on "aemTestIconTextPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author icon text 2"
    #Configure 2nd Icon Text
    When I click "secondIconText" on "aemTestIconTextPage" screen
    And I click "configureButton" on "aemTestIconTextPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemIconTextComponentDialog" screen
    Then I click "type" on "aemIconTextComponentDialog" screen
    And I select "Illustration" value for "typeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "illustrationType" on "aemIconTextComponentDialog" screen
    And I select "House With Car Plane Solar Hero" value for "illustrationTypeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I click "illustrationAlignment" on "aemIconTextComponentDialog" screen
    And I select "Center" value for "illustrationAlignmentList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Icon Text 2" details in "heading" on "aemIconTextComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv" details in "linkUrl" on "aemIconTextComponentDialog" screen
    And I click "linkLabel" on "aemIconTextComponentDialog" screen
    And I enter "Get a quote" details in "linkLabel" on "aemIconTextComponentDialog" screen
    And I take a screenshot
    And I click "linkIcon" on "aemIconTextComponentDialog" screen
    And I select "Arrow" value for "linkIconList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemIconTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemIconTextComponentDialog" screen or "2" seconds before proceeding
    #Configure 2nd Text component
    When I wait for "secondText" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "secondText" on "aemTestIconTextPage" screen
    And I wait for "editButton" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestIconTextPage" screen
    And I take a screenshot
    And I enter "Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details using Action class
    And I click "textSaveIcon" on "aemTestIconTextPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author icon text 3"
    #Configure 3rd Icon Text
    When I click "thirdIconText" on "aemTestIconTextPage" screen
    And I click "configureButton" on "aemTestIconTextPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemIconTextComponentDialog" screen
    Then I click "type" on "aemIconTextComponentDialog" screen
    And I select "Illustration" value for "typeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "illustrationType" on "aemIconTextComponentDialog" screen
    And I select "House With Solar Hero" value for "illustrationTypeList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I click "illustrationAlignment" on "aemIconTextComponentDialog" screen
    And I select "Left" value for "illustrationAlignmentList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Icon Text 3" details in "heading" on "aemIconTextComponentDialog" screen
    And I enter "https://www.google.com" details in "linkUrl" on "aemIconTextComponentDialog" screen
    And I click "linkLabel" on "aemIconTextComponentDialog" screen
    And I enter "Get a quote" details in "linkLabel" on "aemIconTextComponentDialog" screen
    And I take a screenshot
    And I click "linkIcon" on "aemIconTextComponentDialog" screen
    And I select "External" value for "linkIconList" drop down in "aemIconTextComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemIconTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemIconTextComponentDialog" screen or "2" seconds before proceeding
    #Configure 3rd Text component
    When I wait for "thirdText" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "thirdText" on "aemTestIconTextPage" screen
    And I wait for "editButton" on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I click "editButton" on "aemTestIconTextPage" screen
    And I enter "Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details using Action class
    And I click "textSaveIcon" on "aemTestIconTextPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestIconTextPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-icon-text-illustration-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "iconText1" on "aemTestIconTextPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "iconText1" element exists on "aemTestIconTextPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on linkInIconText1
    And I verify "data-event" attribute is "site interaction" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 1" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText1" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-icon-text-illustration-RANDOM[0-8]-p3.html"
    Then I verify "iconText2" element exists on "aemTestIconTextPublished" screen
    #Verify analytics attributes on linkInIconText2
    And I verify "data-event" attribute is "site interaction" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 2" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText2" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-icon-text-illustration-RANDOM[0-8]-p3.html"
    Then I verify "iconText3" element exists on "aemTestIconTextPublished" screen
    #Verify analytics attributes on linkInIconText3
    And I verify "data-event" attribute is "site interaction" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 3" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText3" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "google.com"

  @TestPublishIconTextIllustration-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Icon text illustration post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-icon-text-illustration-p3.html"
    #Post publish checks
    And I wait for "iconText1" on "aemTestIconTextPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "iconText1" element exists on "aemTestIconTextPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on linkInIconText1
    And I verify "data-event" attribute is "site interaction" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 1" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText1" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText1" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-icon-text-illustration-p3.html"
    Then I verify "iconText2" element exists on "aemTestIconTextPublished" screen
    #Verify analytics attributes on linkInIconText2
    And I verify "data-event" attribute is "site interaction" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 2" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText2" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText2" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-icon-text-illustration-p3.html"
    Then I verify "iconText3" element exists on "aemTestIconTextPublished" screen
    #Verify analytics attributes on linkInIconText3
    And I verify "data-event" attribute is "site interaction" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-type" attribute is "link" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-location" attribute is "icon text | icon text 3" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I verify "data-description" attribute is "get a quote" on "linkInIconText3" element on "aemTestIconTextPublished" screen
    And I click "linkInIconText3" on "aemTestIconTextPublished" screen
    And I capture the address navigated to
    And I check the page address contains "google.com"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBIconTextIllustrationLeftAlign
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Icon Text Illustration left aligned in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Content_Alignment:left-align&id=components-icon-text--icon-text-illustration-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBIconTextIllustrationCenterAlign
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Icon Text Illustration center aligned in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-icon-text--icon-text-illustration-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBIconTextIllustrationLeftAlign
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Icon Text Illustration left aligned (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Content_Alignment:left-align&id=components-icon-text--icon-text-illustration-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBIconTextIllustrationCenterAlign
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Icon Text Illustration center aligned (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-icon-text--icon-text-illustration-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"