#Author: Jing Zuo
#Date created - 31 May 2022
#Tests impacted by open defect https://racvone.atlassian.net/browse/DAC-10364
Feature: This feature tests the Related Information List component with standard template and its variants from authoring regression perspective.

  #Jing Zuo 31 May 2022 DAC-10364
  @TestRilLinkCardStandard
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add RIL Link Card view using page path, update configuration and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-ril-component-standard-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-standard-1.html"
    #Search and add Canvas component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "canvasOption" to disappear on "aemInsertCompDialog" screen or "10" seconds before proceeding
    #Open Side panel
    And I click "sidePanelButton" on "aemRilStandardCompPage" screen
    And I click "contentTreeButton" on "aemRilStandardCompPage" screen
    #Configure Canvas component
    And I click "canvasComponent" on "aemRilStandardCompPage" screen
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Canvas Component Configuration Tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemCanvasCompDialog" screen
    #Add Related Information List component
    And I wait for "parsysCanvas" on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilStandardCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "relatedInformationListOption" on "aemInsertCompDialog" screen using Action class
    #Configure Related Information List component
    And I click "RILComponent" on "aemRilStandardCompPage" screen
    And I take a screenshot
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemRilStandardCompDialog" screen
    #Uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure View Tab
    And I click "viewTab" on "aemRilStandardCompDialog" screen
    And I select "Link Card View" value for "selectViewType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I verify "ctaLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I verify "enableImgMobile" element exists on "aemRilStandardCompDialog" screen
    And I verify "addGutterCheck" element exists on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure Configurations Tab
    And I click "configTab" on "aemRilStandardCompDialog" screen
    And I enter " Link Card View" details in "listHeadingField" on "aemRilStandardCompDialog" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilStandardCompDialog" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilStandardCompDialog" screen
    And I click "listHeadingField" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I click "propFilterAddFieldButton" on "aemRilStandardCompDialog" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilStandardCompDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilStandardCompDialog" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilStandardCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilStandardCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilStandardCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemRilStandardCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemRilStandardCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-standard-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Link Card View List title
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "linkCardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "linkCardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "linkCardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "linkCardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "linkCardListTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Link Card View Heading
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "linkCardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "linkCardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "linkCardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "linkCardSecondTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Link Card View Description
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "linkCardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "linkCardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "linkCardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "linkCardSecondDescription" on "aemRilStandardCompPagePublished"
    #Post publish validations for Link Card redirection
    And I click "linkCardSecondTitle" on "aemRilStandardCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-standard-1.html"
    And I dismiss GDPR notification if it exists
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilStandardCompPagePublished" screen
    And I wait for "sixthLinkCardStandard" on "aemRilStandardCompPagePublished" screen or "5" seconds before proceeding
    And I verify "sixthLinkCardStandard" element exists on "aemRilStandardCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilStandard1PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #Jing Zuo 3 Jun 2022 DAC-10364
  @TestRilCardStandard
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add RIL Card view using page path, update configuration and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-ril-component-standard-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-standard-2.html"
    #Search and add Canvas component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    #Open Side panel
    And I click "sidePanelButton" on "aemRilStandardCompPage" screen
    And I click "contentTreeButton" on "aemRilStandardCompPage" screen
    #Configure Canvas component
    And I click "canvasComponent" on "aemRilStandardCompPage" screen
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Canvas Component Configuration Tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemCanvasCompDialog" screen
    #Add Related Information List component
    And I wait for "parsysCanvas" on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilStandardCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "relatedInformationListOption" on "aemInsertCompDialog" screen using Action class
    #Configure Related Information List component
    And I click "RILComponent" on "aemRilStandardCompPage" screen
    And I take a screenshot
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemRilStandardCompDialog" screen
    #Uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure View Tab
    And I click "viewTab" on "aemRilStandardCompDialog" screen
    And I select "Card View" value for "selectViewType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I verify "ctaLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I verify "addGutterCheck" element exists on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure Configurations Tab
    And I click "configTab" on "aemRilStandardCompDialog" screen
    And I enter " Card View" details in "listHeadingField" on "aemRilStandardCompDialog" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilStandardCompDialog" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilStandardCompDialog" screen
    And I click "listHeadingField" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I click "propFilterAddFieldButton" on "aemRilStandardCompDialog" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilStandardCompDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilStandardCompDialog" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilStandardCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilStandardCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilStandardCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-standard-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Card View List title
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "cardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "cardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "cardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "cardListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "cardListTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Card View Heading
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "cardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "cardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "cardSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "cardSecondTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Card View Description
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "cardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "cardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "cardSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "cardSecondDescription" on "aemRilStandardCompPagePublished"
    #Post publish validations for Card View Text Button
    And I verify css attribute "color" is "rgba(0, 172, 238, 1)" for "cardSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "cardSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "13px" for "cardSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "600" for "cardSecondTextButton" on "aemRilStandardCompPagePublished"
    And I click "cardSecondTextButton" on "aemRilStandardCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-standard-2.html"
    And I dismiss GDPR notification if it exists
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilStandardCompPagePublished" screen
    And I wait for "sixthCardStandard" on "aemRilStandardCompPagePublished" screen or "5" seconds before proceeding
    And I verify "sixthCardStandard" element exists on "aemRilStandardCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilStandard2PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #Jing Zuo 3 Jun 2022 DAC-10364
  @TestRilCTATileStandard
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add RIL CTA Tile view using page path, update configuration and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-ril-component-standard-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-standard-3.html"
    #Search and add Canvas component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    #Open Side panel
    And I click "sidePanelButton" on "aemRilStandardCompPage" screen
    And I click "contentTreeButton" on "aemRilStandardCompPage" screen
    #Configure Canvas component
    And I click "canvasComponent" on "aemRilStandardCompPage" screen
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Canvas Component Configuration Tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemCanvasCompDialog" screen
    #Add Related Information List component
    And I wait for "parsysCanvas" on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilStandardCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "relatedInformationListOption" on "aemInsertCompDialog" screen using Action class
    #Configure Related Information List component
    And I click "RILComponent" on "aemRilStandardCompPage" screen
    And I take a screenshot
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemRilStandardCompDialog" screen
    #Uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure View Tab
    And I click "viewTab" on "aemRilStandardCompDialog" screen
    And I select "Cta Tile View" value for "selectViewType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I select "Small Tile" value for "sizeType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I verify "highlightCheck" element exists on "aemRilStandardCompDialog" screen
    And I verify "addGutterCheck" element exists on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure Configurations Tab
    And I click "configTab" on "aemRilStandardCompDialog" screen
    And I enter " Cta Tile View" details in "listHeadingField" on "aemRilStandardCompDialog" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilStandardCompDialog" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilStandardCompDialog" screen
    And I click "listHeadingField" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I click "propFilterAddFieldButton" on "aemRilStandardCompDialog" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilStandardCompDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilStandardCompDialog" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilStandardCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilStandardCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilStandardCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemRilStandardCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-standard-3.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for CTA Tile View List title
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "ctaTileListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "ctaTileListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "ctaTileListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "ctaTileListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "ctaTileListTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for CTA Tile View Heading
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "ctaTileSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "ctaTileSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "ctaTileSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "ctaTileSecondTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for CTA Tile redirection
    And I click "ctaTileSecondTitle" on "aemRilStandardCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-standard-3.html"
    And I dismiss GDPR notification if it exists
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilStandardCompPagePublished" screen
    And I wait for "sixthCTATileStandard" on "aemRilStandardCompPagePublished" screen or "5" seconds before proceeding
    And I verify "sixthCTATileStandard" element exists on "aemRilStandardCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilStandard3PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #Jing Zuo 3 Jun 2022 DAC-10364
  @TestRilLinksStandard
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add RIL Links view using page path, update configuration and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-ril-component-standard-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-standard-4.html"
    #Search and add Canvas component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    #Open Side panel
    And I click "sidePanelButton" on "aemRilStandardCompPage" screen
    And I click "contentTreeButton" on "aemRilStandardCompPage" screen
    #Configure Canvas component
    And I click "canvasComponent" on "aemRilStandardCompPage" screen
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Canvas Component Configuration Tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemCanvasCompDialog" screen
    #Add Related Information List component
    And I wait for "parsysCanvas" on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilStandardCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "relatedInformationListOption" on "aemInsertCompDialog" screen using Action class
    #Configure Related Information List component
    And I click "RILComponent" on "aemRilStandardCompPage" screen
    And I take a screenshot
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemRilStandardCompDialog" screen
    #Uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure View Tab
    And I click "viewTab" on "aemRilStandardCompDialog" screen
    And I select "Links View" value for "selectViewType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Configure Configurations Tab
    And I click "configTab" on "aemRilStandardCompDialog" screen
    And I enter " Links View" details in "listHeadingField" on "aemRilStandardCompDialog" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilStandardCompDialog" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilStandardCompDialog" screen
    And I click "listHeadingField" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I click "propFilterAddFieldButton" on "aemRilStandardCompDialog" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilStandardCompDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilStandardCompDialog" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilStandardCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilStandardCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilStandardCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-standard-4.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Links View List title
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "linksListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "linksListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "linksListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "20px" for "linksListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "linksListTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Links View Heading
    And I verify css attribute "color" is "rgba(100, 104, 106, 1)" for "linksSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "linksSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "linksSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "linksSecondTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Links redirection
    And I click "linksSecondTitle" on "aemRilStandardCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-standard-4.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilStandard4PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot

  #Jing Zuo 3 June 2022 DAC-10364
  @TestRilHubStandard
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add RIL Hub view using page path, update configuration and verify published changes
    #Launch AEM
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
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-ril-component-standard-5" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-ril-component-standard-5.html"
    #Search and add Canvas component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    #Open Side panel
    And I click "sidePanelButton" on "aemRilStandardCompPage" screen
    And I click "contentTreeButton" on "aemRilStandardCompPage" screen
    #Configure Canvas component
    And I click "canvasComponent" on "aemRilStandardCompPage" screen
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Canvas Component Configuration Tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemCanvasCompDialog" screen
    #Add Related Information List component
    And I wait for "parsysCanvas" on "aemRilStandardCompPage" screen or "10" seconds before proceeding
    And I click "parsysCanvas" on "aemRilStandardCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Related Information List" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "relatedInformationListOption" on "aemInsertCompDialog" screen using Action class
    #Configure Related Information List component
    And I click "RILComponent" on "aemRilStandardCompPage" screen
    And I take a screenshot
    And I click "configureRILButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemRilStandardCompDialog" screen
    #Uncheck render as container as the grid is inside a canvas already
    And I click "renderAsContainerCheck" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure View Tab
    And I click "viewTab" on "aemRilStandardCompDialog" screen
    And I select "Hub View" value for "selectViewType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I select "Two Columns" value for "columnType" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I verify "ctaLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I verify "addGutterCheck" element exists on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Configure Configurations Tab
    And I click "configTab" on "aemRilStandardCompDialog" screen
    And I enter " Hub View" details in "listHeadingField" on "aemRilStandardCompDialog" screen
    And I select "Custom Filter" value for "selectionCriteriaField" drop down in "aemRilStandardCompDialog" screen using selection method "visibleText"
    And I click "addFieldButtonCustomFilter" on "aemRilStandardCompDialog" screen
    And I enter "/content/racv/en/home/royalauto/news/community" details in "rootPath1Field" on "aemRilStandardCompDialog" screen
    And I click "listHeadingField" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    #Decrement max results to 3
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "maxResultsNumFieldDown" on "aemRilStandardCompDialog" screen
    And I click "loadMoreRequiredCheckbox" on "aemRilStandardCompDialog" screen
    And I take a screenshot
    And I verify "loadMoreLabel" field contains a value on "aemRilStandardCompDialog" screen
    And I click "propFilterAddFieldButton" on "aemRilStandardCompDialog" screen
    And I enter "jcr:content/cq:template" details in "propName" on "aemRilStandardCompDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRilStandardCompDialog" screen
    And I select "And" value for "propFilterOpDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I verify "tagFilterField" element exists on "aemRilStandardCompPage" screen
    And I verify "tagFilterOpDropdown" element exists on "aemRilStandardCompPage" screen
    And I select "Published Date" value for "sortPropDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrderDropdown" drop down in "aemRilStandardCompPage" screen using selection method "visibleText"
    And I verify "sortCriteriaAddFieldButton" element exists on "aemRilStandardCompPage" screen
    And I verify "includeHideSiteMapCheckbox" element exists on "aemRilStandardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemRilStandardCompPage" screen
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-ril-component-standard-5.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish validations for Hub View List title
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "hubListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "hubListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "hubListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "hubListTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "700" for "hubListTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Hub View Heading
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "hubSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "hubSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-style" is "normal" for "hubSecondTitle" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "24px" for "hubSecondTitle" on "aemRilStandardCompPagePublished"
    #Post publish validations for Hub View Description
    And I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "hubSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "hubSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "hubSecondDescription" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "hubSecondDescription" on "aemRilStandardCompPagePublished"
    #Post publish validations for Hub View Text Button
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "hubSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-family" is "\"Open Sans\", sans-serif" for "hubSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-size" is "16px" for "hubSecondTextButton" on "aemRilStandardCompPagePublished"
    And I verify css attribute "font-weight" is "400" for "hubSecondTextButton" on "aemRilStandardCompPagePublished"
    And I click "hubSecondTextButton" on "aemRilStandardCompPagePublished" screen
    And I check the page address contains "/royalauto/news/community"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-ril-component-standard-5.html"
    And I dismiss GDPR notification if it exists
    #Load more button
    And I click "loadMoreButtonCT" on "aemRilStandardCompPagePublished" screen
    And I wait for "sixthHubStandard" on "aemRilStandardCompPagePublished" screen or "5" seconds before proceeding
    And I verify "sixthHubStandard" element exists on "aemRilStandardCompPagePublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRilStandard5PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I take a screenshot