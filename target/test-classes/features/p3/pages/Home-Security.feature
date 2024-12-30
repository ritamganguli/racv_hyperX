Feature: Home security form submissions

  @TestAlarmSystemsQuoteFormSubmission-p3
  @TestAlarmSystemsQuoteFormSubmission-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-submission-p3.chrome.desktop
  Scenario: Verify the RACV Alarm Systems quote form can be submitted successfully when all valid details
    #launch app form
    Given I launch app page "URL/home/home-security/alarm-systems/quote.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #Personal details
    And I click "titleId" on "alarmSystemsQuotePage" screen
    And I click "mrDropDownResult" on "alarmSystemsQuotePage" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "alarmSystemsQuotePage" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "alarmSystemsQuotePage" screen
    And I enter "Unit 1a 502 Test Road" details in "address" on "alarmSystemsQuotePage" screen
    And I enter "Melbourne" details in "suburb" on "alarmSystemsQuotePage" screen
    And I click "state" on "alarmSystemsQuotePage" screen
    And I click "vicDropDownResult" on "alarmSystemsQuotePage" screen
    And I enter "3000" details in "postcode" on "alarmSystemsQuotePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "alarmSystemsQuotePage" screen
    And I enter "0300000000" details in "phoneNumber" on "alarmSystemsQuotePage" screen
    And I take a screenshot
    #Enquiry details
    And I enter "PROMO123" details in "promoCode" on "alarmSystemsQuotePage" screen
    And I click "livingSituation" on "alarmSystemsQuotePage" screen
    And I click "typeOfHome" on "alarmSystemsQuotePage" screen
    And I take a screenshot
    #RACV T&C
    And I click "termsAndConditions" on "alarmSystemsQuotePage" screen
    And I click "offers" on "alarmSystemsQuotePage" screen
    And I take a screenshot
    And I click "submit" on "alarmSystemsQuotePage" screen
    And I wait for "submit" to disappear on "alarmSystemsQuotePage" screen or "30" seconds before proceeding
    Then I capture the address navigated to
    And I check the page address contains "/alarm-systems.html?referenceNo="
    And I verify "thankyouReference" element is visible on "alarmSystemsQuotePage" screen
    And I take a screenshot

  @TestCctvQuoteFormSubmission-p3
  @TestCctvQuoteFormSubmission-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-submission-p3.chrome.desktop
  Scenario: Verify the RACV Cctv quote form can be submitted successfully when all valid details
    #launch app form
    Given I launch app page "URL/home/home-security/cctv/quote.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #Personal details
    And I click "titleId" on "cctvQuotePage" screen
    And I click "mrDropDownResult" on "cctvQuotePage" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "cctvQuotePage" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "cctvQuotePage" screen
    And I enter "Unit 1a 502 Test Road" details in "address" on "cctvQuotePage" screen
    And I enter "Melbourne" details in "suburb" on "cctvQuotePage" screen
    And I click "state" on "cctvQuotePage" screen
    And I click "vicDropDownResult" on "cctvQuotePage" screen
    And I enter "3000" details in "postcode" on "cctvQuotePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "cctvQuotePage" screen
    And I enter "0300000000" details in "phoneNumber" on "cctvQuotePage" screen
    And I take a screenshot
    #Enquiry details
    And I enter "PROMO123" details in "promoCode" on "cctvQuotePage" screen
    And I click "livingSituation" on "cctvQuotePage" screen
    And I click "typeOfHome" on "cctvQuotePage" screen
    And I take a screenshot
    #RACV T&C
    And I click "termsAndConditions" on "cctvQuotePage" screen
    And I click "offers" on "cctvQuotePage" screen
    And I take a screenshot
    And I click "submit" on "cctvQuotePage" screen
    And I wait for "submit" to disappear on "cctvQuotePage" screen or "30" seconds before proceeding
    Then I capture the address navigated to
    And I check the page address contains "/cctv.html?referenceNo="
    And I verify "thankyouReference" element is visible on "cctvQuotePage" screen
    And I take a screenshot