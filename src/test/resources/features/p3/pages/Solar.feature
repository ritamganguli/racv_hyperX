Feature: This feature validates solar form "my home" variation

  @TestRACVSolarMyHomeFormSubmission-p3
  @TestRACVSolarMyHomeFormSubmission-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
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

  @TestRACVSolarMyBusinessFormSubmission-p3
  @TestRACVSolarMyBusinessFormSubmission-p3.chrome.ios-mobile
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
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