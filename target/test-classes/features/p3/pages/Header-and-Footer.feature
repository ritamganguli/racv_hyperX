Feature: This feature validates the footer and header on the old template

  @TestRACVHomeFooterLinksOldTemplate
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Home page 3 footer links navigation on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #Legal
    And I click "legalFooterLink" on "racvHomePage" screen
    And I capture the address navigated to
    Then I check page address is "URL/about-racv/corporate-governance/legal.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I verify "iWantToWidget" element exists on "racvHomePage" screen
    #Privacy Charter
    And I click "privacyCharterFooterLink" on "racvHomePage" screen
    And I capture the address navigated to
    Then I check page address is "URL/about-racv/corporate-governance/legal/privacy-charter.html"
    And I take a screenshot

  @TestRACVHomeSocialMediaLinksOldTemplate
  @Regression-p3.chrome.desktop
  Scenario: Verify the RACV Home page footer for Social Media link navigation on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #facebook
    When I click "facebookFooterLink" on "racvHomePage" screen
    Then I check the page address contains "https://www.facebook.com/"
    And I check the page address contains "racv"
    And I capture the address navigated to
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #twitter
    And I click "twitterFooterLink" on "racvHomePage" screen
    Then I check the page address contains "https://x.com/"
    And I capture the address navigated to
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #linkedIn
    And I click "linkedInFooterLink" on "racvHomePage" screen
    And I check the page address contains "https://www.linkedin.com/"
    And I check the page address contains "racv"
    And I capture the address navigated to
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #instgram
    And I click "instagramFooterLink" on "racvHomePage" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.instagram.com/"
    And I check the page address contains "racvofficial"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #youtube
    And I click "yooutubeFooterLink" on "racvHomePage" screen
    Then I check page address is "https://www.youtube.com/racvofficial"
    And I capture the address navigated to
    And I take a screenshot

  @TestRACVHomeFooterYellowBannerOldTemplate
  #@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Home page footer Contact Us links on Yellow banner for navigation on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    #verify general enquiry link
    When I click "genEnquiryFooterLink" on "racvHomePage" screen
    Then I check page address is "URL/contact-us.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I verify "iWantToWidget" element exists on "racvHomePage" screen
    #verify roadside assistance
    And I click "roadsideAssistFooterLink" on "racvHomePage" screen
    Then I check page address is "URL/cars-transport/roadside-assistance.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I verify "iWantToWidget" element exists on "racvHomePage" screen
    #verify insurance claims
    And I click "insuranceClaimFooterLink" on "racvHomePage" screen
    And I check page address is "URL/insurance/claims.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I verify "iWantToWidget" element exists on "racvHomePage" screen
    #verify insurance claim button
    And I click "insuranceClaimFooterButton" on "racvHomePage" screen
    Then I check page address is "URL/insurance/claims.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I verify "iWantToWidget" element exists on "racvHomePage" screen
    #verify close button on yellow banner
    Then I click "closeYellowBannerButton" on "racvHomePage" screen
    And I take a screenshot

  @TestRACVLogoOnHomePageOldTemplate
 	@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the RACV Logo and its navigation on RACV home page on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    When I verify "racvLogo" element exists on "racvHomePage" screen
    Then I verify "iWantToWidget" element exists on "racvHomePage" screen
    And I click "racvLogo" on "racvHomePage" screen
    Then I check page address is "URL/"
    And I take a screenshot

  @TestLoginButtonOnHomePageOldTemplate
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the Login button and its navigation on RACV home page on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    When I verify "loginButtonHomePage" element exists on "racvHomePage" screen
    Then I take a screenshot
    And I click "loginButtonHomePage" on "racvHomePage" screen using JavaScript
    And I check page address is "https://my.racv.com.au/s/login/"
    And I take a screenshot

  @TestTopNavBarOnHomePageOldTemplate
 	@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Verify the Top navigation bar and its navigation on RACV home page on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    #Verify About RACV
    And I take a screenshot
    When I click "aboutRacvTopNav" on "racvHomePage" screen using Action class
    Then I check page address is "URL/about-racv.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Verify Retail Stores
    And I click "retailStoresTopNav" on "racvHomePage" screen
    Then I check page address is "URL/contact-us/racv-retail-stores.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Verify Fuel prices
    And I click "fuelPricesTopNav" on "racvHomePage" screen
    Then I check page address is "URL/on-the-road/driving-maintenance/fuel-prices.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Verify Help & Support
    And I click "helpSupportTopNav" on "racvHomePage" screen
    Then I check page address is "URL/help-and-support.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Verify Contact
    And I click "contactTopNav" on "racvHomePage" screen
    Then I check page address is "URL/contact-us.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuTravelLeisureOldTemplate
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Travel & Leisure mega menu items on Desktop till Level 2 on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    When I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #RACV Resorts Link
    And I click "racvResortsLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/resorts.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #One Spa
    #And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    #And I click "oneSpaLink" on "travelLeisureDeskMenuOverlay" screen
    #And I check the page address contains "/travel-experiences/things-to-do/one-spa.html"
    #And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #RACV Club
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "racvClubLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-leisure/racv-club.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Insurance
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "insuranceLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/insurance/travel-insurance.html"
    And I take a screenshot
    And I navigate to "URL/"
    #Travel Loans
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "travelLoansLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/holiday-planning/travel-loans.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Holiday Planning
    And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "holidayPlanningLink" on "travelLeisureDeskMenuOverlay" screen
    And I check the page address contains "/travel-experiences/holiday-planning.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Attraction Tickets
    #And I hover on "travelExperiencesDeskMenuLink" on "racvHomePage" screen using Action class
    #And I click "attractionTicketsLinkL2" on "travelLeisureDeskMenuOverlay" screen
    #And I check the page address contains "/travel-experiences/things-to-do/attraction-tickets.html"
    #And I take a screenshot

  @TestRACVDesktopMegaMenuNewsLifestyleOldTemplate
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for News & Lifestyle mega menu items on Desktop on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    When I click "newsLifestyleDeskMenuLink" on "racvHomePage" screen
    #I land on royal auto index
    Then I check the page address contains "/royalauto.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #News
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    And I click "newsLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/news.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Transport
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "transportLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/transport.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Lifestyle & Home
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "lifestyleHomeLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/lifestyle-home.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Property
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "propertyLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/property.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Travel
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "travelLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/travel.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Sustainability
    And I hover on "newsLifestyleDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "sustainabilityRaLink" on "newsLifestyleDeskMenuOverlay" screen
    And I check the page address contains "/royalauto/sustainability.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuMembershipOldTemplate
  #@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Membership mega menu items on Desktop on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    When I click "membershipDeskMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/membership.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Membership Link L1
    And I click "membershipLink" on "membershipDeskMenuOverlay" screen
    And I check the page address contains "URL/membership.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Manage Your Account L2
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "manageYourAccount" on "membershipDeskMenuOverlay" screen
    And I check the page address contains "URL/membership/account.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Loyalty Discounts L3
    And I hover on "membershipDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "loyaltyDiscounts" on "membershipDeskMenuOverlay" screen
    And I check the page address contains "URL/membership/member-discounts/loyalty-discounts.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenucarsTransportOldTemplate
  #@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Cars & Transport mega menu items on Desktop on the old template
    #launch RACV home page
    Given I launch app
    When I click "carsAndTransportMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/cars-transport.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Hover Cars and Transport
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Car Insurance
    And I click "carInsuranceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/insurance/car-insurance.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Driving and Maintenance
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "vehicleMaintenanceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/vehicle-maintenance.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Roadside Assistance
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "roadsideAssistanceLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/roadside-assistance.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Car Hire
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportCarHireLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/travel-experiences/holiday-transport/sixt-car-hire.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Buying a Car
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportBuyingACarLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/car-loans/buying-a-car.html "
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Public Transport
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "carsTransportPublicTransportLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/bikes-other-transport/public-transport.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Bike Riding
    And I hover on "carsAndTransportMenuLink" on "racvHomePage" screen using Action class
    And I click "bikeRidingLink" on "carsTransportDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/bikes-other-transport/bicycles-escooters-ebikes.html"
    And I take a screenshot

  @TestRACVDesktopMegaMenuBusinessSolutionsOldTemplate
 	#@Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the links and navigation for Business Solutions mega menu items on Desktop on the old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    When I click "businessSolutionsDeskMenuLink" on "racvHomePage" screen
    #Verify index page
    Then I check the page address contains "URL/business-solutions.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I take a screenshot
    #Business insurance
    And I click "businessInsuranceLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/insurance/business-insurance.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Conferences and events
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolConfEventsLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/travel-experiences/venue-hire/conferences.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Vehicles
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolVehiclesLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/cars-transport/roadside-assistance/business.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Emergency Home Assist for Business
    And I hover on "businessSolutionsDeskMenuLink" on "racvHomePage" screen using Action class
    And I click "bizSolEmergencyHomeAssistBizLink" on "businessSolDeskMenuOverlay" screen
    And I check the page address contains "URL/home/emergency-home-assist/plan.html "
    And I take a screenshot

  @TestRACVDesktopMegaMenuInYourHomeOldTemplate
  @Regression-p3.chrome.desktop
	#@Regression-p3.chrome.ios-mobile
  Scenario: Validate the L1/L2/L3 links and navigation for Home mega menu items on Desktop on the old template
    #launch page with old template
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    #Verify L1 Home link
    When I click "homeL1" on "racvHomePage" screen
    Then I check page address is "URL/home.html"
    And I take a screenshot
    #Verify L2 emergency Trades link
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I hover on "homeL1" on "racvHomePage" screen using Action class
    And I click "tradesLinkL2" on "inYourHomeDeskMenuOverlay" screen
    And I check page address is "URL/home/emergency-home-assist.html"
    And I take a screenshot
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    #Verify L3 Plumbing link
    And I hover on "homeL1" on "racvHomePage" screen using Action class
    And I click "plumbingL3Link" on "inYourHomeDeskMenuOverlay" screen
    And I check page address is "URL/home/repairs-maintenance/plumbing.html"
    And I take a screenshot

  @TestRACVMobileMegaMenuInsuranceOldTemplate
  @Sanity-p3.chrome.ios-mobile
  @Regression-p3.chrome.ios-mobile
  Scenario: Validate the L1 and L2 links for Insurance menu, I want to section and a footer link on Mobile on old template
    #launch RACV home page
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
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
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
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
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    And I click "insuranceL1" on "insuranceMegaMenuMobilePage" screen
    And I click "iWantTo" on "insuranceMegaMenuMobilePage" screen
    And I take a screenshot
    And I click "iWantToretrieveAQuote" on "insuranceMegaMenuMobilePage" screen
    And I wait for "iWantToretrieveAQuote" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I check the page address contains "URL/utility/retrieve-quote.html"
    And I take a screenshot
    #Header footer link
    And I navigate to "URL/about-racv/corporate-governance/legal.html"
    And I click "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen
    And I click "contactLink" on "insuranceMegaMenuMobilePage" screen
    And I wait for "contactLink" to disappear on "insuranceMegaMenuMobilePage" screen or "5" seconds before proceeding
    And I wait for "mobileMenuButton" on "insuranceMegaMenuMobilePage" screen or "10" seconds before proceeding
    And I check the page address contains "/contact-us.html"
    And I take a screenshot