#Author: Karan Kapur
#Date created - 06 March 2021
Feature: This feature tests the Club Booking Widget Component

  #KK 11 March 2021
  #Dry run completed on QA
  @TestClubBookingWidgetComponent
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Club Booking Widget component, configure, publish and verify published changes
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
    #Navigate to footer hierarchy to create test page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/travel-leisure/racv-club/footer"
    And I capture the address navigated to
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "clubbasePageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-club-booking-widget-editor" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-booking-widget-editor"
    And I click "addComponentsParsys" on "aemTestComponentPage" screen
    And I click "addComponentsPlusIcon" on "aemTestComponentPage" screen
    #search and add Club Booking Widget component first
    And I enter "Book" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "clubBookingWidgetOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "clubBookingWidgetOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Component authoring dialog to configure the component
    And I click "clubWidgetBookingComponent" on "aemClubBookingWidgetPage" screen
    And I click "configureButton" on "aemClubBookingWidgetPage" screen
    And I wait for "configureButton" on "aemClubBookingWidgetPage" screen or "5" seconds before proceeding
    #Configure tabs
    And I clear contents of "SubmitButtonLink" element on "aemClubBookingWidgetPage" screen
    And I enter "/content/racv/en/home/travel-leisure/racv-club/city-club/club-member-validation" details in "SubmitButtonLink" on "aemClubBookingWidgetPage" screen
    And I clear contents of "checkInCheckOutDifference" element on "aemClubBookingWidgetPage" screen
    And I enter "8" details in "checkInCheckOutDifference" on "aemClubBookingWidgetPage" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemClubBookingWidgetPage" screen
    And I verify "targetDivId" field contains a value on "aemClubBookingWidgetPage" screen
    And I take a screenshot
    #Click on Save changes
    And I click "saveChangesButton" on "aemTestComponentPage" screen
    And I wait for "saveChangesButton" to disappear on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-booking-widget-editor.html"
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "bookNowText" element exists on "aemClubBookingWidgetPublished" screen
    And I verify "checkavailabilityLink" element exists on "aemClubBookingWidgetPublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestClubBookingWidgetComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "moreIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot