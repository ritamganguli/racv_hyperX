#Author: Sumanta Roy
#Date Created : June 19
Feature: This feature tests the successful submission of the important RACV forms

  #Dry run completed on 9 Jul 19
  #NOTE - Need to ascertain manually by looking at the screen shot if the search was a success, since the map could not be automated
  #SR 9 Sep 21 - DAC-9308 - Fixed the screenshot issue, added new step to scroll onto view
  @TestRacvFuelPricesForm
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  @Sanity.safari.desktop
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify the RACV Fuel prices form is up and search can be performed successfully when valid postcode details are entered
    #launch app form
    Given I launch app page "URL/on-the-road/driving-maintenance/fuel-prices.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #verify we are on Fuel prices form
    #1 Aug 19 SR - disabling this check as content is diff across environments
    #When I verify "pageTitle" copy text on "fuelPrices" screen
    #enter details on page 1
    When I enter "3000" details in "postCode" on "fuelPrices" screen
    And I enter "keys:DOWN" details in "postCode" on "fuelPrices" screen
    And I enter "keys:ENTER" details in "postCode" on "fuelPrices" screen
    And I click "priceTrendText" on "fuelPrices" screen
    Then I take a screenshot

  #Test added by Vieng for testing on Mobile emulator
  #SR 6 Apr 2020 - Dry run completed on iPhone and Galaxy emulators after porting
  @TestRacvFuelPricesFormMobile
  #@Sanity.chrome.android-mobile
  @Sanity.chrome.ios-mobile
  @Regression.chrome.android-mobile
  @Regression.chrome.ios-mobile
  Scenario: Verify the RACV Fuel prices form is up and search can be performed successfully when valid postcode details are entered on mobile
    #launch app form
    Given I launch app page "URL/on-the-road/driving-maintenance/fuel-prices.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter details on page 1
    When I enter "3024" details in "postCodeMobile" on "fuelPrices" screen
    And I click "firstPostCodeResult" on "burglaryStats" screen
    And I wait for "firstPostCodeResult" to disappear on "burglaryStats" screen or "5" seconds before proceeding
    Then I take a screenshot

  #Dry run completed on 10 May 22
  @TestRacvRetrieveQuote
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the RACV retrive quote functionality for both valid and invalid data
    #launch app form
    Given I launch app page "URL/utility/retrieve-quote.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter without details on page
    #When I enter "" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter details partially on page
    #When I enter "QTE123456789" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter invalid details  on page
    #When I enter "12345678" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "3000" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter details on page
    When I enter "QTE123456789" details in "quoteNumber" on "retriveQuote" screen
    And I enter "3000" details in "postCode" on "retriveQuote" screen
    And I click "retriveQuoteButton" on "retriveQuote" screen
    And I wait for "retriveQuoteButton" to disappear on "retriveQuote" screen or "10" seconds before proceeding
    And I capture the address navigated to
    #Verify form submission was a success
    And I check the page address contains "https://my.racv.com.au/s/motor-insurance"
    And I take a screenshot

   #Dry run completed on 10 May 22
  @TestRacvRetriveCarInsuranceQuote
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  Scenario: Verify the RACV retrive quote functionality for both valid data
    #launch app form
    Given I launch app page "URL/utility/retrieve-a-car-insurance-quote.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter without details on page
    #When I enter "" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter details partially on page
    #When I enter "QTE123456789" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter invalid details  on page
    #When I enter "12345678" details in "quoteNumber" on "retriveQuote" screen
    #And I enter "3000" details in "postCode" on "retriveQuote" screen
    #And I click "retriveQuoteButton" on "retriveQuote" screen
    #And I handle the alert by accepting
    #And I take a screenshot
    #And I clear contents of "quoteNumber" element on "retriveQuote" screen
    #enter details on page
    When I enter "QTE123456789" details in "quoteNumber" on "retriveQuote" screen
    And I enter "3000" details in "postCode" on "retriveQuote" screen
    And I click "retriveQuoteButton" on "retriveQuote" screen
    And I wait for "retriveQuoteButton" to disappear on "retriveQuote" screen or "10" seconds before proceeding
    And I capture the address navigated to
    #Verify form submission was a success
    And I check the page address contains "https://my.racv.com.au/s/motor-insurance"
    And I take a screenshot

  @TestRacvClubMemberUpgradeForm
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the RACV club member upgrade form functionality for all generic surname
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/member-upgrade-options.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "clubMemUpgradeForm" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "clubMemUpgradeForm" screen
    And I enter "digitalqa@racv.com.au" details in "emailField" on "clubMemUpgradeForm" screen
    And I enter "0455667788" details in "phoneNumberField" on "clubMemUpgradeForm" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "clubMemNumberField" on "clubMemUpgradeForm" screen
    And I select "Upgrade Package 2" value for "selectUpgradeOptionDdn" drop down in "clubMemUpgradeForm" screen using selection method "visibleText"
    And I take a screenshot
    And I click "submitButton" on "clubMemUpgradeForm" screen
    #Verify form submission was a success
    And I wait for "successMessage" on "clubMemUpgradeForm" screen or "10" seconds before proceeding
    And I check the page address contains "/travel-leisure/racv-club/membership/member-upgrade-options/thank-you.html?referenceNo"
    And I verify "successMessage" element exists on "clubMemUpgradeForm" screen
    And I take a screenshot

  @TestRacvClubMemberUpgradeForm-InvalidMemberNumber
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the RACV club member upgrade form functionality for invalid data in member (contains text) upgrade options page
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/member-upgrade-options.html?disableCaptcha=true"
    #Enter invalid member number on page
    When I enter "Test O'first-URLENV" details in "firstName" on "clubMemUpgradeForm" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "clubMemUpgradeForm" screen
    And I enter "digitalqa@racv.com.au" details in "emailField" on "clubMemUpgradeForm" screen
    And I enter "0455667788" details in "phoneNumberField" on "clubMemUpgradeForm" screen
    And I enter "12345678asd" details in "clubMemNumberField" on "clubMemUpgradeForm" screen
    And I select "Upgrade Package 2" value for "selectUpgradeOptionDdn" drop down in "clubMemUpgradeForm" screen using selection method "visibleText"
    And I take a screenshot
    And I click "submitButton" on "clubMemUpgradeForm" screen
    And I verify "errorMessageMemberNumber" element exists on "clubMemUpgradeForm" screen
    And I take a screenshot