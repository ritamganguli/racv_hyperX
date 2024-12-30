#Author: Dheebanraj M & Viengcumm Thongvilu
Feature: This feature tests the overview panel in AEM authoring and storybook

  @TestAuthoringOverviewPanel-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add overview panel components and configure, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-overview-panel-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-overview-panel-RANDOM[0-8]-p3.html"
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
    #Search and add overview panel component 1
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "overview" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "overviewPanelResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "overviewPanelResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Overview Panel 2
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "overview" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "overviewPanelResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "overviewPanelResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Overview panel 3
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "overview" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "overviewPanelResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "overviewPanelResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author overview panel 1"
    #Configure Overview Panel 1
    When I click "firstOverviewPanel" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestOverviewPanelPage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemOverviewPanelComponentDialog" screen
    And I enter "Flexible insurance for commercial property owners" details in "titleField" on "aemOverviewPanelComponentDialog" screen
    And I click "headingLevelDropDown" on "aemOverviewPanelComponentDialog" screen
    And I select "h2" value for "headingLevelDropDownResults" drop down in "aemOverviewPanelComponentDialog" screen using selection method "visibleText"
    And I click "layoutTab" on "aemOverviewPanelComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemOverviewPanelComponentDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in 1st over view panel
    When I click "firstOverviewPanelText" on "aemOverviewPanelTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I enter "Make sure your commercial property is protected with RACV Business Insurance.Flexible coverage is available for property damage, glass breakage and commercial liability." details in "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 1st Tile component in Tiles - Single link tile, no link icon, product tile icon theme
    When I click "firstTile" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemOverviewPanelTileComponentDialog" screen
    And I select "Single link tile" value for "tileLayoutList" drop down in "aemOverviewPanelTileComponentDialog" screen using selection method "visibleText"
    And I enter "overview_panel_id" details in "targetId" on "aemOverviewPanelTileComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road" details in "link" on "aemOverviewPanelTileComponentDialog" screen
    And I click "title" on "aemOverviewPanelTileComponentDialog" screen
    And I enter "Key inclusion" details in "title" on "aemOverviewPanelTileComponentDialog" screen
    And I click "linkIcon" on "aemOverviewPanelTileComponentDialog" screen
    And I select "No Icon" value for "linkIconList" drop down in "aemOverviewPanelTileComponentDialog" screen using selection method "visibleText"
    And I enter "On the road" details in "linkLabel" on "aemOverviewPanelTileComponentDialog" screen
    And I click "showIconSingleLink" on "aemOverviewPanelTileComponentDialog" screen
    And I click "iconSingleLink" on "aemOverviewPanelTileComponentDialog" screen
    And I select "Car" value for "iconSingleLinkList" drop down in "aemOverviewPanelTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "iconThemeSingleLink" on "aemOverviewPanelTileComponentDialog" screen
    And I select "Product" value for "iconThemeSingleLinkList" drop down in "aemOverviewPanelTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemOverviewPanelTileComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelTileComponentDialog" screen or "5" seconds before proceeding
    And I wait for "5" seconds before proceeding
    #Configure Text in 1st overview panel Tile component
    When I click "firstOverviewPanelTileText" on "aemOverviewPanelTileTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTileTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I enter "You can tailor your package by choosing from different cover options, so you don’t pay for insurance you don’t need." details in "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author overview panel 2"
    #Configure Overview Panel 2
    When I click "secondOverviewPanel" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestOverviewPanelPage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemOverviewPanelComponentDialog" screen
    And I enter "Flexible insurance for commercial property owners" details in "titleField" on "aemOverviewPanelComponentDialog" screen
    And I click "headingLevelDropDown" on "aemOverviewPanelComponentDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemOverviewPanelComponentDialog" screen using selection method "visibleText"
    And I click "layoutTab" on "aemOverviewPanelComponentDialog" screen
    #And I verify "targetDivIdValue" element exists on "aemOverviewPanelComponentDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in 2st over view panel
    When I click "secondOverviewPanelText" on "aemOverviewPanelTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I enter "Make sure your commercial property is protected with RACV Business Insurance.Flexible coverage is available for property damage, glass breakage and commercial liability." details in "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 2nd Tile component in Overview Panel - Multi link tile, benefits tile icon theme
    When I click "secondTile" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Multi link tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I enter "overview_panel_id1" details in "targetId" on "aemOverviewPanelTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter " Key exclusion" details in "title" on "aemTileComponentDialog" screen
    And I click "showIconMultiLink" on "aemTileComponentDialog" screen
    And I click "iconMultiLink" on "aemTileComponentDialog" screen
    And I select "Clock" value for "iconMultiLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "iconThemeMultiLink" on "aemTileComponentDialog" screen
    And I select "Benefits" value for "iconThemeMultiLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I wait for "5" seconds before proceeding
    #Configure Text in 2nd overview panel Tile component
    When I click "secondOverviewPanelTileText" on "aemOverviewPanelTileTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTileTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I enter "You can tailor your backpack by choosing from different cover list of options, so you do pay for insurance you do need." details in "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Link List in 2nd overview tile component
    When I click "linkList" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/insurance" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    #Then I enter "List Title" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Child pages" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "increaseChildDepth" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/utility/contact-us" details in "parentPageInChild" on "aemLinkListComponentDialog" screen
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
    And I create a new test log node "Author overview panel 3"
    #Configure Overview Panel
    When I click "thirdOverviewPanel" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestOverviewPanelPage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemOverviewPanelComponentDialog" screen
    And I enter "Flexible insurance for commercial property owners" details in "titleField" on "aemOverviewPanelComponentDialog" screen
    And I click "headingLevelDropDown" on "aemOverviewPanelComponentDialog" screen
    And I select "h4" value for "headingLevelDropDownResults" drop down in "aemOverviewPanelComponentDialog" screen using selection method "visibleText"
    And I click "layoutTab" on "aemOverviewPanelComponentDialog" screen
    #And I verify "targetDivIdValue" element exists on "aemOverviewPanelComponentDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in 3rd over view panel
    When I click "thirdOverviewPanelText" on "aemOverviewPanelTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I enter "Make sure your commercial property is protected with RACV Business Insurance.Flexible coverage is available for property damage, glass breakage and commercial liability." details in "editTextFiled" on "aemOverviewPanelTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 3rd Tile component in overview - Button tile
    When I click "thirdTile" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Button tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I enter "overview_panel_id1" details in "targetId" on "aemOverviewPanelTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter "Key inclusion & exclusion" details in "title" on "aemTileComponentDialog" screen
    And I click "showPrimaryButton" on "aemTileComponentDialog" screen
    And I click "showSecondaryButton" on "aemTileComponentDialog" screen
    And I click "showIconProduct" on "aemTileComponentDialog" screen
    And I click "iconProduct" on "aemTileComponentDialog" screen
    And I select "Alarm Clock" value for "iconProductList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I wait for "5" seconds before proceeding
    #Configure Text in 3rd overview panel Tile component
    When I click "thirdOverviewPanelTileText" on "aemOverviewPanelTileTextDialog" screen
    And I click "configureText" on "aemOverviewPanelTileTextDialog" screen
    And I click "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I enter "You can tailor your backpack by choosing from different cover list of options, so you do pay for insurance you do need." details in "editTextFiled" on "aemOverviewPanelTileTextDialog" screen
    And I click "doneButton" on "aemOverviewPanelComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOverviewPanelComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #configure button 1 - Primary no icon
    Then I click "primaryButton" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestOverviewPanelPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Primary" details in "textField" on "aemButtonComponentDialog" screen
    #And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    Then I click "secondaryButton" on "aemTestOverviewPanelPage" screen
    And I click "configureButton" on "aemTestOverviewPanelPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "/content/racv/en/home" details in "linkField" on "aemButtonComponentDialog" screen
    And I enter "Secondary" details in "textField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemTextComponentDialog" screen
    Then I take a screenshot
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-overview-panel-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "singleTileLink" on "aemTestOverviewPanelPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "singleTileLink" element exists on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on singleLink
    And I verify "data-event" attribute is "site interaction" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "on the road" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on primaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion & exclusion" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "primary" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "secondaryButtonLabel" element exists on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on secondaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion & exclusion" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "secondary" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishOverviewPanel-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Overview panel post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-overview-panel-p3.html"
    #Post publish checks
    And I wait for "singleTileLink" on "aemTestOverviewPanelPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "singleTileLink" element exists on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on singleLink
    And I verify "data-event" attribute is "site interaction" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "on the road" on "singleLink" element on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on primaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion & exclusion" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "primary" on "primaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "secondaryButtonLabel" element exists on "aemTestOverviewPanelPublished" screen
    #Verify analytics attributes on secondaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-location" attribute is "tile | key inclusion & exclusion" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I verify "data-description" attribute is "secondary" on "secondaryButtonLabel" element on "aemTestOverviewPanelPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBOverviewPanelNoCTA
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify overview panel no cta in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit&id=components-overview-panel--overview-panel-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelTextLink
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify overview panel text link in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:single-link&id=components-overview-panel--overview-panel-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelLinkList
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify overview panel link list in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:multi-link&id=components-overview-panel--overview-panel-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelWithButton
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify overview panel button in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:with-button&id=components-overview-panel--overview-panel-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelNoCTA
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify overview panel no cta (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit&id=components-overview-panel--overview-panel-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelTextLink
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify overview panel text link (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:single-link&id=components-overview-panel--overview-panel-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelLinkList
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify overview panel link list (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:multi-link&id=components-overview-panel--overview-panel-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOverviewPanelWithButton
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify overview panel button (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=Link_label:Lorem%20ipsum%20dolor%20sit;Type:with-button&id=components-overview-panel--overview-panel-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"