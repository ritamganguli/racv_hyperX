#Author: Sumanta Roy
#Date Created : 18 Nov 19
Feature: This feature tests the successful AEM form submissions for forms created or updated for AEM Forms project Release 0 and 1

  #Dry run completed on 18 Nov 19
  @TestBSGSubscribeFormSubmission
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the Bourke Street Green Subscribe form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "PURL1/content/racv/microsites/bourke-street-green.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "bsgFirstName" on "bsgHomePage" screen or "10" seconds before proceeding
    When I enter "TestFirstURLENV" details in "bsgFirstName" on "bsgHomePage" screen
    And I enter "TestLast" details in "bsglastName" on "bsgHomePage" screen
    And I enter "digitalqa@racv.com.au" details in "bsgEmail" on "bsgHomePage" screen
    And I enter "0400000000" details in "bsgPhone" on "bsgHomePage" screen
    And I click "offersCheckBox" on "bsgHomePage" screen
    And I take a screenshot
    And I click "subscribeButton" on "bsgHomePage" screen using Action class
    #Submitting using publisher urls results in redirection to geohome.html when successful
    And I check the page address contains "/geohome.html"
    #And I wait for "subscribeThankYou" on "bsgHomePage" screen or "10" seconds before proceeding
    #Then I verify "subscribeThankYou" copy text on "bsgHomePage" screen
    And I capture the address navigated to

  #Dry run completed on 18 Nov 19
  @TestBSGContactUsFormSubmission
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the Bourke Street Green Contact us form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "PURL1/content/racv/microsites/bourke-street-green.html?disableCaptcha=true"
    And I wait for "bsgContactFirstName" on "bsgHomePage" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    When I enter "TestFirstURLENV" details in "bsgContactFirstName" on "bsgHomePage" screen
    And I enter "TestLast" details in "bsgContactLastName" on "bsgHomePage" screen
    And I enter "digitalqa@racv.com.au" details in "bsgContactEmail" on "bsgHomePage" screen
    And I enter "0400000000" details in "bsgContactPhone" on "bsgHomePage" screen
    And I click "bsgContactEnquiryType" on "bsgHomePage" screen
    And I select "General enquiry" value for "bsgContactEnquiryType" drop down in "bsgHomePage" screen using selection method "visibleText"
    And I enter "This is a test general enquiry. Please ignore" details in "bsgContactEnquiryComments" on "bsgHomePage" screen
    And I take a screenshot
    And I click "bsgContactUsSubmitButton" on "bsgHomePage" screen using Action class
    #Submitting using publisher urls results in redirection to geohome.html when successful
    And I check the page address contains "/geohome.html"
    #And I wait for "subscribeThankYou" on "bsgHomePage" screen or "10" seconds before proceeding
    #Then I verify "subscribeThankYou" copy text on "bsgHomePage" screen
    And I capture the address navigated to

  #Dry run completed on 14 Jun 2022 - DM
  @TestBSGLoyaltyFormSubmission
  Scenario: Verify the Bourke Street Green loyalty form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "PURL1/content/racv/microsites/bourke-street-green/friends.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "bsgLoyaltyFirstName" on "bsgFriendsPage" screen or "10" seconds before proceeding
    When I enter "TestFirstURLENV" details in "bsgLoyaltyFirstName" on "bsgFriendsPage" screen
    And I enter "TestLast" details in "bsgLoyaltyLastName" on "bsgFriendsPage" screen
    And I enter "digitalqa@racv.com.au" details in "bsgLoyaltyEmail" on "bsgFriendsPage" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "bsgLoyaltyCardNumber" on "bsgFriendsPage" screen
    And I enter "04/08/1994" details in "bsgLoyaltyDOB" on "bsgFriendsPage" screen
    And I enter "0400000000" details in "bsgLoyaltyPhone" on "bsgFriendsPage" screen
    And I take a screenshot
    And I click "submitLoyaltyButton" on "bsgFriendsPage" screen using Action class
    #Submitting using publisher urls results in redirection to geohome.html when successful
    And I check the page address contains "/geohome.html"
    And I capture the address navigated to

  #Decomissioned 24/4/23 - Apply form now redirects to https://my.racv.com.au/s/club-membership
  @TestApplyClubMembershipFormSubmission
  Scenario: Verify the Apply Club membership form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/membership/join-racv-club/apply.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "membershipOptions" on "applyClubMembershipPage" screen or "10" seconds before proceeding
    When I select "Active Membership - $99 p/m or $1,188 p/a" value for "membershipOptions" drop down in "applyClubMembershipPage" screen using selection method "visibleText"
    And I click "preferredLocationCity" on "applyClubMembershipPage" screen using Action class
    #Personal details
    And I select "Mr" value for "title" drop down in "applyClubMembershipPage" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "firstName" on "applyClubMembershipPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "applyClubMembershipPage" screen
    And I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "email" on "applyClubMembershipPage" screen
    And I enter "0400000000" details in "homePhoneNo" on "applyClubMembershipPage" screen
    And I enter "0400000000" details in "mobilePhoneNo" on "applyClubMembershipPage" screen
    And I enter "12345678" details in "racvMembershipNo" on "applyClubMembershipPage" screen
    And I enter "15/08/1980" details in "applicantDOB" on "applyClubMembershipPage" screen
    And I click "firstName" on "applyClubMembershipPage" screen using Action class
    And I take a screenshot
    And I click "personalInterestSocial" on "applyClubMembershipPage" screen using Action class
    And I click "personalInterestFood" on "applyClubMembershipPage" screen using Action class
    And I click "personalInterestBusiness" on "applyClubMembershipPage" screen using Action class
    And I click "personalInterestLectures" on "applyClubMembershipPage" screen using Action class
    And I click "personalInterestFitness" on "applyClubMembershipPage" screen using Action class
    And I click "personalInterestChildActivities" on "applyClubMembershipPage" screen using Action class
    And I take a screenshot
    #Company Details
    And I enter "RACV" details in "companyName" on "applyClubMembershipPage" screen
    And I enter "Test Analyst" details in "position" on "applyClubMembershipPage" screen
    #Residential Address
    And I enter "473 bourke street" details in "streetAddress" on "applyClubMembershipPage" screen
    And I enter "Melbourne" details in "suburbAddress" on "applyClubMembershipPage" screen
    And I select "VIC" value for "stateAddress" drop down in "applyClubMembershipPage" screen using selection method "visibleText"
    And I enter "3000" details in "postcodeAddress" on "applyClubMembershipPage" screen
    And I enter "This is a test submission. Please ignore." details in "comments" on "applyClubMembershipPage" screen
    And I take a screenshot
    #Below 2 are non-mandatory
    And I click "marketingConsent" on "applyClubMembershipPage" screen using Action class
    And I click "commsByEmail" on "applyClubMembershipPage" screen using Action class
    And I click "termsAndContitions" on "applyClubMembershipPage" screen using Action class
    And I click "submitButton" on "applyClubMembershipPage" screen
    And I wait for "submitButton" to disappear on "applyClubMembershipPage" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

  #Dry run completed on 19 Nov 19
  #Locators are different in QA and Stage
  @TestOrderBrochureFormSubmission
  Scenario: Verify the Order a physical brochure form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "https://racv-test63-01.adobecqms.net/travel-leisure/travel-discounts/cruises-and-tours/order-a-brochure.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test tour" details in "tourName" on "orderBrochurePage" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "orderBrochurePage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "orderBrochurePage" screen
    And I enter "0400000000" details in "phoneNumber" on "orderBrochurePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "orderBrochurePage" screen
    And I enter "473 Bourke Street" details in "address" on "orderBrochurePage" screen
    And I enter "Melbourne" details in "suburb" on "orderBrochurePage" screen
    And I select "VIC" value for "state" drop down in "orderBrochurePage" screen using selection method "visibleText"
    And I enter "3000" details in "postCode" on "orderBrochurePage" screen
    And I enter "This is a test query. Please ignore." details in "comments" on "orderBrochurePage" screen
    And I enter "2" details in "noOfTravellers" on "orderBrochurePage" screen
    And I click "marketingConsent" on "orderBrochurePage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "orderBrochurePage" screen
    Then I capture the address navigated to
    And I verify "thankYouMessage" copy text on "orderBrochurePage" screen

  #Dry run completed on 19 Nov 19
  #Locators are different in QA and Stage
  #SR 21 Jan 21 - Updated test case
  @TestResortsMakeEnquiryFormSubmission
  #@Regression.chrome.desktop
  #@Regression.safari.desktop
  #@Regression-forms.chrome.desktop
  #@Regression-forms.safari.desktop
  Scenario: Verify the Resorts make an enqiry form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts/contact-us.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I select "Cobram" value for "selectResort" drop down in "resortmakeEnquiryPage" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "firstName" on "resortmakeEnquiryPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "resortmakeEnquiryPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "resortmakeEnquiryPage" screen
    And I enter "0400000000" details in "phoneNumber" on "resortmakeEnquiryPage" screen
    And I enter "This is a test submission. Please ignore." details in "comments" on "resortmakeEnquiryPage" screen
    And I take a screenshot
    And I click "submitButton" on "resortmakeEnquiryPage" screen
    Then I capture the address navigated to
    And I verify "thankYouMessage" element exists on "resortmakeEnquiryPage" screen
    And I take a screenshot

  #Dry run completed on 19 Nov 19
  #SR 21 Jan 21 - Updated test case
  @TestSubscribeCruiseNewsletterFormSubmission
  #@Regression.chrome.desktop
  #@Regression.safari.desktop
  #@Regression-forms.chrome.desktop
  #@Regression-forms.safari.desktop
  Scenario: Verify the Subscribe to Cruise Newsletter form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-experiences/holidays.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "cruiseNewsSubscribePage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "cruiseNewsSubscribePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "cruiseNewsSubscribePage" screen
    And I enter "9988776655" details in "mobileNo" on "cruiseNewsSubscribePage" screen
    And I click "racvMemberRadio" on "cruiseNewsSubscribePage" screen
    And I enter "12345678" details in "membershipNo" on "cruiseNewsSubscribePage" screen
    And I click "marketingConsent" on "cruiseNewsSubscribePage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "cruiseNewsSubscribePage" screen
    Then I capture the address navigated to
    And I verify "thankYouMessage" element exists on "cruiseNewsSubscribePage" screen
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on 19 Nov 19
  #This page is not present in QA.
  @TestRoyalPinesLoyaltyFormSubmission
  Scenario: Verify the Royal Pines Loyalty form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "https://staging-cloudfront.racv.com.au/travel-leisure/racv-resorts/our-destinations/royal-pines-gold-coast-resort/offers/royal-pines-loyalty.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "royalPinesLoyaltyPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "royalPinesLoyaltyPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "royalPinesLoyaltyPage" screen
    And I enter "12345678" details in "cardNumber" on "royalPinesLoyaltyPage" screen
    And I enter "15/12/1975" details in "dob" on "royalPinesLoyaltyPage" screen
    And I enter "0400000000" details in "mobileNumber" on "royalPinesLoyaltyPage" screen
    And I click "racvMarketingConsent" on "royalPinesLoyaltyPage" screen using Action class
    And I click "royalPinesMarketingConsent" on "royalPinesLoyaltyPage" screen using Action class
    And I click "termsAndConditions" on "royalPinesLoyaltyPage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "royalPinesLoyaltyPage" screen
    Then I capture the address navigated to
    And I verify "thankYouMessage" element exists on "royalPinesLoyaltyPage" screen
    And I take a screenshot