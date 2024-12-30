#Author: Jing Zuo
Feature: This feature tests the Split Panel in AEM authoring and storybook

  @TestAuthoringSplitPanel-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author split panel component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-splitpanel-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-splitpanel-RANDOM[0-8]-p3.html"
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
    And I create a new test log node "Author Split Panel - Link List"
    #Add Split Panel component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Split Panel" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "splitPanelResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "splitPanelResult" on "aemInsertNewComponent" screen
    And I wait for "splitPanelResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Split Panel component - link list
    #Configurations tab
    When I click "splitPanelInTree" on "aemTestSplitPanelPage" screen
    And I click "configureButton" on "aemTestSplitPanelPage" screen
    And I take a screenshot
    And I click "configurationTab" on "aemSplitPanelComponentDialog" screen
    Then I click "type" on "aemSplitPanelComponentDialog" screen
    And I select "Link list" value for "typeList" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I enter "Split Panel - Link List Variation" details in "heading" on "aemSplitPanelComponentDialog" screen
    And I enter "Limit summary content to under 150 characters." details in "description" on "aemSplitPanelComponentDialog" screen
    And I click "imgAlignment" on "aemSplitPanelComponentDialog" screen
    And I select "Left" value for "imgAlignmentList" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemSplitPanelComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemSplitPanelComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemSplitPanelComponentDialog" screen
    And I enter "split panel" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSplitPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSplitPanelComponentDialog" screen or "5" seconds before proceeding
    #Configure Link List Component
    When I click "linkListInTree" on "aemTestSplitPanelPage" screen
    And I click "configureButton" on "aemTestSplitPanelPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/insurance" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Child Pages" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Child pages" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "increaseChildDepth" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv/corporate-responsibility" details in "parentPageInChild" on "aemLinkListComponentDialog" screen
    And I click "iconTypeInChild" on "aemLinkListComponentDialog" screen
    And I select "Arrow" value for "iconTypeListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "orderByInChild" on "aemLinkListComponentDialog" screen
    And I select "Page Order" value for "orderByListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Split Panel - Button"
    #Add Split Panel component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Split Panel" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "splitPanelResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "splitPanelResult" on "aemInsertNewComponent" screen
    And I wait for "splitPanelResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Split Panel component - button
    #Configurations tab
    When I click "splitPanelInTree" on "aemTestSplitPanelPage" screen
    And I click "configureButton" on "aemTestSplitPanelPage" screen
    And I take a screenshot
    And I click "configurationTab" on "aemSplitPanelComponentDialog" screen
    Then I click "type" on "aemSplitPanelComponentDialog" screen
    And I select "Button" value for "typeList" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I enter "Split Panel - Button Variation" details in "heading" on "aemSplitPanelComponentDialog" screen
    And I enter "Limit summary content to under 150 characters." details in "description" on "aemSplitPanelComponentDialog" screen
    And I click "imgAlignment" on "aemSplitPanelComponentDialog" screen
    And I select "Right" value for "imgAlignmentList" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemSplitPanelComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemSplitPanelComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemSplitPanelComponentDialog" screen
    And I enter "split panel1" details in "altTextImage" on "aemSplitPanelComponentDialog" screen
    And I take a screenshot
    And I click "enablePrimaryCTA" on "aemSplitPanelComponentDialog" screen
    And I click "enableSecondaryCTA" on "aemSplitPanelComponentDialog" screen
    And I click "disableJourneyLine" on "aemSplitPanelComponentDialog" screen
    And I click "enableIconText" on "aemSplitPanelComponentDialog" screen
    And I take a screenshot
    When I click "addIconTextButton" on "aemSplitPanelComponentDialog" screen
    Then I click "iconType1" on "aemSplitPanelComponentDialog" screen
    And I select "Car" value for "iconType1List" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I enter "Car insurance" details in "label1" on "aemSplitPanelComponentDialog" screen
    And I click "addIconTextButton" on "aemSplitPanelComponentDialog" screen
    And I click "iconType2" on "aemSplitPanelComponentDialog" screen
    And I select "Accident" value for "iconType2List" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I enter "Secuirty" details in "label2" on "aemSplitPanelComponentDialog" screen
    And I click "addIconTextButton" on "aemSplitPanelComponentDialog" screen
    And I click "iconType3" on "aemSplitPanelComponentDialog" screen
    And I select "Member Card" value for "iconType3List" drop down in "aemSplitPanelComponentDialog" screen using selection method "visibleText"
    And I enter "Member benefits" details in "label3" on "aemSplitPanelComponentDialog" screen
    And I click "doneButton" on "aemSplitPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSplitPanelComponentDialog" screen or "5" seconds before proceeding
    #Configure button 1 - Primary no icon
    When I click "buttonInTree" on "aemTestSplitPanelPage" screen
    And I click "configureButton" on "aemTestSplitPanelPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    #Enter internal link
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure button 2 - Secondary before text icon
    And I click "buttonInTree" on "aemTestSplitPanelPage" screen
    And I click "configureButton" on "aemTestSplitPanelPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter external link
    And I enter "https://www.racv.com.au/insurance" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "openInDropDown" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-splitpanel-RANDOM[0-8]-p3.html"
    And I wait for "splitPanel1Heading" on "aemTestSplitPanelPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    Then I verify "linkListHeading" element is visible on "aemTestSplitPanelPagePublished" screen
    And I verify "linkList1" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on linkList1
    And I verify "data-event" attribute is "site interaction" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "links" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - link list variation" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "our community" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "primaryCta" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on primaryCta
    And I verify "data-event" attribute is "site interaction" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - button variation" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "secondaryCta" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on secondaryCta
    And I verify "data-event" attribute is "site interaction" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - button variation" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen

  @TestPublishSplitPanel-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Split Panel post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-splitpanel-p3.html"
    And I wait for "splitPanel1Heading" on "aemTestSplitPanelPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    Then I verify "linkListHeading" element is visible on "aemTestSplitPanelPagePublished" screen
    And I verify "linkList1" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on linkList1
    And I verify "data-event" attribute is "site interaction" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "links" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - link list variation" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "our community" on "linkList1" element on "aemTestSplitPanelPagePublished" screen
    And I verify "primaryCta" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on primaryCta
    And I verify "data-event" attribute is "site interaction" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - button variation" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "secondaryCta" element is visible on "aemTestSplitPanelPagePublished" screen
    #Verify analytics attributes on secondaryCta
    And I verify "data-event" attribute is "site interaction" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-location" attribute is "split panel - button variation" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryCta" element on "aemTestSplitPanelPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBSplitPanel1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Split Panel - Link list variation on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:ArrowRight&id=components-split-panel--split-panel-link-list-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSplitPanel2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Split Panel - Button variation on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageAlignment:right;showJourneyLine:false&id=components-split-panel--split-panel-button-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSplitPanel1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Split Panel - Link list variation (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:ArrowRight&id=components-split-panel--split-panel-link-list-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSplitPanel2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Split Panel - Button variation (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageAlignment:right;showJourneyLine:false&id=components-split-panel--split-panel-button-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"