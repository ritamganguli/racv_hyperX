Feature: Various misc tests

  @TestBuildNumber-p3
  Scenario: Verify that correct build number is being displayed on page source for the environment
    Given I verify the build number for "URL/racv-home.html"
    And I take a screenshot
    When I verify the build number for "PURL1/content/racv/en/home/racv-home.html"
    And I take a screenshot
    Then I verify the build number for "PURL2/content/racv/en/home/racv-home.html"
    And I take a screenshot

  @TestPlaceHolder
  @Sanity.chrome.android-mobile
  @Regression.safari.desktop
  @Regression.chrome.ios-mobile
  Scenario: This is a place holder test for the empty phase 3 stages so the pipeline can generate a valid report, delete the suite tags when tests are created the suite
    Given I launch app page "URL"

  @TestAllComponents-p3
  @Sanity-p3.chrome.desktop
  #@Sanity-p3-smartui.chrome.desktop
  Scenario: Verify the all-components page using lambda
    Given I launch app page "URL/racv-home/utility/qa/all-components.html"
    And I scroll the window to "100" percent
    And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-emergency-banner, hide-gdpr"
    And I verify page is accessibility compliant

  @TestInsuranceLambda-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  Scenario: Verify 2 pages of insurance page using lambda
    Given I launch app page "URL/insurance.html"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-emergency-banner, hide-gdpr"
    #And I verify page is accessibility compliant
    And I navigate to "URL/insurance/car-insurance.html"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot "car insurance snapshot" "hide-emergency-banner, hide-gdpr"

  @TestHelpAndSupportLambda-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  Scenario: Verify 2 pages of help and support using lambda
    Given I launch app page "URL/help-and-support.html"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-emergency-banner, hide-gdpr"
    #And I verify page is accessibility compliant
    And I navigate to "URL/help-and-support/car-insurance.html"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot "car insurance snapshot" "hide-emergency-banner, hide-gdpr"
    #And I verify page is accessibility compliant

  @TestErrorPage404-p3
  @TestErrorPage404-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Sanity-p3-smartui.chrome.ios-mobile
  Scenario: Verify the 404 error page appears for non existent page with SVG
    Given I launch app page "URL/non-existent-page-error.html" ignoring errors
    When I verify "404svg" element is visible on "errorPage" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-emergency-banner, hide-gdpr"
    And I verify page is accessibility compliant

  @TestSalesforceChatButtonAvailability-p3
  @TestSalesforceChatButtonAvailability-p3.chrome.ios-mobile
  #@Sanity-p3-smartui.chrome.desktop
  Scenario: Verify the salesforce chat appears without any functionality checks (as consultants are probably not available), chat is only available 9-5 AEST
    # https://racvone.atlassian.net/wiki/spaces/RABX/pages/3475539338/Chat+pages+path+in+Launch+Script
    # A page from insurance section
    Given I launch app page "URL/insurance/car-insurance.html"
    And I dismiss GDPR notification if it exists
    When I verify "chatWithUsButton" element is visible on "salesforceChat" screen
    And I take a screenshot
    # A page from cars-transport section
    And I navigate to "URL/cars-transport/roadside-assistance.html"
    And I dismiss GDPR notification if it exists
    And I verify "chatWithUsButton" element is visible on "salesforceChat" screen
    And I take a screenshot
    # A page from home security section
    And I navigate to "URL/in-your-home/home-security/alarm-systems.html"
    And I dismiss GDPR notification if it exists
    And I verify "chatWithUsButton" element is visible on "salesforceChat" screen
    And I take a screenshot
    # A page from other section
    And I navigate to "URL/help-and-support/emergency-home-assist.html"
    And I dismiss GDPR notification if it exists
    And I verify "chatWithUsButton" element is visible on "salesforceChat" screen
    # Accessibility and lambda checks
    And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-emergency-banner, hide-gdpr, normalize-salesforce-chat-button-text"
    #And I verify page is accessibility compliant

  @TestContactRACVForm-validMember-p3
  @TestContactRACVForm-validMember-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
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
    #Click the footer text to trigger onblur event for last field interacted
    And I click "footerText" on "contactRACVFormPage1" screen
    #Check analytics tagging for forms node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self-service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "email racv - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "email racv" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "comments__c" for "digitalData"
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

  @TestContactRACVForm-invalidMember-p3
  @TestContactRACVForm-invalidMember-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
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