#Author: Sumanta Roy
#Date Created : 17 Dec 19
Feature: This feature validates generic features of the RACV web application

  @TestBuildNumber
  Scenario: Verify that correct build number is being displayed on page source for the environment
    Given I verify the build number for "URL/"
    And I take a screenshot
    When I verify the build number for "PURL1/content/racv/en/home.html"
    And I take a screenshot
    Then I verify the build number for "PURL2/content/racv/en/home.html"
    And I take a screenshot

  #Dry run completed on 5 Dec 19
  @TestIWantToWidgetInsuranceLink
  #@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Validate Get an Insurance Quote Link on the I want to widget in the Hero banner
    #launch RACV home page
    Given I launch app
    And I dismiss GDPR notification if it exists
    When I click "insuranceQuoteIWantToWidget" on "racvHomePage" screen
    Then I check the page address contains "/insurance.html?int_cam=quicklink2"
    And I capture the address navigated to
    And I take a screenshot

  #Dry run completed on 20 Dec 19
  @TestAdditionalHeaderOnResortsPage
  #@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify that upon scrolling down the RACV Resorts page additional header is being displayed
    #launch app form
    Given I launch app page "URL/travel-experiences/resorts.html"
    And I dismiss GDPR notification if it exists
    And I scroll the window to "100" percent
    And I verify "racvResortsInVicTitle" element exists on "resortsPage1" screen
    And I click "racvResortsInVicTitle" on "resortsPage1" screen
    And I verify "saveMoreTitle" element exists on "resortsPage1" screen
    And I click "saveMoreTitle" on "resortsPage1" screen
    And I wait for "additionalHeaderVisible" on "resortsPage1" screen or "10" seconds before proceeding
    Then I verify "additionalHeaderVisible" element exists on "resortsPage1" screen
    And I take a screenshot
    #Check logo
    And I click "additionalHeaderLogo" without scrolling on "resortsPage1" screen
    And I check the page address contains "/travel-experiences/resorts.html"
    And I capture the address navigated to
    And I verify "racvResortsInVicTitle" element exists on "resortsPage1" screen
    And I click "racvResortsInVicTitle" on "resortsPage1" screen
    And I verify "saveMoreTitle" element exists on "resortsPage1" screen
    And I click "saveMoreTitle" on "resortsPage1" screen
    #Check header text
    And I verify "additionalHeaderText" element exists on "resortsPage1" screen
    #Check contact button
    And I click "additionalHeaderContactButton" without scrolling on "resortsPage1" screen
    And I verify "contactResortsOverlay" element exists on "resortsPage1" screen
    And I take a screenshot

  #Dry run completed on 5 Mar 2020
  #SR 6 Aug 2020 AEMU-822 - Updated locators as per latest content
  @TestThriftyIntegration
  Scenario: Verify integration of Thrifty widget from racv to thrifty domain
    #launch app form
    Given I launch app page "URL/travel-leisure/travel-discounts/thrifty-car-hire.html"
    #switch to iFrame
    And I switch "to" iFrame "thriftyIframe" on "thriftyCarHirePage" screen
    When I select "Albury City, NSW" value for "pickUpLocationDropDown" drop down in "thriftyCarHirePage" screen using selection method "visibleText"
    And I enter "DATAMAP[clubMemberNumber]" details in "memberNumber" on "thriftyCarHirePage" screen
    And I select "Blue" value for "memberType" drop down in "thriftyCarHirePage" screen using selection method "visibleText"
    And I click "findVehicleButton" on "thriftyCarHirePage" screen
    And I switch to "new" browser tab
    Then I capture the address navigated to
    And I check the page address contains "https://www.thrifty.com.au/"
    And I take a screenshot

  #Dry run completed on 5 Mar 2020
  #DAC-9308 - SR 8 Sep 21 - Added wait
  #SR 30 Sep 21 - DAC-9408 Added scroll and link opening in new tab as per latest content
  @TestHomeTradesAndServicesIntegration
  Scenario: Verify integration of home trades and services
    #launch app form
    Given I launch app page "URL/in-your-home/home-assist.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "findQuote" on "homeAssistHomePage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    Then I check the page address contains "/tradies?service=&int_cam=search-tradie-tile"
    And I take a screenshot

  #Dry run completed on 6 Mar 2020
  @TestInternationalDrivingPermitIntegration
  #@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify integration of International driving permit redirect from RACV
    #launch app form
    Given I launch app page "URL/travel-leisure/holiday-planning/international-driving-licence.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "applyOnlineNowLink" on "internationalDrivingLicHomePage" screen
    And I switch to "NEW" browser tab
    Then I capture the address navigated to
    And I check page address is "https://www.internationaldrivingpermit.com.au/"
    And I take a screenshot

  #Dry run completed on 12 Mar 2020
  #SR 6 Aug 2020 - This feature is currently disabled in live and in lower environments due to covid
  @TestSpiritOfTasmaniaIntegration
  Scenario: Verify integration of Spirit of Tasmania redirect from RACV cruises and tours
    #launch app form
    Given I launch app page "URL/travel-leisure/travel-discounts/cruises-and-tours/partners/spirit-of-tasmania.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "bookNowButton" on "spiritOfTasmaniaPartnerPage" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/membership/member-benefits/member-discounts/spirit-of-tasmania-tickets.html"
    And I enter "6085261" details in "memberNumber" on "spiritOfTasmaniaPartnerPage" screen
    And I enter "Department" details in "memberFamilyName" on "spiritOfTasmaniaPartnerPage" screen
    And I take a screenshot
    And I click "submitButton" on "spiritOfTasmaniaPartnerPage" screen
    And I check page address is "https://www.spiritoftasmania.com.au/offers/racv"
    And I take a screenshot

  #Dry run completed on 12 Mar 2020
  #SR 30 Sep 21 - DAC-9408 Updated wait to 10 s
  @TestSuccessfactorsIntegration
 	@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify integration of Successfactors from RACV careers
    #launch app form
    Given I launch app page "URL/about-racv/careers.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "viewVacanciesButton" on "workAtRacvPage" screen
    And I switch to "new" browser tab
    Then I capture the address navigated to
    And I check page address is "https://careers.racv.com.au/"
    And I take a screenshot

  #Dry run completed on 6 Mar 2020 on QA only. Stage has new changes.
  #Test is flaky, the destination selection from hidden list doesn't works intermittently
  #This test will need to be updated in April once Insurance quote project goes live which changes the iFrame
  #SR 6 Aug 2020 - This feature is currently disabled in live and in lower environments due to covid
  @TestTokoiMarineIntegration
  Scenario: Verify integration of Travel insurance quote with Tokio-Marine
    #launch app form
    Given I launch app page "URL/travel-leisure/insurance/travel-insurance.html"
    And I dismiss GDPR notification if it exists
    When I switch "to" iFrame "instantQuoteIFrame" on "travelInsuranceHomePage" screen
    And I click "destination" on "travelInsuranceHomePage" screen
    And I click "selectHiddenDestination" on "travelInsuranceHomePage" screen
    And I enter "12/04/2021" details in "departureDate" on "travelInsuranceHomePage" screen
    #commenting below as return date is set by default as 7 days from booking
    #And I enter "20/04/2021" details in "returnDate" on "travelInsuranceHomePage" screen
    And I click "returnDate" on "travelInsuranceHomePage" screen
    And I click "ageTraveller1" on "travelInsuranceHomePage" screen
    And I enter "34" details in "ageTraveller1" on "travelInsuranceHomePage" screen
    And I click "ageTraveller2" on "travelInsuranceHomePage" screen
    And I enter "32" details in "ageTraveller2" on "travelInsuranceHomePage" screen
    And I select "Bronze" value for "memberType" drop down in "travelInsuranceHomePage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "getQuoteButton" on "travelInsuranceHomePage" screen
    And I switch to "new" browser tab
    Then I capture the address navigated to
    And I check page address is "https://racv.tmnfatravelinsurance.com.au/quotes/step/1"
    And I take a screenshot