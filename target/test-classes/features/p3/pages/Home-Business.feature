Feature: Home business section related tests

  @TestEHAForBusinessEnquiryFormSubmission-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the EHA for Business Enquiry form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/business-solutions/eha-business/enquiry-form.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "ehaBusinessEnquiryPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "ehaBusinessEnquiryPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "ehaBusinessEnquiryPage" screen
    And I enter "0400000000" details in "phone" on "ehaBusinessEnquiryPage" screen
    And I enter "RACV" details in "businessName" on "ehaBusinessEnquiryPage" screen
    And I enter "Test" details in "natureOfBusiness" on "ehaBusinessEnquiryPage" screen
    And I click "interestedProducts1" on "ehaBusinessEnquiryPage" screen
    And I click "interestedProducts2" on "ehaBusinessEnquiryPage" screen
    And I click "interestedProducts3" on "ehaBusinessEnquiryPage" screen
    And I click "interestedProducts4" on "ehaBusinessEnquiryPage" screen
    And I click "interestedProducts5" on "ehaBusinessEnquiryPage" screen
    And I enter "Test query please ignore" details in "additionalComments" on "ehaBusinessEnquiryPage" screen
    And I click "marketingConsent" on "ehaBusinessEnquiryPage" screen
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