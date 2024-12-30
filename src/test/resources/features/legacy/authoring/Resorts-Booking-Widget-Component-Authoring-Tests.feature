#Author: Viengcumm Thongvilu
#Date created - 18 Feb 2021
Feature: This feature tests the Resorts Booking Widget Component

  #VT 23 Feb 2021
  #Dry run completed on QA
  @TestResortsBookingWidgetComponent
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Resorts Booking Widget component, configure, publish and verify published changes
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
    And I click "createButton" on "aemLandingPage" screen
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-resort-booking-widget-editor-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-resort-booking-widget-editor-1"
    #open page properties and configure google maps client library
    #And I click "pageInfoButton" on "aemLandingPage" screen
    #And I click "openPropertiesOption" on "aemLandingPage" screen
    #And I click "advancedTabLink" on "aemAuthoringPageProperties" screen
    #And I click "clientLibraryAddFieldButton" on "aemAuthoringPageProperties" screen
    #And I select "Google Map" value for "clientLibraryDropDown" drop down in "aemAuthoringPageProperties" screen using selection method "visibleText"
    #And I take a screenshot
    #And I click "saveAndCloseButton" on "aemAuthoringPageProperties" screen
    #add component to page
    And I wait for "addComponentsParsys" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "addComponentsParsys" on "aemTestComponentPage" screen
    And I click "addComponentsPlusIcon" on "aemTestComponentPage" screen
    #search and add Resorts Booking Widget component first
    And I enter "Resorts Book" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "resortsBookingWidgetOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "resortsBookingWidgetOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "resortsBookingWidgetOption" to disappear on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemResortsBookingWidgetPage" screen
    And I click "contentTreeButton" on "aemResortsBookingWidgetPage" screen
    And I click "resortWidgetBookingComponent" on "aemResortsBookingWidgetPage" screen
    And I click "configureButton" on "aemResortsBookingWidgetPage" screen
    And I wait for "configureButton" to disappear on "aemResortsBookingWidgetPage" screen or "5" seconds before proceeding
    #Configure tabs
    And I enter "!" details in "searchButtonLabel" on "aemResortsBookingWidgetPage" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/search" details in "searchButtonLink" on "aemResortsBookingWidgetPage" screen
    And I enter "More options" details in "moreOptionLabel" on "aemResortsBookingWidgetPage" screen
    And I enter "Promo Code" details in "promoCodeLabel" on "aemResortsBookingWidgetPage" screen
    And I enter "Members" details in "memberLabel" on "aemResortsBookingWidgetPage" screen
    And I clear contents of "memberId" element on "aemResortsBookingWidgetPage" screen
    And I enter "Member number" details in "memberId" on "aemResortsBookingWidgetPage" screen
    And I take a screenshot
    #Filter Tab
    And I click "filtersTab" on "aemResortsBookingWidgetPage" screen
    And I enter "!" details in "membershipDisplayMessage" on "aemResortsBookingWidgetPage" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemResortsBookingWidgetPage" screen
    And I verify "targetDivId" field contains a value on "aemResortsBookingWidgetPage" screen
    And I take a screenshot
    #Resorts List Tab
    And I click "resortListTab" on "aemResortsBookingWidgetPage" screen
    #add healesville
    And I click "vicAddField" on "aemResortsBookingWidgetPage" screen
    And I select "Healesville Country Club & Resort" value for "healesvilleDropDown" drop down in "aemResortsBookingWidgetPage" screen using selection method "visibleText"
    And I take a screenshot
    #add racv clubs
    And I click "addNewStateButton" on "aemResortsBookingWidgetPage" screen
    And I enter "RACV CLUBS" details in "clubStateField" on "aemResortsBookingWidgetPage" screen
    And I click "clubAddField" on "aemResortsBookingWidgetPage" screen
    And I select "RACV City Club" value for "clubDropDown" drop down in "aemResortsBookingWidgetPage" screen using selection method "visibleText"
    And I take a screenshot
    #Click on Save changes
    And I click "saveChangesButton" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-resort-booking-widget-editor-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "searchButton" element exists on "aemResortsBookingWidgetPublished" screen
    And I verify "promoCodeLink" element exists on "aemResortsBookingWidgetPublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestResortsBookingWidgetComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot