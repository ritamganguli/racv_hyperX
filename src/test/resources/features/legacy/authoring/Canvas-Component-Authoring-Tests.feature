#Author: Sumanta Roy
#Date created -15 Sep 2020
Feature: This feature tests the Canvas component and it's variants from authoring regression perspective.

  #SR 15 Sep 2020 AEMU-964
  #Dry run completed in QA without delete step on 15 Sep 2020
  #SR 25 Mar 21 - Updated locator for canvas and color code for Blue variant
  @TestCanvasComponentVariants
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add Canvas component, update Background and Layout type as White-default, Blue-article container, Transparent-article content container and verify published changes
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
    And I enter "test-automation-canvas-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-canvas-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    #Configuration tab - White-default
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I click "centerAlignCheckbox" on "aemCanvasCompDialog" screen
    And I click "reduceContainerWidthCheckbox" on "aemCanvasCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" element exists on "aemCanvasCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemCanvasCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-canvas-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasWhiteDefaultPublished" element exists on "aemCanvasCompPublished" screen
    And I verify css attribute "background-color" is "rgba(255, 255, 255, 1)" for "canvasWhiteDefaultPublished" on "aemCanvasCompPublished"
    #Update to Blue-article container
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-canvas-component-1.html"
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Blue" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Article Container" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-canvas-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasBlueArticleContainerPublished" element exists on "aemCanvasCompPublished" screen
    And I verify css attribute "background-color" is "rgba(31, 90, 165, 1)" for "canvasBlueArticleContainerPublished" on "aemCanvasCompPublished"
    #Update to Transperant-article content container
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-canvas-component-1.html"
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Transparent" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Article Content Container" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-canvas-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasTransperantArticleContentContainerPublished" element exists on "aemCanvasCompPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestCanvasComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 01 Apr 2021
  #Dry run completed in QA 06 Apr 2021
  @TestClubCanvasComponentVariant
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create club new page, add Canvas component, update Background and Layout type as White-default, Blue-article container, Transparent-article content container and verify published changes
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/travel-leisure/racv-club/footer"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select club page template
    And I click "clubbasePageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-club-canvas-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    #Configuration tab - White-default
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "White" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Default" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I click "centerAlignCheckbox" on "aemCanvasCompDialog" screen
    And I click "reduceContainerWidthCheckbox" on "aemCanvasCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" element exists on "aemCanvasCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemCanvasCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasWhiteDefaultPublished" element exists on "aemCanvasCompPublished" screen
    And I verify css attribute "background-color" is "rgba(255, 255, 255, 1)" for "canvasWhiteDefaultPublished" on "aemCanvasCompPublished"
    #Update to Blue-article container
    And I navigate to "AEM/editor.html/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Blue" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Article Container" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasBlueArticleContainerPublished" element exists on "aemCanvasCompPublished" screen
    And I verify css attribute "background-color" is "rgba(162, 130, 81, 1)" for "canvasBlueArticleContainerPublished" on "aemCanvasCompPublished"
    #Update to Transperant-article content container
    And I navigate to "AEM/editor.html/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    And I click "contentTreeCanvas" on "aemCanvasCompPage" screen
    And I click "configureCanvasButton" on "aemCanvasCompPage" screen
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I select "Transparent" value for "backgroundDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "Article Content Container" value for "layoutTypeDropdown" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-canvas-component-1.html"
    And I capture the address navigated to
    And I take a screenshot
    And I verify "canvasTransperantArticleContentContainerPublished" element exists on "aemCanvasCompPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestClubCanvasComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot