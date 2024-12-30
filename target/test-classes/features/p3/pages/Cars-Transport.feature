Feature: Tests relating to Cars Transport pages

  @TestERAPage-p3
  @Regression-p3.chrome.desktop
  Scenario: Verify that ERA page is displaying the 3 compare cards
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I verify "card1Price" element is visible on "roadsideAssistHomePage" screen
    And I verify "card2Price" element is visible on "roadsideAssistHomePage" screen
    And I verify "card3Price" element is visible on "roadsideAssistHomePage" screen
    And I take a screenshot

  @TestDriveSchool-p3
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify Drive Widget feature with default options and Noble Park suburb and results appear
    Given I launch app page "URL/cars-transport/drive-school/find-instructor.html"
    And I dismiss GDPR notification if it exists
    When I enter "Noble Park" details in "suburbEmpty" on "driveWidget" screen
    And I click "firstSearchResult" on "driveWidget" screen
    And I take a screenshot
    And I click "searchButton" on "driveWidget" screen
    Then I verify "driverResultHeading" element is visible on "driveWidget" screen
    And I verify "driver1CardImage" element is visible on "driveWidget" screen
    And I take a screenshot

  @TestDriveSchoolOptions-p3
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify Drive Widget feature for Automatic, Male, Arabic and Broadmeadows filters and results appear
    Given I launch app page "URL/cars-transport/drive-school/find-instructor.html"
    And I dismiss GDPR notification if it exists
    And I click "moreFiltersButton" on "driveWidget" screen
    #And I click "type" on "driveWidget" screen
    #And I click "manualTransmission" on "driveWidget" screen
    And I click "language" on "driveWidget" screen
    And I click "mandarinLanguage" on "driveWidget" screen
    And I verify "driverName" element exists on "driveWidget" screen
    And I click "gender" on "driveWidget" screen
    And I click "maleGender" on "driveWidget" screen
    And I click "testCenters" on "driveWidget" screen
    And I click "broadmeadowsLocation" on "driveWidget" screen
    And I take a screenshot
    When I click "searchButton" on "driveWidget" screen
    Then I verify "driverResultHeading" element is visible on "driveWidget" screen
    And I verify "driver1CardImage" element is visible on "driveWidget" screen
    And I take a screenshot

  @TestDriveSchoolNoResults-p3
  @Regression-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify Drive Widget feature no results and reset criteria function
    Given I launch app page "URL/cars-transport/drive-school/find-instructor.html"
    And I dismiss GDPR notification if it exists
    And I enter "No Result" details in "suburbEmpty" on "driveWidget" screen
    And I click "searchButton" on "driveWidget" screen
    And I verify "noResultContainer" element is visible on "driveWidget" screen
    And I take a screenshot
    #click reset and verify suburb field is empty and no results container is not visible
    When I click "resetButton" on "driveWidget" screen
    Then I verify "suburbEmpty" element is visible on "driveWidget" screen
    And I verify "noResultContainer" element is not visible on "driveWidget" screen
    And I take a screenshot

  @TestRACVYouthMotoringProgramSubmission-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the Youth Motoring Program form can be submitted with provision for presentation as Yes and a SF reference number is returned
    #launch app form
    Given I launch app page "URL/cars-transport/road-safety/school-programs/presentation-form.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Teacher" details in "schoolPosition" on "schoolPresentationForm" screen
    And I enter "Test O'first-URLENV" details in "firstName" on "schoolPresentationForm" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "schoolPresentationForm" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "schoolPresentationForm" screen
    And I enter "0400000000" details in "phoneNumber" on "schoolPresentationForm" screen
    And I enter "My School" details in "schoolName" on "schoolPresentationForm" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "schoolPresentationForm" screen
    And I enter "Melbourne" details in "suburb" on "schoolPresentationForm" screen
    And I enter "3000" details in "postcode" on "schoolPresentationForm" screen
    And I enter "30" details in "numberOfStudents" on "schoolPresentationForm" screen
    And I take a screenshot
    And I enter "01/01/2050" details in "firstDatePreference" on "schoolPresentationForm" screen
    And I click "secondDatePreference" on "schoolPresentationForm" screen
    And I enter "1:30 pm" details in "firstTimePreference" on "schoolPresentationForm" screen
    And I enter "12/11/2050" details in "secondDatePreference" on "schoolPresentationForm" screen
    And I click "numberOfStudents" on "schoolPresentationForm" screen
    And I enter "16:30 pm" details in "secondTimePreference" on "schoolPresentationForm" screen
    And I click "yesForProvision" on "schoolPresentationForm" screen
    And I enter "Test only, please ignore" details in "comments" on "schoolPresentationForm" screen
    And I click "offersConsent" on "schoolPresentationForm" screen
    And I take a screenshot
    #Analytics checks for form node at Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "youth motoring program - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "youth motoring program" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I click "submitButton" on "schoolPresentationForm" screen
    And I wait for "submitButton" to disappear on "schoolPresentationForm" screen or "10" seconds before proceeding
    And I capture the address navigated to
    Then I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    And I get object data for "digitalData"

  @TestWheelchairScooterAssistFormSubmission-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the Wheelchair and Scooter assist form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance/wheelchair-scooter-assist/form.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "wheelchairScooterAssistPage" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "lastName" on "wheelchairScooterAssistPage" screen
    And I enter "15/08/1980" details in "dob" on "wheelchairScooterAssistPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "wheelchairScooterAssistPage" screen
    And I enter "0400000000" details in "contactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "wheelchairScooterAssistPage" screen
    And I enter "Melbourne" details in "suburb" on "wheelchairScooterAssistPage" screen
    And I enter "3000" details in "postcode" on "wheelchairScooterAssistPage" screen
    #State is now prefilled
    #And I click "state" on "wheelchairScooterAssistPage" screen
    #And I click "vicResult" on "wheelchairScooterAssistPage" screen
    And I take a screenshot
    And I click "postalResidentDifferentAddress" on "wheelchairScooterAssistPage" screen
    And I enter "580 Bourke Street" details in "postalStreet" on "wheelchairScooterAssistPage" screen
    And I enter "Melbourne North" details in "postalSuburb" on "wheelchairScooterAssistPage" screen
    And I enter "3333" details in "postalPostcode" on "wheelchairScooterAssistPage" screen
    And I click "postalState" on "wheelchairScooterAssistPage" screen
    And I click "postalVicResult" on "wheelchairScooterAssistPage" screen
    And I click "racvMemberYes" on "wheelchairScooterAssistPage" screen
    And I enter "DATAMAP[nonClubMemberNumber]" details in "racvMemberNumber" on "wheelchairScooterAssistPage" screen
    And I enter "My Emergency Contact" details in "emergencyContactName" on "wheelchairScooterAssistPage" screen
    And I enter "0412345678" details in "emergencyContactNumber" on "wheelchairScooterAssistPage" screen
    And I enter "My Partner" details in "retailPartnerName" on "wheelchairScooterAssistPage" screen
    And I click "termsAndConditions" on "wheelchairScooterAssistPage" screen
    And I click "marketingConsent" on "wheelchairScooterAssistPage" screen
    And I take a screenshot
    And I click "submitButton" on "wheelchairScooterAssistPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  @TestBikeAssistFormSubmission-p3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the Bike Assist form can be submitted successfully when all valid details are entered and reference number is returned
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance/bike-assist/form.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    When I enter "Test O'first-URLENV" details in "firstName" on "bikeAssistEFormPage" screen
    And I enter "Test O'last-URLENV" details in "lastName" on "bikeAssistEFormPage" screen
    And I enter "17/10/1975" details in "dob" on "bikeAssistEFormPage" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "bikeAssistEFormPage" screen
    And I enter "0400000000" details in "contactNumber" on "bikeAssistEFormPage" screen
    And I enter "550 Princess Highway" details in "streetAddress" on "bikeAssistEFormPage" screen
    And I enter "Noble Park" details in "suburb" on "bikeAssistEFormPage" screen
    And I enter "3174" details in "postcode" on "bikeAssistEFormPage" screen
    #Click state but dont select an option, first result is selected on blur
    And I click "state" on "bikeAssistEFormPage" screen
    And I take a screenshot
    And I enter "PRO123" details in "promoCode" on "bikeAssistEFormPage" screen
    #Click first name to trigger onblur event for promocode field
    And I click "firstName" on "bikeAssistEFormPage" screen
    And I take a screenshot
    #Check analytics data generated for form node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "application" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "bike assist arevo eform - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "bike assist arevo eform" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "promo_code__c" for "digitalData"
    And I click "submitButton" on "bikeAssistEFormPage" screen
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    #Check analytics data generated for thank you page
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.messageType" value equals "success banner" for "digitalData"
    And I verify "$.form.formInfo.messageLocation" value equals "bike assist arevo eform" for "digitalData"
    And I verify "$.form.formInfo.messageDescription" value equals "thank you for contacting us" for "digitalData"

  @TestPurchaseBusinessERAFormSubmission-3Vehicles
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the Purchase Business ERA form for 3 vehicles using 3 or less option and having same postal and mailing address can be submitted successfully and a SF reference number is returned
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance/business/purchase.html?product=businessRoadsideCare&disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I click "lessThan3VehiclesOption" on "purchaseBusinessERAForm" screen
    #Vehicle 0
    And I click "vehiclePackageType" on "purchaseBusinessERAForm" screen
    And I click "vehiclePackageTypeResult" on "purchaseBusinessERAForm" screen
    And I enter "1GH8HJ" details in "vehicle0RegistrationNo" on "purchaseBusinessERAForm" screen
    And I enter "Toyota" details in "vehicle0Make" on "purchaseBusinessERAForm" screen
    And I enter "Camry" details in "vehicle0Model" on "purchaseBusinessERAForm" screen
    And I enter "2017" details in "vehicle0YearOfMfg" on "purchaseBusinessERAForm" screen
    And I click "addVehicle1Checkbox" on "purchaseBusinessERAForm" screen
    #Vehicle 1
    And I click "vehiclePackageType" on "purchaseBusinessERAForm" screen
    And I click "vehiclePackageTypeResult" on "purchaseBusinessERAForm" screen
    And I enter "2GJ8HL" details in "vehicle1RegistrationNo" on "purchaseBusinessERAForm" screen
    And I enter "Holden" details in "vehicle1Make" on "purchaseBusinessERAForm" screen
    And I enter "Equinox" details in "vehicle1Model" on "purchaseBusinessERAForm" screen
    And I enter "2018" details in "vehicle1YearOfMfg" on "purchaseBusinessERAForm" screen
    And I click "addVehicle2Checkbox" on "purchaseBusinessERAForm" screen
    #Vehicle 2
    And I click "vehiclePackageType" on "purchaseBusinessERAForm" screen
    And I click "vehiclePackageTypeResult" on "purchaseBusinessERAForm" screen
    And I enter "9HB8GH" details in "vehicle2RegistrationNo" on "purchaseBusinessERAForm" screen
    And I enter "Toyota" details in "vehicle2Make" on "purchaseBusinessERAForm" screen
    And I enter "RAV4" details in "vehicle2Model" on "purchaseBusinessERAForm" screen
    And I enter "2019" details in "vehicle2YearOfMfg" on "purchaseBusinessERAForm" screen
    And I take a screenshot
    #Your Details
    And I enter "Test Ltd." details in "companyName" on "purchaseBusinessERAForm" screen
    And I enter "TestFURLENV TestL" details in "contactName" on "purchaseBusinessERAForm" screen
    And I enter "digitalqa@racv.com.au" details in "companyEmail" on "purchaseBusinessERAForm" screen
    And I enter "0400000000" details in "phoneNumber" on "purchaseBusinessERAForm" screen
    And I enter "12345678" details in "abn" on "purchaseBusinessERAForm" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "purchaseBusinessERAForm" screen
    And I enter "Melbourne" details in "suburb" on "purchaseBusinessERAForm" screen
    And I enter "3000" details in "postcode" on "purchaseBusinessERAForm" screen
    And I click "stateDropdown" on "purchaseBusinessERAForm" screen
    And I click "vicDropDownOption" on "purchaseBusinessERAForm" screen
    And I click "mailingSameAsPostalAddress" on "purchaseBusinessERAForm" screen
    And I click "offersCheckBox" on "purchaseBusinessERAForm" screen
    And I take a screenshot
    #Check analytics tags for form node - Step 1
    And I get object data for "digitalData"
    And I verify "$.form.formInfo.formType" value equals "lead" for "digitalData"
    And I verify "$.form.formInfo.stage" value equals "start" for "digitalData"
    And I verify "$.form.formInfo.stepName" value equals "business era purchase - start" for "digitalData"
    And I verify "$.form.formInfo.formName" value equals "business era purchase" for "digitalData"
    And I verify "$.form.formInfo.stepNumber" value equals "1" for "digitalData"
    And I verify "$.form.formInfo.lastFieldInteracted" value equals "marketing_consent__c" for "digitalData"
    And I click "submitButton" on "purchaseBusinessERAForm" screen
    And I wait for "submitButton" to disappear on "purchaseBusinessERAForm" screen or "10" seconds before proceeding
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot
    And I get object data for "digitalData"

  @TestPurchaseBusinessERAFormSubmission-Morethan3
  @Regression-p3.chrome.desktop
  @Regression-forms-p3.chrome.desktop
  @Integration-p3
  Scenario: Verify the Purchase Business ERA form for 12 vehicles using 3 or more vehicles option and having different postal and mailing address can be submitted successfully and a SF reference number is returned
    #launch app form
    Given I launch app page "URL/cars-transport/roadside-assistance/business/purchase.html?product=businessRoadsideCare&disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I click "moreThan3VehiclesOption" on "purchaseBusinessERAForm" screen
    And I upload an attachment for "chooseFileButton" on "purchaseBusinessERAForm" from "test_xlsx.xlsx"
    #Your Details
    And I enter "Test Ltd." details in "companyName" on "purchaseBusinessERAForm" screen
    And I enter "TestFURLENV TestL" details in "contactName" on "purchaseBusinessERAForm" screen
    And I enter "digitalqa@racv.com.au" details in "companyEmail" on "purchaseBusinessERAForm" screen
    And I take a screenshot
    And I enter "0400000000" details in "phoneNumber" on "purchaseBusinessERAForm" screen
    And I enter "12345678" details in "abn" on "purchaseBusinessERAForm" screen
    And I enter "473 Bourke Street" details in "streetAddress" on "purchaseBusinessERAForm" screen
    And I enter "Melbourne" details in "suburb" on "purchaseBusinessERAForm" screen
    And I enter "3000" details in "postcode" on "purchaseBusinessERAForm" screen
    And I click "stateDropdown" on "purchaseBusinessERAForm" screen
    And I click "vicDropDownOption" on "purchaseBusinessERAForm" screen
    And I enter "550 Princess Highway" details in "mailingAddress" on "purchaseBusinessERAForm" screen
    And I enter "Noble Park" details in "mailingSuburb" on "purchaseBusinessERAForm" screen
    And I enter "3174" details in "mailingPostcode" on "purchaseBusinessERAForm" screen
    And I click "mailingStateDropdown" on "purchaseBusinessERAForm" screen
    And I click "mailingStateVicDropDownOption" on "purchaseBusinessERAForm" screen
    And I click "offersCheckBox" on "purchaseBusinessERAForm" screen
    And I take a screenshot
    And I click "submitButton" on "purchaseBusinessERAForm" screen
    And I wait for "submitButton" to disappear on "purchaseBusinessERAForm" screen or "10" seconds before proceeding
    Then I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I take a screenshot

  @TestSubscribeRoyalAutoNewsSubscribe-p3
  @Regression-p3.chrome.desktop
  Scenario: Verify royal auto news subscribe
    #launch app form
    Given I launch app page "URL/royalauto/subscribe.html"
    And I dismiss GDPR notification if it exists
    And I enter "Test" details in "newsFirstName" on "royalAutoSubscribe" screen
    And I enter "Test" details in "newsLastName" on "royalAutoSubscribe" screen
    And I enter "digitalqa@racv.com.au" details in "newsEmail" on "royalAutoSubscribe" screen
    And I enter "3000" details in "newsPostcode" on "royalAutoSubscribe" screen
    And I enter "1234567" details in "newsMemberNumber" on "royalAutoSubscribe" screen
    And I click "newsTsAndCsAccept" on "royalAutoSubscribe" screen
    And I take a screenshot
    And I click "newsSubscribeButton" on "royalAutoSubscribe" screen
    And I wait for "newsSubscribeSuccessMessage" on "royalAutoSubscribe" screen or "10" seconds before proceeding
    And I verify "newsSubscribeSuccessMessage" element is visible on "royalAutoSubscribe" screen
    And I capture the address navigated to