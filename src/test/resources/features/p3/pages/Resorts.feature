Feature: Various tests to verify the RACV Resorts pages/components

  @TestRacvTravelSubscribeForm-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  Scenario: Verify the RACV travel subscribe functionality for valid data on travel leisure page
    #launch app form
    Given I launch app page "URL/travel-experiences.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter valid member number on page
    When I enter "Test O'first-URLENV" details in "firstName" on "travelSubscribe" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "travelSubscribe" screen
    And I enter "digitalqa@racv.com.au" details in "emailField" on "travelSubscribe" screen
    And I enter "0455667788" details in "mobNumberField" on "travelSubscribe" screen
    And I click "yesButton" on "travelSubscribe" screen
    And I click "marketingConsent" on "travelSubscribe" screen
    And I take a screenshot
    And I click "submitButton" on "travelSubscribe" screen
    And I wait for "submitButton" to disappear on "travelSubscribe" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify form submission was a success
    And I check the page address contains "/subscribed.html"
    And I verify "successMessage" element is visible on "travelSubscribe" screen
    And I take a screenshot

  @TestRacvTravelSubscribeForm-invalid-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  Scenario: Verify the RACV travel subscribe functionality for invalid data on travel leisure page
    Given I launch app page "URL/travel-experiences.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter without details on page
    When I enter "" details in "firstName" on "travelSubscribe" screen
    And I enter "" details in "lastName" on "travelSubscribe" screen
    And I enter "" details in "emailField" on "travelSubscribe" screen
    And I enter "" details in "mobNumberField" on "travelSubscribe" screen
    And I take a screenshot
    And I click "submitButton" on "travelSubscribe" screen
    And I verify "errorMessageFirstName" element is visible on "travelSubscribe" screen
    And I verify "errorMessageLastName" element is visible on "travelSubscribe" screen
    And I verify "errorMessageEmail" element is visible on "travelSubscribe" screen
    And I verify "errorMessageMember" element is visible on "travelSubscribe" screen
    And I take a screenshot

  @TestCapeSchanckResortPageSubNav-p3
 	@Regression-p3.chrome.desktop
  Scenario: Verify the Cape Schanck page is up and sub navigation is being displayed and can be used
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts/cape-schanck.html"
    And I dismiss GDPR notification if it exists
    When I check the page address contains "/travel-experiences/resorts/cape-schanck.html"
    Then I verify "resortBookingWidget" element exists on "capeSchanckPage" screen
    And I take a screenshot
    #Verify sub nav
    And I scroll the window to "100" percent
    And I verify "subNavAccomodation" element is visible on "capeSchanckPage" screen
    And I take a screenshot
    #Click on Accomodation in Sticky Nav
    And I click "subNavAccomodation" without scrolling on "capeSchanckPage" screen
    And I check the page address contains "/travel-experiences/resorts/cape-schanck/accommodation.html"
    And I capture the address navigated to
    And I take a screenshot