#Author: Viengcumm Thongvilu
Feature: This feature tests the Banner in AEM authoring and storybook

  @TestAuthoringBanner-p3
  @AuthoringSanity-p3.chrome.desktop
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author 4 Banner component variants, and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-banner-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html"
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure newly added container to fixed-width
    Then I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Banner 1 authoring"
    #Add 1st Banner component into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component and select Product and brand Theme
    #Configurations tab
    When I click "firstBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Title 1 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "1 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image1" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I enter "Get a quote 1" details in "buttonLabel" on "aemBannerComponentDialog" screen
    #external URL
    And I enter "https://www.google.com" details in "buttonLink" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Product and brand" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Add 2nd Banner component into Container
    ###############
    ## NODE
    ###############
    And I create a new test log node "Banner 2 authoring"
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component and select Feature and promotion Theme
    #Configurations tab
    When I click "secondBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Title 2 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "2 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image2" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I enter "Get a quote 2" details in "buttonLabel" on "aemBannerComponentDialog" screen
    #Internal direct url
    And I enter "https://www.racv.com.au/insurance" details in "buttonLink" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Feature and promotion" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Add 3rd Banner component into Container
    ###############
    ## NODE
    ###############
    And I create a new test log node "Banner 3 authoring"
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component and select Product action Theme
    #Configurations tab
    When I click "thirdBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Title 3 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "3 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image3" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I enter "Get a quote 3" details in "buttonLabel" on "aemBannerComponentDialog" screen
    #internal page url
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Product action" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/insurance" details in "buttonLink" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Add 4th Banner component into Container
    ###############
    ## NODE
    ###############
    And I create a new test log node "Banner 4 authoring"
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component and select Support and help Theme
    #Configurations tab
    When I click "fouthBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Title 4 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "4 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image4" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I enter "Get a quote 4" details in "buttonLabel" on "aemBannerComponentDialog" screen
    #anchor link
    And I enter "#test" details in "buttonLink" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Support and help" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
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
    And I create a new test log node "Publish Desktop checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html"
    When I dismiss GDPR notification if it exists
    And I wait for "heading1" on "aemTestBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I verify "heading1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button1" element is visible on "aemTestBannerPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1
    And I verify "data-event" attribute is "site interaction" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 1 are short succinct and focussed on providing value" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 1" on "button1" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.google.com"
    When I navigate to "URL/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button2" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button2
    And I verify "data-event" attribute is "site interaction" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 2 are short succinct and focussed on providing value" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 2" on "button2" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au/insurance"
    When I navigate to "URL/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button3" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button3
    And I verify "data-event" attribute is "site interaction" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 3 are short succinct and focussed on providing value" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 3" on "button3" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button3" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/insurance.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button4" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button4
    And I verify "data-event" attribute is "site interaction" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 4 are short succinct and focussed on providing value" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 4" on "button4" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button4" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/racv-home/utility/qa/test-automation-banner-RANDOM[0-8]-p3.html#test"

  @TestPublishBanner-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Banner post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-banner-p3.html"
    When I dismiss GDPR notification if it exists
    And I wait for "heading1" on "aemTestBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I verify "heading1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button1" element is visible on "aemTestBannerPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1
    And I verify "data-event" attribute is "site interaction" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 1 are short succinct and focussed on providing value" on "button1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 1" on "button1" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.google.com"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-banner-p3.html"
    Then I verify "heading2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button2" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button2
    And I verify "data-event" attribute is "site interaction" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 2 are short succinct and focussed on providing value" on "button2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 2" on "button2" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au/insurance"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-banner-p3.html"
    Then I verify "heading3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button3" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button3
    And I verify "data-event" attribute is "site interaction" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 3 are short succinct and focussed on providing value" on "button3" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 3" on "button3" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button3" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/insurance.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-banner-p3.html"
    Then I verify "heading4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "button4" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on button4
    And I verify "data-event" attribute is "site interaction" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "banner | title 4 are short succinct and focussed on providing value" on "button4" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote 4" on "button4" element on "aemTestBannerPagePublished" screen
    And I take a screenshot
    And I click "button4" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/racv-home/utility/qa/all-components/<theme>/test-automation-banner-p3.html#test"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBBannerProductAndBrand
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product and brand banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-banner--generic-banner-story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerFeatureAndPromotion
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductAction
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerSupportAndHelp
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify support and help banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductAndBrandNoImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product and brand no image banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerFeatureAndPromotionNoImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion no image banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductActionNoImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action no image banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerSupportAndHelpNoImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify support and help no image banner on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductAndBrand
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product and brand banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-banner--generic-banner-story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerFeatureAndPromotion
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductAction
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerSupportAndHelp
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify support and help banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductAndBrandNoImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product and brand no image banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerFeatureAndPromotionNoImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion no image banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerProductActionNoImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action no image banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBBannerSupportAndHelpNoImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify support and help no image banner (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help;hideImage:true&id=components-banner--generic-banner-story&viewMode=story&globals=theme:club;aemdecorators:aem-fixed"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"