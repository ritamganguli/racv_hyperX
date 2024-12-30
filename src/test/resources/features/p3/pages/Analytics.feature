#Author: Dheebanraj M
#Date Created : 22 May 23
Feature: This feature tests the AEM filter map analytics by passing test input

  #Dry run completed on 22 May 23
  #DM 22 May 23 - AP3-403 Updated test with analytics checks
  @TestFilterMapAPIAnalytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the API repairer map variation of filter map analytics data by adding the test input
    #launch app form
    Given I launch app page "URL/insurance/car-insurance/repairer-map.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"test","authState":"unauth","error":"","pageLoadRules":""}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"search-navigate"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"repairer map","sortBy":"","resultsCount":"","term":"tarneit vic"}}}
      """

  @TestFilterMapGenericListAnalytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the generic list map variation of filter map analytics data by adding the test input
    #launch app form
    Given I launch app page "URL/contact-us/racv-retail-stores.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I enter "Melbourne" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultMelbourne" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultMelbourne" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"test","authState":"unauth","error":"","pageLoadRules":""}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"search-navigate"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"racv retail stores","sortBy":"","resultsCount":"","term":"melbourne vic"}}}
      """

  @TestRACVTradesWidget-Postcode-Keyword-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of trades widget with postcode and keyword variant by adding the test input
    #launch the page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View"}},"user":{"userInfo":{"authState":"unauth"}},"event":[],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}}}
      """
    #Analytics checks for Trades search widget tool start
    When I enter "3000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I click "postcodeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1"}}}
      """
    #Analytics checks for Trades search widget tool complete
    When I enter "drain" details in "tradeInput" on "tradesWidgetPage" screen
    And I click "tradeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1"}}}
      """
    And I take a screenshot

  @TestRACVTradesWidget-Postcode-Keyword-Errors-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data errors of trades widget with postcode and keyword variant by adding the test input
    #launch the page
    Given I launch app page "URL/home/repairs-maintenance.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    #Analytics checks for Trades search widget tool interact - on-page errors
    When I click "getQuoteButton" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","error":"multiple validation errors occurred","errorType":"on page error","errorTrigger":""}}}
      """
    #Analytics checks for Trades search widget tool interact - inline errors
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "2000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%,%event.$rule.name%,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1","error":"enter a victorian postcode or suburb","errorType":"inline error","errorTrigger":"2000"}}}
      """
    When I enter "drain" details in "tradeInput" on "tradesWidgetPage" screen
    And I click "tradeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%,%event.$rule.name%,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1","error":"enter a victorian postcode or suburb","errorType":"inline error","errorTrigger":"2000"}}}
      """
    #Analytics checks for Trades search widget tool interact - multiple inline errors
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "2000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%,%event.$rule.name%,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1","error":"enter a victorian postcode or suburb","errorType":"inline error","errorTrigger":"2000"}}}
      """
    When I enter "Heaaa" details in "tradeInput" on "tradesWidgetPage" screen
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%,%event.$rule.name%,%event.$rule.name%,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade job and location","stepNumber":"1","error":"multiple validation errors occurred","errorType":"inline error","errorTrigger":"heaaa"}}}
      """
    And I take a screenshot

  @TestRACVTradesWidget-Postcode-Only-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of trades widget with postcode only variant by adding the test input
    #launch the page
    Given I launch app page "URL/home/repairs-maintenance/plumbing.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View"}},"user":{"userInfo":{"authState":"unauth"}},"event":[],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}}}
      """
    #Analytics checks for Trades search widget tool start
    When I enter "3000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I click "postcodeFirstResult" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"staging","authState":"unauth","error":"","pageLoadRules":"PL|Analytics|Global|Add satTrack To digitalData.event Array,PL|GTM|Global|Extension Load|Top Of AEM Pages,PL|Analytics|Global|Page View,%event.$rule.name%"}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade location only","stepNumber":"1"}}}
      """
    And I take a screenshot

  @TestRACVTradesWidget-Postcode-Only-Errors-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data errors of trades widget with postcode only variant by adding the test input
    #launch the page
    Given I launch app page "URL/home/repairs-maintenance/plumbing.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    #Analytics checks for Trades search widget tool interact - on-page errors
    When I click "getQuoteButton" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"test","authState":"unauth","error":"","pageLoadRules":""}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","error":"this field is required","errorType":"on page error","errorTrigger":""}}}
      """
    #Analytics checks for Trades search widget tool interact - inline errors
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "2000" details in "postcodeInput" on "tradesWidgetPage" screen
    And I take a screenshot
    And I verify below JSON equals for object "digitalData"
      """
      {"page":{"pageInfo":{"abort":"false","pageType":"content","platform":"aem","platformVersion":"6.5 SP17","environment":"test","authState":"unauth","error":"","pageLoadRules":""}},"user":{"userInfo":{"authState":"unauth"}},"event":[{"eventAction":"tool-navigate"},{"eventAction":"tool-interact"},{"eventAction":"tool-interact"}],"product":{"productInfo":{"productID":"","productName":""}},"search":{"searchInfo":{"searchType":"","sortBy":"","resultsCount":""}},"tool":{"toolInfo":{"toolName":"trades search widget","toolType":"product selector","stage":"start","stepName":"trade location only","stepNumber":"1","error":"enter a victorian postcode or suburb","errorType":"inline error","errorTrigger":"2000"}}}
      """

  @TestForm-Container-Analytics-p3
  @TestForm-Container-Analytics-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form container
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-container-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    When I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requiredMsgEmail" element is visible on "aemTestFormPagePublished" screen
    And I verify "requiredMsgPostcode" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form multiple validation errors
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "multiple validation errors occurred" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I click "dobLabel" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form start
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "lead_form" for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "form test-start" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "email__c" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    Then I click "submitButton" on "aemTestFormPagePublished" screen
    And I verify "requiredMsgPostcode" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form in line error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "postcode is required" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "java@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I enter "3000" details in "postcodeField" on "aemTestFormPagePublished" screen
    Then I click "submitButton" on "aemTestFormPagePublished" screen
    And I verify "invalidEmailMsg" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form on page error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "sorry you cant use this email - please try another.please enter a valid email" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "on page error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I enter "3000" details in "postcodeField" on "aemTestFormPagePublished" screen
    When I enter "06" details in "dayPlaceholder" on "aemTestFormPagePublished" screen
    And I enter "12" details in "monthPlaceholder" on "aemTestFormPagePublished" screen
    And I enter "1991" details in "yearPlaceholder" on "aemTestFormPagePublished" screen
    And I click "dobLabel" on "aemTestFormPagePublished" screen
    And I click "memberTypeDropdown" on "aemTestFormPagePublished" screen
    And I click "clubMemberOption" on "aemTestFormPagePublished" screen
    And I click "memberStatusDropdown" on "aemTestFormPagePublished" screen
    And I click "currentOption" on "aemTestFormPagePublished" screen
    And I click "memberCheckbox" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on Form Button
    And I verify "data-event" attribute is "site interaction" on "submitButton" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "submitButton" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "lead_form" on "submitButton" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "submit" on "submitButton" element on "aemTestFormPagePublished" screen
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate back to the previous page
    And I get object data for "digitalData"
    #Verify analytics - form complete
    #Check analytics tags for form node
    And I verify "$.form.formInfo.formName" value equals "lead_form" for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "lead_form-complete" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    And I verify "$.form.formInfo.formField.marketingConsent" value equals "true" for "digitalData"
    And I verify "$.form.formInfo.formField.memberStatus" value equals "current" for "digitalData"
    And I verify "$.form.formInfo.formField.memberType" value equals "racv club member" for "digitalData"
    And I verify "$.form.formInfo.formField.postcode" value equals "3000" for "digitalData"
    #Check analytics tags for last event node
    And I verify "$.event[-1:].eventAction" value equals "form-navigate" for "digitalData"

  @TestForm-Field-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form field - text input, text area
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-field-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    #Verify membership field appears when email is entered
    And I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I click "addressAreaLabel" on "aemTestFormPagePublished" screen
    #Verify analytics - form text
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "email__c" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    #set the focus inside the address field before submitting to verify membership required error, otherwise onblur error will prevent membership error from appearing
    Then I verify "membershipField" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I verify "requiredMsgMembership" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form text error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "multiple validation errors occurred" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    #verify comment area is hidden when 1 is entered in the membership field
    When I enter "1" details in "membershipField" on "aemTestFormPagePublished" screen
    And I click "addressAreaLabel" on "aemTestFormPagePublished" screen
    Then I verify "commentsArea" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I clear contents of "membershipField" element on "aemTestFormPagePublished" screen
    And I enter "01234567" details in "membershipField" on "aemTestFormPagePublished" screen
    And I click "addressAreaLabel" on "aemTestFormPagePublished" screen
    And I verify "commentsArea" element is visible on "aemTestFormPagePublished" screen
    When I click "submitButton" on "aemTestFormPagePublished" screen
    And I verify "requiredMsgComments" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form text area error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "comments are required" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[5].eventAction" value equals "form-interact" for "digitalData"
    Then I enter "Testing form" details in "commentsArea" on "aemTestFormPagePublished" screen
    And I click "addressAreaLabel" on "aemTestFormPagePublished" screen
    #Verify analytics - form text area
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "comments__c" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[6].eventAction" value equals "form-interact" for "digitalData"
    And I take a screenshot

  @TestForm-Option-Analytics-p3
  @TestForm-Option-Analytics-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form option - checkbox, radio button, dropdown
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-options-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I click "completeInsurance" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form radio button
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "typeofinsurance" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    Then I click "submitButton" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify "requireMsgInsurance" element is not visible on "aemTestFormPagePublished" screen
    And I verify "requireMsgTitle" element is visible on "aemTestFormPagePublished" screen
    #Verify analytics - form dropdown error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "select a title" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I click "titleDropdown" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "mrOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form radio button
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "salutation__c" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    Then I click "submitButton" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify "requireMsgInsurance" element is visible on "aemTestFormPagePublished" screen
    And I verify "requireMsgTitle" element is not visible on "aemTestFormPagePublished" screen
    #Verify analytics - form radio button error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "select a car insurance" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I click "insuranceRadioButton" on "aemTestFormPagePublished" screen
    And I verify "stateCheckbox" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "stateOthers" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    #Verify analytics - form checkbox
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "state__c" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I verify "insuranceRadioButton" element is not visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    When I click "stateOthers" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is visible on "aemTestFormPagePublished" screen
    Then I click "completeInsurance" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "titleDropdown" on "aemTestFormPagePublished" screen
    And I click "mrOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requireMsgState" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form checkbox error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "select a state" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[6].eventAction" value equals "form-interact" for "digitalData"

  @TestForm-DOB-Picker-Analytics-p3
  @TestForm-DOB-Picker-Analytics-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form dob picker
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-dob-picker-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "dobLabel" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    #Click Submit button and verify error state
    When I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requiredMsgDoB" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form dob picker error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "date of birth is required" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-interact" for "digitalData"
    #Enter invalid date and verify constraint error states
    When I enter "06" details in "dayPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "constraintErrorMsg" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I refresh the page
    When I enter "12" details in "monthPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "constraintErrorMsg" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I refresh the page
    When I enter "1111" details in "yearPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "constraintErrorMsg" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    #Enter valid date and click submit button
    When I enter "06" details in "dayPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I enter "12" details in "monthPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I enter "1991" details in "yearPlaceholder" on "aemTestFormPagePublished" screen using JavaScript
    And I click "dobLabel" on "aemTestFormPagePublished" screen
    #https://racvone.atlassian.net/browse/AP3-4628 No analytics data captured for form-interact

  @TestForm-Date-Picker-Analytics-p3
  @TestForm-Date-Picker-Analytics-p3.chrome.ios-mobile
  @Regression-p3.chrome.desktop
  #@Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form date picker
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-date-picker-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "startDateLabel" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    #Click Submit button and verify error states
    When I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requiredMsgStartDate" element is visible on "aemTestFormPagePublished" screen
    And I verify "requiredMsgEndDate" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form date picker error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "multiple validation errors occurred" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    #Select start date before today and verify past dates are enabled
    When I click "datepickerStartDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "prevMonthButton" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row of the calendar table as start date
    Then I click "startDateInCalendar" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "endDateField" on "aemTestFormPagePublished" screen
    #When I click "datepickerEndDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "changeYearButton" on "aemTestFormPagePublished" screen
    #Select the second option
    And I click "yearOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "nextMonthButton" on "aemTestFormPagePublished" screen
    #Verify Sunday and Saturday in the second row of the calendar table are disabled
    And I verify "disabledSunday" element is visible on "aemTestFormPagePublished" screen
    And I verify "disabledSaturday" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Monday in the second row of the calendar table as end date
    And I click "endDateInCalendar" on "aemTestFormPagePublished" screen
    And I click "endDateToolip" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form date picker
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "date2" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"

  @TestForm-File-Uploader-Analytics-p3
  @Regression-p3.chrome.desktop
  #@Regression-p3.chrome.ios-mobile - file upload not supported on iphone
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of form file uploader
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/form-file-uploader-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I wait for "label1" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    #upload valid xlsx to file upload 1 (all  files accepted)
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_xlsx.xlsx"
    And I verify "fileOutput1" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I get object data for "digitalData"
    #Verify analytics - form file uploader
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "file upload" for "digitalData"
    #https://racvone.atlassian.net/browse/AP3-4628 event action is not correct
    #Check analytics tags for event node
    #And I verify "$.event[0].eventAction" value equals "form-interact" for "digitalData"
    And I verify "fileOutput1Delete" element is visible on "aemTestFormPagePublished" screen
    And I click "fileOutput1Delete" on "aemTestFormPagePublished" screen
    And I verify "fileOutput1" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    #Successfuly upload jpg and delete
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_jpg.jpg"
    And I verify "fileOutput1New" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Upload uppercase PNG - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png5.PNG"
    And I verify "fileOutput2Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Upload png - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png2.png"
    And I verify "fileOutput2" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Upload uppercase PDF - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_pdf5.PDF"
    And I verify "fileOutput3Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Upload docx - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_docx.docx"
    And I verify "fileOutput3" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Mimetype test - Upload zip renamed as jpg - fail
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_zip.jpg"
    And I verify "fileOutput4Error" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Verify analytics - form file upload error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "test_zip.jpg is not a supported file type. please upload a file with the correct format .jpg .jpeg .gif .png .pdf .rtf .doc .docx .txt .csv .xls or .xlsx" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[6].eventAction" value equals "form-interact" for "digitalData"

  @TestHeroBanner-Error-401-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of hero banner error - 401
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/hero-banner-error-401.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    #Verify analytics attributes on errorPrimaryButton
    And I verify "data-event" attribute is "site interaction" on "errorPrimaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "errorPrimaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "error banner | 401" on "errorPrimaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "back to home" on "errorPrimaryButton" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on errorSecondaryButton
    And I verify "data-event" attribute is "site interaction" on "errorSecondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "errorSecondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "error banner | 401" on "errorSecondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "explore our products" on "errorSecondaryButton" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics - 401 error
    #Check analytics tags for form node
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.error" value equals "401" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "on page error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "form-interact" for "digitalData"
    #Check analytics tags for page node
    And I verify "$.page.pageInfo.pageType" value equals "on page error" for "digitalData"

  @TestLoanCalculator-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of loan calculator
    #launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/loan-calculator-analytics-p3.html"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I click "fortnightlyButton" on "aemTestLoanCalculatorPagePublished" screen
    #Verify analytics - first interacts
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "loan calculator" for "digitalData"
    And I verify "$.tool.toolInfo.toolType" value equals "calculator" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "tool-interact" for "digitalData"
    When I click "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "loanAmountField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter "0" details in "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I click "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "interestRateField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter ".9" details in "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I click "loanTermField" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    #Verify analytics - interacts
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "loan calculator" for "digitalData"
    And I verify "$.tool.toolInfo.toolType" value equals "calculator" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "interact" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.paymentFrequency" value equals "fortnight" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.loanAmount" value equals "50000" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.interestRate" value equals "4.9" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.loanTerm" value equals "5" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[-1:].eventAction" value equals "tool-interact" for "digitalData"
    When I click "monthlyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I click "applyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I wait for "applyButton" to disappear on "aemTestLoanCalculatorPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate back to the previous page
    #Verify analytics - form complete
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "loan calculator" for "digitalData"
    And I verify "$.tool.toolInfo.toolType" value equals "calculator" for "digitalData"
    And I verify "$.tool.toolInfo.stepName" value equals "loan calculator - complete" for "digitalData"
    And I verify "$.tool.toolInfo.stepNumber" value equals "2" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.paymentFrequency" value equals "month" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.loanAmount" value equals "50000" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.interestRate" value equals "4.9" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.loanTerm" value equals "5" for "digitalData"
    #Check analytics tags for last event node
    And I verify "$.event[-1:].eventAction" value equals "tool-navigate" for "digitalData"

  @TestHotelBookingWidget-Analytics-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of hotel booking widget
    #Launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/test-automation-te-search-widget-p3.html#hotels"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    #Select Sunday in the third row from the second month container of the calendar table as start date
    When I click "dates" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "startDate" on "aemTestHotelBookingWidgetPagePublished" screen
    #Select Saturday in the third row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    #Verify analytics - single inline error
    And I get object data for "digitalData"
    #Check analytics tags for event node
    Then I verify "$.tool.toolInfo.toolName" value equals "travel and experiences widget" for "digitalData"
    And I verify "$.tool.toolInfo.toolArea" value equals "hotels" for "digitalData"
    And I verify "$.tool.toolInfo.error" value equals "please enter a destination" for "digitalData"
    And I verify "$.tool.toolInfo.errorType" value equals "in line error" for "digitalData"
    And I verify "$.tool.toolInfo.errorTrigger" value equals "location" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "tool-interact" for "digitalData"
    And I refresh the page
    When I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I enter "abcd" details in "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "LocationSearchErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics - free text search error
    And I get object data for "digitalData"
    #Check analytics tags for event node
    Then I verify "$.tool.toolInfo.toolName" value equals "travel and experiences widget" for "digitalData"
    And I verify "$.tool.toolInfo.toolArea" value equals "hotels" for "digitalData"
    And I verify "$.tool.toolInfo.error" value equals "please enter a destination" for "digitalData"
    And I verify "$.tool.toolInfo.errorType" value equals "in line error" for "digitalData"
    And I verify "$.tool.toolInfo.errorTrigger" value equals "location" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "tool-interact" for "digitalData"
    And I refresh the page
    When I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    #Verify analytics - multiple inline error
    And I get object data for "digitalData"
    Then I verify "$.tool.toolInfo.toolName" value equals "travel and experiences widget" for "digitalData"
    And I verify "$.tool.toolInfo.toolArea" value equals "hotels" for "digitalData"
    And I verify "$.tool.toolInfo.error" value equals "multiple validation errors occurred" for "digitalData"
    And I verify "$.tool.toolInfo.errorType" value equals "in line error" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-interact" for "digitalData"
    And I refresh the page
    When I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "cairnsOption" on "aemTestHotelBookingWidgetPagePublished" screen
    #Verify analytics - first interacts
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "travel and experiences widget" for "digitalData"
    And I verify "$.tool.toolInfo.toolArea" value equals "hotels" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "start" for "digitalData"
    And I verify "$.tool.toolInfo.stepName" value equals "find a hotel" for "digitalData"
    And I verify "$.tool.toolInfo.stepNumber" value equals "1" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-navigate" for "digitalData"
    When I click "dates" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestHotelBookingWidgetPagePublished" screen
    #Select Saturday in the third row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I navigate back to the previous page
    #Verify analytics - complete
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "travel and experiences widget" for "digitalData"
    And I verify "$.tool.toolInfo.toolArea" value equals "hotels" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.tool.toolInfo.stepName" value equals "find a hotel" for "digitalData"
    And I verify "$.tool.toolInfo.stepNumber" value equals "2" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.toolGuests" value equals "2" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.toolLocation" value equals "cairns" for "digitalData"
    #Check analytics tags for last event node
    And I verify "$.event[-1:].eventAction" value equals "tool-navigate" for "digitalData"

  @TestResortBookingWidget-Analytics-p3
  @Regression-p3.chrome.desktop
  @AnalyticsEvents-p3
  @Integration-p3
  Scenario: Verify the analytics data of resort booking widget
    #Launch the page
    Given I launch app page "URL/racv-home/utility/qa/analytics/test-automation-te-search-widget-p3.html#resorts"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    And I take a screenshot
    When I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I verify "memberTypeEmptyErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics - single inline error
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "resorts booking widget" for "digitalData"
    And I verify "$.tool.toolInfo.error" value equals "please select member type" for "digitalData"
    And I verify "$.tool.toolInfo.errorTrigger" value equals "member dropdown" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-interact" for "digitalData"
    When I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "addPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I enter "1122334" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics - promo code error
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "resorts booking widget" for "digitalData"
    And I verify "$.tool.toolInfo.error" value equals "please enter a valid promo code" for "digitalData"
    And I verify "$.tool.toolInfo.errorTrigger" value equals "1122334" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[2].eventAction" value equals "tool-interact" for "digitalData"
    And I refresh the page
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    Then I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics - form inline errors
    And I get object data for "digitalData"
    #Check analytics tags for form node
    Then I verify "$.form.formInfo.error" value equals "multiple validation errors occurred" for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "in line error" for "digitalData"
    And I verify "$.form.formInfo.errorTrigger" value equals "resorts booking widget member validation" for "digitalData"
    #Check analytics tags for user node
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[1].eventAction" value equals "form-interact" for "digitalData"
    And I enter "123456" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "Test" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics - form on page errors
    And I get object data for "digitalData"
    #Check analytics tags for form node
    Then I verify "$.form.formInfo.error" value equals "membership number and family name combination is incorrect. please try again." for "digitalData"
    And I verify "$.form.formInfo.errorType" value equals "on page error" for "digitalData"
    And I verify "$.form.formInfo.errorTrigger" value equals "resorts booking widget member validation" for "digitalData"
    #Check analytics tags for user node
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[-1:].eventAction" value equals "form-interact" for "digitalData"
    And I refresh the page
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    Then I enter "DATAMAP[clubMemberNumber]" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics - form first interacts
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.form.formInfo.formName" value equals "resorts booking widget member validation" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "member details" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    #Check analytics tags for user node
    And I verify "$.user.userInfo.authState" value equals "unauth" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[1].eventAction" value equals "form-navigate" for "digitalData"
    And I verify "$.event[2].eventAction" value equals "form-interact" for "digitalData"
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "clubMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics - form complete
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.form.formInfo.formName" value equals "resorts booking widget member validation" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "member validated" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "2" for "digitalData"
    #Check analytics tags for user node
    And I verify "$.user.userInfo.authState" value equals "auth" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[-1:].eventAction" value equals "member-validate" for "digitalData"
    And I refresh the page
    When I click "location" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "allVicCheckbox" on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics - first interacts
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "resorts booking widget" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "start" for "digitalData"
    And I verify "$.tool.toolInfo.stepName" value equals "find a resort" for "digitalData"
    And I verify "$.tool.toolInfo.stepNumber" value equals "1" for "digitalData"
    #Check analytics tags for event node
    And I verify "$.event[0].eventAction" value equals "tool-navigate" for "digitalData"
    When I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Sunday in the second row of the calendar table as start date
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Saturday in the second row of the calendar table as end date
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    Then I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    When I click "guests" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "childrenIncreaseButton" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    Then I click "childrenIncreaseButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #RACV Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "racvMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    Then I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "travel-experiences/resorts/search.html"
    And I navigate back to the previous page
    #Verify analytics - complete
    And I get object data for "digitalData"
    #Check analytics tags for tool node
    Then I verify "$.tool.toolInfo.toolName" value equals "resorts booking widget" for "digitalData"
    And I verify "$.tool.toolInfo.stage" value equals "complete" for "digitalData"
    And I verify "$.tool.toolInfo.stepName" value equals "find a resort" for "digitalData"
    And I verify "$.tool.toolInfo.stepNumber" value equals "2" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.toolLocation" value equals "cape schanck resort:cobram resort:goldfields resort:torquay resort:inverloch resort:healesville country club and resort" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.toolGuests" value equals "3" for "digitalData"
    And I verify "$.tool.toolInfo.toolField.toolMemberType" value equals "racv_member" for "digitalData"
    #Check analytics tags for last event node
    And I verify "$.event[-1:].eventAction" value equals "tool-navigate" for "digitalData"