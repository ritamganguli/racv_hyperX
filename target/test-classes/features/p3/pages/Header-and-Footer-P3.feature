Feature: This feature validates the footer and header on the new AP3 template

  @TestRACVHomeFooterLinks-p3
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Home page 3 footer links navigation
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    And I dismiss GDPR notification if it exists
    #Legal
    And I click "legalFooterLink" on "racvHomePage" screen
    And I capture the address navigated to
    Then I check page address is "URL/about-racv/corporate-governance/legal.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Privacy Charter
    And I click "privacyCharterFooterLink" on "racvHomePage" screen
    And I capture the address navigated to
    Then I check page address is "URL/about-racv/corporate-governance/legal/privacy-charter.html"
    And I take a screenshot

  @TestRACVHomeSocialMediaLinks-p3
  @Regression-p3.chrome.desktop
  Scenario: Verify the RACV Home page footer for Social Media link navigation
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    And I dismiss GDPR notification if it exists
    #facebook
    When I click "facebookFooterLink" on "racvHomePage" screen
    And I switch to "new" browser tab
    Then I check the page address contains "https://www.facebook.com/"
    And I check the page address contains "racv"
    And I capture the address navigated to
    And I take a screenshot
    And I switch to "parent" browser tab
    And I navigate to "URL/insurance.html"
    #twitter
    And I click "twitterFooterLink" on "racvHomePage" screen
    And I switch to "new" browser tab
    Then I check the page address contains "https://x.com/"
    And I capture the address navigated to
    And I take a screenshot
    And I switch to "parent" browser tab
    And I navigate to "URL/insurance.html"
    #linkedIn
    And I click "linkedInFooterLink" on "racvHomePage" screen
    And I switch to "new" browser tab
    And I check the page address contains "https://www.linkedin.com/"
    And I capture the address navigated to
    And I take a screenshot
    And I switch to "parent" browser tab
    And I navigate to "URL/insurance.html"
    #instagram
    And I click "instagramFooterLink" on "racvHomePage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "https://www.instagram.com/"
    And I check the page address contains "racvofficial"
    And I take a screenshot
    And I switch to "parent" browser tab
    And I navigate to "URL/insurance.html"
    #youtube
    And I click "yooutubeFooterLink" on "racvHomePage" screen
    And I switch to "new" browser tab
    Then I check page address is "https://www.youtube.com/racvofficial"
    And I capture the address navigated to
    And I take a screenshot

  @TestRACVLogoOnHomePage-p3
 	@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Logo and its navigation on RACV home page
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I verify "racvLogo" element exists on "racvHomePage" screen
    And I click "racvLogo" on "racvHomePage" screen
    And I check page address is "URL/"
    And I take a screenshot

  @TestLoginButtonOnHomePage-p3
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the Login button and its navigation on RACV home page
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I verify "loginButtonHomePage" element exists on "racvHomePage" screen
    Then I take a screenshot
    And I click "loginButtonHomePage" on "racvHomePage" screen
    And I check page address is "https://my.racv.com.au/s/login/"
    And I take a screenshot

  @TestTopNavBarOnHomePage-p3
 	@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the Top navigation bar and its navigation on RACV home page
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    #Verify About RACV
    And I take a screenshot
    When I click "aboutRacvTopNav" on "racvHomePage" screen using Action class
    Then I check page address is "URL/about-racv.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Verify Retail Stores
    And I click "retailStoresTopNav" on "racvHomePage" screen
    Then I check page address is "URL/contact-us/racv-retail-stores.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Verify Fuel prices
    And I click "fuelPricesTopNav" on "racvHomePage" screen
    Then I check page address is "URL/on-the-road/driving-maintenance/fuel-prices.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Verify Help & Support
    And I click "helpSupportTopNav" on "racvHomePage" screen
    Then I check page address is "URL/help-and-support.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Verify Contact
    And I click "contactTopNav" on "racvHomePage" screen
    Then I check page address is "URL/contact-us.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuTravelLeisure-p3
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Travel & Leisure mega menu items on Desktop till Level 2
    #launch RACV home page
    Given I launch app page "URL"
    And I dismiss GDPR notification if it exists
    When I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Holiday Planning
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "holidayPlanningLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/holiday-planning.html"
    And I take a screenshot
    #RACV Club
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "racvClubLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-leisure/racv-club.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Insurance
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "insuranceLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/insurance/travel-insurance.html"
    And I take a screenshot
    #Travel Loans
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "travelLoansLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/holiday-planning/travel-loans.html"
    And I take a screenshot
    #RACV Resorts Link
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "racvResortsLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/resorts.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuNewsLifestyle-p3
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for News & Lifestyle mega menu items on Desktop
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I click "newsLifestyleDeskMenuLink" on "racvHomePage" screen
    Then I check the page address contains "/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #News
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    And I click "newsLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/news.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Transport
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "transportLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/transport.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Lifestyle & Home
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "lifestyleHomeLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/lifestyle-home.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Property
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "propertyLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/property.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Travel
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "travelLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/travel.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Sustainability
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "sustainabilityRaLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/sustainability.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"

  @TestRACVDesktopMegaMenuMembership-p3
  @Regression-p3.chrome.desktop
  Scenario: Validate the links and navigation for Membership mega menu items on Desktop
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I click "membershipDeskMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/membership.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Membership Link L1
    And I click "membershipDeskMenuLink" on "racvHomePage" screen
    And I check the page address contains "URL/membership.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Manage your account L2
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "manageYourAccount" on "membershipDeskMenuOverlay" screen
    And I check the page address contains "URL/membership/account.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Loyalty Discounts L3
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "loyaltyDiscounts" on "membershipDeskMenuOverlay" screen
    And I check the page address contains "URL/membership/member-discounts/loyalty-discounts.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenucarsTransport-p3
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Cars & Transport mega menu items on Desktop
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I click "carsAndTransportMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/cars-transport.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Hover Cars and Transport
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Car Insurance
    And I click "carInsuranceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/insurance/car-insurance.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Driving and Maintenance
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "vehicleMaintenanceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/vehicle-maintenance.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Roadside Assistance
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "roadsideAssistanceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/roadside-assistance.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Car Hire
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportCarHireLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/travel-experiences/holiday-transport/sixt-car-hire.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Buying a Car
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportBuyingACarLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/car-loans/buying-a-car.html "
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Public Transport
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportPublicTransportLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/bikes-other-transport/public-transport.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Bike Riding
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "bikeRidingLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/bikes-other-transport/bicycles-escooters-ebikes.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuBusinessSolutions-p3
 	#@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Business Solutions mega menu items on Desktop
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    When I click "businessSolutionsDeskMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/business-solutions.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Business insurance
    And I click "businessInsuranceLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/insurance/business-insurance.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Conferences and events
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolConfEventsLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/travel-experiences/venue-hire/conferences.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Vehicles
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolVehiclesLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/roadside-assistance/business.html"
    And I take a screenshot
    And I navigate to "URL/insurance.html"
    #Emergency Home Assist for Business
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolEmergencyHomeAssistBizLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/home/emergency-home-assist/plan.html "
    And I take a screenshot

  @TestRACVDesktopMegaMenuInYourHome-p3
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the L1/L2/L3 links and navigation for Home mega menu items on Desktop on the AP3 template
    #launch page with old template
    Given I launch app page "URL/home.html"
    #Verify L1 Home link
    When I click "homeL1" on "racvHomePage" screen
    Then I check page address is "URL/home.html"
    And I take a screenshot
    #Verify L2 emergency Trades link
    And I navigate to "URL/home.html"
    And I hover on "homeL1" on "racvHomePage" screen using Action class
    And I click "tradesLinkL2" on "inYourHomeDeskMenuOverlay" screen
    And I check page address is "URL/home/emergency-home-assist.html"
    And I take a screenshot
    And I navigate to "URL/home.html"
    #Verify L3 Plumbing link
    And I hover on "homeL1" on "racvHomePage" screen using Action class
    And I click "plumbingL3Link" on "inYourHomeDeskMenuOverlay" screen
    And I check page address is "URL/home/repairs-maintenance/plumbing.html"
    And I take a screenshot

  @TestRACVMobileMegaMenuInsurance-p3
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.ios-mobile
  @TestRACVMobileMegaMenuInsurance-p3.chrome.ios-mobile
  Scenario: Validate the L1 and L2 links for Insurance menu, I want to section and a footer link on Mobile for new AP3 template
    #launch RACV home page
    Given I launch app page "URL/insurance.html"
    And I dismiss GDPR notification if it exists
    When I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    Then I take a screenshot
    #Insurance L1
    When I click "insuranceL1" on "insuranceMegaMenuMobilePage" screen
    And I take a screenshot
    And I click "exploreAllInsurance" on "insuranceMegaMenuMobilePage" screen
    And I wait for "exploreAllInsurance" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I wait for "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen or "10" seconds before proceeding
    And I check the page address contains "/insurance.html"
    And I take a screenshot
    #Car Insurance L2
    And I navigate to "URL/insurance.html"
    When I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    When I click "insuranceL1" on "insuranceMegaMenuMobilePage" screen
    And I click "carInsuranceL2" on "insuranceMegaMenuMobilePage" screen
    And I take a screenshot
    And I click "comprehensiveL3" on "insuranceMegaMenuMobilePage" screen
    And I wait for "comprehensiveL3" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I wait for "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen or "10" seconds before proceeding
    And I check the page address contains "/insurance/car-insurance/comprehensive.html"
    And I take a screenshot
    #I want to section
    And I navigate to "URL/insurance.html"
    And I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    And I click "insuranceL1" on "insuranceMegaMenuMobilePage" screen
    And I click "iWantTo" on "insuranceMegaMenuMobilePage" screen
    And I take a screenshot
    And I click "iWantToretrieveAQuote" on "insuranceMegaMenuMobilePage" screen
    And I wait for "iWantToretrieveAQuote" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I check the page address contains "URL/utility/retrieve-quote.html"
    And I take a screenshot
    #Header footer link
    And I navigate to "URL/insurance.html"
    And I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    And I click "contactLink" on "insuranceMegaMenuMobilePage" screen
    And I wait for "contactLink" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I wait for "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen or "10" seconds before proceeding
    And I check the page address contains "/contact-us.html"
    And I take a screenshot

  @TestMegamenuSearch-Desktop-p3
  @Sanity-p3.chrome.desktop
  @Sanity-p3-smartui.chrome.desktop
  Scenario: Verify megamenu search function on desktop
    #launch RACV home page
    Given I launch app page "URL/help-and-support.html"
    And I dismiss GDPR notification if it exists
    When I click "searchOnHomePage" on "racvHomePage" screen
    And I take a screenshot
    And I take a lambda snapshot "search bar" "hide-emergency-banner, hide-gdpr"
    #Search for custom user input
    And I enter "insurance" details in "searchInputBox" on "searchOverlay" screen
    And I take a screenshot
    And I click "searchRacvButton" on "searchOverlay" screen
    And I wait for "searchTitleInsurance" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleInsurance" copy text on "searchResultsPage" screen
    And I take a screenshot
    And I navigate to "URL/"
    And I click "searchOnHomePage" on "racvHomePage" screen
    #Validate search recommendation feature
    And I enter "insur" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchSuggestInsurance" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a lambda snapshot "search suggestions" "hide-emergency-banner, hide-gdpr"
    And I take a screenshot
    And I click "searchSuggestInsurance" on "searchOverlay" screen
    And I take a screenshot

  @TestMegamenuSearch-Mobile-p3
  @TestSearchOnHomePage-Mobile-p3.chrome.ios-mobile
  @Sanity-p3.chrome.ios-mobile
  @Sanity-p3-smartui.chrome.ios-mobile
  Scenario: Verify Megamenu search function on mobile
    #launch RACV home page
    Given I launch app page "URL/help-and-support.html"
    And I dismiss GDPR notification if it exists
    When I click "mobileMenuButton" on "racvHomePage" screen
    And I take a screenshot
    And I take a lambda snapshot "search bar" "hide-emergency-banner, hide-gdpr"
    #Search for custom user input
    And I enter "insurance" details in "searchInputBox" on "searchOverlay" screen
    And I take a screenshot
    And I click "searchRacvButtonMobile" on "searchOverlay" screen
    And I wait for "searchTitleInsurance" on "searchResultsPage" screen or "10" seconds before proceeding
    And I verify "searchTitleInsurance" copy text on "searchResultsPage" screen
    And I take a screenshot
    And I navigate to "URL/"
    And I click "mobileMenuButton" on "racvHomePage" screen
    #Validate search recommendation feature
    And I enter "insur" details in "searchInputBox" on "searchOverlay" screen
    And I wait for "searchSuggestInsurance" on "searchOverlay" screen or "10" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "search suggestions" "hide-emergency-banner, hide-gdpr"
    And I click "searchSuggestInsurance" on "searchOverlay" screen
    And I take a screenshot