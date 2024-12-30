# Author: Viengcumm Thongvilu
# Date Created : 11 Jul 19
# This feature file contains the PROD sanity tests, these steps may differ to the same lower environment tests
Feature: This feature file contains the PROD sanity tests

  @TestBuildNumber-PROD
  Scenario: Verify that correct build number is being displayed on page source for the environment
    Given I verify the build number for "URL/"
    And I take a screenshot

  #Dry run completed on 20 Aug 19
  #SR 3 Oct 19 - Updated test post Desktop mega menu change
  #SR 226 Nov 19 - Updated as per latest content refresh
  #SR 3 Sep 21 - DAC-9326 changes
  @TestRACVDesktopMegaMenuNewsLifestyle-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Validate the links and navigation for News & Lifestyle mega menu items on Desktop
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "newsLifestyleDeskMenuLink" on "racvHomePage" screen
    And I wait for "newsLifestyleHeading" on "racvHomePage" screen or "10" seconds before proceeding
    #I land on royal auto index
    Then I check the page address contains "/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/"
    #News
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    And I click "newsLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "newsLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/news.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Transport
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "transportLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "transportLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/transport.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Lifestyle & Home
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "lifestyleHomeLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "lifestyleHomeLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/lifestyle-home.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Property
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "propertyLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "propertyLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/property.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Travel
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "travelLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "travelLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/travel.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Sustainability
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "sustainabilityRaLink" on "newsLifestyleDeskMenuOverlay" screen
    And I wait for "sustainabilityRaLink" to disappear on "newsLifestyleDeskMenuOverlay" screen or "10" seconds before proceeding
    And I check the page address contains "/royalauto/sustainability.html"
    And I take a screenshot
    And I navigate to "URL/"

  #Dry run completed on 15 Jul 19
  #DAC-2759 - SR 2 Dec 19 - Added step to verify navigation to result page for Competition
  #SR 24 Dec 2020 - Updated link to Competition search result first item page as per latest
  #SR 3 Sep 21 - Updated for DAC-9326
  @TestSearchOnHomePage-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify Search on RACV Home page for key search items to establish search is functioning as expected
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "searchOnHomePage" on "racvHomePage" screen
    And I take a screenshot
    #Search for custom user input
    And I enter "insurance" details in "searchInputBox" on "searchOverlay" screen
    And I take a screenshot
    And I click "searchRacvButton" on "searchOverlay" screen
    And I wait for "searchTitleInsurance" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleInsurance" copy text on "searchResultsPage" screen
    And I take a screenshot
    And I navigate to "URL/"
    And I click "searchOnHomePage" on "racvHomePage" screen
    #Validate search recommendation feature
    And I enter "insur" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchSuggestInsurance" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "searchSuggestInsurance" on "searchOverlay" screen
    And I take a screenshot

  #Dry run completed on 16 Aug 19
  @TestLoginButtonOnHomePage-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Login button and its navigation on RACV home page
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    And I wait for "loginButtonHomePage" on "racvHomePage" screen or "10" seconds before proceeding
    Then I take a screenshot
    And I click "loginButtonHomePage" on "racvHomePage" screen using JavaScript
    And I wait for "loginButtonHomePage" to disappear on "racvHomePage" screen or "10" seconds before proceeding
    And I check page address is "https://my.racv.com.au/s/login/"
    And I take a screenshot

  #Dry run completed
  #SR 14 Apr 2020 - DAC-4739 changes related to AFR-587
  #SR 27 Apr 2020 - DAC-4869 - Added analytics check for form node in Step 1.
  @TestRACVClubLetterIntroForm-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV Club letter of introduction form can be submitted successfully when all valid details are entered
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?clubpath=%2Fcontent%2Fracv%2Fen%2Fhome%2Ftravel-leisure%2Fracv-club%2Fmembership%2Freciprocal-clubs%2Fasia%2Fsingapore%2Fjcr%3Acontent%2Flist%2Fclubdetails0&disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    And I wait for "membershipNumber" on "clubLetterPage1" screen or "10" seconds before proceeding
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubLetterPage1" screen
    And I select "Mr" value for "memberTitle" drop down in "clubLetterPage1" screen using selection method "visibleText"
    And I enter "testURLENV" details in "memberFirstName" on "clubLetterPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberLastName" on "clubLetterPage1" screen
    And I click "visitStartCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    #And I click "visitStartCalendarNextMonth" on "clubLetterPage1" screen
    And I click "visitStartCalendarDate" on "clubLetterPage1" screen
    And I click "visitEndCalendarIcon" on "clubLetterPage1" screen
    #And I click "visitEndCalendarNextMonth" on "clubLetterPage1" screen
    #Pick visitStartCalendarDate + 1day
    And I click "visitEndCalendarDate" on "clubLetterPage1" screen
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
    And I wait for "submit" to disappear on "clubLetterPage1" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    #Verify form submission was a success
    Then I check the page address contains "/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html?referenceNo=FMD"
    And I take a screenshot

  @TestMemberValidationClubLOIForm-NonClubMember-PROD
  @Sanity-prod.chrome.desktop
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

  @TestContactRACVForm-validMember-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Contact RACV form can be submitted successfully when all valid details are entered, refresh the page after successful submission to ensure error page appears
    #launch app form
    Given I launch app page "URL/contact-us/enquire-online.html?disableCaptcha=true"
    And I wait for "membershipId" on "contactRACVFormPage1" screen or "5" seconds before proceeding
    #Get analytics data
    And I get object data for "digitalData"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    #Enter details into the form
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipId" on "contactRACVFormPage1" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "contactRACVFormPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "contactRACVFormPage1" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "contactRACVFormPage1" screen
    And I enter "0400000000" details in "phoneNumber" on "contactRACVFormPage1" screen
    And I click "natureOfBusinessDropDown" on "contactRACVFormPage1" screen
    And I click "natureOfBusinessFeedbackResult" on "contactRACVFormPage1" screen
    And I enter "This is an automated test query, please ignore" details in "comments" on "contactRACVFormPage1" screen
    And I take a screenshot
    #Check analytics tagging for forms node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "email racv - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "email racv" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "natureofbusiness" for "digitalData"
    And I wait for "submitButton" on "contactRACVFormPage1" screen or "5" seconds before proceeding
    And I click "submitButton" on "contactRACVFormPage1" screen
    And I wait for "copyReferenceText" on "contactRACVFormPage1" screen or "30" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    #Verify form submission was a success
    And I verify "copyReferenceText" element is visible on "contactRACVFormPage1" screen
    #Refresh the page and ensure an error appears
    Then I refresh the page
    And I check the page address contains "/error/pagenotfound.html"
    And I capture the address navigated to
    And I take a screenshot

  @TestContactRACVForm-invalidMember-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Contact RACV form member validation is working when invalid details are submitted
    #launch app form
    Given I launch app page "URL/contact-us/enquire-online.html?disableCaptcha=true"
    And I wait for "membershipId" on "contactRACVFormPage1" screen or "5" seconds before proceeding
    #Get analytics data
    And I get object data for "digitalData"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    #Enter details into the form
    When I enter "00000000" details in "membershipId" on "contactRACVFormPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "contactRACVFormPage1" screen
    And I click "natureOfBusinessDropDown" on "contactRACVFormPage1" screen
    And I click "natureOfBusinessFeedbackResult" on "contactRACVFormPage1" screen
    And I enter "This is an automated test query, please ignore" details in "comments" on "contactRACVFormPage1" screen
    And I take a screenshot
    And I click "submitButton" on "contactRACVFormPage1" screen
    And I wait for "memberValidationError" on "contactRACVFormPage1" screen or "30" seconds before proceeding
    And I take a screenshot
    #Verify form member validation error is visible
    And I verify "memberValidationError" element is visible on "contactRACVFormPage1" screen
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "email racv - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "email racv" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.error" value equals "sorry the member number youve entered is invalid. please try again." for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "on page error" for "digitalData"

  @TestRACVMovieTickets-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV movie tickets form navigates to neat idea website successfully when all valid details are entered
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-benefits-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details on Page 2
    And I wait for "membershipNumber" on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    #Check analytics tagging for form node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "purchase movie tickets - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "purchase movie tickets" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    #And I verify "$.product.productInfo.productName" value equals "membership:member discount:movie tickets:na" for "digitalData"
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    #Check domain navigated to
    Then I check the page address contains "https://stores.neatideas.com.au/racv/"
    And I capture the address navigated to
    And I take a screenshot

  @TestRACVMovieTicketsInvalidSubmission-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV movie tickets form blocks invalid member submission
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-benefits-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details on Page 2
    And I wait for "membershipNumber" on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "invalid" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    #Ensure submission failed
    And I verify "invalidMemberError" element is visible on "movieTicketsPage2-p3" screen
    And I take a screenshot

  #Dry run completed on 3 Jul 19
  #SR 1 Apr 2020 - DAC-4664 - Added analytics checks
  #SR 9 Jul 2020 - AEMU-776 - Updated analytics tag value
  #SR 22 Mar 2021 - DAC - 7818 - Updated count of results returned
  @TestRACVResortsSearchForm1-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when membership type is selected as Book as Guest and default options for other search criteria
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    #And I dismiss GDPR notification if it exists
    #Enter details into the form
    And I wait for "membershipType" on "resortsPage1" screen or "5" seconds before proceeding
    And I click "membershipType" on "resortsPage1" screen
    And I click "memTypeGuest" on "resortsPage1" screen
   	And I take a screenshot
    #Check analytics - no relevant tags generated here
    And I get object data for "digitalData"
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #Check analytics tags for search node
    And I get object data for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "resorts search" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value starts with "7" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "all properties" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  #Dry run completed on 3 Jul 19
  @TestRACVResortsSearchForm2-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as RACV member, Vic all resorts, two adults, one kid for three nights
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "resortsWhere" on "resortsPage1" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in Vic
    And I click "resortsWhereVIC" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 3 nights
    And I click "resortsWhenEnd3Nights" on "resortsPage1" screen
    And I click "apply" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    #Add a kid
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select RACV member and enter details
    And I click "memTypeRACVMember" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  #Dry run completed
  #SR 26 Mar 2020 - DAC-4657 - added analytics tagging checks
  @TestRacvMemberWoolworthsForm-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV Member validation form for woolworths is up and running
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-validation-woolworths.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #enter details on page 1
    And I enter "15122291" details in "membershipNo" on "wooliesMemberValidation" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "wooliesMemberValidation" screen
    And I enter "Test O'test-test" details in "familyName" on "wooliesMemberValidation" screen
    And I enter "randomEmailGen" details in "emailAddress" on "wooliesMemberValidation" screen
    And I take a screenshot
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "woolworths member validation - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "woolworths member validation" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    #And I verify "$.product.productInfo.productName" value equals "membership:member discount: woolworths:na" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    And I click "submitButton" on "wooliesMemberValidation" screen
    And I wait for "wooliesRacvAnalytics" on "wooliesMemberValidation" screen or "30" seconds before proceeding
    And I verify "wooliesRacvAnalytics" element exists on "wooliesMemberValidation" screen
    And I capture the address navigated to
    Then I check the page address contains "https://giftcards.woolworths.com.au/"
    And I capture the address navigated to
    And I take a screenshot

  #Dry run completed on 9 Jul 19
  @TestRacvClubBookingForm-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the RACV Club Booking form can be submitted successfully when all valid details are entered
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #verify we are on find member page
    And I wait for "pageTitle" on "clubFormPage1" screen or "10" seconds before proceeding
    When I verify "pageTitle" copy text on "clubFormPage1" screen
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
    And I take a screenshot
    #enter details on page 2
    And I wait for "pageTitle" on "clubFormPage2" screen or "10" seconds before proceeding
    And I verify "pageTitle" element exists on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    And I wait for "submitButton" to disappear on "clubFormPage2" screen or "10" seconds before proceeding
    #validate we are on correct page
    #Then I verify "selectFirstRoom" element exists on "clubFormPage3" screen
    Then I check the page address contains "https://bookings.travelclick.com"
    And I capture the address navigated to
    And I take a screenshot

  @TestRacvClubMemberValidationNegative-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the club member validation blocks non club members
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/city-club/club-member-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #7545947 is a non club member
    And I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "clubFormPage2" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "clubFormPage2" screen
    And I take a screenshot
    And I click "submitButton" on "clubFormPage2" screen
    And I wait for "submitButton" to disappear on "clubFormPage2" screen or "10" seconds before proceeding
    #Ensure submission faile
    And I verify "memberValidationError" element is visible on "clubFormPage2" screen
    And I take a screenshot

  #Added as resorts contact us form is not present now
  @TestClubContactUsFormSubmission-Prod
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Club Contact Us form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/contact-us.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "clubContactUsPage" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "clubContactUsPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "clubContactUsPage" screen
    And I enter "0400000000" details in "phoneNumber" on "clubContactUsPage" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "clubMembershipNumber" on "clubContactUsPage" screen
    And I select "General Enquiries" value for "enquiryType" drop down in "clubContactUsPage" screen using selection method "visibleText"
    And I enter "Test enquiry. Please ignore" details in "comments" on "clubContactUsPage" screen
    And I take a screenshot
    #Analytics checks for form object
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "contact racv club - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "contact racv club" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    #Analytics checks for product object - uncomment below once QA is synced with latest content, Stage is fine
    #And I verify "$.product.productInfo.productName" value equals "leisure:racv club:na:na" for "digitalData"
    And I click "submitButton" on "clubContactUsPage" screen using Action class
    And I wait for "referenceNumber" on "thankYouPage" screen or "30" seconds before proceeding
    Then I capture the address navigated to
    And I get object data for "digitalData"
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on MSQA on 9 Jan 2020
  #updated locators on 17 Jan 2020
  #SR 28 Apr 2020 - DAC-4870 - Added analytics checks for form nodes. Steps commented as tags do not exist in QA.
  @TestAssistanceBySMSFormSubmission-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Assistance by SMS Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/contact-us/assistance-by-sms.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "title" on "assistanceBySmsPage" screen or "10" seconds before proceeding
    And I click "title" on "assistanceBySmsPage" screen
    And I click "titleOption" on "assistanceBySmsPage" screen
    And I take a screenshot
    And I enter "Test O'first-URLENV" details in "firstName" on "assistanceBySmsPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "assistanceBySmsPage" screen
    And I enter "12345678" details in "memberNumber" on "assistanceBySmsPage" screen
    And I enter "473 Bourke Street" details in "address" on "assistanceBySmsPage" screen
    And I enter "Melbourne" details in "suburb" on "assistanceBySmsPage" screen
    And I click "state" on "assistanceBySmsPage" screen
    And I click "stateValue" on "assistanceBySmsPage" screen
    And I enter "3000" details in "postcode" on "assistanceBySmsPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "assistanceBySmsPage" screen
    And I enter "0400000000" details in "mobile" on "assistanceBySmsPage" screen
    And I take a screenshot
    #Analytics check for form node at Step 1
    And I get object data for "digitalData"
    #And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    #And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    #And I verify "$.form.formInfo.stepName" value equals "assistance by sms - start" for "digitalData"
    #And I verify "$.form.formInfo.formName" value equals "assistance by sms" for "digitalData"
    #And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submitButton" on "assistanceBySmsPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    #Analytics check for form node at Step 2
    And I get object data for "digitalData"
    #And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    #And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    #And I verify "$.form.formInfo.stepName" value equals "assistance by sms - complete" for "digitalData"
    #And I verify "$.form.formInfo.formName" value equals "assistance by sms" for "digitalData"
    #And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

  @TestERAPage-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify that ERA page is displaying the 3 compare cards
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I verify "card1Price" element is visible on "roadsideAssistHomePage" screen
    And I verify "card2Price" element is visible on "roadsideAssistHomePage" screen
    And I verify "card3Price" element is visible on "roadsideAssistHomePage" screen
    And I take a screenshot

  @TestRACVTradesWidget-Postcode-Variant-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify Trades Widget post code only variant
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance/plumbing.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
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

  @TestRACVTradesWidget-Postcode-Keyword-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify Trades Widget search by postcode and keyword
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I verify "tradePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
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
    #enter heating & cooling and select first result
    And I enter "heating & cooling" details in "tradeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "tradesWidgetPage" screen
    And I wait for "getQuoteButton" to disappear on "tradesWidgetPage" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Heating%20%26%20Cooling&postCode=3000%2C%20Melbourne"
    And I take a screenshot

  @TestRACVTradesWidget-Suburb-Trade-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify Trades Widget search by suburb and select from all trade
    #launch app page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    #verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I verify "tradePlaceHolder" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #click submit and verify error states
    And I click "getQuoteButton" on "tradesWidgetPage" screen
    And I verify "tradeInputError" element is visible on "tradesWidgetPage" screen
    And I verify "postcodeInputError" element is visible on "tradesWidgetPage" screen
    And I take a screenshot
    #enter Noble and select result
    And I enter "Noble" details in "postcodeInput" on "tradesWidgetPage" screen
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
    And I check the page address contains "/trades/s/trades-quotes?category=Electrical&postCode=3174%2C%20Noble%20Park"
    And I take a screenshot

  @TestBSGHomePageLoad-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Bourke Street Green microsite page loads as expected and validate menu links, subcribe and contact us fields
    #launch app form
    Given I launch app page "URL/../../microsites/bourke-street-green.html"
    And I dismiss GDPR notification if it exists
    And I wait for "bsgPageHeader" on "bsgHomePage" screen or "10" seconds before proceeding
    When I verify "bsgPageHeader" copy text on "bsgHomePage" screen
    #Check if menu links are there
    Then I verify "bsgMenuLink" element exists on "bsgHomePage" screen
    #Check Subscribe form fields are present
    And I verify "bsgFirstName" element exists on "bsgHomePage" screen
    And I verify "bsglastName" element exists on "bsgHomePage" screen
    And I verify "bsgEmail" element exists on "bsgHomePage" screen
    And I verify "bsgPhone" element exists on "bsgHomePage" screen
    And I verify "offersCheckBox" element exists on "bsgHomePage" screen
    And I click "offersCheckBox" on "bsgHomePage" screen
    And I verify "privacyText" element exists on "bsgHomePage" screen
    And I verify "subscribeButton" element exists on "bsgHomePage" screen
    And I take a screenshot
    #Check Enquiry form fields are present
    And I verify "bsgContactFirstName" element exists on "bsgHomePage" screen
    And I verify "bsgContactLastName" element exists on "bsgHomePage" screen
    And I verify "bsgContactEmail" element exists on "bsgHomePage" screen
    And I verify "bsgContactPhone" element exists on "bsgHomePage" screen
    And I verify "bsgContactEnquiryType" element exists on "bsgHomePage" screen
    And I verify "bsgContactEnquiryComments" element exists on "bsgHomePage" screen
    And I click "bsgContactEnquiryComments" on "bsgHomePage" screen
    And I verify "bsgContactPrivacyText" element exists on "bsgHomePage" screen
    And I verify "bsgContactUsSubmitButton" element exists on "bsgHomePage" screen
    And I take a screenshot

  @TestSmartPlaceWebPageLoad-PROD
  @Sanity-prod.chrome.desktop
  Scenario: Verify the Smartplace web-page loads as expected and validate logo, top links, Archive link, footer section
    #launch app form
    Given I launch app page "URL/../../microsites/smartplace.html"
    And I dismiss GDPR notification if it exists
    And I wait for "logoImage" on "smartplaceHomePage" screen or "10" seconds before proceeding
    #Check Logo
    When I verify "logoImage" element is visible on "smartplaceHomePage" screen
    And I take a screenshot
    #Working Together link
    Then I click "workingTogetherLink" on "smartplaceHomePage" screen
    And I wait for "workingTogetherLink" to disappear on "smartplaceHomePage" screen or "10" seconds before proceeding
    And I check the page address contains "/working-together.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "URL/../../microsites/smartplace.html"
    #Working digitally link
    And I click "workingDigitallyLink" on "smartplaceHomePage" screen
    And I wait for "workingDigitallyLink" to disappear on "smartplaceHomePage" screen or "10" seconds before proceeding
    And I check the page address contains "/working-digitally.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "URL/../../microsites/smartplace.html"
    #485+473 Bourke Link
    And I click "473485BourkeLink" on "smartplaceHomePage" screen
    And I wait for "473485BourkeLink" to disappear on "smartplaceHomePage" screen or "10" seconds before proceeding
    And I check the page address contains "/485-and-473-bourke.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "URL/../../microsites/smartplace.html"
    #Charli button
    And I verify "charliButton" element is visible on "smartplaceHomePage" screen
    #Archive section
    And I click "archiveTitleText" on "smartplaceHomePage" screen
    And I take a screenshot
    #Discover more button
    And I click "discoverMoreButton" on "smartplaceHomePage" screen
    And I wait for "discoverMoreButton" to disappear on "smartplaceHomePage" screen or "10" seconds before proceeding
    And I check the page address contains "/news.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "URL/../../microsites/smartplace.html"
    #Footer links container
    And I click "footerBar" on "smartplaceHomePage" screen
    And I verify "footerLinkContainer" element exists on "smartplaceHomePage" screen
    And I take a screenshot

  @TestMemberDiscountCategories-PROD
  @Sanity-prod.chrome.desktop
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
    And I click "viewAllButtonTab1" on "memberDiscountsPage" screen
    And I switch to "NEW" browser tab
    And I capture the address navigated to
    And I check page address is "https://racv.clubconnect.com.au/en"

  @TestRACVSolarFormHomeSubmission-Prod
  @Sanity-prod.chrome.desktop
  Scenario: Verify the home RACV Solar form submits and redirects to thank-you page
   	Given I launch app page "URL/home/solar/get-a-quote.html?disableCaptcha=true"
   	And I dismiss GDPR notification if it exists
   	And I click "installOption" on "solarFormPage" screen
   	And I click "mainReason" on "solarFormPage" screen
   	And I click "productPackage" on "solarFormPage" screen
   	And I select "I'm ready to install now" value for "installEnquiry" drop down in "solarFormPage" screen using selection method "visibleText"
   	And I take a screenshot
   	And I enter "Test O'first-URLENV" details in "firstNameInput" on "solarFormPage" screen
    And I enter "Test O'last-name" details in "lastNameInput" on "solarFormPage" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddressInput" on "solarFormPage" screen
    And I enter "0300000000" details in "phoneNumberInput" on "solarFormPage" screen
    And I click "emailOption" on "solarFormPage" screen
    And I click "howDidYouFindOutDropDown" on "solarFormPage" screen
    And I click "howDidYouFindOutOtherOption" on "solarFormPage" screen
    And I take a screenshot
    And I click "subscribeCheckbox" on "solarFormPage" screen
    And I enter "485 Bourke Street" details in "addressInput" on "solarFormPage" screen
    And I enter "Melbourne" details in "suburbInput" on "solarFormPage" screen
    And I click "stateDropdown" on "solarFormPage" screen
    And I click "vicDropDownOption" on "solarFormPage" screen
    And I enter "3000" details in "postcodeInput" on "solarFormPage" screen
    And I take a screenshot
    When I click "submitButton" on "solarFormPage" screen
    And I wait for "submitButton" to disappear on "solarFormPage" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I capture the address navigated to
    And I check the page address contains "/home/solar.html"

  @TestRACVSolarMyFormBusinessSubmission-Prod
  @Sanity-prod.chrome.desktop
  Scenario: Verify the business option of RACV Solar form submits and redirects to thank-you page
   	Given I launch app page "URL/home/solar/get-a-quote.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I click "installBusinessOption" on "solarFormPage" screen
    And I click "mainBuisnessReason" on "solarFormPage" screen
    And I select "I'm ready to install now" value for "installEnquiry" drop down in "solarFormPage" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Test O'RACV" details in "businessNameInput" on "solarFormPage" screen
    And I enter "Test O'first-URLENV" details in "firstNameInput" on "solarFormPage" screen
    And I enter "Test O'last-name" details in "lastNameInput" on "solarFormPage" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddressInput" on "solarFormPage" screen
    And I enter "0300000000" details in "phoneNumberInput" on "solarFormPage" screen
    And I click "emailOption" on "solarFormPage" screen
    And I click "howDidYouFindOutDropDown" on "solarFormPage" screen
    And I click "howDidYouFindOutOtherOption" on "solarFormPage" screen
    And I take a screenshot
    And I click "subscribeCheckbox" on "solarFormPage" screen
    And I enter "485 Bourke Street" details in "addressInput" on "solarFormPage" screen
    And I enter "Melbourne" details in "suburbInput" on "solarFormPage" screen
    And I click "stateDropdown" on "solarFormPage" screen
    And I click "vicDropDownOption" on "solarFormPage" screen
    And I enter "3000" details in "postcodeInput" on "solarFormPage" screen
    And I take a screenshot
    When I click "submitButton" on "solarFormPage" screen
    And I wait for "submitButton" to disappear on "solarFormPage" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I capture the address navigated to
    And I check the page address contains "/home/solar.html"