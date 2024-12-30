#Author: Viengcumm Thongvilu
#Date created - 09 Jul 2021
Feature: This feature tests the Split Panel component and it's variants from authoring regression perspective.

  #VT 09 Jul 2021 - DAC-9005
  #Dry run completed in QA on 14 Jul 2021
  @TestSplitPanelComponent
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Split Panel component, configure and verify published changes
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
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-split-panel-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I enter "racv:" details in "contentHubPrimaryTag" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-split-panel-component-1.html"
    #Configure page description
    And I click "pageInfoButton" on "aemLandingPage" screen
    And I click "openPropertiesOption" on "aemLandingPage" screen
    And I enter "Test description" details in "description" on "aemAuthoringPageProperties" screen
    And I take a screenshot
    #Configure thumbnail
    And I click "thumbnailTabLink" on "aemAuthoringPageProperties" screen
    And I enter "/content/dam/racv/images/logo.png" details in "thumbnailPagePath" on "aemAuthoringPageProperties" screen
    And I enter "test alt" details in "thumbnailAltText" on "aemAuthoringPageProperties" screen
    And I take a screenshot
    And I click "saveAndCloseButton" on "aemAuthoringPageProperties" screen
    #Add component to page
    And I wait for "addComponentsParsysContentHubCategory" on "aemLandingPage" screen or "10" seconds before proceeding
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component
    And I enter "Split Panel" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "splitPanelOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "splitPanelOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemSplitPanelCompPage" screen
    And I click "contentTreeButton" on "aemSplitPanelCompPage" screen
    #Configure canvas
    And I click "contentTreeSplitPanel" on "aemSplitPanelCompPage" screen
    And I click "configureButton" on "aemSplitPanelCompPage" screen
    #Configuration tab
    And I click "configurationTab" on "aemCanvasCompDialog" screen
    And I click "addFieldButton" on "aemCanvasCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemCanvasCompDialog" screen
    And I verify "targetDivField" field contains a value on "aemCanvasCompDialog" screen
    And I click "renderAsContainerCheckBox" on "aemCanvasCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "15px - Small" value for "topSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I select "20px - Base" value for "bottomSpacingMobile" drop down in "aemCanvasCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #Open Side panel
    #And I click "sidePanelButton" on "aemSplitPanelCompPage" screen
    And I click "contentTreeButton" on "aemSplitPanelCompPage" screen
    #Configure tile
    And I click "contentTreeTile" on "aemSplitPanelCompPage" screen
    And I click "configureButton" on "aemSplitPanelCompPage" screen
    #Configurations tab
    And I select "Content Hub" value for "layoutDropdown" drop down in "aemSplitPanelTileCompDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/utility/test-automation-split-panel-component-1" details in "pagePath" on "aemSplitPanelTileCompDialog" screen
    And I enter "Read more" details in "ctaLabel" on "aemSplitPanelTileCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-split-panel-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "image" element exists on "aemSplitPanelPublished" screen
    #verify published
    #tag
    Then I verify "tag" element exists on "aemSplitPanelPublished" screen
    And I verify css attribute "color" is "rgba(102, 106, 112, 1)" for "tag" on "aemSplitPanelPublished"
    And I verify css attribute "font-weight" is "500" for "tag" on "aemSplitPanelPublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "tag" on "aemSplitPanelPublished"
    And I verify css attribute "font-size" is "14px" for "tag" on "aemSplitPanelPublished"
    #h2
    And I verify "h2" element exists on "aemSplitPanelPublished" screen
    And I verify css attribute "color" is "rgba(10, 27, 63, 1)" for "h2" on "aemSplitPanelPublished"
    And I verify css attribute "font-weight" is "700" for "h2" on "aemSplitPanelPublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "h2" on "aemSplitPanelPublished"
    And I verify css attribute "font-size" is "28px" for "h2" on "aemSplitPanelPublished"
    #description
    And I verify "description" element exists on "aemSplitPanelPublished" screen
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "description" on "aemSplitPanelPublished"
    And I verify css attribute "font-weight" is "400" for "description" on "aemSplitPanelPublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "description" on "aemSplitPanelPublished"
    And I verify css attribute "font-size" is "16px" for "description" on "aemSplitPanelPublished"
    #text link
    And I verify "textLink" element exists on "aemSplitPanelPublished" screen
    And I verify css attribute "color" is "rgba(14, 111, 197, 1)" for "textLink" on "aemSplitPanelPublished"
    And I verify css attribute "font-weight" is "500" for "textLink" on "aemSplitPanelPublished"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "textLink" on "aemSplitPanelPublished"
    And I verify css attribute "font-size" is "16px" for "textLink" on "aemSplitPanelPublished"
    #verify text-link click
    And I click "textLink" on "aemSplitPanelPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/utility/test-automation-split-panel-component-1.html"
    #verify h2 click
    And I click "h2" on "aemSplitPanelPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/utility/test-automation-split-panel-component-1.html"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestSplitPanelComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    #Extra click for "Force Delete" prompt
    And I click "forceDeleteButton" on "aemLandingPage" screen
    And I wait for "forceDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot