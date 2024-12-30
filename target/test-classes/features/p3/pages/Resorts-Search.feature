Feature: This feature validates RACV Resorts Search feature

  @TestRACVResortsSearchForm-Guest
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when membership type is selected as Book as Guest and default options for other search criteria
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    And I wait for "membershipType" on "resortsPage1" screen or "5" seconds before proceeding
    And I click "membershipType" on "resortsPage1" screen
    And I click "memTypeGuest" on "resortsPage1" screen
   	And I take a screenshot
    #Check analytics - no relevant tags generated here
    And I get object data for "digitalData"
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
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

  @TestRACVResortsSearchForm-RACV-Member
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as RACV member, Vic all resorts, two adults, one kid for three nights
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
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
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  @TestRACVResortsSearchForm-Club-Member
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as RACV club member, Tasmania all resorts, two adults, two kids for one night
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in tasmania
    And I click "resortsWhereVIC" on "resortsPage1" screen
    And I click "resortsWhereTAS" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 1 nights
    And I click "resortsWhenEnd1Night" on "resortsPage1" screen
    And I click "apply" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    #Add 2 kids
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select RACV club member and enter details
    And I click "memTypeRACVClubMember" on "resortsPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memTypeRACVClubMemberLastName" on "resortsPage1" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "memTypeRACVClubMemberId" on "resortsPage1" screen
    And I take a screenshot
    And I click "memTypeRACVClubMemberSubmit" on "resortsPage1" screen
    And I take a screenshot
    And I wait for "searchButton" on "resortsPage1" screen or "2" seconds before proceeding
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  @TestRACVResortsSearchForm-RACQ-Member
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as Auto club member (RACQ), Queensland all resorts, two adults for two night
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in Queensland
    And I click "resortsWhereQLD" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 2 nights
    And I click "resortsWhenEnd2Nights" on "resortsPage1" screen
    And I take a screenshot
    And I click "apply" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select Auto club member and enter details
    And I click "memTypeAutoClubMember" on "resortsPage1" screen
    And I click "memTypeAutoClubRACQMember" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  @TestRACVResortsSearchForm-Other-Member
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as Other member, Queensland all resorts, two adults for two night
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in Queensland
    And I click "resortsWhereQLD" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 2 nights
    And I click "resortsWhenEnd2Nights" on "resortsPage1" screen
    And I take a screenshot
    And I click "apply" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select Auto club member and enter details
    And I click "memTypeAutoClubMember" on "resortsPage1" screen
    And I click "memTypeAutoClubOtherMember" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  @TestRACVResortsSearchFormWithPromoCode
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as Vic all resorts, two adults, one kid for three nights with a promo code
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
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
    And I take a screenshot
    And I click "apply" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    #Add a kid
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Enter promo code
    And I click "promoCodeLink" on "resortsPage1" screen
    And I enter "racvstaff17" details in "promoCodeField" on "resortsPage1" screen
    And I take a screenshot
    And I click "promoApplyButton" on "resortsPage1" screen
    And I verify "promoAppliedSuccess" element is visible on "resortsPage1" screen
    And I take a screenshot
    #Click Search
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    #This step verifies a success message or a replan message
    Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen

  @TestRACVResortsSearchForm2Mobile
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as RACV member, Vic all resorts, two adults, one kid for three nights on mobile
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in Vic
    And I click "resortsWhereVIC" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhere again to get rid of the selecter drop down for mobile
    And I click "resortsWhere" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 3 nights
    And I click "resortsWhenEnd3Nights" on "resortsPage1" screen
    And I click "apply" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhen again to get rid of the selecter drop down for mobile
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    #Add a kid
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWho again to get rid of the selecter drop down for mobile
    And I click "resortsWho" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select RACV member and enter details
    And I click "memTypeRACVMember" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #This step verifies a success message or a replan message
    #Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen
    #SR 6 Apr 20 - Replaced above with URL validation for mobile as copy can't be validated here
    Then I check the page address contains "/travel-experiences/resorts/search.html"
    And I take a screenshot

  @TestRACVResortsSearchForm3Mobile
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as RACV club member, Tasmania all resorts, two adults, two kids for one night on mobile
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in tasmania
    And I click "resortsWhereTAS" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhere again to get rid of the selecter drop down for mobile
    And I click "resortsWhere" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 1 nights
    And I click "resortsWhenEnd1Night" on "resortsPage1" screen
    And I click "apply" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhere again to get rid of the selecter drop down for mobile
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWho" on "resortsPage1" screen
    #Add 2 kids
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    And I click "resortsWhoAddKid" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhere again to get rid of the selecter drop down for mobile
    And I click "resortsWho" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select RACV club member and enter details
    And I click "memTypeRACVClubMember" on "resortsPage1" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memTypeRACVClubMemberLastName" on "resortsPage1" screen
    And I enter "DATAMAP[clubMemberNumber]" details in "memTypeRACVClubMemberId" on "resortsPage1" screen
    And I take a screenshot
    And I click "memTypeRACVClubMemberSubmit" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    #This step verifies a success message or a replan message
    #Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen
    #SR 6 Apr 20 - Replaced above with URL validation for mobile as copy can't be validated here
    Then I check the page address contains "/travel-experiences/resorts/search.html"
    And I take a screenshot

  @TestRACVResortsSearchForm4Mobile
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Resorts form returns and displays search result successfully when search criteria is selected as Auto club member, Queensland all resorts, two adults for two night on mobile
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    #And I dismiss emergency banner if it exists
    And I dismiss GDPR notification if it exists
    #Enter details into the form
    When I click "resortsWhere" on "resortsPage1" screen
    #Select all resorts in Queensland
    And I click "resortsWhereQLD" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhere again to get rid of the selecter drop down for mobile
    And I click "resortsWhere" on "resortsPage1" screen
    #Select Checkin
    And I click "resortsWhen" on "resortsPage1" screen
    And I click "resortsWhenStart" on "resortsPage1" screen
    #Select check out for 2 nights
    And I click "resortsWhenEnd2Nights" on "resortsPage1" screen
    And I click "apply" on "resortsPage1" screen
    #21 Feb 20 VT - Click resortsWhen again to get rid of the selecter drop down for mobile
    And I click "resortsWhen" on "resortsPage1" screen
    #And I click "resortsWho" on "resortsPage1" screen
    And I click "membershipType" on "resortsPage1" screen
    #Select Auto club member and enter details
    And I click "memTypeAutoClubMember" on "resortsPage1" screen
    And I click "memTypeAutoClubRACQMember" on "resortsPage1" screen
    And I enter "WHEELCHAIR TEST" details in "memTypeAutoClubRACQMemberName" on "resortsPage1" screen
    And I enter "digitalqa@racv.com.au" details in "memTypeAutoClubRACQMemberEmail" on "resortsPage1" screen
    And I take a screenshot
    And I click "memTypeAutoClubRACQMemberSubmit" on "resortsPage1" screen
    And I take a screenshot
    And I click "searchButton" on "resortsPage1" screen
    And I wait for "tilePreLoader" to disappear on "resortsPage2" screen or "30" seconds before proceeding
    And I wait for "resultCountsDiv" on "resortsPage1" screen or "5" seconds before proceeding
    And I capture the address navigated to
    #This step verifies a success message or a replan message
    #Then I verify either "searchSuccess" or "bookingUnavailableSearchSuccess" copy text on "resortsPage2" screen
    #SR 6 Apr 20 - Replaced above with URL validation for mobile as copy can't be validated here
    Then I check the page address contains "/travel-experiences/resorts/search.html"
    And I take a screenshot

  @TestRACVResortsContactUs
  Scenario: Verify that RACV Resorts Contact Us form submission
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I wait for "contactButton" on "resortsPage1" screen or "5" seconds before proceeding
    #And I dismiss GDPR notification if it exists
    When I click "contactButton" without scrolling on "resortsPage1" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "resortsContactUsOverlay" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "resortsContactUsOverlay" screen
    And I enter "digitalqa@racv.com.au" details in "emailAddress" on "resortsContactUsOverlay" screen
    And I enter "0426789654" details in "mobileNumber" on "resortsContactUsOverlay" screen
    And I select "Goldfields" value for "resortName" drop down in "resortsContactUsOverlay" screen using selection method "visibleText"
    And I enter "This is test query. Please ignore" details in "comments" on "resortsContactUsOverlay" screen
    And I take a screenshot
    #Validate analytics tagging for form node, step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "resort page contact us - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "resort page contact us" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    #Analytics checks for product object - uncomment below once QA is synced with latest content, Stage is fine
    And I verify "$.product.productInfo.productName" value equals "leisure:resorts:na:na" for "digitalData"
    And I click "submitButton" on "resortsContactUsOverlay" screen
    And I wait for "pageTitle" on "resortsContactUsThankUPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    #Validate analytics tagging for form node, step 2
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "resort enquiry contact us - complete" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "resort page contact us" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    #Analytics checks for product object - uncomment below once QA is synced with latest content, Stage is fine
    And I verify "$.product.productInfo.productName" value equals "leisure:resorts:na:na" for "digitalData"
    Then I check the page address contains "/travel-experiences/resorts/contact-us.html?referenceNo="
    And I verify "pageTitle" copy text on "resortsContactUsThankUPage" screen
