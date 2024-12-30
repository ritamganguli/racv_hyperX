#Author: Viengcumm Thongvilu
#Date created - 30 Sep 2021
Feature: This feature tests the Offer Card Component and it's variants on different templates.

  #VT 4 Oct 2021 DAC-6874
  #Dry run completed on QA
  @TestOfferCard1
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add Canvas, Grid control and Offer Card component, configue, publish and verify published changes
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
    And I enter "test-automation-offer-card-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-offer-card-1.html"
    #add canvas
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Transparent" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" element exists on "aemCanvasCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemCanvasCompDialog" screen
    And I select "No Spacing" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "No Spacing" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Add Grid control component, defaults to 50:50 so nothing else to configure
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Grid Control" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add Offer Card 1 in 1st grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    #Configure Offer Card 1
    And I click "contentTreeOfferCard1" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/cape-schanck" details in "pagePath" on "aemOfferCardCompPage" screen
    And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    And I enter "cardAltText1" details in "imageAltText" on "aemOfferCardCompPage" screen
    And I click "enableCTA" on "aemOfferCardCompPage" screen
    And I enter "CTA1" details in "ctaLablel" on "aemOfferCardCompPage" screen
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
    And I navigate to "URL/utility/test-automation-offer-card-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Verify card 1
    #click banner
    And I click "card1Image" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-1.html"
    And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card1Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card1Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card1Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    And I click "card1CTA" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-1.html"
    And I dismiss GDPR notification if it exists
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestOfferCard1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 4 Oct 2021 DAC-6874
  #Dry run completed on QA
  @TestOfferCard2
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add Canvas, Grid control and 2 Offer Card component, configue, publish and verify published changes
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
    And I enter "test-automation-offer-card-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-offer-card-2.html"
    #add canvas
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Transparent" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" element exists on "aemCanvasCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemCanvasCompDialog" screen
    And I select "No Spacing" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "No Spacing" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Add Grid control component, defaults to 50:50 so nothing else to configure
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Grid Control" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add Offer Card 1 in 1st grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "offerCardOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Add Offer Card 2 on 2nd grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "offerCardOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Offer Card 1
    And I click "contentTreeOfferCard1" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/cape-schanck" details in "pagePath" on "aemOfferCardCompPage" screen
    And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    And I enter "cardAltText1" details in "imageAltText" on "aemOfferCardCompPage" screen
    And I click "enableCTA" on "aemOfferCardCompPage" screen
    And I enter "CTA1" details in "ctaLablel" on "aemOfferCardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure Offer Card 2
    And I click "contentTreeOfferCard2" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/healesville" details in "pagePath" on "aemOfferCardCompPage" screen
    And I select "Custom Selection" value for "selectionCriteria" drop down in "aemOfferCardCompPage" screen using selection method "visibleText"
    And I enter "Test Title" details in "cardTitle" on "aemOfferCardCompPage" screen
    And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/dining/cape-dessert-1600x600.jpg" details in "cardImage" on "aemOfferCardCompPage" screen
    And I enter "cardAltText2" details in "imageAltText" on "aemOfferCardCompPage" screen
    And I click "enableCTA" on "aemOfferCardCompPage" screen
    And I enter "CTA2" details in "ctaLablel" on "aemOfferCardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure card 2 RTE
    And I click "card2RTE" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I switch "to" iFrame "editRteIFrame" on "aemTestComponentPage" screen
    And I enter "Test Offer Card Text2" details in "rteComponentEditor2" on "aemOfferCardCompPage" screen
    And I switch "from" iFrame "rteComponentEditor2" on "aemOfferCardCompPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-offer-card-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Verify card 1
    #click banner
    And I click "card1Image" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-2.html"
    And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card1Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card1Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card1Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    And I click "card1CTA" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-2.html"
    And I dismiss GDPR notification if it exists
    #Verify card 2
    #click banner
    And I click "card2Image" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/healesville.html"
    And I navigate to "URL/utility/test-automation-offer-card-2.html"
    And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card2Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card2Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card2Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    And I click "card2CTA" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/healesville.html"
    And I navigate to "URL/utility/test-automation-offer-card-2.html"
    And I dismiss GDPR notification if it exists
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestOfferCard2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 4 Oct 2021 DAC-6874
  #Dry run completed on QA
  @TestOfferCard3
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add Canvas, Grid control and 3 Offer Card component, configue, publish and verify published changes
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
    And I enter "test-automation-offer-card-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-offer-card-3.html"
    #add canvas
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Transparent" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" element exists on "aemCanvasCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemCanvasCompDialog" screen
    And I select "No Spacing" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "No Spacing" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Add Grid control component
    And I click "parsysCanvas" on "aemRilCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Grid Control" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "gridControlOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "gridControlOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "contentTreeButton" on "aemGridControlCompPage" screen
    And I click "gridControlComponent" on "aemGridControlCompPage" screen
    And I click "configureButton" on "aemGridControlCompPage" screen
    And I wait for "configurationTab" on "aemGridControlCompPage" screen or "5" seconds before proceeding
    #Configuration tab
    And I click "configurationTab" on "aemGridControlCompPage" screen
    #Select variant
    And I select "Three Column [33%, 33%, 33%]" value for "columnsDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Select vertical spacing
    And I select "No spacing" value for "verticalSpacingDropdown" drop down in "aemGridControlCompPage" screen using selection method "visibleText"
    #Click on Save changes
    And I click "saveChangesButton" on "aemGridControlCompPage" screen
    And I take a screenshot
    #Add Offer Card 1 in 1st grid
    And I click "col1Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "offerCardOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Add Offer Card 2 on 2nd grid
    And I click "col2Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "offerCardOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Add Offer Card 3 on 2nd grid
    And I click "col3Parsys" on "aemGridControlCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Offer Card" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "offerCardOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "offerCardOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "offerCardOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Offer Card 1
    And I click "contentTreeOfferCard1" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/cape-schanck" details in "pagePath" on "aemOfferCardCompPage" screen
    And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    And I enter "cardAltText1" details in "imageAltText" on "aemOfferCardCompPage" screen
    And I click "enableCTA" on "aemOfferCardCompPage" screen
    And I enter "CTA1" details in "ctaLablel" on "aemOfferCardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Offer Card 2
    And I click "contentTreeOfferCard2" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/healesville" details in "pagePath" on "aemOfferCardCompPage" screen
    And I select "Custom Selection" value for "selectionCriteria" drop down in "aemOfferCardCompPage" screen using selection method "visibleText"
    And I enter "Test Title" details in "cardTitle" on "aemOfferCardCompPage" screen
    And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/cape-schanck-resort/dining/cape-dessert-1600x600.jpg" details in "cardImage" on "aemOfferCardCompPage" screen
    And I enter "cardAltText2" details in "imageAltText" on "aemOfferCardCompPage" screen
    And I click "enableCTA" on "aemOfferCardCompPage" screen
    And I enter "CTA2" details in "ctaLablel" on "aemOfferCardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure card 2 RTE
    And I click "card2RTE" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I switch "to" iFrame "editRteIFrame" on "aemTestComponentPage" screen
    And I enter "Test Offer Card Text2" details in "rteComponentEditor2" on "aemOfferCardCompPage" screen
    And I switch "from" iFrame "rteComponentEditor2" on "aemOfferCardCompPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #Configure Offer Card 3
    And I click "contentTreeOfferCard3" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/cobram" details in "pagePath" on "aemOfferCardCompPage" screen
    And I select "Custom Selection" value for "selectionCriteria" drop down in "aemOfferCardCompPage" screen using selection method "visibleText"
    And I enter "Test Title3" details in "cardTitle" on "aemOfferCardCompPage" screen
    And I enter "/content/dam/racv/images/travel-and-leisure/resorts/torquay-resort/cards/torquay-resort-600x400.png" details in "cardImage" on "aemOfferCardCompPage" screen
    And I click "cardImageResult" on "aemOfferCardCompPage" screen
    #And I click "enableImageOnDesktop" on "aemOfferCardCompPage" screen
    #And I enter "cardAltText3" details in "imageAltText" on "aemOfferCardCompPage" screen
    #And I click "enableCTA" on "aemOfferCardCompPage" screen
    #And I enter "CTA3" details in "ctaLablel" on "aemOfferCardCompPage" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure card 3 RTE
    And I click "card3RTE" on "aemOfferCardCompPage" screen
    And I click "configureButton" on "aemOfferCardCompPage" screen
    And I switch "to" iFrame "editRteIFrame" on "aemTestComponentPage" screen
    And I enter "Test Offer Card Text3" details in "rteComponentEditor3" on "aemOfferCardCompPage" screen
    And I switch "from" iFrame "rteComponentEditor3" on "aemOfferCardCompPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-offer-card-3.html"
    And I dismiss GDPR notification if it exists
    #Verify card 1
    #click banner
    And I click "card1Image" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-3.html"
    And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card1Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card1Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card1Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    And I click "card1CTA" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "travel-experiences/resorts/cape-schanck.html"
    And I navigate to "URL/utility/test-automation-offer-card-3.html"
    And I dismiss GDPR notification if it exists
    #Verify card 2
    #click banner
    And I click "card2Image" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/healesville.html"
    And I navigate to "URL/utility/test-automation-offer-card-3.html"
    And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card2Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card2Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card2Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    And I click "card2CTA" on "offerCardComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/travel-experiences/resorts/healesville.html"
    And I navigate to "URL/utility/test-automation-offer-card-3.html"
    And I dismiss GDPR notification if it exists
    #Verify card 3
    #click banner
    #And I click "card3Image" on "offerCardComponentPubPage" screen
    #And I capture the address navigated to
    #And I take a screenshot
    #And I check the page address contains "/travel-leisure/racv-resorts/our-destinations/cobram-resort.html"
    #And I navigate to "URL/utility/test-automation-offer-card-3.html"
    #And I dismiss GDPR notification if it exists
    #Verify elements
    And I click "card3Title" on "offerCardComponentPubPage" screen
    And I take a screenshot
    And I verify "card3Price" element exists on "offerCardComponentPubPage" screen
    And I verify "card3Description" element exists on "offerCardComponentPubPage" screen
    #click CTA
    #And I click "card3CTA" on "offerCardComponentPubPage" screen
    #And I capture the address navigated to
    #And I take a screenshot
    #And I check the page address contains "/travel-leisure/racv-resorts/our-destinations/cobram-resort.html"
    #And I navigate to "URL/utility/test-automation-offer-card-3.html"
    #And I dismiss GDPR notification if it exists
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestOfferCard3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot
