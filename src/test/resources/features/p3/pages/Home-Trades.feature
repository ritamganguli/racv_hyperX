Feature: Tests relating to Home Trades pages

  @TestRACVTradesWidget-Postcode-Variant-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Sanity-p3-smartui.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Integration-p3
  Scenario: Verify Trades Widget post code only variant
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance/plumbing.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I take a lambda snapshot "trades widget postcode variant" "hide-emergency-banner, hide-gdpr"
    And I take a screenshot
    #click submit and verify error states
    And I click "getQuoteButton" on "tradesWidgetPage" screen
    And I verify "postcodeInputError" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #enter 3000 and select result
    And I enter "3000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "tradesWidgetPage" screen
    And I wait for "getQuoteButton" to disappear on "tradesWidgetPage" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Plumbing&postCode=3000%2C%20Melbourne"
    And I take a screenshot

  @TestRACVTradesWidget-Postcode-Keyword-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Sanity-p3-smartui.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Integration-p3
  Scenario: Verify Trades Widget search by postcode and keyword
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I verify "tradePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    And I take a lambda snapshot "trades widget" "hide-emergency-banner, hide-gdpr"
    #click submit and verify error states
    And I click "getQuoteButton" on "tradesWidgetPage" screen
    And I verify "tradeInputError" element is visible on "tradesWidgetPage" screen
    And I verify "postcodeInputError" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #enter 3000 and select result
    And I enter "3000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #enter electrical and select first result
    And I enter "electrical" details in "tradeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "tradesWidgetPage" screen
    And I wait for "getQuoteButton" to disappear on "tradesWidgetPage" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Electrical&postCode=3000%2C%20Melbourne"
    And I take a screenshot

  @TestRACVTradesWidget-Suburb-Trade-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Integration-p3
  Scenario: Verify Trades Widget search by suburb and select from all trade
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I verify "tradePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #no need to take another lambda screenshot, already taken in @TestRACVTradesWidget-Postcode-Keyword-p3
    #And I take a lambda snapshot "trades widget postcode variant" "hide-emergency-banner, hide-gdpr"
    #click submit and verify error states
    And I click "getQuoteButton" on "tradesWidgetPage" screen
    And I verify "tradeInputError" element is visible on "tradesWidgetPage" screen
    And I verify "postcodeInputError" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #enter Noble and select result
    And I enter "mel" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #Click the field and select from all trades
    And I click "tradeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "allTradesElectricalResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "tradesWidgetPage" screen
    And I wait for "getQuoteButton" to disappear on "tradesWidgetPage" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Electrical&postCode=3000%2C%20Melbourne"
    And I take a screenshot