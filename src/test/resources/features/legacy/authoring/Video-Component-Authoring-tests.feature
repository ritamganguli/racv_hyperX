#Author: Karan Kapur
#Date created -9 January 2022
#Dry run completed on 1st Feb 2022
Feature: This feature tests the video component and it's variants from authoring regression perspective.

  @TestVideoComponentVariants
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add Video component.
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
    And I enter "test-automation-video-component" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-video-component.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add video component
    And I enter "Video" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "videoOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "videoOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemCanvasCompPage" screen
    And I click "contentTreeButton" on "aemCanvasCompPage" screen
    #Configure canvas
    And I click "contentTreeVideo" on "aemCanvasCompPage" screen
    And I click "configureVideoButton" on "aemCanvasCompPage" screen
    #Configuration tab
    And I click "configurationTab" on "aemVideoCompDialog" screen
    And I select "Modal View" value for "viewType" drop down in "aemVideoCompDialog" screen using selection method "visibleText"
    And I enter "/content/dam/racv/images/logo.png" details in "videoImg" on "aemVideoCompDialog" screen
    And I enter "https://www.youtube.com/watch?v=aArrAGgIA5A" details in "videoPath" on "aemVideoCompDialog" screen
    And I enter "New Video Component" details in "videoTitle" on "aemVideoCompDialog" screen
    And I enter "4 minutes" details in "videoTime" on "aemVideoCompDialog" screen
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
    And I navigate to "URL/utility/test-automation-video-component.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I wait for "playButton" on "aemVideoCompPublished" screen or "5" seconds before proceeding
    And I verify "playButton" element exists on "aemVideoCompPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemVideoComponentPageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot