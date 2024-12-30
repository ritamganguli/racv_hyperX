#Author: Sumanta Roy
#Date created - 24 Aug 2020
Feature: This feature tests the Tiles component and it's layouts for Tile variants from authoring regression perspective.

  #SR 24 Aug 2020 AEMU-842
  #Dry run completed in QA on 26 Aug 2020
  #SR 11 Feb 2021 - DAC-6975 - Added check for layout tab for tiles
  @TestTilesComponentTwoColsVariantWithContentPriceTile
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 50:50 variant, update configuration to have a Content and a Price tile and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tile-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tile-component-1.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Tiles" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (50:50)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    #And I enter "-test" details in "tile1Name" on "aemTilesCompDialog" screen
    And I verify "tile1Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile2Name" on "aemTilesCompDialog" screen
    And I verify "tile2Name" element exists on "aemTilesCompDialog" screen
    And I click "addFieldButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "deleteField3Button" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Configure Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I verify "targetDivField" element exists on "aemTilesCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemTilesCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Content Tile
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Content Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Medium Tile" value for "tileSizeDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Yellow" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I click "forceDesktopDesignCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Content-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/royalauto" details in "ctaLink1" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId1" details in "ctaId1" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel1" details in "ctaLabel1" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam1" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode1" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    #And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Price Tile
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Price Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Default (no highlight)" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Price-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "PriceCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "PriceCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I take a screenshot
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "$220" details in "priceText" on "aemTileCompDialog" screen
    And I enter "Discounted Price" details in "priceLabelText" on "aemTileCompDialog" screen
    And I select "Right" value for "ctaButtonPosition" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-tile-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Content Tile
    Then I verify "contentTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I click "contentTileCTA1" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-1.html"
    And I dismiss GDPR notification if it exists
    And I click "contentTileCTA2" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-1.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Price Tile
    And I click "priceTileTitle" on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I verify "priceTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceSubTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I click "ctaPriceTile" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-1.html"
    And I dismiss GDPR notification if it exists
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTileComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 1 Sep 2020 AEMU-842
  #Dry run completed in QA on 1 Sep 2020
  #SR 11 Feb 2021 - DAC-6975 - Added check for layout tab for tiles
  @TestTilesComponentTwoCols3070VariantWithContentLinkTile
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 30:70 variant, update configuration to have a Content and a Link tile and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tile-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tile-component-2.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Tiles" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (30:70)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    #And I enter "-test" details in "tile1Name" on "aemTilesCompDialog" screen
    And I verify "tile1Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile2Name" on "aemTilesCompDialog" screen
    And I verify "tile2Name" element exists on "aemTilesCompDialog" screen
    And I click "addFieldButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "deleteField3Button" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Configure Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I verify "targetDivField" element exists on "aemTilesCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemTilesCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Content Tile
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Content Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Medium Tile" value for "tileSizeDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Yellow" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I click "forceDesktopDesignCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Content-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/royalauto" details in "ctaLink1" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId1" details in "ctaId1" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel1" details in "ctaLabel1" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam1" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode1" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    #And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Link tile
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Link Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "LinkTile1" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "LinkTile1Id" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "LinkTile1Label" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-tile-component-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Content Tile
    Then I verify "contentTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I click "contentTileCTA1" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-2.html"
    And I dismiss GDPR notification if it exists
    And I click "contentTileCTA2" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-2.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Link Tile
    And I click "linkTileTitle" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTileComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 1 Sep 2020 AEMU-842
  #Dry run completed in QA on 1 Sep 2020
  #SR 11 Feb 2021 - DAC-6975 - Added check for layout tab for tiles
  @TestTilesComponentTwoCols7030VariantWithPriceLinkTile
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 70:30 variant, update configuration to have a Price and a Link tile and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tile-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tile-component-3.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Tiles" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (70:30)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    #And I enter "-test" details in "tile1Name" on "aemTilesCompDialog" screen
    And I verify "tile1Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile2Name" on "aemTilesCompDialog" screen
    And I verify "tile2Name" element exists on "aemTilesCompDialog" screen
    And I click "addFieldButton" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "deleteField3Button" on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Configure Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I verify "targetDivField" element exists on "aemTilesCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemTilesCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Price Tile
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Price Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Default (no highlight)" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Price-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "PriceCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "PriceCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I take a screenshot
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "$220" details in "priceText" on "aemTileCompDialog" screen
    And I enter "Discounted Price" details in "priceLabelText" on "aemTileCompDialog" screen
    And I select "Right" value for "ctaButtonPosition" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Link tile
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Link Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "LinkTile1" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "LinkTile1Id" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "LinkTile1Label" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-tile-component-3.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Price Tile
    And I click "priceTileTitle" on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I verify "priceTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceSubTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I click "ctaPriceTile" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-3.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Link Tile
    And I click "linkTileTitle" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTileComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 1 Sep 2020 AEMU-842
  #Dry run completed in QA on 1 Sep 2020
  #SR 11 Feb 2021 - DAC-6975 - Added check for layout tab for tiles
  @TestTilesComponentThreeColsVariantWithPriceLinkContentTile
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component three columns 33:33:33 variant, update configuration to have a Price, Link and Content tile and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tile-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tile-component-4.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Tiles" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Three Columns" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addFieldButton" on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile1Name" on "aemTilesCompDialog" screen
    And I verify "tile1Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile2Name" on "aemTilesCompDialog" screen
    And I verify "tile2Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile3Name" on "aemTilesCompDialog" screen
    And I verify "tile3Name" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Configure Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I verify "targetDivField" element exists on "aemTilesCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemTilesCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Price Tile
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Price Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Default (no highlight)" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Price-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "PriceCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "PriceCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I take a screenshot
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "$220" details in "priceText" on "aemTileCompDialog" screen
    And I enter "Discounted Price" details in "priceLabelText" on "aemTileCompDialog" screen
    And I select "Right" value for "ctaButtonPosition" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Link tile
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Link Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "LinkTile1" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I enter "LinkTile1Id" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "LinkTile1Label" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    #And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 3rd Content tile
    And I click "thirdTileComponent" on "aemTilesCompPage" screen
    And I click "configureThirdTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Content Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Medium Tile" value for "tileSizeDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I select "Yellow" value for "tileHighlightDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "tileStarredCheckbox" on "aemTileCompDialog" screen
    And I click "enableCtaCheckbox" on "aemTileCompDialog" screen
    And I click "forceDesktopDesignCheckbox" on "aemTileCompDialog" screen
    And I select "h3" value for "headingLevelDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Content-Tile-Title" details in "tileTitle" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId" details in "ctaId" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel" details in "ctaLabel" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/royalauto" details in "ctaLink1" on "aemTileCompDialog" screen
    And I take a screenshot
    And I enter "ContentCTAId1" details in "ctaId1" on "aemTileCompDialog" screen
    And I enter "ContentCTALabel1" details in "ctaLabel1" on "aemTileCompDialog" screen
    And I verify "analyticsUrlParam1" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "openingMode1" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I click "showIconCheckbox" on "aemTileCompDialog" screen
    And I select "Arrow Down" value for "tileIconDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    #And I select "Default (Grey Base)" value for "tileIconColorDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTileCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-tile-component-4.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Price Tile
    And I click "priceTileTitle" on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I verify "priceTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I verify "priceSubTextPriceTile" element exists on "aemTilesCompPagePublished" screen
    And I click "ctaPriceTile" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-4.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Link Tile
    And I click "linkTileTitle" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-4.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Content Tile
    Then I verify "contentTileTitle" element exists on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I click "contentTileCTA1" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-4.html"
    And I dismiss GDPR notification if it exists
    And I click "contentTileCTA2" on "aemTilesCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/royalauto.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTileComponent4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 3 Sep 2020 - Dev completed. Dry run completed except for delete step, due to defect AEMU-944
  #SR 11 Feb 2021 - DAC-6975 - Added check for layout tab for tiles
  @TestTilesComponentTwoColsVariantWithMultiLinkTile
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 50:50 variant, update configuration to have a Multi link tile and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tile-component-5" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tile-component-5.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Tiles" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (50:50)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    #And I enter "-test" details in "tile1Name" on "aemTilesCompDialog" screen
    And I verify "tile1Name" element exists on "aemTilesCompDialog" screen
    #And I enter "-test" details in "tile2Name" on "aemTilesCompDialog" screen
    And I verify "tile2Name" element exists on "aemTilesCompDialog" screen
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Configure Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I verify "targetDivField" element exists on "aemTilesCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemTilesCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemTilesCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Multi Link Tile
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Multi Link Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Multi link tile 1 title" details in "multiLinkTitle" on "aemTileCompDialog" screen
    #add first link
    And I click "multiLinkAddFieldButton" on "aemTileCompDialog" screen
    And I enter "CTA Label0" details in "ctaLabel" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "multiLinkCtaLink" on "aemTileCompDialog" screen
    And I enter "CTA Id" details in "multiLinkCtaId" on "aemTileCompDialog" screen
    And I verify "multiLinkAnalyticsUrl" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "multiLinkCtaOpeningMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #add second link
    And I click "multiLinkAddFieldButton" on "aemTileCompDialog" screen
    And I enter "CTA Label1" details in "multiLinkCtaLabel1" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "multiLinkCtaLink1" on "aemTileCompDialog" screen
    And I enter "CTA Id1" details in "multiLinkCtaId1" on "aemTileCompDialog" screen
    And I verify "multiLinkAnalyticsUrl1" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "multiLinkCta1OpeningMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 2nd Multi Link Tile
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Multi Link Tile" value for "tileLayoutDropdown" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I enter "Multi link tile 2 title" details in "multiLinkTitle" on "aemTileCompDialog" screen
    #add first link
    And I click "multiLinkAddFieldButton" on "aemTileCompDialog" screen
    And I enter "CTA Label2" details in "ctaLabel" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home" details in "multiLinkCtaLink" on "aemTileCompDialog" screen
    And I enter "CTA Id2" details in "multiLinkCtaId" on "aemTileCompDialog" screen
    And I verify "multiLinkAnalyticsUrl" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "multiLinkCtaOpeningMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #add second link
    And I click "multiLinkAddFieldButton" on "aemTileCompDialog" screen
    And I enter "CTA Label3" details in "multiLinkCtaLabel1" on "aemTileCompDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "multiLinkCtaLink1" on "aemTileCompDialog" screen
    And I enter "CTA Id3" details in "multiLinkCtaId1" on "aemTileCompDialog" screen
    And I verify "multiLinkAnalyticsUrl1" element exists on "aemTileCompDialog" screen
    And I select "Same Tab" value for "multiLinkCta1OpeningMode" drop down in "aemTileCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #layout tab
    And I click "layoutTabLink" on "aemTileCompDialog" screen
    And I verify "targetDivId" element exists on "aemTileCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-tile-component-5.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Multi link Tile 1
    And I click "multiLinkTileTitle1" on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I click "multiLinkTileLink0" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-5.html"
    And I dismiss GDPR notification if it exists
    And I click "multiLinkTileLink1" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-5.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Multi link Tile 2
    And I click "multiLinkTileTitle2" on "aemTilesCompPagePublished" screen
    And I take a screenshot
    And I click "multiLinkTileLink2" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tile-component-5.html"
    And I dismiss GDPR notification if it exists
    And I click "multiLinkTileLink3" on "aemTilesCompPagePublished" screen
    And I check page address is "URL/royalauto.html"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTileComponent5PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot