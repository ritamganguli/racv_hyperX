Feature: Various tests to test the T&E section of the website

  @TestSubscribeTravelDealsFormSubmission-p3
  @TestSubscribeTravelDealsFormSubmission-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the Subscribe Travel Deals experience fragment form can be submitted successfully when all valid details are entered and reference number is returned
    # Launch a page that has the EF
    Given I launch app page "URL/travel-experiences/attraction-tickets-experiences.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "subscribeTravelDealsPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "subscribeTravelDealsPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "subscribeTravelDealsPage" screen
    And I enter "0400000000" details in "mobileNo" on "subscribeTravelDealsPage" screen
    And I click "racvMemberRadio" on "subscribeTravelDealsPage" screen
    # Cannot click the below on IOS due to stale element issue
    #And I click "marketingConsent" on "subscribeTravelDealsPage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "subscribeTravelDealsPage" screen
    And I wait for "submitButton" to disappear on "subscribeTravelDealsPage" screen or "10" seconds before proceeding
    Then I capture the address navigated to
    And I check the page address contains "/travel-experiences/subscribed.html"
    And I take a screenshot

  @TestEventsEnquirySubmission-p3
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Forms-Dispatcher-p3
  Scenario: Verify the Conferences and Events Enquiry form can be submitted and a SF reference number is returned
    #launch app form
    Given I launch app page "URL/travel-experiences/conferences-venues-events/enquiry.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I enter "My Test Enquiry Message" details in "eventDetails" on "eventsEnquiryPage" screen
    And I click "eventStartDate" on "eventsEnquiryPage" screen
    And I click "calendarNextMonth" on "eventsEnquiryPage" screen
    And I click "calendarLastValidDayOfMonth" on "eventsEnquiryPage" screen
    And I click "selectFlexibleDatesYes" on "eventsEnquiryPage" screen
    And I enter "123" details in "numberOfAttendees" on "eventsEnquiryPage" screen
    And I click "selectAll" on "eventsEnquiryPage" screen
    And I enter "TestURLENV" details in "firstName" on "eventsEnquiryPage" screen
    And I enter "lastname" details in "lastName" on "eventsEnquiryPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "eventsEnquiryPage" screen
    And I enter "0400000000" details in "phoneNumber" on "eventsEnquiryPage" screen
    And I enter "My Company" details in "companyName" on "eventsEnquiryPage" screen
   	#Select all the how did you hear about us check boxes
    And I click "hearAboutUsOption1" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption2" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption3" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption4" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption5" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption6" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption7" on "eventsEnquiryPage" screen
    And I click "hearAboutUsOption8" on "eventsEnquiryPage" screen
    And I click "offersConsent" on "eventsEnquiryPage" screen
    When I click "submitEnquiryButton" on "eventsEnquiryPage" screen
    And I wait for "submitEnquiryButton" to disappear on "eventsEnquiryPage" screen or "10" seconds before proceeding
    And I capture the address navigated to
    Then I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  @TestWeddingEnquiryFormSubmission-p3
  @TestWeddingEnquiryFormSubmission-p3.chrome.ios-mobile
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Forms-Dispatcher-p3
  Scenario: Verify the Wedding enquiry form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-experiences/conferences-venues-events/weddings/enquiry.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I select "Cape Schanck Resort" value for "weddingLocation" drop down in "weddingEnquiryPage" screen using selection method "visibleText"
    And I click "preferredDate" on "weddingEnquiryPage" screen
    And I click "calendarNextMonth" on "weddingEnquiryPage" screen
    And I click "calendarLastValidDayOfMonth" on "weddingEnquiryPage" screen
    And I enter "40" details in "noOfPeople" on "weddingEnquiryPage" screen
    And I enter "This is a test submission. Please ignore." details in "comments" on "weddingEnquiryPage" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "weddingEnquiryPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "weddingEnquiryPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "weddingEnquiryPage" screen
    And I enter "0400000000" details in "phoneNumber" on "weddingEnquiryPage" screen
    And I click "marketingConsent" on "weddingEnquiryPage" screen
    And I take a screenshot
    When I click "submitButton" on "weddingEnquiryPage" screen
    And I wait for "submitEnquiryButton" to disappear on "eventsEnquiryPage" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I verify "thankYouMessage" element exists on "weddingEnquiryPage" screen
    And I check the page address contains "?referenceNo=FMD"

  @TestThingsToDoIntegration-p3
  @Regression-p3.chrome.desktop
  Scenario: Verify integration of Things To Do from racv to club connect domain (via resorts widget)
    #launch app form
    Given I launch app page "URL/travel-experiences/things-to-do/attraction-tickets.html"
    And I dismiss GDPR notification if it exists
    When I verify "thingsToDoActiveTab" element is visible on "attractionTicketsHomePage" screen
    And I select "  Adelaide" value for "thingsToDoLocationDropDown" drop down in "attractionTicketsHomePage" screen using selection method "visibleText"
    When I click "searchButton" on "attractionTicketsHomePage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check page address is "https://racv.clubconnect.com.au/en/listing/region/adelaide#RACV=1"
    And I take a screenshot