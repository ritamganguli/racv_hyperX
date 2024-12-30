Feature: Various tests to test the membership section of the website

  @TestMemberDiscountCategories-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsAttributes-p3
  Scenario: Verify the member benefits discount tab function and cards are displaying
    #launch app form
    Given I launch app page "URL/membership/member-discounts.html#Moviesevents"
    And I dismiss GDPR notification if it exists
    And I wait for "benefitsHeading" on "memberDiscountsPage" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "benefitsHeading" element is visible on "memberDiscountsPage" screen
    And I verify "popularTab" element exists on "memberDiscountsPage" screen
    #Verify analytics attributes in benfits snapshot panel for popularTab
    And I verify "data-event" attribute is "site interaction" on "popularTab" element on "memberDiscountsPage" screen
    And I verify "data-type" attribute is "tab" on "popularTab" element on "memberDiscountsPage" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "popularTab" element on "memberDiscountsPage" screen
    And I verify "data-description" attribute is "popular" on "popularTab" element on "memberDiscountsPage" screen
    #verify View all button is visible for tab6
    And I verify "viewAllButtonTab6" element exists on "memberDiscountsPage" screen
    And I take a screenshot
    #Verify analytics attributes in benfits snapshot panel for View all button
    And I verify "data-event" attribute is "site interaction" on "viewAllButtonTab6" element on "memberDiscountsPage" screen
    And I verify "data-type" attribute is "button" on "viewAllButtonTab6" element on "memberDiscountsPage" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "viewAllButtonTab6" element on "memberDiscountsPage" screen
    And I verify "data-description" attribute is "view all offers" on "viewAllButtonTab6" element on "memberDiscountsPage" screen
    And I take a screenshot
    #verify the analytics of panel card
    And I verify "movieTicketsCardTab6" element exists on "memberDiscountsPage" screen
    And I verify "data-event" attribute is "site interaction" on "movieTicketsCardTab6" element on "memberDiscountsPage" screen
    And I verify "data-type" attribute is "link" on "movieTicketsCardTab6" element on "memberDiscountsPage" screen
    And I verify "data-location" attribute is "benefits snapshot panel | movie tickets" on "movieTicketsCardTab6" element on "memberDiscountsPage" screen
    And I verify "data-description" attribute is "view offer" on "movieTicketsCardTab6" element on "memberDiscountsPage" screen
    And I take a screenshot
    #end of analytics code
    And I click "fuelAndMotoringTab" on "memberDiscountsPage" screen
    And I verify "fuelAndMotoringTabFirstCard" element is visible on "memberDiscountsPage" screen
    And I verify "viewAllButtonTab2" element is visible on "memberDiscountsPage" screen
    And I verify "exploreAllText" element is visible on "memberDiscountsPage" screen
    And I take a screenshot
    And I click "popularTab" on "memberDiscountsPage" screen
    #verify at least 1 card appears
    And I verify "popularTabFirstCard" element is visible on "memberDiscountsPage" screen
    And I take a screenshot
    And I verify "viewAllButtonTab1" element is visible on "memberDiscountsPage" screen
    #Below does not work on ios, new tab never opens
    #And I click "viewAllButtonTab1" on "memberDiscountsPage" screen using JavaScript
    #And I switch to "NEW" browser tab
    #And I capture the address navigated to
    #And I check page address is "https://racv.clubconnect.com.au/en"