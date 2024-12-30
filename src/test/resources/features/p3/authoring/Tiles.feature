#Author: Viengcumm Thongvilu
Feature: This feature tests the tiles in AEM authoring and storybook

  @TestAuthoringTiles-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author tiles component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-tiles-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-tiles-RANDOM[0-8]-p3.html"
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
    #Add Tiles component into Container
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tiles config"
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Tiles" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "tilesResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "tilesResult" on "aemInsertNewComponent" screen
    And I wait for "tilesResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Tiles component
    #Configurations tab
    When I click "tilesInTree" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "layout" on "aemTilesComponentDialog" screen
    And I select "Tile" value for "layoutList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I click "columns" on "aemTilesComponentDialog" screen
    And I select "Four Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 1st Tile component in Tiles - Single link tile, no link, product tile icon theme
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 1"
    When I click "firstTile" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Single link tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_1" details in "targetId" on "aemTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter " First Tile Component" details in "title" on "aemTileComponentDialog" screen
    And I click "showIconSingleLink" on "aemTileComponentDialog" screen
    And I click "iconSingleLink" on "aemTileComponentDialog" screen
    And I select "Car" value for "iconSingleLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "iconThemeSingleLink" on "aemTileComponentDialog" screen
    And I select "Product" value for "iconThemeSingleLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 2nd Tile component in Tiles - Single link tile, arrow link icon, information tile icon theme
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 2"
    When I click "secondTile" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Single link tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_2" details in "targetId" on "aemTileComponentDialog" screen
    And I enter "/content/racv/en/home/in-your-home" details in "link" on "aemTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter " Second Tile Component" details in "title" on "aemTileComponentDialog" screen
    And I click "linkIcon" on "aemTileComponentDialog" screen
    And I select "Arrow" value for "linkIconList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I enter "In your home" details in "linkLabel" on "aemTileComponentDialog" screen
    And I click "showIconSingleLink" on "aemTileComponentDialog" screen
    And I click "iconSingleLink" on "aemTileComponentDialog" screen
    And I select "Balcony" value for "iconSingleLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "iconThemeSingleLink" on "aemTileComponentDialog" screen
    And I select "Information" value for "iconThemeSingleLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 3rd Tile component in Tiles - Multi link tile, benefits tile icon theme
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 3"
    When I click "thirdTile" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Multi link tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_3" details in "targetId" on "aemTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter "Tile Title Third Tile Component" details in "title" on "aemTileComponentDialog" screen
    And I click "showIconMultiLink" on "aemTileComponentDialog" screen
    And I click "iconMultiLink" on "aemTileComponentDialog" screen
    And I select "Clock" value for "iconMultiLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "iconThemeMultiLink" on "aemTileComponentDialog" screen
    And I select "Benefits" value for "iconThemeMultiLinkList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 4th Tile component in Tiles - Button tile
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 4"
    When I click "fourthTile" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "tileLayout" on "aemTileComponentDialog" screen
    And I select "Button tile" value for "tileLayoutList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_4" details in "targetId" on "aemTileComponentDialog" screen
    And I click "title" on "aemTileComponentDialog" screen
    And I enter "Tile Title Fourth Tile Component" details in "title" on "aemTileComponentDialog" screen
    And I click "showPrimaryButton" on "aemTileComponentDialog" screen
    And I click "showSecondaryButton" on "aemTileComponentDialog" screen
    And I click "showIconProduct" on "aemTileComponentDialog" screen
    And I click "iconProduct" on "aemTileComponentDialog" screen
    And I select "Alarm Clock" value for "iconProductList" drop down in "aemTileComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in 1st Tile component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text config"
    When I click "textInFirstTile" on "aemTestTilesPage" screen
    And I click "editButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I enter "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old." details using Action class
    And I click "textSaveIcon" on "aemTestTilesPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTilesPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 2nd Tile component
    When I click "textInSecondTile" on "aemTestTilesPage" screen
    And I click "editButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I enter "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. " details using Action class
    And I click "textSaveIcon" on "aemTestTilesPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTilesPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 3rd Tile component
    When I click "textInThirdTile" on "aemTestTilesPage" screen
    And I click "editButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I enter "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable." details using Action class
    And I click "textSaveIcon" on "aemTestTilesPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTilesPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 4th Tile component
    When I click "textInFourthTile" on "aemTestTilesPage" screen
    And I click "editButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I enter "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet." details using Action class
    And I click "textSaveIcon" on "aemTestTilesPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestTilesPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 3 link list config"
    #Configure Link List in 3rd Tile component
    When I click "linkListInTree" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/insurance" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Child pages" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "increaseChildDepth" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/insurance" details in "parentPageInChild" on "aemLinkListComponentDialog" screen
    And I click "iconTypeInChild" on "aemLinkListComponentDialog" screen
    And I select "Arrow" value for "iconTypeListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "orderByInChild" on "aemLinkListComponentDialog" screen
    And I select "Page Order" value for "orderByListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Buttons in 4th Tile component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 4 buttons"
    #configure button 1 - Primary no icon
    Then I click "button1Component" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    #And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I wait for "autoCompleteResult1" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #configure button 2 - Secondary icon before text
    Then I click "button2Component" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "autoCompleteResult1" on "aemEditorPage" screen or "5" seconds before proceeding
    And I enter "keys:TAB" details in "linkField" on "aemButtonComponentDialog" screen
    And I enter "Button 2" details in "textField" on "aemButtonComponentDialog" screen
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
    #Add Separator
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "separator" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "separatorResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Copy paste"
    #Copy and paste 2nd Tiles component
    When I click "tilesInTree" on "aemTestTilesPage" screen
    Then I click "copyButton" on "aemTestTilesPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    #Add Separator
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "separator" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "separatorResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    #Copy and paste 3rd Tiles component
    When I click "tilesInTree" on "aemTestTilesPage" screen
    Then I click "copyButton" on "aemTestTilesPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    #Add Separator
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "separator" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "separatorResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    #Copy and paste 4th Tiles component
    When I click "tilesInTree" on "aemTestTilesPage" screen
    Then I click "copyButton" on "aemTestTilesPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 2nd Tiles component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tiles config"
    #Configurations tab
    When I click "secondTilesInTree" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "Three Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 3rd Tiles component
    #Configurations tab
    When I click "thirdTilesInTree" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "Two Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 4th Tiles component
    #Configurations tab
    When I click "fourthTilesInTree" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "One Column" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 1st Tile component in 2nd Tiles
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 2 config"
    When I click "firstTileInTiles2" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_5" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile component in 2nd Tiles
    When I click "secondTileInTiles2" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_6" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 3rd Tile component in 2nd Tiles
    When I click "thirdTileInTiles2" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_7" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Tile component in 2nd Tiles
    When I click "fourthTileInTiles2" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_8" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile component in 3rd Tiles
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 3 config"
    When I click "firstTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_9" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile component in 3rd Tiles
    When I click "secondTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_10" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 3rd Tile component in 3rd Tiles
    When I click "thirdTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_11" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Tile component in 3rd Tiles
    When I click "fourthTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_12" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile component in 4th Tiles
    ###############
    ## NODE
    ###############
    And I create a new test log node "Tile 4 config"
    When I click "firstTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_13" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile component in 4th Tiles
    When I click "secondTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_14" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 3rd Tile component in 4th Tiles
    When I click "thirdTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_15" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Tile component in 4th Tiles
    When I click "fourthTileInTiles3" on "aemTestTilesPage" screen
    And I click "configureButton" on "aemTestTilesPage" screen
    And I take a screenshot
    Then I click "targetId" on "aemTileComponentDialog" screen
    And I clear contents of "targetId" element on "aemTileComponentDialog" screen
    And I enter "container_tiles_tile_16" details in "targetId" on "aemTileComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-tiles-RANDOM[0-8]-p3.html"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "singleLink" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on singleLink
    And I verify "data-event" attribute is "site interaction" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title second tile component" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "in your home" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "linkInMultiLinks" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on linkInMultiLinks
    And I verify "data-event" attribute is "site interaction" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "links" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title third tile component" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "car insurance" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "primaryButtonLabel" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on primaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title fourth tile component" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "button 1" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "secondaryButtonLabel" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on secondaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title fourth tile component" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "button 2" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishTiles-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Tiles post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-tiles-p3.html"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "singleLink" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on singleLink
    And I verify "data-event" attribute is "site interaction" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title second tile component" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "in your home" on "singleLink" element on "aemTestTilesPublished" screen
    And I verify "linkInMultiLinks" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on linkInMultiLinks
    And I verify "data-event" attribute is "site interaction" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "links" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title third tile component" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "car insurance" on "linkInMultiLinks" element on "aemTestTilesPublished" screen
    And I verify "primaryButtonLabel" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on primaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title fourth tile component" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "button 1" on "primaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "secondaryButtonLabel" element exists on "aemTestTilesPublished" screen
    #Verify analytics attributes on secondaryButtonLabel
    And I verify "data-event" attribute is "site interaction" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-location" attribute is "tile | tile title fourth tile component" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I verify "data-description" attribute is "button 2" on "secondaryButtonLabel" element on "aemTestTilesPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBTilesPage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify tiles page in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--tiles-page&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentNoIcon
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify content tiles no icon in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--content-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentIllustrative
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify content tiles Illustrative in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--content-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentProduct
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify content tiles Product in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--content-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentInformation
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify content tiles Information in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:info&id=components-tile--content-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentBenefit
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify content tiles Benefit in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--content-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkNoIcon
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify single link tiles no icon in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--single-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkIllustrative
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify single link tiles Illustrative in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--single-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkProduct
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify single link tiles Product in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--single-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkInformation
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify single link tiles Information in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--single-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkBenefit
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify single link tiles Benefit in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--single-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkNoIcon
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Multi link tiles no icon in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--multi-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkIllustrative
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Multi link tiles Illustrative in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--multi-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkProduct
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Multi link tiles Product in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--multi-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkInformation
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Multi link tiles Information in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--multi-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkBenefit
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Multi link tiles Benefit in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--multi-link-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesProductActionPrimary
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action tile with primary button in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--product-action-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesProductActionPrimaryandSecondary
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action tile with primary and secondary button in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=priAndSec:primaryAndSec&id=components-tile--product-action-tile&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesPage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify tiles page (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--tiles-page&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentNoIcon
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify content tiles no icon (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--content-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentIllustrative
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify content tiles Illustrative (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--content-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentProduct
  @Storybook-regression-p3.chrome.desktopv
  Scenario: Verify content tiles Product (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--content-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentInformation
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify content tiles Information (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:info&id=components-tile--content-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesContentBenefit
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify content tiles Benefit (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--content-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkNoIcon
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify single link tiles no icon (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--single-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkIllustrative
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify single link tiles Illustrative (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--single-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkProduct
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify single link tiles Product (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--single-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkInformation
  @Storybook-regression-p3.chrome.desktopv
  Scenario: Verify single link tiles Information (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--single-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesSingleLinkBenefit
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify single link tiles Benefit (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--single-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkNoIcon
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Multi link tiles no icon (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--multi-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkIllustrative
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Multi link tiles Illustrative (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:illustrative&id=components-tile--multi-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkProduct
  @Storybook-regression-p3.chrome.desktopv
  Scenario: Verify Multi link tiles Product (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--multi-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkInformation
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Multi link tiles Information (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:product&id=components-tile--multi-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesMultiLinkBenefit
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Multi link tiles Benefit (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=IconType:benefit&id=components-tile--multi-link-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesProductActionPrimary
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action tile with primary button (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-tile--product-action-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTilesProductActionPrimaryandSecondary
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action tile with primary and secondary button (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=priAndSec:primaryAndSec&id=components-tile--product-action-tile&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"