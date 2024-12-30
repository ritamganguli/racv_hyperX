Feature: This feature tests member validation on dispatcher

  @TestRACVMovieTickets-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the RACV movie tickets form navigates to neat idea website successfully
    Given I launch app page "URL/membership/member-discounts/member-benefits-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    Then I check the page address contains "https://uat-stores.neatideas.com.au/racv/"
    And I capture the address navigated to
    And I take a screenshot

  @TestRACVMovieTicketsAnalytics-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  @AnalyticsEvents-p3
  Scenario: Verify the RACV movie tickets form analytics
    Given I launch app page "URL/membership/member-discounts/member-benefits-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details on Page 2
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    #Check analytics tagging for form node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "purchase movie tickets - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "purchase movie tickets" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.product.productInfo.productName" value equals "" for "digitalData"
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    Then I check the page address contains "https://uat-stores.neatideas.com.au/racv/"
    And I capture the address navigated to
    And I take a screenshot
    #And I navigate back to the previous page
    #And I verify "$.user.userInfo.authState" value equals "auth" for "digitalData"

  @TestRACVMovieTicketsNegative-p3
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the RACV movie tickets form fails with invalid details
    Given I launch app page "URL/membership/member-discounts/member-benefits-validation.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]-invalid" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    When I verify "invalidMemberError" element is visible on "movieTicketsPage2-p3" screen
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    And I take a screenshot

  @TestRacvMemberWoolworthsForm-p3
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the RACV Member validation form with generic surname
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-validation-woolworths.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNo" on "wooliesMemberValidation-p3" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "wooliesMemberValidation-p3" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "wooliesMemberValidation-p3" screen
    #And I enter "randomEmailGen" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    And I take a screenshot
    And I click "submitButton" on "wooliesMemberValidation-p3" screen using JavaScript
    And I wait for "wooliesRacvAnalytics" on "wooliesMemberValidation-p3" screen or "30" seconds before proceeding
    And I verify "wooliesRacvAnalytics" element exists on "wooliesMemberValidation-p3" screen
    And I capture the address navigated to
    Then I check page address is "https://giftcards.woolworths.com.au/woolworths-group-and-partners-gift-cards"
    And I take a screenshot

  @TestRacvMemberWoolworthsFormAnalytics-p3
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  @AnalyticsEvents-p3
  Scenario: Verify the RACV Member validation form analytics
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-validation-woolworths.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "wooliesMemberValidation-p3" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "wooliesMemberValidation-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "wooliesMemberValidation-p3" screen
    #And I enter "randomEmailGen" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    And I take a screenshot
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "woolworths member validation - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "woolworths member validation" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.product.productInfo.productName" value equals "" for "digitalData"
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-navigate" for "digitalData"
    And I click "submitButton" on "wooliesMemberValidation-p3" screen
    And I wait for "submitButton" to disappear on "wooliesMemberValidation-p3" screen or "30" seconds before proceeding
    And I navigate back to the previous page
    And I verify "$.user.userInfo.authState" value equals "auth" for "digitalData"

  @TestRacvMemberWoolworthsFormNegative-p3
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the RACV Member validation fails for incorrect details for woolworths form
    #launch app form
    Given I launch app page "URL/membership/member-discounts/member-validation-woolworths.html?disableCaptcha=true?disableCaptcha=true"
    #enter details on page 1
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "wooliesMemberValidation-p3" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "wooliesMemberValidation-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]-incorrect" details in "familyName" on "wooliesMemberValidation-p3" screen
    #And I enter "randomEmailGen" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddress" on "wooliesMemberValidation-p3" screen
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "woolworths member validation - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "woolworths member validation" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.product.productInfo.productName" value equals "" for "digitalData"
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    And I click "submitButton" on "wooliesMemberValidation-p3" screen using JavaScript
    #Check the message
    Then I verify "memberValFailedMessage" element is visible on "wooliesMemberValidation-p3" screen
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    And I capture the address navigated to
    And I take a screenshot

  @TestTicketTekForm-p3
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the TicketTek form navigates to neat idea website successfully
    Given I launch app page "URL/membership/member-discounts/member-validation-ticketek.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    Then I check the page address contains "https://premier.ticketek.com.au/shows/show.aspx?sh=RACV"
    And I capture the address navigated to
    And I take a screenshot

  @TestTicketTekFormAnalytics-p3
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  @AnalyticsEvents-p3
  Scenario: Verify the TicketTek form analytics
    Given I launch app page "URL/membership/member-discounts/member-validation-ticketek.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    #Enter details on Page 2
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    #Check analytics tagging for form node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "self service" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "enter membership details" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "member validation modal" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.product.productInfo.productName" value equals "" for "digitalData"
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    Then I check the page address contains "https://premier.ticketek.com.au/shows/show.aspx?sh=RACV"
    And I capture the address navigated to
    And I take a screenshot
    #And I navigate back to the previous page
    #And I verify "$.user.userInfo.authState" value equals "auth" for "digitalData"

  @TestTicketTekForm-p3-invalid
  @Regression-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Integration-p3
  @Forms-Dispatcher-p3
  Scenario: Verify the TicketTek form fails with invalid details
    Given I launch app page "URL/membership/member-discounts/member-validation-ticketek.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNumber" on "movieTicketsPage2-p3" screen
    And I enter "DATAMAP[nonClubMemberSurname]-invalid" details in "memberFamilyName" on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I click "submitButton" on "movieTicketsPage2-p3" screen using JavaScript
    And I wait for "submitButton" to disappear on "movieTicketsPage2-p3" screen or "10" seconds before proceeding
    When I verify "invalidMemberError" element is visible on "movieTicketsPage2-p3" screen
    And I take a screenshot
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"