#Author: Sumanta Roy
#Date created -3 Sep 2020
Feature: This feature tests the Tiles component and it's layouts for Card variants from authoring regression perspective.

  #SR 3 Sep 2020 AEMU-842
  #Dry run completed in QA without delete step on 8 Sep 2020
  @TestTilesComponentTwoColsVariantWithDefaultLinkCard
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 50:50 variant, update configuration to have a Default and a Link Card and verify published changes
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
    And I enter "test-automation-card-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-card-component-1.html"
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
    And I select "Cards" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (50:50)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile with Default Card
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Default Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-default-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge7.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Default-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobile" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge7.jpg" details in "altImageDesktop" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "DefaultCardCta" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "DefaultCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile with Link Card
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    #same identifier for second card hence configureSecondTileComponent is used
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Link Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-link-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge7.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I enter "Link-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    #And I click "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge7.jpg" details in "altImageDesktopLinkCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-card-component-1.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Default card
    And I verify "defaultCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "defaultCardTitle" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-1.html"
    And I dismiss GDPR notification if it exists
    And I click "defaultCardCta" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-1.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Link card
    And I verify "linkCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "linkCardImageAlt" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-1.html"
    And I dismiss GDPR notification if it exists
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCardComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 8 Sep 2020 AEMU-842
  #Dry run completed in QA without delete step on 8 Sep 2020
  @TestTilesComponentTwoColsVariantWithHubCard
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 50:50 variant, update configuration to have a Hub and a Hub Card with theme and verify published changes
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
    And I enter "test-automation-card-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-card-component-2.html"
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
    And I select "Cards" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (50:50)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile with Hub Card
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Hub Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-default-hub-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Default-hub-1-image" details in "altText" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletHubCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileHubCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "HubCardCtaLabel" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "HubCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I click "hubCardSelectArticleCategoryBtn" on "aemCardCompDialog" screen
    And I click "hubCardDiscountCategoryBtn" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "hubCardDiscountCategoryConfirmBtn" on "aemCardCompDialog" screen
    And I wait for "hubCardDiscountCategoryTag" on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I verify "hubCardDiscountCategoryTag" element exists on "aemCardCompDialog" screen
    #Increment twice and decrement once
    And I click "hubCardIncrementReadTimeBtn" on "aemCardCompDialog" screen
    And I click "hubCardIncrementReadTimeBtn" on "aemCardCompDialog" screen
    And I click "hubCardDecrementReadTimeBtn" on "aemCardCompDialog" screen
    And I take a screenshot
    #Theme tab
    And I click "themesTab" on "aemCardCompDialog" screen
    And I select "Default" value for "themeDropdown" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile with Hub Card Blue theme
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Hub Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-blue-hub-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Blue-hub-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletHubCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileHubCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaLabel" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Theme tab - select blue
    And I click "themesTab" on "aemCardCompDialog" screen
    And I select "Blue" value for "themeDropdown" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-card-component-2.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Hub card default
    And I verify "hubDefaultCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardTitle" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardCategory" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardCategoryReadUnit" element exists on "aemCardsCompPagePublished" screen
    And I click "hubDefaultCardCta1" on "aemCardsCompPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/"
    And I navigate to "URL/utility/test-automation-card-component-2.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Hub card blue
    And I verify "hubBlueCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubBlueCardTitle" element exists on "aemCardsCompPagePublished" screen
    And I click "hubBlueCardCta1" on "aemCardsCompPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCardComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 9 Sep 2020 AEMU-1030
  #Dry run completed in QA without delete step on 9 Sep 2020
  #Open defect for image  - DAC-6276
  @TestTilesComponentTwoColsVariantWithHubDefaultCard
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 30:70 variant, update configuration to have a Hub and a Default card verify published changes
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
    And I enter "test-automation-card-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-card-component-3.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Cards" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (30:70)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile with Hub Card
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Hub Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-default-hub-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Default-hub-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletHubCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileHubCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "HubCardCtaLabel" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "HubCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I click "hubCardSelectArticleCategoryBtn" on "aemCardCompDialog" screen
    And I click "hubCardDiscountCategoryBtn" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "hubCardDiscountCategoryConfirmBtn" on "aemCardCompDialog" screen
    And I wait for "hubCardDiscountCategoryTag" on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I verify "hubCardDiscountCategoryTag" element exists on "aemCardCompDialog" screen
    #Increment twice and decrement once
    And I click "hubCardIncrementReadTimeBtn" on "aemCardCompDialog" screen
    And I click "hubCardIncrementReadTimeBtn" on "aemCardCompDialog" screen
    And I click "hubCardDecrementReadTimeBtn" on "aemCardCompDialog" screen
    And I take a screenshot
    #Theme tab
    And I click "themesTab" on "aemCardCompDialog" screen
    And I select "Default" value for "themeDropdown" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile with Default card
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Default Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-default-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/weddings/1200 x 388 Cape Schanck wedding reception.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "Default-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobile" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/weddings/1200 x 388 Cape Schanck wedding reception.jpg" details in "altImageDesktop" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "DefaultCardCta" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "DefaultCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-card-component-3.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Hub card
    And I verify "hubDefaultCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardTitle" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardCategory" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubDefaultCardCategoryReadUnit" element exists on "aemCardsCompPagePublished" screen
    And I click "hubDefaultCardCta1" on "aemCardsCompPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/"
    And I navigate to "URL/utility/test-automation-card-component-3.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Default card
    And I verify "defaultCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "defaultCardTitle" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-3.html"
    And I dismiss GDPR notification if it exists
    And I click "defaultCardCta" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCardComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 9 Sep 2020 AEMU-1030
  #Dry run completed in QA without delete step on 9 Sep 2020
  @TestTilesComponentTwoColsVariantWithLinkHubCard
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component two columns 70:30 variant, update configuration to have a Link and a Hub Card and verify published changes
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
    And I enter "test-automation-card-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-card-component-4.html"
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
    And I select "Cards" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Two Columns (70:30)" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile with Link Card
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Link Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-link-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/weddings/1200 x 388 Cape Schanck wedding reception.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I enter "Link-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    #And I click "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/weddings/1200 x 388 Cape Schanck wedding reception.jpg" details in "altImageDesktopLinkCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile with Hub Card Blue theme
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Hub Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-blue-hub-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge7.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Blue-hub-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletHubCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileHubCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaLabel" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Theme tab - select blue
    And I click "themesTab" on "aemCardCompDialog" screen
    And I select "Blue" value for "themeDropdown" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-card-component-4.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Link card
    And I verify "linkCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "linkCardImageAlt" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-4.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Hub card blue
    And I verify "hubBlueCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubBlueCardTitle" element exists on "aemCardsCompPagePublished" screen
    And I click "hubBlueCardCta1" on "aemCardsCompPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCardComponent4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 10 Sep 2020 AEMU-1030
  #Dry run completed in QA without delete step on 10 Sep 2020
  @TestTilesComponentThreeColsVariantWithLinkHubDefaultCard
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add a Tiles component three columns 33:33:33 variant, update configuration to have a Link, Hub and Default Card and verify published changes
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
    And I enter "test-automation-card-component-5" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-card-component-5.html"
    #Add Tiles component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tiles component
    And I enter "Tiles" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tilesOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tilesOption" on "aemInsertCompDialog" screen using Action class
    #Select tile layout
    And I click "sidePanelButton" on "aemTilesCompPage" screen
    And I click "contentTreeButton" on "aemTilesCompPage" screen
    And I click "tilesComponent" on "aemTilesCompPage" screen
    And I click "configureTilesButton" on "aemTilesCompPage" screen
    #Configure Tiles Metadata Tab
    And I click "tilesMetadataTab" on "aemTilesCompDialog" screen
    And I select "Cards" value for "tileLayoutDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I select "Three Columns" value for "tileLayoutColumnsDropdown" drop down in "aemTilesCompDialog" screen using selection method "visibleText"
    And I click "addFieldButton" on "aemTilesCompDialog" screen
    And I click "addGutterCheckbox" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Tiles Layout Tab
    And I click "tilesLayoutTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Take snap of Adaptive Show/Hide tab
    And I click "tilesAdaptShowHideTab" on "aemTilesCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 1st Tile with Link Card
    And I click "firstTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureFirstTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Link Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-link-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I enter "Link-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    #And I click "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileLinkCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "altImageDesktopLinkCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    #Configure 2nd Tile with Hub Card Blue theme
    And I click "secondTileComponent" on "aemTilesCompPage" screen
    #same identifier for first card hence configureFirstTileComponent is used
    And I click "configureSecondTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemCardCompDialog" screen
    And I select "Hub Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "-blue-hub-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Blue-hub-1-image" details in "altText" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTabletHubCard" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobileHubCard" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaLabel" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "HubBlueCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Theme tab - select blue
    And I click "themesTab" on "aemCardCompDialog" screen
    And I select "Blue" value for "themeDropdown" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 3rd Default Card
    #same identifier for first card hence configureThirdTileComponent is used
    And I click "thirdTileComponent" on "aemTilesCompPage" screen
    And I click "configureThirdTileComponent" on "aemTilesCompPage" screen
    And I click "configurationsTab" on "aemTileCompDialog" screen
    And I select "Default Card" value for "cardLayout" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I select "h3" value for "headingLevel" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    And I enter "Heading-default-tile-1" details in "headingTitle" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "cardImage" on "aemCardCompDialog" screen
    And I click "altText" on "aemCardCompDialog" screen
    And I enter "Default-tile-1-image" details in "altText" on "aemCardCompDialog" screen
    And I click "enableImageMobileCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageTablet" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/FIamge3.jpg" details in "altImageMobile" on "aemCardCompDialog" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/HeaderFBatCityClub.jpg" details in "altImageDesktop" on "aemCardCompDialog" screen
    And I take a screenshot
    And I click "enableCtaCheckbox" on "aemCardCompDialog" screen
    And I enter "/content/racv/en/home" details in "ctaLink" on "aemCardCompDialog" screen
    And I enter "DefaultCardCta" details in "ctaLabel" on "aemCardCompDialog" screen
    And I enter "DefaultCardCtaId" details in "ctaId" on "aemCardCompDialog" screen
    And I verify "analyticsUrl" element exists on "aemCardCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemCardCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-card-component-5.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publishing validations - Link card
    And I verify "linkCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "linkCardImageAlt" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-5.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Hub card blue
    And I verify "hubBlueCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I verify "hubBlueCardTitle" element exists on "aemCardsCompPagePublished" screen
    And I click "hubBlueCardCta1" on "aemCardsCompPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/"
    And I navigate to "URL/utility/test-automation-card-component-5.html"
    And I dismiss GDPR notification if it exists
    #Post publishing validations - Default card
    And I verify "defaultCardImageAlt" element exists on "aemCardsCompPagePublished" screen
    And I click "defaultCardTitle" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-card-component-5.html"
    And I dismiss GDPR notification if it exists
    And I click "defaultCardCta" on "aemCardsCompPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCardComponent5PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot