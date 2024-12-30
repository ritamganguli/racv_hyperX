#Author: Sumanta Roy
#Date Created : 11 Jul 19
#SR 16 Aug 19 - Updated tests to have page navigation URL checks and removed any content validation
Feature: This feature validates Search feature for RACV website

  #Dry run completed on 15 Jul 19
  #DAC-2759 - SR 2 Dec 19 - Added step to verify navigation to result page for Competition
  #DAC-9308 - SR 7 Sep 21 - Updated link for Competition first entry destination as per latest content
  @TestSearchOnHomePage
 	@Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify Search on RACV Home page for key search items to establish search is functioning as expected
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "searchOnHomePage" on "racvHomePage" screen
    And I wait for "searchInputBox" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify all standard search elements are present
    Then I verify "searchInputBox" element exists on "searchOverlay" screen
    And I verify "searchRacvButton" element exists on "searchOverlay" screen
    #Search for custom user input
    And I enter "insurance" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchRacvButton" on "searchOverlay" screen or "3" seconds before proceeding
    And I click "searchRacvButton" on "searchOverlay" screen
    And I wait for "searchTitleInsurance" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleInsurance" copy text on "searchResultsPage" screen
    And I navigate to "URL/"
    And I click "searchOnHomePage" on "racvHomePage" screen
    #Validate search recommendation feature
    And I enter "insur" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchSuggestInsurance" on "searchOverlay" screen or "3" seconds before proceeding
    And I take a screenshot
    And I click "searchSuggestInsurance" on "searchOverlay" screen
    And I take a screenshot

  #Dry run completed on 2 Dec 19, works fine on QA and Stage, Prod returns different results
  @TestSearchSortOnHomePage
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify Search sorting option on RACV Home page for suggested option Competition
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "searchOnHomePage" on "racvHomePage" screen
    And I wait for "searchInputBox" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a screenshot
    #Competitions
    And I enter "Competitions" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchRacvButton" on "searchOverlay" screen or "3" seconds before proceeding
    And I click "searchRacvButton" on "searchOverlay" screen
    And I wait for "searchTitleCompetition" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleCompetition" copy text on "searchResultsPage" screen
    #Check element for sort by relevance
    And I verify "sortRelevanceCompetetion" element exists on "searchResultsPage" screen
    And I take a screenshot
    #change sort to date
    Then I click "sortField" on "searchResultsPage" screen
    And I click "sortDateOption" on "searchResultsPage" screen
    And I wait for "sortDateCompetetion" on "searchResultsPage" screen or "10" seconds before proceeding
    #Check element for sort by date
    And I verify "sortDateCompetetion" element exists on "searchResultsPage" screen
    And I take a screenshot

  #Dry run completed on 2 Dec 19, works fine on QA and Stage, Prod
  @TestSearchLoadMoreOnHomePage
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify Search for load more results option on RACV Home page for suggested option Competition
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "searchOnHomePage" on "racvHomePage" screen
    And I wait for "searchInputBox" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a screenshot
    #Competitions
    And I enter "Competitions" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchRacvButton" on "searchOverlay" screen or "3" seconds before proceeding
    And I click "searchRacvButton" on "searchOverlay" screen
    And I wait for "searchTitleCompetition" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleCompetition" copy text on "searchResultsPage" screen
    #check 10 results are displayed
    And I verify "searchResultsTen" element exists on "searchResultsPage" screen
    And I verify "searchResultsTenthElement" element exists on "searchResultsPage" screen
    And I take a screenshot
    #Click on load more link
    And I click "loadMoreLink" on "searchResultsPage" screen using Action class
    #check 20 results are displayed
    And I verify "searchResultsTwenty" element exists on "searchResultsPage" screen
    And I verify "searchResultsTwentiethElement" element exists on "searchResultsPage" screen
    And I take a screenshot

  #Dry run completed on 11 Dec 19
  @TestSearchRacvClub
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify the search feature on RACV club page for Suggested, recommended and Custom keyword search
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html"
    And I dismiss GDPR notification if it exists
    When I click "searchIcon" on "racvClubHomePage" screen
    And I take a screenshot
    #Verify Suggested search - Accomodation
    Then I click "accomodationLink" on "racvClubSearchOverlay" screen
    And I verify "accomodationSearchPageTitle" copy text on "racvClubSearchOverlay" screen
    And I navigate to "URL/travel-leisure/racv-club.html"
    And I click "searchIcon" on "racvClubHomePage" screen
    #Verify Suggested search - Events
    And I click "eventsLink" on "racvClubSearchOverlay" screen
    And I verify "eventsSearchPageTitle" copy text on "racvClubSearchOverlay" screen
    And I navigate to "URL/travel-leisure/racv-club.html"
    And I click "searchIcon" on "racvClubHomePage" screen
    #Verify Suggested search - Member Groups
    And I click "memberGroupLink" on "racvClubSearchOverlay" screen
    And I verify "memberGroupSearchPageTitle" copy text on "racvClubSearchOverlay" screen
    And I navigate to "URL/travel-leisure/racv-club.html"
    And I click "searchIcon" on "racvClubHomePage" screen
    #Verify Suggested search - Dining
    And I click "diningLink" on "racvClubSearchOverlay" screen
    And I verify "diningSearchPageTitle" copy text on "racvClubSearchOverlay" screen
    And I navigate to "URL/travel-leisure/racv-club.html"
    And I click "searchIcon" on "racvClubHomePage" screen
    #Verify search recommendation
    And I enter "holiday" details in "searchField" on "racvClubSearchOverlay" screen
    And I take a screenshot
    And I click "firstQuickLinkItem" on "racvClubSearchOverlay" screen
    And I capture the address navigated to
    And I take a screenshot
    And I navigate to "URL/travel-leisure/racv-club.html"
    And I click "searchIcon" on "racvClubHomePage" screen
    #Verify Custom search
    And I enter "car" details in "searchField" on "racvClubSearchOverlay" screen
    And I click "searchButton" on "racvClubSearchOverlay" screen
    And I verify "carSearchPageTitle" copy text on "racvClubSearchOverlay" screen
    And I capture the address navigated to