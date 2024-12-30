Feature: This feature validates AP3 form constraints and submissions with value attributes injected and XSS filtering injected

  @TestFormConstraintsPostcodeInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 1 - postcode, submissions with value attribute injected, test case AP3-T725
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 4 numbers
    When I update "postcode" attributes "value" to "3128" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 4 numbers starting with 0
    When I update "postcode" attributes "value" to "0123" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - 4 zeros
    When I update "postcode" attributes "value" to "0000" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - letters
    When I update "postcode" attributes "value" to "abcd" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - 3 numbers + 1 symbol
    When I update "postcode" attributes "value" to "223%" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - 3 numbers + 1 letter
    When I update "postcode" attributes "value" to "223p" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 7 - 3 numbers + period(floating number)
    When I update "postcode" attributes "value" to "223.1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 8 - 3 or less numbers
    When I update "postcode" attributes "value" to "223" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 9 - empty input
    And I update "postcode" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "postcodeErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestPostcodeConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 1 - Postcode, submissions with XSS filtering injected, test case AP3-T725
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "postcode" attributes "value" to "java" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsABNInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 4 - abn, submissions with value attributes injected, test case AP3-T727
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-14 numbers
    When I update "abn" attributes "value" to "44004060833123" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - letters
    When I update "abn" attributes "value" to "abcdefgh" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - 1-14 numbers with whitespace
    When I update "abn" attributes "value" to "1234 56789" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - 1-14 numbers with 1 letter
    When I update "abn" attributes "value" to "1234k56789" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - 1-14 numbers with 1 symbol
    When I update "abn" attributes "value" to "1234&56789" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "abn" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "abnErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestABNConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 4 - abn, submissions with XSS filtering injected, test case AP3-T727
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "abn" attributes "value" to "script" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsAddressLineInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 5 - address line, submissions with value attributes injected, test case AP3-T728
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1 letter/number
    When I update "addressLine" attributes "value" to "a" value on "formConstraintsPage" screen
    And I click "submitButton" on "formConstraintsPage" screen
    And I take a screenshot
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 100 letters/numbers
    When I update "addressLine" attributes "value" to "Office Of Governor & Lieutenant Governor, 75 Rev Doctor Martin Luther King Junior Boulevard Suite 90" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - unit number
    When I update "addressLine" attributes "value" to "110/225 Elizabeth Street, Melbourne VIC" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - range number
    When I update "addressLine" attributes "value" to "159-161 Johnston St, Fitzroy VIC 3065" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 5 - invalid symbols
    When I update "addressLine" attributes "value" to "^500 Elizabeth Street$, Melbourne VIC" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - valid symbols
    When I update "addressLine" attributes "value" to "80 A'Beckett Street, Melbourne VIC" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 7 - empty
    When I update "addressLine" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "addressLineErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestAddressLineConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 5 - address line, submissions with XSS filtering injected, test case AP3-T728
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "addressLine" attributes "value" to "md5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "invalidInputError" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsAgeInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 6 - age, submissions with value attributes injected, test case AP3-T729
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-3 numbers
    When I update "age" attributes "value" to "67" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 1-3 numbers starting with 0
    When I update "age" attributes "value" to "08" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - numbers + letters
    When I update "age" attributes "value" to "1a" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - numbers + symbols
    When I update "age" attributes "value" to "1&" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - numbers + symbols + letters
    When I update "age" attributes "value" to "1#a" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - numbers + whitespace
    When I update "age" attributes "value" to "1 3" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 7 - 1 or more letters
    When I update "age" attributes "value" to "ab" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 8 - empty input
    When I update "age" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "ageErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestAgeConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 6 - age, submissions with XSS filtering injected, test case AP3-T729
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "age" attributes "value" to "md5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsStreetNumberInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 7 - street number, submissions with value attributes injected, test case AP3-T730
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - space
    When I update "streetNumber" attributes "value" to "1 2" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - hyphen
    When I update "streetNumber" attributes "value" to "712-714" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - capital letters
    When I update "streetNumber" attributes "value" to "Ca" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - lowercase letters
    When I update "streetNumber" attributes "value" to "ca" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 5 - numbers
    When I update "streetNumber" attributes "value" to "189" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 6 - space + letters/numbers
    When I update "streetNumber" attributes "value" to " a1ba1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 7 - hyphen + letters/numbers
    When I update "streetNumber" attributes "value" to "-a1ba1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 8 - letter + letters/numbers
    When I update "streetNumber" attributes "value" to "a1ba1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 9 - number + letters/numbers
    When I update "streetNumber" attributes "value" to "1a1ba1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 10 - empty input
    When I update "streetNumber" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "streetNumberErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestStreetNumberConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 7 - street number, submissions with XSS filtering injected, test case AP3-T730
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "streetNumber" attributes "value" to ".bash" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsOrganisationInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 8 - organisation, submissions with value attributes injected, test case AP3-T731
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - all uppercase letters with length between 1 and 150
    When I update "organisation" attributes "value" to "RACV" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - all lowercase letters with length between 1 and 150
    When I update "organisation" attributes "value" to "racv" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - all numbers with length between 1 and 150
    When I update "organisation" attributes "value" to "1122334455" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - 1-150 alphanumeric characters with combination of uppercase letters, lowercase letters, and numbers
    When I update "organisation" attributes "value" to "Racv12" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 5 - 1-150 alphanumeric characters containing a symbol
    When I update "organisation" attributes "value" to "Royal ! Automobile # Club $ of * Victoria" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "organisation" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "organisationErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestOrganisationConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 8 - organisation, submissions with XSS filtering injected, test case AP3-T731
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "organisation" attributes "value" to "cmd" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "invalidInputError" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsYearInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 10 - year, submissions with value attributes injected, test case AP3-T732
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 2 numbers
    When I update "year" attributes "value" to "99" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 4 numbers
    When I update "year" attributes "value" to "1999" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - 3 numbers
    When I update "year" attributes "value" to "199" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - letters
    When I update "year" attributes "value" to "abcd" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "year" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "yearErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestYearConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 10 - year, submissions with XSS filtering injected, test case AP3-T732
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "year" attributes "value" to "md5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsEmailInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 11 - email, submissions with value attributes injected, test case AP3-T733
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - normal email
    When I update "email" attributes "value" to "digitalqa@racv.com.au" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - including "." symbol within an email address
    When I update "email" attributes "value" to "very.common@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - including "-" symbol within an email address
    When I update "email" attributes "value" to "fully-qualified-domain@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - including "-" symbol in local-part and "." symbol in domain name
    When I update "email" attributes "value" to "other.email-with-hyphen@and.subdomains.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 5 - including "-" symbol within both domain name and local-part
    When I update "email" attributes "value" to "other-indeed@strange-gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 6 - no @ character
    When I update "email" attributes "value" to "Abc.gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 7 - more than one @ character without question marks
    When I update "email" attributes "value" to "A@b@c@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 8 - special characters in this local-part without question marks
    When I update "email" attributes "value" to "a\"b(c)d,e:f;g<h>i[j\k]l@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 9 - quoted strings in the local part
    When I update "email" attributes "value" to "just\"not\"right@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 10 - spaces, quotes, and backslashes may only exist when within quoted strings and preceded by a backslash
    When I update "email" attributes "value" to "this is\"not\allowed@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 11 - even if escaped (preceded by a backslash), spaces, quotes, and backslashes must still be contained by quotes
    When I update "email" attributes "value" to "this\ still\"not\\allowed@gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 12 - local-part is longer than 64 characters
    When I update "email" attributes "value" to "1234567890123456789012345678901234567890123456789012345678901234+x@example.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 13 - underscore
    When I update "email" attributes "value" to "i_like_underscore@but_its_not_allowed_in_this_part.gmail.com" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 14 - empty input
    When I update "email" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "emailErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestEmailConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 11 - email, submissions with XSS filtering injected, test case AP3-T733
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "email" attributes "value" to "javascript" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNameInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 12 - name, submissions with value attributes inhected, test case AP3-T734
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - only alphabets
    When I update "name" attributes "value" to "kim" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - alphanumeric input
    When I update "name" attributes "value" to "12u3ttarr" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - alphabet input and "-", "'" and spaces
    When I update "name" attributes "value" to "'u-t tarr" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - alphabet input with umlauts
    When I update "name" attributes "value" to "für" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - alphabet input and "_", ".", tabs, line breaks
    When I update "name" attributes "value" to "u_t.t	arr" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "name" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "nameErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestNameConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 12 - name, submissions with XSS filtering inhected, test case AP3-T734
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "name" attributes "value" to "java" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "invalidInputError" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsPromoCodeInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 13 - promo code, submissions with value attributes injected, test case AP3-T735
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - all uppercase letters with length between 1 and 10
    When I update "promoCode" attributes "value" to "SASASASA" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - all lowercase letters with length between 1 and 10
    When I update "promoCode" attributes "value" to "sasasasa" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - all numbers with length between 1 and 10
    When I update "promoCode" attributes "value" to "12345678" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - 1-10 uppercase letters/lowercase letter/numbers
    When I update "promoCode" attributes "value" to "E21C2kmwe1" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 5 - including symbols
    When I update "promoCode" attributes "value" to "S#1289vbn+" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "promoCode" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "promoCodeErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestPromocodeConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 13 - promo code, submissions with XSS filtering injected, test case AP3-T735
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "promoCode" attributes "value" to "csh" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "invalidInputError" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsMembershipNoInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 14 - membership number, submissions with value attributes injected, test case AP3-T736
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-8 numbers
    When I update "membershipNo" attributes "value" to "1234567" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - any number of letters
    When I update "membershipNo" attributes "value" to "abcdefg" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - any string of numbers with lengths 1 to 8 containing letters
    When I update "membershipNo" attributes "value" to "1234jk" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - any string of numbers with lengths 1 to 8 containing letters
    When I update "membershipNo" attributes "value" to "1234&*" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - any string of numbers with lengths 1 to 8 containing whitespace
    When I update "membershipNo" attributes "value" to "12 34 5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "membershipNo" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "membershipNoErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestMembershipNoConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 14 - membership number, submissions with XSS filtering injected, test case AP3-T736
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "membershipNo" attributes "value" to "ksh" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsMonthInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 15 - month, submissions with value attributes injected, test case AP3-T737
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1 number
    When I update "month" attributes "value" to "9" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 2 numbers strating with 0
    When I update "month" attributes "value" to "09" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - 2 numbers starting with 1, and the number is less than or equal to 12
    When I update "month" attributes "value" to "11" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 4 - 2 numbers more than 12
    When I update "month" attributes "value" to "13" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - any number of letters
    When I update "month" attributes "value" to "abc" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - 1 number + 1 letter
    When I update "month" attributes "value" to "1a" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 7 - 1 number + 1 symbol
    When I update "month" attributes "value" to "1!" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 8 - empty input
    When I update "month" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "monthErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestMonthConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 15 - month, submissions with XSS filtering injected, test case AP3-T737
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "month" attributes "value" to "pw" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNationalMeterIdentifierInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 16 - national meter identifier, submissions with value attributes injected, test case AP3-T738
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 11 numbers
    When I update "nationalMeterIdentifier" attributes "value" to "99887766551" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - 10 or less numbers
    When I update "nationalMeterIdentifier" attributes "value" to "9988776655" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - any string of numbers with length 11 containing letter(s)
    When I update "nationalMeterIdentifier" attributes "value" to "9988776655a" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - any string of numbers with length 11 containing symbol(s)
    When I update "nationalMeterIdentifier" attributes "value" to "9988776655#" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - empty input
    When I update "nationalMeterIdentifier" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "nationalMeterIdentifierErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestNMIConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 16 - national meter identifier, submissions with XSS filtering injected, test case AP3-T738
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "nationalMeterIdentifier" attributes "value" to "tftp" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfEmployeesInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 17 - No. of employees, submissions with value attributes injected, test case AP3-T739
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-5 numbers
    When I update "noOfEmployees" attributes "value" to "99887" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - letters
    When I update "noOfEmployees" attributes "value" to "abcde" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - numbers + letters
    When I update "noOfEmployees" attributes "value" to "1234e" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - numbers + symbols
    When I update "noOfEmployees" attributes "value" to "1234@" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - numbers + space
    When I update "noOfEmployees" attributes "value" to "123 4" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "noOfEmployees" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "noOfEmployeesErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestNoOfEmployeesConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 17 - No. of employees, submissions with XSS filtering injected, test case AP3-T739
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "noOfEmployees" attributes "value" to "wget" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfGuestsInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 18 - No. of guests, submissions with value attributes injected, test case AP3-T740
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-3 numbers
    When I update "noOfGuests" attributes "value" to "112" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - letters
    When I update "noOfGuests" attributes "value" to "abcde" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - numbers + letters
    When I update "noOfGuests" attributes "value" to "1e" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - numbers + symbols
    When I update "noOfGuests" attributes "value" to "1@" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - empty input
    When I update "noOfGuests" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "noOfGuestsErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestNoOfGuestsConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 18 - No. of guests, submissions with XSS filtering injected, test case AP3-T740
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "noOfGuests" attributes "value" to "md5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfNightsInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 19 - No. of nights, submissions with value attributes injected, test case AP3-T741
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-2 numbers
    When I update "noOfNights" attributes "value" to "12" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - letters
    When I update "noOfNights" attributes "value" to "ab" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 3 - numbers + letters
    When I update "noOfNights" attributes "value" to "1e" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - numbers + symbols
    When I update "noOfNights" attributes "value" to "1@" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - empty input
    When I update "noOfNights" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "noOfNightsErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestNoOfNightsConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 19 - No. of nights, submissions with XSS filtering injected, test case AP3-T741
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "noOfNights" attributes "value" to "pw" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsContactNumberInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 20 - contact number, submissions with value attributes injected, test case AP3-T726
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - 1-11 numbers
    When I update "telephone" attributes "value" to "92331234123" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - numbers starting with 0
    When I update "telephone" attributes "value" to "0429233123" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - letters
    When I update "telephone" attributes "value" to "abcdefgh" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - a string of length bewteen 1 and 11 containing letter(s)
    When I update "telephone" attributes "value" to "91234567h" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - a string of length bewteen 1 and 11 containing symbol(s)
    When I update "telephone" attributes "value" to "91234567&" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - a string of length bewteen 1 and 11 containing space
    When I update "telephone" attributes "value" to "9123 456 7" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 7 - empty input
    When I update "telephone" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "phoneErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestTelephoneConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 20 - contact number, submissions with XSS filtering injected, test case AP3-T726
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "telephone" attributes "value" to "passwd" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsRateInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 21 - rate, submissions with value attributes injected, test case AP3-T742
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - an integer number of length between 1 and 3
    When I update "rate" attributes "value" to "12" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - a floating number of length between 1 and 3
    When I update "rate" attributes "value" to "0.2" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - letters
    When I update "rate" attributes "value" to "abc" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 4 - a string of length between 1-3 containing numbers and letters
    When I update "rate" attributes "value" to "12k" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 5 - a string of length between 1-3 containing numbers and symbols
    When I update "rate" attributes "value" to "1%9" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Scenario 6 - empty input
    When I update "rate" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "rateErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestRateConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 21 - rate, submissions with XSS filtering injected, test case AP3-T742
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "rate" attributes "value" to "md5" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsUrlPatternInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 22 - Url pattern, submissions with value attributes injected, test case AP3-T743
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - characters
    When I update "urlPattern" attributes "value" to "https://www.racv.com.au/" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 2 - special symbols
    When I update "urlPattern" attributes "value" to "https://www.racv.com.au/?kids=3" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I wait for "thankYouPageBanner" on "formConstraintsPage" screen or "60" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I navigate to "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 3 - empty input
    When I update "urlPattern" attributes "value" to "" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "urlPatternErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestUrlPatternConstraintsXssInjection-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field validation and constraint 22 - Url pattern, submissions with XSS filtering injected, test case AP3-T743
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    When I update "urlPattern" attributes "value" to ".bash" value on "formConstraintsPage" screen
    And I take a screenshot
    And I click "submitButton" on "formConstraintsPage" screen
    Then I verify "invalidInputError" element is visible on "formConstraintsPage" screen
    And I take a screenshot