#Author: Dheebanraj M
#Date created - 08 Jul 2021
Feature: This feature tests the Adaptive image component and it's variants from authoring regression perspective.

  #DM 08 Jul 2021 AEMU-22
  #Dry run completed in QA
  @TestAdaptiveImageComponent
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add canvas and Adaptive image component, publish, edit adaptive image variant and republish and verify published changes
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
    And I enter "test-automation-adaptive-image-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-adaptive-image-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemAdaptiveImageCompPage" screen
    And I click "contentTreeButton" on "aemAdaptiveImageCompPage" screen
    #select canvas and click add component
    And I click "canvasParsys" on "aemAdaptiveImageCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add adaptive image component
    And I enter "adaptive" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "adaptiveImageOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "adaptiveImageOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure adaptive image
    And I click "contentTreeAdaptiveImage" on "aemAdaptiveImageCompPage" screen
    And I click "configureAdaptiveImageButton" on "aemAdaptiveImageCompPage" screen
    #Configuration tab
    And I click "configurationTab" on "aemAdaptiveImageCompDialog" screen
    And I select "Hero banner" value for "transformationName" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I click "assetsButton" on "aemAdaptiveImageCompPage" screen
    And I click "publishStatusFilter" on "aemAdaptiveImageCompPage" screen
    And I click "publishedFilter" on "aemAdaptiveImageCompPage" screen using JavaScript
    And I wait for "assertImage" on "aemAdaptiveImageCompPage" screen or "5" seconds before proceeding
    And I drag "assertImage" from "aemAdaptiveImageCompPage" screen and drop in "dropAsset" on  "aemAdaptiveImageCompDialog" screen
    And I enter "test" details in "imageAltText" on "aemAdaptiveImageCompDialog" screen
    And I enter "/content/racv/en/home/about-racv" details in "urlText" on "aemAdaptiveImageCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemAdaptiveImageCompDialog" screen
    And I verify "targetDivField" field contains a value on "aemAdaptiveImageCompDialog" screen
    And I take a screenshot
    #Adaptive Show/Hide tab
    And I click "adaptiveTab" on "aemAdaptiveImageCompDialog" screen
    And I click "hideOnTabletCheckBox" on "aemAdaptiveImageCompDialog" screen
    And I click "hideOnMobileCheckBox" on "aemAdaptiveImageCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemAdaptiveImageCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemAdaptiveImageCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I click "pageInfoButton" on "aemTilesCompPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemTilesCompPage" screen
    And I wait for "publishOptionSecondary" on "aemTilesCompPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemTilesCompPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-adaptive-image-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish check
    And I verify "adaptiveImage" element exists on "aemAdaptiveImagePublished" screen
    And I verify "altText" element exists on "aemAdaptiveImagePublished" screen
    And I click "adaptiveImage" on "aemAdaptiveImagePublished" screen using Action class
    And I check page address is "URL/about-racv.html"
    #go back to aem and change variant
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-adaptive-image-component-1.html"
    And I click "contentTreeButton" on "aemAdaptiveImageCompPage" screen
    And I click "contentTreeAdaptiveImage" on "aemAdaptiveImageCompPage" screen
    And I click "configureAdaptiveImageButton" on "aemAdaptiveImageCompPage" screen
    And I click "configurationTab" on "aemAdaptiveImageCompDialog" screen
    And I select "Carousel image" value for "transformationName" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemAdaptiveImageCompDialog" screen
    And I verify "targetDivField" field contains a value on "aemAdaptiveImageCompDialog" screen
    And I click "renderAsContainerCheckBox" on "aemAdaptiveImageCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I select "No Spacing" value for "topSpacingMobile" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I select "50px - Large" value for "bottomSpacingDesktop" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I select "No Spacing" value for "bottomSpacingMobile" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemAdaptiveImageCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemAdaptiveImageCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-adaptive-image-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish check
    And I verify "adaptiveImage" element exists on "aemAdaptiveImagePublished" screen
    And I verify "altText" element exists on "aemAdaptiveImagePublished" screen
    And I click "adaptiveImage" on "aemAdaptiveImagePublished" screen
    And I check page address is "URL/about-racv.html"
    #go back to aem and change variant
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-adaptive-image-component-1.html"
    And I click "contentTreeButton" on "aemAdaptiveImageCompPage" screen
    And I click "contentTreeAdaptiveImage" on "aemAdaptiveImageCompPage" screen
    And I click "configureAdaptiveImageButton" on "aemAdaptiveImageCompPage" screen
    And I click "configurationTab" on "aemAdaptiveImageCompDialog" screen
    And I select "Slide show image" value for "transformationName" drop down in "aemAdaptiveImageCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemAdaptiveImageCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemAdaptiveImageCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-adaptive-image-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish check
    And I verify "adaptiveImage" element exists on "aemAdaptiveImagePublished" screen
    And I verify "altText" element exists on "aemAdaptiveImagePublished" screen
    And I click "adaptiveImage" on "aemAdaptiveImagePublished" screen
    And I check page address is "URL/about-racv.html"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I wait for "aemTestAdaptiveImageComponent1PageIcon" on "aemLandingPage" screen or "10" seconds before proceeding
    And I click "aemTestAdaptiveImageComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot