Feature: This feature validates AP3 form constraints on blur

  @TestFormConstraintsPostcode-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 1 - postcode, test case AP3-T725
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 1 - 4 numbers
    When I enter "3128" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 2 - 4 numbers starting with 0
    When I enter "0123" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 3 - 4 zeros
    When I enter "0000" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 4 - letters
    When I enter "abcd" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 5 - 3 numbers + 1 symbol
    When I enter "223%" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 6 - 3 numbers + 1 letter
    When I enter "223p" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 7 - 3 numbers + period(floating number)
    When I enter "223.1" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 8 - 3 or less numbers
    When I enter "223" details in "postcode" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "postcode" element on "formConstraintsPage" screen
    #Scenario 9 - empty input
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "postcodeErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsABN-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 4 - abn, test case AP3-T727
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 1 - 1-14 numbers
    When I enter "44004060833" details in "abn" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 2 - letters
    When I enter "abcdefgh" details in "abn" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 3 - 1-14 numbers with whitespace
    When I enter "1234 56789" details in "abn" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 4 - 1-14 numbers with 1 letter
    When I enter "1234k56789" details in "abn" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 5 - 1-14 numbers with 1 symbol
    When I enter "1234&56789" details in "abn" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "abn" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "abnErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsAddressLine-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 5 - address line, test case AP3-T728
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 1 - 1 letter/number
    When I enter "a" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 2 - 100 letters/numbers
    When I enter "Office Of Governor & Lieutenant Governor, 75 Rev Doctor Martin Luther King Junior Boulevard Suite 90" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 3 - unit number
    When I enter "110/225 Elizabeth Street, Melbourne VIC" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 4 - range number
    When I enter "159-161 Johnston St, Fitzroy VIC 3065" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 5 - invalid symbols
    When I enter "^500 Elizabeth Street$, Melbourne VIC" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 6 - valid symbols
    When I enter "80 A'Beckett Street, Melbourne VIC" details in "addressLine" on "formConstraintsPage" screen
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "addressLine" element on "formConstraintsPage" screen
    #Scenario 7 - empty
    And I click "abn" on "formConstraintsPage" screen
    Then I verify "addressLineErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsAge-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 6 - age, test case AP3-T729
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 1 - 1-3 numbers
    When I enter "67" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 2 - 1-3 numbers starting with 0
    When I enter "08" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 3 - numbers + letters
    When I enter "1a" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 4 - numbers + symbols
    When I enter "1&" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 5 - numbers + symbols + letters
    When I enter "1#a" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 6 - numbers + whitespace
    When I enter "1 3" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 7 - 1 or more letters
    When I enter "ab" details in "age" on "formConstraintsPage" screen
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "age" element on "formConstraintsPage" screen
    #Scenario 8 - empty input
    And I click "addressLine" on "formConstraintsPage" screen
    Then I verify "ageErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsStreetNumber-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 7 - street number, test case AP3-T730
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - space
    When I enter "1 2" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 2 - hyphen
    When I enter "712-714" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 3 - capital letters
    When I enter "Ca" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 4 - lowercase letters
    When I enter "ca" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 5 - numbers
    When I enter "189" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 6 - space + letters/numbers
    When I enter " a1ba1" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 7 - hyphen + letters/numbers
    When I enter "-a1ba1" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 8 - letter + letters/numbers
    When I enter "a1ba1" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 9 - number + letters/numbers
    When I enter "1a1ba1" details in "streetNumber" on "formConstraintsPage" screen
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "streetNumber" element on "formConstraintsPage" screen
    #Scenario 10 - empty input
    And I click "organisation" on "formConstraintsPage" screen
    Then I verify "streetNumberErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsOrganisation-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 8 - organisation, test case AP3-T731
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 1 - all uppercase letters with length between 1 and 150
    When I enter "RACV" details in "organisation" on "formConstraintsPage" screen
    And I click "year" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 2 - all lowercase letters with length between 1 and 150
    When I enter "racv" details in "organisation" on "formConstraintsPage" screen
    And I click "year" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 3 - all numbers with length between 1 and 150
    When I enter "1122334455" details in "organisation" on "formConstraintsPage" screen
    And I click "year" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 4 - 1-150 alphanumeric characters with combination of uppercase letters, lowercase letters, and numbers
    When I enter "Racv12" details in "organisation" on "formConstraintsPage" screen
    And I click "year" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 5 - 1-150 alphanumeric characters containing symbols
    When I enter "Royal ! Automobile # Club $ of * Victoria" details in "organisation" on "formConstraintsPage" screen
    And I click "year" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "organisation" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "year" on "formConstraintsPage" screen
    Then I verify "organisationErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsYear-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 10 - year, test case AP3-T732
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "year" element on "formConstraintsPage" screen
    #Scenario 1 - 2 numbers
    When I enter "99" details in "year" on "formConstraintsPage" screen
    And I click "email" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "year" element on "formConstraintsPage" screen
    #Scenario 2 - 4 numbers
    When I enter "1999" details in "year" on "formConstraintsPage" screen
    And I click "email" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "year" element on "formConstraintsPage" screen
    #Scenario 3 - 3 numbers
    When I enter "199" details in "year" on "formConstraintsPage" screen
    And I click "email" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "year" element on "formConstraintsPage" screen
    #Scenario 5 - letters
    When I enter "abcd" details in "year" on "formConstraintsPage" screen
    And I click "email" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "year" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "email" on "formConstraintsPage" screen
    Then I verify "yearErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsEmail-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 11 - email, test case AP3-T733
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 1 - normal email
    When I enter "testing@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 2 - including "." symbol within an email address
    When I enter "very.common@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 3 - including "-" symbol within an email address
    When I enter "fully-qualified-domain@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 4 - including "-" symbol in local-part and "." symbol in domain name
    When I enter "other.email-with-hyphen@and.subdomains.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 5 - including "-" symbol within both domain name and local-part
    When I enter "other-indeed@strange-example.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 6 - no @ character
    When I enter "Abc.example.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 7 - more than one @ character without question marks
    When I enter "A@b@c@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 8 - special characters in this local-part without question marks
    When I enter "a\"b(c)d,e:f;g<h>i[j\k]l@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 9 - quoted strings in the local part
    When I enter "just\"not\"right@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 10 - spaces, quotes, and backslashes may only exist when within quoted strings and preceded by a backslash
    When I enter "this is\"not\allowed@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 11 - even if escaped (preceded by a backslash), spaces, quotes, and backslashes must still be contained by quotes
    When I enter "this\ still\"not\\allowed@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 12 - local-part is longer than 64 characters
    When I enter "1234567890123456789012345678901234567890123456789012345678901234+x@gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 13 - underscore in domain part
    When I enter "i_like_underscore@but_its_not_allowed_in_this_part.gmail.com" details in "email" on "formConstraintsPage" screen
    And I click "name" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "email" element on "formConstraintsPage" screen
    #Scenario 14 - empty input
    And I click "name" on "formConstraintsPage" screen
    Then I verify "emailErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsName-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 12 - name, test case AP3-T734
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 1 - only alphabets
    When I enter "kim" details in "name" on "formConstraintsPage" screen
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 2 - alphanumeric input
    When I enter "12u3ttarr" details in "name" on "formConstraintsPage" screen
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 3 - alphabet input and "-", "'" and spaces
    When I enter "'u-t tarr" details in "name" on "formConstraintsPage" screen
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 4 - alphabet input and "_", ".", tabs, line breaks
    When I enter "u_t.t	arr" details in "name" on "formConstraintsPage" screen
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 5 - alphabet input with umlauts
    When I enter "für" details in "name" on "formConstraintsPage" screen
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "name" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "promoCode" on "formConstraintsPage" screen
    Then I verify "nameErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsPromoCode-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 13 - promo code, test case AP3-T735
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 1 - all uppercase letters with length between 1 and 10
    When I enter "SASASASA" details in "promoCode" on "formConstraintsPage" screen
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 2 - all lowercase letters with length between 1 and 10
    When I enter "sasasasa" details in "promoCode" on "formConstraintsPage" screen
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 3 - all numbers with length between 1 and 10
    When I enter "12345678" details in "promoCode" on "formConstraintsPage" screen
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 4 - 1-10 uppercase letters/lowercase letter/numbers
    When I enter "E21C2kmwe1" details in "promoCode" on "formConstraintsPage" screen
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 5 - including symbols
    When I enter "S#1289vbn+" details in "promoCode" on "formConstraintsPage" screen
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "promoCode" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "membershipNo" on "formConstraintsPage" screen
    Then I verify "promoCodeErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsMembershipNo-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 14 - membership number, test case AP3-T736
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 1 - 1-8 numbers
    When I enter "1234567" details in "membershipNo" on "formConstraintsPage" screen
    And I click "month" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 2 - any number of letters
    When I enter "abcdefg" details in "membershipNo" on "formConstraintsPage" screen
    And I click "month" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 3 - any string of numbers with lengths 1 to 8 containing letters
    When I enter "1234jk" details in "membershipNo" on "formConstraintsPage" screen
    And I click "month" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 4 - any string of numbers with lengths 1 to 8 containing letters
    When I enter "1234&*" details in "membershipNo" on "formConstraintsPage" screen
    And I click "month" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 5 - any string of numbers with lengths 1 to 8 containing spaces
    When I enter "12 34 5" details in "membershipNo" on "formConstraintsPage" screen
    And I click "month" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "membershipNo" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "month" on "formConstraintsPage" screen
    Then I verify "membershipNoErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsMonth-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 15 - month, test case AP3-T737
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 1 - 1 number
    When I enter "9" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 2 - 2 numbers strating with 0
    When I enter "09" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 3 - 2 numbers starting with 1, and the number is less than or equal to 12
    When I enter "11" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 4 - 2 numbers more than 12
    When I enter "13" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 5 - any number of letters
    When I enter "abc" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 6 - 1 number + 1 letter
    When I enter "1a" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 7 - 1 number + 1 symbol
    When I enter "1!" details in "month" on "formConstraintsPage" screen
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "month" element on "formConstraintsPage" screen
    #Scenario 8 - empty input
    And I click "nationalMeterIdentifier" on "formConstraintsPage" screen
    Then I verify "monthErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNationalMeterIdentifier-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 16 - national meter identifier, test case AP3-T738
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "nationalMeterIdentifier" element on "formConstraintsPage" screen
    #Scenario 1 - 11 numbers
    When I enter "99887766551" details in "nationalMeterIdentifier" on "formConstraintsPage" screen
    And I click "noOfEmployees" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "nationalMeterIdentifier" element on "formConstraintsPage" screen
    #Scenario 2 - 10 or less numbers
    When I enter "9988776655" details in "nationalMeterIdentifier" on "formConstraintsPage" screen
    And I click "noOfEmployees" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "nationalMeterIdentifier" element on "formConstraintsPage" screen
    #Scenario 3 - any string of numbers with length 11 containing letter(s)
    When I enter "9988776655a" details in "nationalMeterIdentifier" on "formConstraintsPage" screen
    And I click "noOfEmployees" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "nationalMeterIdentifier" element on "formConstraintsPage" screen
    #Scenario 4 - any string of numbers with length 11 containing symbol(s)
    When I enter "9988776655#" details in "nationalMeterIdentifier" on "formConstraintsPage" screen
    And I click "noOfEmployees" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "nationalMeterIdentifier" element on "formConstraintsPage" screen
    #Scenario 5 - empty input
    And I click "noOfEmployees" on "formConstraintsPage" screen
    Then I verify "nationalMeterIdentifierErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfEmployees-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 17 - No. of employees, test case AP3-T739
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 1 - 1-5 numbers
    When I enter "99887" details in "noOfEmployees" on "formConstraintsPage" screen
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 2 - letters
    When I enter "abcde" details in "noOfEmployees" on "formConstraintsPage" screen
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 3 - numbers + letters
    When I enter "1234e" details in "noOfEmployees" on "formConstraintsPage" screen
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 4 - numbers + symbols
    When I enter "1234@" details in "noOfEmployees" on "formConstraintsPage" screen
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 5 - numbers + space
    When I enter "123 4" details in "noOfEmployees" on "formConstraintsPage" screen
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfEmployees" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "noOfGuests" on "formConstraintsPage" screen
    Then I verify "noOfEmployeesErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfGuests-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 18 - No. of guests, test case AP3-T740
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfGuests" element on "formConstraintsPage" screen
    #Scenario 1 - 1-3 numbers
    When I enter "112" details in "noOfGuests" on "formConstraintsPage" screen
    And I click "noOfNights" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfGuests" element on "formConstraintsPage" screen
    #Scenario 2 - letters
    When I enter "abcde" details in "noOfGuests" on "formConstraintsPage" screen
    And I click "noOfNights" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfGuests" element on "formConstraintsPage" screen
    #Scenario 3 - numbers + letters
    When I enter "1e" details in "noOfGuests" on "formConstraintsPage" screen
    And I click "noOfNights" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfGuests" element on "formConstraintsPage" screen
    #Scenario 4 - numbers + symbols
    When I enter "1@" details in "noOfGuests" on "formConstraintsPage" screen
    And I click "noOfNights" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfGuests" element on "formConstraintsPage" screen
    #Scenario 5 - empty input
    And I click "noOfNights" on "formConstraintsPage" screen
    Then I verify "noOfGuestsErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsNoOfNights-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 19 - No. of nights, test case AP3-T741
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfNights" element on "formConstraintsPage" screen
    #Scenario 1 - 1-2 numbers
    When I enter "12" details in "noOfNights" on "formConstraintsPage" screen
    And I click "telephone" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfNights" element on "formConstraintsPage" screen
    #Scenario 2 - letters
    When I enter "ab" details in "noOfNights" on "formConstraintsPage" screen
    And I click "telephone" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfNights" element on "formConstraintsPage" screen
    #Scenario 3 - numbers + letters
    When I enter "1e" details in "noOfNights" on "formConstraintsPage" screen
    And I click "telephone" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "noOfNights" element on "formConstraintsPage" screen
    #Scenario 4 - numbers + symbols
    When I enter "1@" details in "noOfNights" on "formConstraintsPage" screen
    And I click "telephone" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "noOfNights" element on "formConstraintsPage" screen
    #Scenario 5 - empty input
    And I click "telephone" on "formConstraintsPage" screen
    Then I verify "noOfNightsErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsContactNumber-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 20 - contact number, test case AP3-T726
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 1 - 1-11 numbers
    When I enter "92331234123" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 2 - numbers starting with 0
    When I enter "0429233123" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 3 - letters
    When I enter "abcdefgh" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 4 - a string of length bewteen 1 and 11 containing letter(s)
    When I enter "91234567h" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 5 - a string of length bewteen 1 and 11 containing symbol(s)
    When I enter "91234567&" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 6 - a string of length bewteen 1 and 11 containing space
    When I enter "9123 456 7" details in "telephone" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "telephone" element on "formConstraintsPage" screen
    #Scenario 7 - empty input
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "phoneErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsRate-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 21 - rate, test case AP3-T742
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 1 - an integer number of length between 1 and 3
    When I enter "12" details in "rate" on "formConstraintsPage" screen
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 2 - a floating number of length between 1 and 3
    When I enter "0.2" details in "rate" on "formConstraintsPage" screen
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 3 - letters
    When I enter "abcd" details in "rate" on "formConstraintsPage" screen
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 4 - a string of length between 1-3 containing numbers and letters
    When I enter "1k9" details in "rate" on "formConstraintsPage" screen
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 5 - a string of length between 1-3 containing numbers and symbols
    When I enter "1%9" details in "rate" on "formConstraintsPage" screen
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "rate" element on "formConstraintsPage" screen
    #Scenario 6 - empty input
    And I click "urlPattern" on "formConstraintsPage" screen
    Then I verify "rateErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot

  @TestFormConstraintsUrlPattern-p3
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  @Regression-forms-constraints-p3.chrome.desktop
  @Regression-forms-injection-p3.chrome.desktop
  Scenario: Verify form field input validation and constraint 22 - Url pattern, test case AP3-T743
    Given I launch app page "URL/racv-home/utility/qa/all-components/form-constraints.html"
    And I dismiss GDPR notification if it exists
    #Scenario 1 - characters
    When I enter "https://www.racv.com.au/" details in "urlPattern" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I clear contents of "urlPattern" element on "formConstraintsPage" screen
    #Scenario 2 - special symbols
    When I enter "https://www.racv.com.au/?kids=3" details in "urlPattern" on "formConstraintsPage" screen
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "constraintErrorMsg" element is not visible on "formConstraintsPage" screen
    And I take a screenshot
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I clear contents of "urlPattern" element on "formConstraintsPage" screen
    #Scenario 3 - empty input
    And I click "rate" on "formConstraintsPage" screen
    Then I verify "urlPatternErrorMsg" element is visible on "formConstraintsPage" screen
    And I take a screenshot