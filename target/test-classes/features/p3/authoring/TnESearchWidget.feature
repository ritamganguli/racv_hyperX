#Author: Jing Zuo
Feature: This feature tests the T&E Search Widget, Resort Booking Widget, Hotel Booking Widget in AEM authoring and storybook

  @TestAuthoringResortBookingWidget-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author resort booking widget component and verify published dispatcher component, accessibility and visually
    #Launch AEM
    Given I launch app page "AEM"
    #Enter creds
    And I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-resort-booking-widget-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-resort-booking-widget-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Travel & Experience Search Widget" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "Resort Booking Widget" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Limit summary content to under 100 characters" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/racv-step-inspection-trades-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/locksmith-repair-front-door-1600x900.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "travel & experience search widget" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Button"
    #Configure first button
    When I refresh the page
    Then I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButtonInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButtonInTree" on "aemTestTnESearchWidgetPage" screen
    Then I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author T&E Search Widget"
    #Configure T&E Search Widget
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "teSearchWidgetInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "configurationsTab" on "aemTnESearchWidgetComponentDialog" screen
    #Things to do
    Then I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Things to do" value for "tabType1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Things to do" details in "tabTitle1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find attractions and activities" details in "tabSubHeading1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Balcony" value for "tabIcon1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/things-to-do" details in "tabPagePath1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    #Racv Resorts
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "RACV Resorts" value for "tabType2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACV Resorts" details in "tabTitle2" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a RACV Resort" details in "tabSubHeading2" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabActive2" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Spa Bath" value for "tabIcon2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel2" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Hotels
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hotels" value for "tabType3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Hotels" details in "tabTitle3" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Hotel" details in "tabSubHeading3" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hotel Building" value for "tabIcon3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel3" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Holiday Packages
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Holiday Packages" value for "tabType4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Holiday Packages" details in "tabTitle4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Holiday Package" details in "tabSubHeading4" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hot Tub" value for "tabIcon4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/holiday-and-packages" details in "tabPagePath4" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tours
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Tours" value for "tabType5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Tours" details in "tabTitle5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Tour" details in "tabSubHeading5" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Suitcase" value for "tabIcon5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/tours" details in "tabPagePath5" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Cruises
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruises" value for "tabType6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Cruises" details in "tabTitle6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Cruises" details in "tabSubHeading6" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruise Ship" value for "tabIcon6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/cruises" details in "tabPagePath6" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Travel Insurance
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Travel Insurance" value for "tabType7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Travel Insurance" details in "tabTitle7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Travel Insurance" details in "tabSubHeading7" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Accident" value for "tabIcon7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/travel-insurance" details in "tabPagePath7" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    And I click "doneButton" on "aemTnESearchWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTnESearchWidgetComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Resort Booking Widget"
    #Open side panel
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Resort Booking Widget
    When I click "resortBookingWidgetInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    #Configurations tab
    And I click "configurationsTab" on "aemResortBookingWidgetComponentDialog" screen
    Then I enter "Search" details in "searchButtonLabel" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/search" details in "searchButtonLink" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I verify "locationLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "locationDefaultValueLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesPlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesPromoCodeError" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "guestsLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "adultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "adultAgeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "maxAdultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "defaultAdultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "childrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "childrenAgeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "maxChildrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "defaultChildrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberTypeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberTypePlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "tooltipText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "autoClubSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Promotions tab
    And I click "promotionsTab" on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoCodeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalHeading" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalDescription" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalPlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Overlay Settings tab
    And I click "overlayTab" on "aemResortBookingWidgetComponentDialog" screen
    And I click "clubMemberLogo" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACV Club Logo Gold" value for "clubMemberLogoList" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I verify "clubMemberDescription" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberForgotNumber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberForgotNumberLink" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "disclaimber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "invalidDetailsErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "servcieDownErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Auto Club Members" details in "autoClubHeading" on "aemResortBookingWidgetComponentDialog" screen
    And I verify "autoClubDisclaimber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 1
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "NRMA Logo" value for "autoClubMemberIcon1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "NRMA Members" details in "autoClubMembershipLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 2
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACQ Logo" value for "autoClubMemberIcon2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACQ Members" details in "autoClubMembershipLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 3
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon3" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RAC Logo" value for "autoClubMemberIcon3List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RAC Members" details in "autoClubMembershipLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 4
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon4" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACT Logo" value for "autoClubMemberIcon4List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACT Members" details in "autoClubMembershipLabel4" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel4" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 5
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon5" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RAA Logo" value for "autoClubMemberIcon5List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RAA Members" details in "autoClubMembershipLabel5" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel5" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 6
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon6" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Balcony" value for "autoClubMemberIcon6List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Other Auto Club Members" details in "autoClubMembershipLabel6" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Resort List tab
    And I click "resortListTab" on "aemResortBookingWidgetComponentDialog" screen
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    #VIC resorts
    And I enter "VIC" details in "state1" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Victoria" details in "allResortsLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cape Schanck Resort" value for "resort1State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort2State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cobram Resort" value for "resort2State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort3State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Goldfields Resort" value for "resort3State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort4State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Torquay Resort" value for "resort4State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort5State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Inverloch Resort" value for "resort5State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort6State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Healesville Country Club & Resort" value for "resort6State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort7State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACV City Club" value for "resort7State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #QLD resorts
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "QLD" details in "state2" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Queensland" details in "allResortsLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState2" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Royal Pines Resort, Gold Coast" value for "resort1State2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState2" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort2State2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Noosa Resort" value for "resort2State2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #TAS resorts
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "TAS" details in "state3" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Tasmania" details in "allResortsLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState3" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State3" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Hobart Hotel" value for "resort1State3List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "enableDefaultResorts" on "aemResortBookingWidgetComponentDialog" screen
    And I click "defaultResort" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cape Schanck Resort" value for "defaultResortList" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemResortBookingWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemResortBookingWidgetComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-resort-booking-widget-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "resortsTab" on "aemTestResortBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "resortsTab" element exists on "aemTestResortBookingWidgetPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5299
    #And I verify page is accessibility compliant
    And I take a screenshot
    When I click "location" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "allVicCheckbox" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "guests" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "childrenIncreaseButton" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I click "childrenIncreaseButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    And I verify "memberTypeEmptyErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "addPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "racvMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    Then I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Club Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr"
    Then I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I enter "123456" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "Test" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on cancel button
    And I verify "data-event" attribute is "site interaction" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking club membership form" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "cancel" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "cancelButton" on "aemTestResortBookingWidgetPagePublished" screen
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    Then I enter "DATAMAP[clubMemberNumber]" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on submit button
    And I verify "data-event" attribute is "site interaction" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking club membership form" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "submit" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "clubMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Other Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "otherMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "auto club members snapshot" "hide-gdpr"
    Then I click "nrmaMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Guest
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "guest" on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics attributes on add promo code button
    And I verify "data-event" attribute is "site interaction" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "link" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking widget" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "add promo code" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "addPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "add promo code snapshot" "hide-gdpr"
    Then I enter "1122334" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I clear contents of "promoCodeInput" element on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "RACVSTAFF" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitPromoCode" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify analytics attributes on search button
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking widget" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "search" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    Then I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "travel-experiences/resorts/search.html"

  @TestPublishResortBookingWidget-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Resort Booking Widget post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-te-search-widget-p3.html#resorts"
    #Post publish checks
    And I wait for "resortsTab" on "aemTestResortBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "resortsTab" element exists on "aemTestResortBookingWidgetPagePublished" screen
    And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5299
    #And I verify page is accessibility compliant
    And I take a screenshot
    When I click "location" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "allVicCheckbox" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "guests" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "childrenIncreaseButton" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I click "childrenIncreaseButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    And I verify "memberTypeEmptyErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "addPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "racvMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    Then I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Club Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr"
    Then I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I enter "123456" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "Test" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on cancel button
    And I verify "data-event" attribute is "site interaction" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking club membership form" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "cancel" on "cancelButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "cancelButton" on "aemTestResortBookingWidgetPagePublished" screen
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    Then I enter "DATAMAP[clubMemberNumber]" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on submit button
    And I verify "data-event" attribute is "site interaction" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking club membership form" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "submit" on "submitButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "clubMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Other Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "otherMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot "auto club members snapshot" "hide-gdpr"
    Then I click "nrmaMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Guest
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "guest" on "aemTestResortBookingWidgetPagePublished" screen
    #Verify analytics attributes on add promo code button
    And I verify "data-event" attribute is "site interaction" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "link" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking widget" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "add promo code" on "addPromoCode" element on "aemTestResortBookingWidgetPagePublished" screen
    And I click "addPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot "add promo code snapshot" "hide-gdpr"
    Then I enter "1122334" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I clear contents of "promoCodeInput" element on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "RACVSTAFF" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitPromoCode" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify analytics attributes on search button
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "resorts booking widget" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "search" on "searchButton" element on "aemTestResortBookingWidgetPagePublished" screen
    Then I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "travel-experiences/resorts/search.html"

    Examples:
      | theme |
      | base  |

  @TestAuthoringHotelBookingWidget-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author hotel booking widget component and verify published dispatcher component, accessibility and visually
    #Launch AEM
    Given I launch app page "AEM"
    #Enter creds
    And I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-hotel-booking-widget-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hotel-booking-widget-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Travel & Experience Search Widget" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "Hotel Booking Widget" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Limit summary content to under 100 characters" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/racv-step-inspection-trades-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/locksmith-repair-front-door-1600x900.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "travel & experience search widget" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Button"
    #Configure first button
    When I refresh the page
    Then I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButtonInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButtonInTree" on "aemTestTnESearchWidgetPage" screen
    Then I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author T&E Search Widget"
    #Configure T&E Search Widget
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "teSearchWidgetInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "configurationsTab" on "aemTnESearchWidgetComponentDialog" screen
    #Things to do
    Then I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Things to do" value for "tabType1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Things to do" details in "tabTitle1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find attractions and activities" details in "tabSubHeading1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Balcony" value for "tabIcon1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/things-to-do" details in "tabPagePath1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    #Racv Resorts
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "RACV Resorts" value for "tabType2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACV Resorts" details in "tabTitle2" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a RACV Resort" details in "tabSubHeading2" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Spa Bath" value for "tabIcon2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel2" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Hotels
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hotels" value for "tabType3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Hotels" details in "tabTitle3" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Hotel" details in "tabSubHeading3" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabActive3" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hotel Building" value for "tabIcon3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel3" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Holiday Packages
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Holiday Packages" value for "tabType4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Holiday Packages" details in "tabTitle4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Holiday Package" details in "tabSubHeading4" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hot Tub" value for "tabIcon4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/holiday-and-packages" details in "tabPagePath4" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tours
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Tours" value for "tabType5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Tours" details in "tabTitle5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Tour" details in "tabSubHeading5" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Suitcase" value for "tabIcon5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/tours" details in "tabPagePath5" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Cruises
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruises" value for "tabType6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Cruises" details in "tabTitle6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Cruises" details in "tabSubHeading6" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruise Ship" value for "tabIcon6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/cruises" details in "tabPagePath6" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Travel Insurance
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Travel Insurance" value for "tabType7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Travel Insurance" details in "tabTitle7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Travel Insurance" details in "tabSubHeading7" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Accident" value for "tabIcon7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/travel-insurance" details in "tabPagePath7" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    And I click "doneButton" on "aemTnESearchWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTnESearchWidgetComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Hotel Booking Widget"
    #Open side panel
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hotel Booking Widget
    When I click "hotelBookingWidgetInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    #Configurations tab
    Then I click "configurationsTab" on "aemHotelBookingWidgetComponentDialog" screen
    And I enter "/content/dam/racv-assets/config/hotels.csv" details in "pathHotelsSearch" on "aemHotelBookingWidgetComponentDialog" screen
    And I enter "travel.racv.com.au" details in "searchButtonLink" on "aemHotelBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I verify "locationLabel" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "locationPlaceholderText" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "locationEmptyErr" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "locationNoResultErr" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "datesLabel" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "datesErrMsg" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I verify "guestsLabel" field contains a value on "aemHotelBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHotelBookingWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHotelBookingWidgetComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-hotel-booking-widget-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "hotelsTab" on "aemTestHotelBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "hotelsTab" element exists on "aemTestHotelBookingWidgetPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5295
    #And I verify page is accessibility compliant
    And I take a screenshot
    When I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "LocationEmptyErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "datesEmptyErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    When I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I enter "abcd" details in "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "LocationSearchErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Then I take a lambda snapshot "search error snapshot" "hide-gdpr"
    And I refresh the page
    And I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "cairnsOption" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestHotelBookingWidgetPagePublished" screen
    #Select Saturday in the third row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestHotelBookingWidgetPagePublished" screen
    #Then I take a lambda snapshot "date range snapshot" "hide-gdpr"
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on search button
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "travel & experiences widget" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "search button" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "travel.racv.com.au"

  @TestPublishHotelBookingWidget-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hotel Booking Widget post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-te-search-widget-p3.html#hotels"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "hotelsTab" on "aemTestHotelBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5295
    #And I verify page is accessibility compliant
    And I verify "hotelsTab" element exists on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    When I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "LocationEmptyErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "datesEmptyErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    When I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I enter "abcd" details in "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "LocationSearchErr" element is visible on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    Then I take a lambda snapshot "search error snapshot" "hide-gdpr"
    And I refresh the page
    And I click "location" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "cairnsOption" on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestHotelBookingWidgetPagePublished" screen
    #Select Saturday in the third row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestHotelBookingWidgetPagePublished" screen
    Then I take a lambda snapshot "date range snapshot" "hide-gdpr"
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on search button
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-location" attribute is "travel & experiences widget" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I verify "data-description" attribute is "search button" on "searchButton" element on "aemTestHotelBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "travel.racv.com.au"

    Examples:
      | theme |
      | base  |

  @TestSBHotelBookingWidget
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Hotel Booking Widget on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showLocationDropdownNoResultsError:true&id=components-travelandexperience-hotel-booking-widget--hotel-booking-widget-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "searchButton" on "storybookHotelBookingWidget" screen
    And I verify "LocationEmptyErr" element is visible on "storybookHotelBookingWidget" screen
    And I verify "datesEmptyErr" element is visible on "storybookHotelBookingWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    When I click "location" on "storybookHotelBookingWidget" screen
    And I enter "abcd" details in "location" on "storybookHotelBookingWidget" screen
    And I verify "LocationSearchErr" element is visible on "storybookHotelBookingWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "search error snapshot" "hide-gdpr"
    And I refresh the page
    And I click "location" on "storybookHotelBookingWidget" screen
    And I click "cairnsOption" on "storybookHotelBookingWidget" screen
    And I click "dates" on "storybookHotelBookingWidget" screen
    And I take a screenshot
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "storybookHotelBookingWidget" screen
    #Select Saturday in the third row from the second month container of the calendar table as end date
    And I click "endDate" on "storybookHotelBookingWidget" screen
    # Dont take a screenshot here because the dates keep changing and causing false positives
    #Then I take a lambda snapshot "date range snapshot" "hide-gdpr"
    And I click "applyButton" on "storybookHotelBookingWidget" screen
    And I take a screenshot

  @TestSBResortBookingWidget
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Resort Booking Widget on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showDatesDropdownPromoCodeError:true;showPromoCodeModalFieldError:true;showClubErrorMessage:true&id=components-travelandexperience-resort-booking-widget--resorts-widget-story-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "location" on "storybookResortBookingWidget" screen
    And I click "allVicCheckbox" on "storybookResortBookingWidget" screen
    And I click "dates" on "storybookResortBookingWidget" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "storybookResortBookingWidget" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "storybookResortBookingWidget" screen
    And I click "applyButton" on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I click "guests" on "storybookResortBookingWidget" screen
    And I verify "childrenIncreaseButton" element is visible on "storybookResortBookingWidget" screen
    And I click "childrenIncreaseButton" on "storybookResortBookingWidget" screen
    And I click "searchButton" on "storybookResortBookingWidget" screen
    And I take a screenshot
    # Dont take a snapshot here because the dates keep changing and causing false positives
    #Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    And I verify "memberTypeEmptyErr" element is visible on "storybookResortBookingWidget" screen
    And I verify "addPromoCode" element is visible on "storybookResortBookingWidget" screen
    #RACV Member
    When I click "memberType" on "storybookResortBookingWidget" screen
    And I click "racvMember" on "storybookResortBookingWidget" screen
    And I verify "racvMemberForPromoCode" element is visible on "storybookResortBookingWidget" screen
    Then I take a screenshot
    And I click "closePromoCode" on "storybookResortBookingWidget" screen
    #RACV Club Member
    When I click "memberType" on "storybookResortBookingWidget" screen
    And I click "racvClubMember" on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr"
    Then I click "submitButton" on "storybookResortBookingWidget" screen
    And I verify "membershipNumberErr" element is visible on "storybookResortBookingWidget" screen
    And I verify "memberFamilyNameErr" element is visible on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I click "cancelButton" on "storybookResortBookingWidget" screen
    #Other Member
    When I click "memberType" on "storybookResortBookingWidget" screen
    And I click "otherMember" on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I take a lambda snapshot "auto club members snapshot" "hide-gdpr"
    Then I click "nrmaMember" on "storybookResortBookingWidget" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I click "closePromoCode" on "storybookResortBookingWidget" screen
    #Guest
    When I click "memberType" on "storybookResortBookingWidget" screen
    And I click "guest" on "storybookResortBookingWidget" screen
    And I click "addPromoCode" on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I take a lambda snapshot "add promo code snapshot" "hide-gdpr"
    Then I enter "1122334" details in "promoCodeInput" on "storybookResortBookingWidget" screen
    And I click "submitPromoCode" on "storybookResortBookingWidget" screen
    And I wait for "promoCodeErr" on "storybookResortBookingWidget" screen or "30" seconds before proceeding
    And I verify "promoCodeErr" element is visible on "storybookResortBookingWidget" screen
    And I take a screenshot
    And I click "cancelPromoCode" on "storybookResortBookingWidget" screen