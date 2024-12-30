#Author: Sumanta Roy
#Date Created : 21 Nov 19
Feature: This feature tests the successful AEM form submissions for forms created or updated for AEM Forms project Release 2

  #Dry run completed on 21 Nov 19
  @TestWheelchairScooterAssistFormSubmission
  #@Regression.chrome.desktop
  #@Regression.safari.desktop
  #@Regression-forms.chrome.desktop
  #@Regression-forms.safari.desktop
  Scenario: Verify the Wheelchair and Scooter assist e form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/on-the-road/roadside-assistance/wheelchair-scooter-assist/wheelchair-and-scooter-assist-eform.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "wheelchairScooterAssistPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "wheelchairScooterAssistPage" screen
    And I enter "15/08/1980" details in "dob" on "wheelchairScooterAssistPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "wheelchairScooterAssistPage" screen
    And I enter "0400000000" details in "contactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "wheelchairScooterAssistPage" screen
    And I enter "Melbourne" details in "suburb" on "wheelchairScooterAssistPage" screen
    And I enter "3000" details in "postcode" on "wheelchairScooterAssistPage" screen
    And I select "VIC" value for "state" drop down in "wheelchairScooterAssistPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "postalResidentSameAddress" on "wheelchairScooterAssistPage" screen using Action class
    And I click "racvMemberYes" on "wheelchairScooterAssistPage" screen
    And I enter "12345678" details in "racvMemberNumber" on "wheelchairScooterAssistPage" screen
    And I enter "TestContact" details in "emergencyContactName" on "wheelchairScooterAssistPage" screen
    And I enter "0400000000" details in "emergencyContactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "Exon" details in "retailPartnerName" on "wheelchairScooterAssistPage" screen
    And I click "termsAndConditions" on "wheelchairScooterAssistPage" screen using Action class
    And I click "marketingConsent" on "wheelchairScooterAssistPage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "wheelchairScooterAssistPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on 22 Nov 19
  @TestWheelchairScooterAssistDiffPostalAddressFormSubmission
  #@Regression.chrome.desktop
  #@Regression.safari.desktop
  #@Regression-forms.chrome.desktop
  #@Regression-forms.safari.desktop
  Scenario: Verify the Wheelchair and Scooter assist e form can be submitted successfully when all valid details are entered along with a different Postal address and reference number is returned
    #launch app form
    Given I launch app page "URL/on-the-road/roadside-assistance/wheelchair-scooter-assist/wheelchair-and-scooter-assist-eform.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "wheelchairScooterAssistPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "wheelchairScooterAssistPage" screen
    And I enter "15/08/1980" details in "dob" on "wheelchairScooterAssistPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "wheelchairScooterAssistPage" screen
    And I enter "0400000000" details in "contactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "wheelchairScooterAssistPage" screen
    And I enter "Melbourne" details in "suburb" on "wheelchairScooterAssistPage" screen
    And I enter "3000" details in "postcode" on "wheelchairScooterAssistPage" screen
    And I select "VIC" value for "state" drop down in "wheelchairScooterAssistPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "postalResidentDifferentAddress" on "wheelchairScooterAssistPage" screen using Action class
    And I enter "550 Princess Highway" details in "postalStreet" on "wheelchairScooterAssistPage" screen
    And I enter "Noble Park" details in "postalSuburb" on "wheelchairScooterAssistPage" screen
    And I enter "3174" details in "postalPostcode" on "wheelchairScooterAssistPage" screen
    And I select "VIC" value for "postalState" drop down in "wheelchairScooterAssistPage" screen using selection method "visibleText"
    And I click "racvMemberYes" on "wheelchairScooterAssistPage" screen
    And I enter "12345678" details in "racvMemberNumber" on "wheelchairScooterAssistPage" screen
    And I enter "TestContact" details in "emergencyContactName" on "wheelchairScooterAssistPage" screen
    And I enter "0400000000" details in "emergencyContactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "Exon" details in "retailPartnerName" on "wheelchairScooterAssistPage" screen
    And I click "termsAndConditions" on "wheelchairScooterAssistPage" screen using Action class
    And I click "marketingConsent" on "wheelchairScooterAssistPage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "wheelchairScooterAssistPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on 21 Nov 19
  @TestSharedWorkSpaceFormSubmission
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
  Scenario: Verify the Shared working space form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-club/city-club/facilities/shared-working-space.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "sharedWorkingSpacePage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "sharedWorkingSpacePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "sharedWorkingSpacePage" screen
    And I enter "0400000000" details in "phoneNumber" on "sharedWorkingSpacePage" screen
    And I enter "12345678" details in "memberNumber" on "sharedWorkingSpacePage" screen
    And I enter "15/02/2020" details in "bookingDate" on "sharedWorkingSpacePage" screen
    And I take a screenshot
    And I enter "08.00" details in "startTime" on "sharedWorkingSpacePage" screen
    And I enter "17.00" details in "endTime" on "sharedWorkingSpacePage" screen
    And I enter "10" details in "noOfParticipants" on "sharedWorkingSpacePage" screen
    And I enter "Desk and Chairs" details in "roomConfiguration" on "sharedWorkingSpacePage" screen
    And I enter "Test enquiry. Please ignore" details in "comments" on "sharedWorkingSpacePage" screen
    And I take a screenshot
    And I click "submitButton" on "sharedWorkingSpacePage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on 21 Nov 19
  #NOTE - This form looks it will need update in terms of UX. Script will also need to be updated
  @TestEmailCaptureBannerFormSubmission
  Scenario: Verify the Email capture banner form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "https://author-racv-test63-01.adobecqms.net/content/experience-fragments/email-capture-banner/email-capture-banner1.html?wcmmode=disabled"
    And I dismiss GDPR notification if it exists
    When I enter "sroy" details in "qaUsername" on "qaAuthLoginPage" screen
    And I enter "sroy@1" details in "qaPassword" on "qaAuthLoginPage" screen
    And I click "qaSignInButton" on "qaAuthLoginPage" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "emailCaptureBannerPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "emailCaptureBannerPage" screen
    And I enter "0400000000" details in "mobileNumber" on "emailCaptureBannerPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "emailCaptureBannerPage" screen
    And I click "termsAndConditions" on "emailCaptureBannerPage" screen using Action class
    And I take a screenshot
    And I click "submitButton" on "emailCaptureBannerPage" screen using Action class
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on 22 Nov 19
  #SR 26 Mar 2020 - DAC-4663 Updated test with analytics checks
  @TestClubContactUsFormSubmission
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
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