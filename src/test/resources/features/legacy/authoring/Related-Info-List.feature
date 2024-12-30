#Author: Sumanta Roy
#Date created - 12 July 2021
#Tests impacted by open defect https://racvone.atlassian.net/browse/DAC-9064
Feature: This feature tests the Related Information List component and it's variants from authoring regression perspective.

  #SR 12 July 2021 DAC-9004
  #Dry run completed on - 14 July 2021
  @TestRilLargeStackVariantContentHub
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Category template, add a canvas, grid and RIL Large and Stack variants using page paths, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-ril-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-1.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add Grid control component, defaults to 50:50 so nothing else to configure
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Grid Control" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add RIL large view on 1st grid
    And I wait for "parsys1Grid" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsys1Grid" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    #Configure Layout tab on 1st RIL
    And I wait for "ril1" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "ril1" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on 1st RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub Large View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on 1st RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " list 1" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/australia/adelaide-best-food-art-festivals" details in "pagePath1Field" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Add RIL large view on 2nd grid
    And I wait for "parsys2Grid" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsys2Grid" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    #Configure Layout tab on 2nd RIL
    And I wait for "ril2" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "ril2" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on 2nd RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub Stacked View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I select "Single Column" value for "stackedColumnsDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Verify fields and Update configuration tab on 2nd RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " list 2" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/living/community/a-war-of-words-letters-from-the-trenches-in-first-world-war" details in "pagePath3Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/living/community/avenues-of-honour" details in "pagePath2Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/australia/adelaide-best-food-art-festivals" details in "pagePath1Field" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "largeListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Large view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "largeListTitle" on "aemRilCompPagePublished"
    #Post publish validations for Large view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "largeCardTitle" on "aemRilCompPagePublished"
    #Defect https://racvone.atlassian.net/browse/DAC-9064
    #And I verify css attribute "font-weight" is "700" for "largeCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for Large view Description
    And I verify css attribute "color" is "rgba(102, 106, 112, 1)" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "14px" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "largeCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for Large view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "largeCardLink" on "aemRilCompPagePublished"
    And I click "largeCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/travel/australia/adelaide-best-food-art-festivals.html"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "stackedListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Post publish validations for Stacked view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "stackedListTitle" on "aemRilCompPagePublished"
    #Post publish validations for Stacked view heading of 3rd tile
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    #Defect - https://racvone.atlassian.net/browse/DAC-9064
    #And I verify css attribute "font-weight" is "600" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for Stacked view heading of 3rd tile
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "14px" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I click "stackedThirdCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/travel/australia/adelaide-best-food-art-festivals.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #SR 14 July 2021 DAC-9004
  #Dry run completed on - 15 July 2021
  @TestRilCHVariantContentHub
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Category template, add a canvas, RIL content hub variant using page path, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-ril-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-2.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add RIL content hub view on canvas
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I click "rilChView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " ch view" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/victoria" details in "pagePath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "pagePath2Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/a-war-of-words-letters-from-the-trenches-in-first-world-war" details in "pagePath3Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-2.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentHubListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content hub view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentHubListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Defect https://racvone.atlassian.net/browse/DAC-9064
    #And I verify css attribute "font-weight" is "700" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Description
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I click "contentHubSecondCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/news/community.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #SR 15 July 2021 DAC-9004
  #Dry run completed on - 16 Jul 2021
  @TestRilCHVariant2ContentHub
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Category template, add a canvas, RIL content hub variant using Custom filter, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-ril-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-3.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Add RIL content hub view on canvas
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I click "rilChView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " ch view" details in "listHeadingField" on "aemRilCompPage" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilCompPage" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilCompPage" screen
    And I click "propFilterAddFieldButton" on "aemRilCompPage" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilCompPage" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilCompPage" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I refresh the page
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-3.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentHubListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content hub view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentHubListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Defect https://racvone.atlassian.net/browse/DAC-9064
    #And I verify css attribute "font-weight" is "700" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Description
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I click "contentHubSecondCardLink" on "aemRilCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-3.html"
    And I dismiss GDPR notification if it exists
    And I wait for "loadMoreButton" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Load more button
    And I click "loadMoreButton" on "aemRilCompPagePublished" screen
    And I verify "sixthCardOnLoadmoreClick" element exists on "aemRilCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #DM 02 Jun 2022 DAC-10326
  #Dry run completed on - 02 Jun 2022
  @TestRilCTvariantContentHub
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Category template, add a canvas, RIL content Tile variant using Custom filter, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-ril-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-4.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add RIL content Tile view on canvas
    And I wait for "parsysCanvas" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "rilOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I click "rilChView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Tile View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Small Tile" value for "sizeType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "highlightCheck" element exists on "aemRilCompPage" screen
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "addGutterCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " CT view" details in "listHeadingField" on "aemRilCompPage" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilCompPage" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilCompPage" screen
    And I click "propFilterAddFieldButton" on "aemRilCompPage" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilCompPage" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilCompPage" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-4.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentTileListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content Tile view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentTileListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view heading
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view Description
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view Text Button
    And I verify css attribute "color" is "rgba(0, 172, 238, 1)" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "13px" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "600" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I click "contentTilesecondTileButton" on "aemRilCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-4.html"
    And I dismiss GDPR notification if it exists
    And I wait for "loadMoreButtonCT" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilCompPagePublished" screen
    And I verify "sixthCardOnLoadmoreClick" element exists on "aemRilCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilComponent4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #DM 02 Jun 2022 DAC-10367
  #Dry run completed on - 02 Jun 2022
  @TestRilLargeStackVariantContentHubArt
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Article template, add a canvas, grid and RIL Large and Stack variants using page paths, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub article page template
    And I click "chArticleTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-rilArt-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I enter "racv:content-hub/travel/holiday-type" details in "chPrimaryTagInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-rilart-component-1.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubArticle" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add Grid control component, defaults to 50:50 so nothing else to configure
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Grid Control" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add RIL large view on 1st grid
    And I click "parsys1GridArt" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "rilOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on 1st RIL
    And I click "ril1" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on 1st RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub Large View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on 1st RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " list 1" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/australia/adelaide-best-food-art-festivals" details in "pagePath1Field" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "ril1" to disappear on "aemRilCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Add RIL large view on 2nd grid
    And I wait for "parsysCanvas" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsys2GridArt" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "rilOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    #Configure Layout tab on 2nd RIL
    And I click "ril2" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on 2nd RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub Stacked View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I select "Single Column" value for "stackedColumnsDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    #Verify fields and Update configuration tab on 2nd RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " list 2" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/living/community/a-war-of-words-letters-from-the-trenches-in-first-world-war" details in "pagePath3Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/living/community/avenues-of-honour" details in "pagePath2Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/australia/adelaide-best-food-art-festivals" details in "pagePath1Field" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "ril2" to disappear on "aemRilCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-rilart-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "largeListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Large view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "largeListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "largeListTitle" on "aemRilCompPagePublished"
    #Post publish validations for Large view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "largeCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "largeCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for Large view Description
    And I verify css attribute "color" is "rgba(102, 106, 112, 1)" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "14px" for "largeCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "largeCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for Large view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "largeCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "largeCardLink" on "aemRilCompPagePublished"
    And I click "largeCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/travel/australia/adelaide-best-food-art-festivals.html"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-rilart-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "stackedListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Post publish validations for Stacked view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "stackedListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "stackedListTitle" on "aemRilCompPagePublished"
    #Post publish validations for Stacked view heading of 3rd tile
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "stackedThirdCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for Stacked view heading of 3rd tile
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "14px" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "stackedThirdCardLink" on "aemRilCompPagePublished"
    And I click "stackedThirdCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/travel/australia/adelaide-best-food-art-festivals.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilArtComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #DM 02 Jun 2022 DAC-10367
  #Dry run completed on - 02 Jun 2022
  @TestRilCHVariantContentHubArt
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub article template, add a canvas, RIL content hub variant using page path, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub article page template
    And I click "chArticleTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-rilArt-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I enter "racv:content-hub/travel/holiday-type" details in "chPrimaryTagInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-rilart-component-2.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubArticle" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add RIL content hub view on canvas
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "rilOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I wait for "parsysCanvas" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "rilChArtView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " ch view" details in "listHeadingField" on "aemRilCompPage" screen
    And I verify "selectionCriteriaField" element exists on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I click "addFieldButton" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/a-war-of-words-letters-from-the-trenches-in-first-world-war" details in "pagePath3Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "pagePath2Field" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/travel/victoria" details in "pagePath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "rilChArtView" to disappear on "aemRilCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-rilart-component-2.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentHubListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content hub view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentHubListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Description
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I click "contentHubSecondCardLink" on "aemRilCompPagePublished" screen
    And I check page address is "URL/royalauto/news/community.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilArtComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #DM 02 Jun 2022 DAC-10367
  #Dry run completed on - 02 Jun 2022
  @TestRilCHVariant2ContentHubArt
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub article template, add a canvas, RIL content hub variant using Custom filter, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chArticleTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-rilArt-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I enter "racv:content-hub/travel/holiday-type" details in "chPrimaryTagInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-rilart-component-3.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubArticle" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add RIL content hub view on canvas
    And I wait for "parsysCanvas" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I click "rilChArtView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Hub View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "hidePrimaryTagCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " ch view" details in "listHeadingField" on "aemRilCompPage" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilCompPage" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilCompPage" screen
    And I click "propFilterAddFieldButton" on "aemRilCompPage" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilCompPage" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilCompPage" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "rilChArtView" to disappear on "aemRilCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-rilart-component-3.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentHubListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content hub view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentHubListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentHubListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view heading
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "contentHubSecondCardTitle" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Description
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentHubSecondCardDescription" on "aemRilCompPagePublished"
    #Post publish validations for content hub view Text link
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "500" for "contentHubSecondCardLink" on "aemRilCompPagePublished"
    And I click "contentHubSecondCardLink" on "aemRilCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-rilart-component-3.html"
    And I dismiss GDPR notification if it exists
    And I wait for "loadMoreButton" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Load more button
    And I click "loadMoreButton" on "aemRilCompPagePublished" screen
    And I verify "sixthCardOnLoadmoreClick" element exists on "aemRilCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilArtComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #DM 02 Jun 2022 DAC-10367
  #Dry run completed on - 02 Jun 2022
  @TestRilCTvariantContentHubArt
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub article template, add a canvas, RIL content hub variant using CT view, Custom filter, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chArticleTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-rilArt-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I enter "racv:content-hub/travel/holiday-type" details in "chPrimaryTagInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-rilart-component-4.html"
    #Add canvas component and update to Content hub 12 col variant
    And I click "addComponentsParsysContentHubArticle" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Content Hub View" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "12" value for "gridConfiguration" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #Add RIL content Tile view on canvas
    And I wait for "parsysCanvas" on "aemRilCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "rilOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure Layout tab on RIL
    And I click "rilChArtView" on "aemRilCompPage" screen
    And I click "configureRilButton" on "aemRilCompPage" screen
    And I click "layoutRilTab" on "aemRilCompPage" screen
    #uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilCompPage" screen
    And I take a screenshot
    #Configure View tab on RIL
    And I click "viewRilTab" on "aemRilCompPage" screen
    And I select "Content Tile View" value for "selectViewType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Small Tile" value for "sizeType" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "highlightCheck" element exists on "aemRilCompPage" screen
    And I verify "ctaLabelField" field contains a value on "aemRilCompPage" screen
    And I verify "addGutterCheck" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Verify fields and Update configuration tab on RIL
    And I click "configurationRilTab" on "aemRilCompPage" screen
    And I enter " CT view" details in "listHeadingField" on "aemRilCompPage" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilCompPage" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilCompPage" screen
    And I click "listHeadingField" on "aemRilCompPage" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "maxResultsNumFieldDown" on "aemRilCompPage" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilCompPage" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilCompPage" screen
    And I click "propFilterAddFieldButton" on "aemRilCompPage" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilCompPage" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilCompPage" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "rilChArtView" to disappear on "aemRilCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-rilart-component-4.html"
    And I dismiss GDPR notification if it exists
    And I wait for "contentTileListTitle" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for content Tile view List title
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentTileListTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "contentTileListTitle" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view heading
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "contentTilesecondTileTitle" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view Description
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "contentTilesecondTileDescription" on "aemRilCompPagePublished"
    #Post publish validations for content Tile view Text Button
    And I verify css attribute "color" is "rgba(0, 172, 238, 1)" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-size" is "13px" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I verify css attribute "font-weight" is "600" for "contentTilesecondTileButton" on "aemRilCompPagePublished"
    And I click "contentTilesecondTileButton" on "aemRilCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-rilart-component-4.html"
    And I dismiss GDPR notification if it exists
    And I wait for "loadMoreButtonCT" on "aemRilCompPagePublished" screen or "10" seconds before proceeding
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilCompPagePublished" screen
    And I verify "sixthCardOnLoadmoreClick" element exists on "aemRilCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilArtComponent4PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot