#Author: Sumanta Roy
#Date Created : 9 Jan 2020
Feature: This feature tests the successful AEM form submissions for forms created or updated for AEM Forms project Release 3

  #Dry run completed on MSQA on 9 Jan 2020
  #updated locators on 17 Jan 2020
  #SR 14 Apr 20 - DAC-4776 - Added analytics checks for form node at step 1. Step 2 is not generating any form node in QA but in Stage, hence commented out
  @TestEHAForBusinessEnquiryFormSubmission
  #@Regression.chrome.desktop
  #@Regression.safari.desktop
  #@Regression-forms.chrome.desktop
  #@Regression-forms.safari.desktop
  Scenario: Verify the EHA for Business Enquiry form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/business-solutions/eha-business/enquiry-form.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "ehaBusinessEnquiryPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "ehaBusinessEnquiryPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "ehaBusinessEnquiryPage" screen
    And I enter "0400000000" details in "phone" on "ehaBusinessEnquiryPage" screen
    And I enter "RACV" details in "businessName" on "ehaBusinessEnquiryPage" screen
    And I enter "Delivery" details in "natureOfBusiness" on "ehaBusinessEnquiryPage" screen
    And I click "enquiryTypeSolar" on "ehaBusinessEnquiryPage" screen
    And I enter "Test query please ignore" details in "additionalComments" on "ehaBusinessEnquiryPage" screen
    And I click "tsAndCs" on "ehaBusinessEnquiryPage" screen
    #Check analytics data generated for form node at Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "eha business enquiry - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "eha business enquiry" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I take a screenshot
    And I click "submitButton" on "ehaBusinessEnquiryPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    #Check analytics data generated for form node at Step 2
    #Step 2 is not generating any form node in QA but in Stage, hence commented out
    And I get object data for "digitalData"
    #And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    #And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    #And I verify "$.form.formInfo.stepName" value equals "eha business enquiry - complete" for "digitalData"
    #And I verify "$.form.formInfo.formName" value equals "eha business enquiry" for "digitalData"
    #And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    #And I verify "$.form.formInfo.formField.marketingConsent" value equals "true" for "digitalData"
    And I take a screenshot

  #Dry run completed on MSQA on 9 Jan 2020
  #updated locators on 17 Jan 2020
  #SR 28 Apr 2020 - DAC-4870 - Added analytics checks for form nodes. Steps commented as tags do not exist in QA.
  @TestAssistanceBySMSFormSubmission
  @Regression.chrome.desktop
  #@Regression.safari.desktop
  @Regression-forms.chrome.desktop
  @Regression-forms.safari.desktop
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

  #Dry run completed on MSQA on 9 Jan 2020
  @TestRoyalAutoContactUsFormSubmission
  Scenario: Verify the Royal auto Contact Us Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/royalauto/about-royalauto/contact.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "royalAutoContactUsPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "royalAutoContactUsPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "royalAutoContactUsPage" screen
    And I enter "0400000000" details in "phone" on "royalAutoContactUsPage" screen
    And I enter "Test query please ignore" details in "enquiry" on "royalAutoContactUsPage" screen
    And I click "submitButton" on "royalAutoContactUsPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on MSQA on 9 Jan 2020
  #updated locators on 17 Jan 2020
  @TestUnsubscribeRoyalAutoMagazineFormSubmission
  Scenario: Verify the Unsubscribe Royal auto Magazine Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/royalauto/about-royalauto/subscribe.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "Melbourne" details in "suburb" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "Victoria" details in "state" on "unsbscribeRoyalAutoMagazinePage" screen
    And I enter "3000" details in "postcode" on "unsbscribeRoyalAutoMagazinePage" screen
    And I click "checkUpdates" on "unsbscribeRoyalAutoMagazinePage" screen
    And I click "unsubscribeButton" on "registerSocialMediaPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on DEV1 10 Jan 2020
  #10 Jan 2020 - has been validated on Dev with changes from Jeetendra
  #updated locators on 17 Jan 2020
  @TestGolfMembershipEnquiryFormSubmission
  Scenario: Verify the Golf membership enquiry Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-golf/racv-golf-membership/faqs.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "golfMembershipFaqPage" screen
    And I enter "TestLast" details in "surname" on "golfMembershipFaqPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "golfMembershipFaqPage" screen
    And I enter "0400000000" details in "contactNumber" on "golfMembershipFaqPage" screen
    And I enter "Test query please ignore" details in "natureOfEnquiry" on "golfMembershipFaqPage" screen
    And I click "submitButton" on "golfMembershipFaqPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on MSQA on 10 Jan 2020
  #updated locators on 17 Jan 2020
  #SR 28 May 2020 DAC-4882 - Added analytics tagging checks. Test added to QA regression but Stage generates diff values, content sync should fix this
  #SR 7 Aug 2020 AEMU-822 - Updated analytics tag values
  @TestTransferExistingHandicapFormSubmission
  Scenario: Verify the Golf transfer or reactivate existing membership Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-golf/racv-golf-membership/your-handicap/transfer-my-existing-handicap.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "transferExistingHandicapPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "transferExistingHandicapPage" screen
    And I enter "0400000000" details in "mobileNumber" on "transferExistingHandicapPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "transferExistingHandicapPage" screen
    And I enter "473 Bourke Street" details in "address" on "transferExistingHandicapPage" screen
    And I enter "Melbourne" details in "suburb" on "transferExistingHandicapPage" screen
    And I select "VIC" value for "state" drop down in "transferExistingHandicapPage" screen using selection method "visibleText"
    And I enter "3000" details in "postalCode" on "transferExistingHandicapPage" screen
    And I enter "12345678" details in "golfMemberNumber" on "transferExistingHandicapPage" screen
    And I enter "87654321" details in "previousGolfLinkNumber" on "transferExistingHandicapPage" screen
    And I take a screenshot
    #Check analytics tagging for form node at Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "golf membership handicap transfer - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "golf membership handicap transfer" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submitButton" on "transferExistingHandicapPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    #Check analytics tagging for form node at Step 2
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "golf membership handicap transfer - complete" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "golf membership handicap transfer" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    And I verify "$.form.formInfo.formField.marketingConsent" value equals "false" for "digitalData"

  #Dry run completed on MSQA on 10 Jan 2020
  #updated locators on 17 Jan 2020
  #SR 25 may 2020 - DAC-4883 - The tag values are different in QA and Stage. Content sync required, until then enabling the test on QA only
  #SR 7 Aug 2020 - AEMU-822 - Updated analytics tags and test data
  @TestGolfSubmitIntentToPlayFormSubmission
  Scenario: Verify the Golf submit intent to play Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-golf/racv-golf-membership/your-handicap/submit-intent-to-play.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "submitIntentToPlayPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "submitIntentToPlayPage" screen
    And I enter "0400000000" details in "mobileNumber" on "submitIntentToPlayPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "submitIntentToPlayPage" screen
    And I enter "12345678" details in "golfMemberNumber" on "submitIntentToPlayPage" screen
    And I enter "Inverloch" details in "golfCourse1" on "submitIntentToPlayPage" screen
    And I enter "08/10/2020" details in "dateOfPlay1" on "submitIntentToPlayPage" screen
    And I enter "Torquay" details in "golfCourse2" on "submitIntentToPlayPage" screen
    And I enter "08/11/2020" details in "dateOfPlay2" on "submitIntentToPlayPage" screen
    And I enter "Healesville" details in "golfCourse3" on "submitIntentToPlayPage" screen
    And I enter "08/12/2020" details in "dateOfPlay3" on "submitIntentToPlayPage" screen
    #Check analytics tagging for form node at Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "golf membership intent to play - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "golf membership intent to play" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submitButton" on "submitIntentToPlayPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    #Check analytics tagging for form node at Step 2
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "golf membership intent to play - complete" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "golf membership intent to play" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"

  #Dry run completed on MSQA on 10 Jan 2020
  @TestGolfApplyForHandicapFormSubmission
  Scenario: Verify the Golf Apply for a handicap Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-golf/racv-golf-membership/your-handicap/apply-for-a-handicap.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "applyForHandicapPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "applyForHandicapPage" screen
    And I enter "0400000000" details in "mobileNumber" on "applyForHandicapPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "applyForHandicapPage" screen
    And I enter "473 Bourke Street" details in "address" on "applyForHandicapPage" screen
    And I enter "Melbourne" details in "suburb" on "applyForHandicapPage" screen
    And I select "VIC" value for "state" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "3000" details in "postalCode" on "applyForHandicapPage" screen
    And I enter "12345678" details in "golfMemberNumber" on "applyForHandicapPage" screen
    #Scorecard 1
    And I enter "Inverloch" details in "golfCourse1" on "applyForHandicapPage" screen
    And I enter "21/12/2019" details in "datePlayed1" on "applyForHandicapPage" screen
    And I enter "4" details in "stablefordScore1" on "applyForHandicapPage" screen
    And I select "9" value for "holesPlayed1" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "2" details in "coursePar1" on "applyForHandicapPage" screen
    And I enter "2" details in "slopeRating1" on "applyForHandicapPage" screen
    And I enter "2" details in "scratchRating1" on "applyForHandicapPage" screen
    And I upload an attachment for "scorecard1" on "applyForHandicapPage" from "test_png.png"
    #Scorecard 2
    And I enter "Torquay" details in "golfCourse2" on "applyForHandicapPage" screen
    And I enter "23/12/2019" details in "datePlayed2" on "applyForHandicapPage" screen
    And I enter "5" details in "stablefordScore2" on "applyForHandicapPage" screen
    And I select "18" value for "holesPlayed2" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "3" details in "coursePar2" on "applyForHandicapPage" screen
    And I enter "3" details in "slopeRating2" on "applyForHandicapPage" screen
    And I enter "3" details in "scratchRating2" on "applyForHandicapPage" screen
    And I upload an attachment for "scorecard2" on "applyForHandicapPage" from "test_png.png"
    #Scorecard 3
    And I enter "City Club" details in "golfCourse3" on "applyForHandicapPage" screen
    And I enter "25/12/2019" details in "datePlayed3" on "applyForHandicapPage" screen
    And I enter "6" details in "stablefordScore3" on "applyForHandicapPage" screen
    And I select "9" value for "holesPlayed3" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "4" details in "coursePar3" on "applyForHandicapPage" screen
    And I enter "4" details in "slopeRating3" on "applyForHandicapPage" screen
    And I enter "4" details in "scratchRating3" on "applyForHandicapPage" screen
    And I upload an attachment for "scorecard3" on "applyForHandicapPage" from "test_png.png"
    #Scorecard 4
    And I click "upload4thScorecardAccordian" on "applyForHandicapPage" screen
    And I enter "Healesville Club" details in "golfCourse4" on "applyForHandicapPage" screen
    And I enter "27/12/2019" details in "datePlayed4" on "applyForHandicapPage" screen
    And I enter "6" details in "stablefordScore4" on "applyForHandicapPage" screen
    And I select "18" value for "holesPlayed4" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "5" details in "coursePar4" on "applyForHandicapPage" screen
    And I enter "5" details in "slopeRating4" on "applyForHandicapPage" screen
    And I enter "5" details in "scratchRating4" on "applyForHandicapPage" screen
    And I upload an attachment for "scorecard4" on "applyForHandicapPage" from "test_png.png"
    #Scorecard 5
    And I click "upload5thScorecardAccordian" on "applyForHandicapPage" screen
    And I enter "Gippsland" details in "golfCourse5" on "applyForHandicapPage" screen
    And I enter "29/12/2019" details in "datePlayed5" on "applyForHandicapPage" screen
    And I enter "6" details in "stablefordScore5" on "applyForHandicapPage" screen
    And I select "9" value for "holesPlayed5" drop down in "applyForHandicapPage" screen using selection method "visibleText"
    And I enter "6" details in "coursePar5" on "applyForHandicapPage" screen
    And I enter "6" details in "slopeRating5" on "applyForHandicapPage" screen
    And I enter "6" details in "scratchRating5" on "applyForHandicapPage" screen
    And I upload an attachment for "scorecard5" on "applyForHandicapPage" from "test_png.png"
    And I click "submitButton" on "applyForHandicapPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on Stage on 10 Jan 2020
  #updated locators on 17 Jan 2020
  @TestMarketingConsentCapeSchanckFormSubmission
  Scenario: Verify the Marketing consent on Cape schanck Form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-resorts/our-destinations/cape-schanck-resort.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "capeSchanckPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "capeSchanckPage" screen
    And I enter "0400000000" details in "mobileNumber" on "capeSchanckPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "capeSchanckPage" screen
    And I click "consentCheck" on "capeSchanckPage" screen
    And I click "signUpButton" on "capeSchanckPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on MSQA on 10 Jan 2020
  @TestGolfSignUpAsMemberFormSubmission
  Scenario: Verify the Golf Sign Up form can be submitted successfully when all valid details are entered for a RACV member and having different residential and postal addresses
    #launch app form
    Given I launch app page "URL/travel-leisure/racv-golf/sign-up-now.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I select "Mr." value for "title" drop down in "golfSignUpPage1" screen using selection method "visibleText"
    And I enter "Test O'first-URLENV" details in "firstName" on "golfSignUpPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "lastName" on "golfSignUpPage1" screen
    And I select "YES" value for "membershipType" drop down in "golfSignUpPage1" screen using selection method "visibleText"
    And I enter "DATAMAP[clubMemberNumber]" details in "membershipNumber" on "golfSignUpPage1" screen
    And I click "memberDOBPicker" on "golfSignUpPage1" screen
    And I click "memberDOBYear" on "golfSignUpPage1" screen
    And I click "memberDOBmonth" on "golfSignUpPage1" screen
    And I click "memberDOBDay" on "golfSignUpPage1" screen
    And I take a screenshot
    And I enter "473 Bourke Street" details in "memberStreetAddress" on "golfSignUpPage1" screen
    And I enter "Melbourne" details in "memberSuburb" on "golfSignUpPage1" screen
    And I enter "3000" details in "memberPostCode" on "golfSignUpPage1" screen
    And I select "VIC" value for "memberState" drop down in "golfSignUpPage1" screen using selection method "visibleText"
    And I click "differentPostalAddress" on "golfSignUpPage1" screen
    And I enter "550 Princess Highway" details in "postalAddress" on "golfSignUpPage1" screen
    And I enter "Noble Park" details in "postalSuburb" on "golfSignUpPage1" screen
    And I enter "3174" details in "postalPostCode" on "golfSignUpPage1" screen
    And I select "VIC" value for "postalState" drop down in "golfSignUpPage1" screen using selection method "visibleText"
    And I enter "0400000000" details in "memberMobileNumber" on "golfSignUpPage1" screen
    And I enter "0400000001" details in "memberAltMobileNumber" on "golfSignUpPage1" screen
    And I enter "digitalqa@racv.com.au" details in "memberEmailAddress" on "golfSignUpPage1" screen
    And I enter "digitalqa@racv.com.au" details in "confirmEmailAddress" on "golfSignUpPage1" screen
    And I take a screenshot
    And I select "Facebook" value for "hearAboutUs" drop down in "golfSignUpPage1" screen using selection method "visibleText"
    And I click "termsAndConditions" on "golfSignUpPage1" screen
    And I click "offersAndUpdates" on "golfSignUpPage1" screen
    And I take a screenshot
    And I click "submitForm" on "golfSignUpPage1" screen
    #Enter payment card details
    And I verify "paymentCard" element exists on "PaymentsPage1" screen
    And I click "paymentCard" on "PaymentsPage1" screen
    And I enter "4444333322221111" details in "cardNumber" on "PaymentsPage1" screen
    And I select "01" value for "expiryMonth" drop down in "PaymentsPage1" screen using selection method "visibleText"
    And I select "2023" value for "expiryYear" drop down in "PaymentsPage1" screen using selection method "visibleText"
    And I enter "123" details in "cvv" on "PaymentsPage1" screen
    And I take a screenshot
    And I click "submitButtonCard" on "PaymentsPage1" screen
    #Verify form submission was a success
    When I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  #Dry run completed on MSQA on 19 Aug 2021
  @TestWheelchairAndScooterNDISForm
  Scenario: Verify the Wheelchair and Scooter NDIS form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/on-the-road/roadside-assistance/wheelchair-scooter-assist/ndis.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "wheelchairAndScooterNDIS" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "wheelchairAndScooterNDIS" screen
    And I click "dateOfBirth" on "wheelchairAndScooterNDIS" screen
    And I click "dateOfBirthYear" on "wheelchairAndScooterNDIS" screen
    And I click "dateOfBirthMonth" on "wheelchairAndScooterNDIS" screen
    And I click "dateOfBirthDay" on "wheelchairAndScooterNDIS" screen
    And I enter "12345" details in "ndisNumber" on "wheelchairAndScooterNDIS" screen
    And I select "Personal Mobility Equipment" value for "ndisFundingCategory" drop down in "wheelchairAndScooterNDIS" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "email" on "wheelchairAndScooterNDIS" screen
    And I enter "0400000000" details in "contactNumber" on "wheelchairAndScooterNDIS" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "wheelchairAndScooterNDIS" screen
    And I enter "Melbourne" details in "suburb" on "wheelchairAndScooterNDIS" screen
    And I enter "3000" details in "postcode" on "wheelchairAndScooterNDIS" screen
    And I select "VIC" value for "state" drop down in "wheelchairAndScooterNDIS" screen using selection method "visibleText"
    And I enter "DATAMAP[clubMemberNumber]" details in "memberNumber" on "wheelchairAndScooterNDIS" screen
    And I take a screenshot
    And I enter "Test Emergency Contact" details in "emergencyContactName" on "wheelchairAndScooterNDIS" screen
    And I enter "0400000000" details in "emergencyContactNumber" on "wheelchairAndScooterNDIS" screen
    And I click "offers" on "wheelchairAndScooterNDIS" screen
    And I click "tac" on "wheelchairAndScooterNDIS" screen
    And I take a screenshot
    And I click "submit" on "wheelchairAndScooterNDIS" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot