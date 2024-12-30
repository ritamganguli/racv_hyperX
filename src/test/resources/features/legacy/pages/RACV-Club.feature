#Author: Sumanta Roy
#Date Created : 17 Dec 19
Feature: This feature validates RACV Club features

  #Dry run completed
  #SR 14 Apr 2020 - DAC-4739 changes related to AFR-587
  #SR 27 Apr 2020 - DAC-4869 - Added analytics check for form node in Step 1.
  @TestRACVClubLetterIntroForm
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  @Sanity.safari.desktop
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the RACV Club letter of introduction form can be submitted successfully when all valid details are entered
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?clubpath=%2Fcontent%2Fracv%2Fen%2Fhome%2Ftravel-leisure%2Fracv-club%2Fmembership%2Freciprocal-clubs%2Fasia%2Fsingapore%2Fjcr%3Acontent%2Flist%2Fclubdetails0&disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubLetterPage1" screen
    And I select "Mr" value for "memberTitle" drop down in "clubLetterPage1" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "memberFirstName" on "clubLetterPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberLastName" on "clubLetterPage1" screen
    And I click "visitStartCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    And I click "visitStartCalendarDate" on "clubLetterPage1" screen
    And I take a screenshot
    And I click "visitEndCalendarIcon" on "clubLetterPage1" screen
    #Below step is not required as calendar opens for current month
    #And I click "visitEndCalendarNextMonth" on "clubLetterPage1" screen
    And I click "visitEndCalendarDate" on "clubLetterPage1" screen
    #Pick visitStartCalendarDate + 1day
    And I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "memberEmail" on "clubLetterPage1" screen
    And I enter "0300000000" details in "phoneHome" on "clubLetterPage1" screen
    And I enter "0400000000" details in "phoneMobile" on "clubLetterPage1" screen
    And I take a screenshot
    #Analytics tag check for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "club membership letter of intro - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "club membership letter of intro" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submit" on "clubLetterPage1" screen using JavaScript
    And I wait for "submit" to disappear on "clubLetterPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #Verify form submission was a success
    Then I check the page address contains "/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed 14 May 20
  @TestRACVClubLetterIntroFormMobile
  #@Sanity.chrome.android-mobile
  @Sanity.chrome.ios-mobile
  @Regression.chrome.android-mobile
  @Regression.chrome.ios-mobile
  Scenario: Verify the RACV Club letter of introduction form can be submitted successfully when all valid details are entered on mobile
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?clubpath=%2Fcontent%2Fracv%2Fen%2Fhome%2Ftravel-leisure%2Fracv-club%2Fmembership%2Freciprocal-clubs%2Fasia%2Fsingapore%2Fjcr%3Acontent%2Flist%2Fclubdetails0&disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubLetterPage1" screen
    And I select "Mr" value for "memberTitle" drop down in "clubLetterPage1" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "memberFirstName" on "clubLetterPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberLastName" on "clubLetterPage1" screen
    And I enter "2024-08-16" details in "visitStartTextBox" on "clubLetterPage1" screen using JavaScript
    And I enter "2024-08-17" details in "visitEndTextBox" on "clubLetterPage1" screen using JavaScript
    And I enter "digitalqa@racv.com.au" details in "memberEmail" on "clubLetterPage1" screen
    And I enter "0300000000" details in "phoneHome" on "clubLetterPage1" screen
    And I enter "0400000000" details in "phoneMobile" on "clubLetterPage1" screen
    And I take a screenshot
    #Analytics tag check for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "club membership letter of intro - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "club membership letter of intro" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submit" on "clubLetterPage1" screen
    And I capture the address navigated to
    #Verify form submission was a success
    Then I check the page address contains "/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?referenceNo=FMD"
    And I take a screenshot

  @TestRacvClubBookingForm
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  #@Sanity.safari.desktop
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @TestRacvClubBookingForm.safari.desktop
  Scenario: Verify the RACV Club Booking form can be submitted successfully when all valid details are entered
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "checkInDatePicker" on "clubFormPage1" screen or "5" seconds before proceeding
    When I click "checkInDatePicker" on "clubFormPage1" screen
    And I click "checkInDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkInDatePickerDay5" on "clubFormPage1" screen
    And I click "checkOutDatePicker" on "clubFormPage1" screen
    And I click "checkOutDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkOutDatePickerDay9" on "clubFormPage1" screen
    And I select "2" value for "adults" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I select "1" value for "children" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I take a screenshot
    And I click "availibilityButton" on "clubFormPage1" screen
    #switch to new tab
    And I switch to "new" browser tab
    And I update the page address by suffixing "&disableCaptcha=true"
    #enter details on page 2
    And I verify "pageTitle" element exists on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    And I wait for "title" on "travelClickPage" screen or "35" seconds before proceeding
    Then I check the page address contains "https://bookings.travelclick.com"
    And I capture the address navigated to
    And I take a screenshot

  #Test added by Vieng for testing on Mobile emulator
  #SR 6 Apr 2020 - DAC-4383 changes
  @TestRacvClubBookingFormMobile
  #@Sanity.chrome.android-mobile
  @Regression.chrome.android-mobile
  @TestRacvClubBookingFormMobile.chrome.android-mobile
  Scenario: Verify the RACV Club Booking form can be submitted successfully when all valid details are entered on mobile
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter details on page 1
    When I enter "01/01/2022" details in "checkInDatePicker" on "clubFormPage1" screen
    And I enter "07/01/2022" details in "checkOutDatePicker" on "clubFormPage1" screen
    And I select "2" value for "adults" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I select "1" value for "children" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I take a screenshot
    And I click "availibilityButton" on "clubFormPage1" screen
    #switch to new tab
    And I switch to "new" browser tab
    And I update the page address by suffixing "&disableCaptcha=true"
    #enter details on page 2
    And I verify "pageTitle" element exists on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    And I wait for "submitButton" to disappear on "clubFormPage2" screen or "10" seconds before proceeding
    And I wait for "title" on "travelClickPage" screen or "35" seconds before proceeding
    And I capture the address navigated to
    #validate we are on correct page
    #Then I verify "selectFirstRoom" element exists on "clubFormPage3" screen
    Then I check the page address contains "https://bookings.travelclick.com"
    And I take a screenshot

  #Dry run completed on 5 Dec 19
  @TestRacvClubBookingFormInvalidMembership
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the RACV Club Booking form throws en error form invalid member details
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter details on page 1
    When I click "checkInDatePicker" on "clubFormPage1" screen
    And I click "checkInDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkInDatePickerDay5" on "clubFormPage1" screen
    And I click "checkOutDatePicker" on "clubFormPage1" screen
    And I click "checkOutDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkOutDatePickerDay9" on "clubFormPage1" screen
    And I select "2" value for "adults" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I select "1" value for "children" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I take a screenshot
    And I click "availibilityButton" on "clubFormPage1" screen
    #switch to new tab
    And I switch to "new" browser tab
    And I update the page address by suffixing "&disableCaptcha=true"
    #enter details on page 2 - invalid membership data
    And I verify "pageTitle" element exists on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "invalid-last-name" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    #member validation error
    Then I verify "memberValidationError" element exists on "clubFormPage2" screen
    And I capture the address navigated to
    And I take a screenshot

  @TestRacvClubBookingFormNonClubMembership
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the RACV Club Booking form throws an error for non club member details
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter details on page 1
    When I click "checkInDatePicker" on "clubFormPage1" screen
    And I click "checkInDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkInDatePickerDay5" on "clubFormPage1" screen
    And I click "checkOutDatePicker" on "clubFormPage1" screen
    And I click "checkOutDatePickerNxtMonth" on "clubFormPage1" screen
    And I click "checkOutDatePickerDay9" on "clubFormPage1" screen
    And I select "2" value for "adults" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I select "1" value for "children" drop down in "clubFormPage1" screen using selection method "visibleText"
    And I take a screenshot
    And I click "availibilityButton" on "clubFormPage1" screen
    #switch to new tab
    And I switch to "new" browser tab
    And I update the page address by suffixing "&disableCaptcha=true"
    #enter details on page 2 - invalid membership data
    And I verify "pageTitle" element exists on "clubFormPage2" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "invalid" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    #member validation error
    Then I verify "memberValidationError" element exists on "clubFormPage2" screen
    And I capture the address navigated to
    And I take a screenshot

  #Dry run completed on 10 Dec 19
  #NOTE -  For some odd reason this button needs to be clicked twice in automation
  #SR 14 Apr 2020 - Updated test as per DAC-4739 changes related to AFR-587
  @TestReciprocalClubPage
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the RACV Reciprocal Club page for map, country filter and validate the reciprocal form is rendered as expected
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/reciprocal-clubs.html"
    And I dismiss GDPR notification if it exists
    #check map is displayed
    When I verify "worldMapImage" element exists on "reciprocalClubPage" screen
    And I take a screenshot
    #click on Europe
    Then I click "europeMapImage" on "reciprocalClubPage" screen using JavaScript
    And I take a screenshot
    #select a club
    And I click "selectCountry" on "reciprocalClubPage" screen
    And I select "Austria" value for "selectCountry" drop down in "reciprocalClubPage" screen using selection method "visibleText"
    And I take a screenshot
    #Click on order LOI button - NOTE -  For some odd reason this button needs to be clicked twice in automation
    And I click "orderLOIButton" on "reciprocalClubPage" screen
    #Check we landed on the correct page - austria
    And I check the page address contains "/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html"
    And I check the page address contains "europe-uk%2Faustria"
    And I capture the address navigated to
    #Add parameter to disable google captcha onto url
    And I update the page address by suffixing "&disableCaptcha=true"
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubLetterPage1" screen
    And I select "Mr" value for "memberTitle" drop down in "clubLetterPage1" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "memberFirstName" on "clubLetterPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberLastName" on "clubLetterPage1" screen
    And I click "visitStartCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    And I click "visitStartCalendarDate" on "clubLetterPage1" screen
    And I take a screenshot
    And I click "visitEndCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitEndCalendarNextMonth" on "clubLetterPage1" screen
    #Pick visitStartCalendarDate + 1day
    And I click "visitEndCalendarDate" on "clubLetterPage1" screen
    And I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "memberEmail" on "clubLetterPage1" screen
    And I enter "0300000000" details in "phoneHome" on "clubLetterPage1" screen
    And I enter "0400000000" details in "phoneMobile" on "clubLetterPage1" screen
    And I take a screenshot
    And I click "submit" on "clubLetterPage1" screen
    Then I capture the address navigated to
    And I check the page address contains "letter.html?referenceNo=FMD"
    And I take a screenshot

  #SR 14 Apr 20 - DAC-4739 - Added new test to accomodate AFR-587 changes
  #Dry run completed on QA
  @TestMemberValidationClubLOIForm-NonClubMember
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify Member validation does not proceed for RACV Club letter of introduction form when non club member combination of member id and last name are used
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?clubpath=%2Fcontent%2Fracv%2Fen%2Fhome%2Ftravel-leisure%2Fracv-club%2Fmembership%2Freciprocal-clubs%2Fasia%2Fsingapore%2Fjcr%3Acontent%2Flist%2Fclubdetails0&disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details into the form - incorrect combination of member id and last name
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "clubLetterPage1" screen
    And I select "Mr" value for "memberTitle" drop down in "clubLetterPage1" screen using selection method "visibleText"
    And I enter "TestFirstURLENV" details in "memberFirstName" on "clubLetterPage1" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "memberLastName" on "clubLetterPage1" screen
    And I click "visitStartCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    And I click "visitStartCalendarDate" on "clubLetterPage1" screen
    And I take a screenshot
    And I click "visitEndCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitEndCalendarNextMonth" on "clubLetterPage1" screen
    #Pick visitStartCalendarDate + 1day
    And I click "visitEndCalendarDate" on "clubLetterPage1" screen
    And I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "memberEmail" on "clubLetterPage1" screen
    And I enter "0300000000" details in "phoneHome" on "clubLetterPage1" screen
    And I enter "0400000000" details in "phoneMobile" on "clubLetterPage1" screen
    And I take a screenshot
    And I click "submit" on "clubLetterPage1" screen
    And I capture the address navigated to
    #Verify form submission was a success
    Then I verify "errorMessage" element is visible on "clubLetterPage1" screen
    And I take a screenshot

  #SR 27 Jul 21 - DAC-9149
  #Dry run - Completed on 27th Jul 21
  @TestClubTourFormSubmission
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify Club tour request form is submitted successfuly and a reference is returned when correct details are entered
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/join-racv-club/book-a-tour.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I enter "Test O'first-URLENV" details in "firstName" on "clubBookTourForm" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "clubBookTourForm" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddress" on "clubBookTourForm" screen
    And I enter "0400000000" details in "mobileNumber" on "clubBookTourForm" screen
    And I enter "12345678" details in "clubMembersipNumber" on "clubBookTourForm" screen
    And I click "tourDateField" on "clubBookTourForm" screen
    And I click "nextMonthButton" on "clubBookTourForm" screen
    #Verify Sun, Tue, Fri, Sat are disabled
    And I verify "sundayDisabled" element exists on "clubBookTourForm" screen
    And I verify "tuesdayDisabled" element exists on "clubBookTourForm" screen
    And I verify "fridayDisabled" element exists on "clubBookTourForm" screen
    And I verify "saturdayDisabled" element exists on "clubBookTourForm" screen
    And I take a screenshot
    And I click "lastThursdayOfMonth" on "clubBookTourForm" screen
    And I enter "This is an automated test, please ignore" details in "commentsField" on "clubBookTourForm" screen
    And I select "1" value for "howDidYouFindOutDropDown" drop down in "clubBookTourForm" screen using selection method "index"
    #And I verify "privacyText" element exists on "clubBookTourForm" screen
    And I take a screenshot
    And I click "submitButton" on "clubBookTourForm" screen
    And I wait for "referenceNumber" on "thankYouPage" screen or "30" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Verify form submission was a success
    Then I check the page address contains "/travel-leisure/racv-club/membership/member-offers/thank-you.html?referenceNo=FMD"
