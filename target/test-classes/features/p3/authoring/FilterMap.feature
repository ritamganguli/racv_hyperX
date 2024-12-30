#Author: Viengcumm Thongvilu
Feature: This feature tests the Filter Map in AEM authoring and storybook

  @TestAuthoringFilterMapGenericList-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  @AnalyticsEventsAuthoring-p3
  Scenario: Verify user is able to author filter map generic list, add list to filter map component and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    And I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to generic list creation page
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/lists/qa"
    Then I capture the address navigated to
    And I click "genericPageOption" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    And I enter "test-automation-filter-map-generic-list-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Generic list"
    And I check the page address contains "/editor.html/content/racv/lists/qa/test-automation-filter-map-generic-list-RANDOM[0-8]-p3.html"
    #Add generic list filter map component 1
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Generic List Filter Map" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "genericListFilterMapResult" on "aemInsertNewComponent" screen
    And I wait for "genericListFilterMapResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure generic list filter map component 1
    And I click "genericListFilterMapInTree" on "aemGenericPage" screen
    And I click "configureButton" on "aemEditorPage" screen
    And I take a screenshot
    And I enter "Goodyear Autocare Airport West" details in "titleName" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "Goodyear Autocare Airport West will take care of your whole vehicle, from tyres to all your mechanical needs." details in "description" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "-37.714748" details in "latitude" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "144.890696" details in "longitude" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "1/93-95 Matthews Avenue, Airport West, VIC, 3042" details in "address" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "(03) 9310 5019" details in "phone" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "Visit website" details in "firstCTALabel" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "http://www.goodyearairportwest.com.au/" details in "firstCTAURLPath" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "Get directions" details in "secondCTALabel" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "https://www.google.com.au/maps/place/Goodyear+Autocare+Airport+West/@-37.7147479,144.8906962,15z/data=!4m5!3m4!1s0x0:0xd50b93090649ad1d!8m2!3d-37.7147479!4d144.8906962" details in "secondCTAURLPath" on "aemRACVGenericListFilterMapDialog" screen
    And I enter "Weekdays: 8:00am - 5:00pm - Weekends: Closed" details in "openingTimes" on "aemRACVGenericListFilterMapDialog" screen
    And I click "doneButton" on "aemRACVGenericListFilterMapDialog" screen
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Page"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-filter-map-generic-list-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-filter-map-generic-list-RANDOM[0-8]-p3.html"
    #Edit properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Filter Map" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary2" on "aemPageProperties" screen
    And I select "Filter Map" value for "clientLibrary2List" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Open side panel
    #And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Add Filter Map component into Container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Filter Map" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "filterMapResult" on "aemInsertNewComponent" screen
    And I wait for "filterMapResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Filter map"
    #Configure Filter Map component
    When I click "filterMapInTree" on "aemTestFilterMapPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    #Select Generic List as view type
    Then I click "viewType" on "aemFilterMapComponentDialog" screen
    And I select "Generic List" value for "viewTypeList" drop down in "aemFilterMapComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/lists/qa/test-automation-filter-map-generic-list-RANDOM[0-8]-p3" details in "genericPagePath" on "aemFilterMapComponentDialog" screen
    And I click "pinPath" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-pin-solid.svg" details in "pinPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-pin-solid-light.svg" details in "pinLightPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-circle-solid.svg" details in "clusterPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I enter "0" details in "minZoom" on "aemFilterMapComponentDialog" screen
    And I enter "18" details in "maxZoom" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I enter "Search" details in "searchLabel" on "aemFilterMapComponentDialog" screen
    And I enter "Search here" details in "searchPlaceholder" on "aemFilterMapComponentDialog" screen
    And I enter "Try again" details in "errorMessage" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFilterMapComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFilterMapComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-filter-map-generic-list-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    #Post publish checks
    When I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I verify page is accessibility compliant
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I click "postcodeResult" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I verify "filterMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I verify "locationIcon" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on locationIcon
    And I verify "data-event" attribute is "site interaction" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "location icon" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "showTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on showTile1Details
    And I verify "data-event" attribute is "site interaction" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "show more details" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I click "showTile1Details" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "show details" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    And I verify "hideTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on hideTile1Details
    And I verify "data-event" attribute is "site interaction" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "hide details" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "primaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on primaryButton
    And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "visit website" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "secondaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on secondaryButton
    And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "get directions" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map generic list RANDOM[0-8] p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    When I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #Then I launch app page "URL/racv-home/utility/qa/test-automation-filter-map-generic-list-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I dismiss GDPR notification if it exists
    #And I dismiss emergency banner if it exists
    #Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #When I click "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    # Cannot click it on ios, need to press down+tab
    #And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    #And I enter "keys:DOWN" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "keys:TAB" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #When I click "listView" on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on listView
    #And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    #Then I verify "filterMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    #And I verify "showTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on showTile1Details
    #And I verify "data-event" attribute is "site interaction" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "accordion" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "show more details" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I click "showTile1Details" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "show details" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #And I verify "hideTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on hideTile1Details
    #And I verify "data-event" attribute is "site interaction" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "accordion" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "hide details" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "primaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on primaryButton
    #And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "visit website" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "secondaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on secondaryButton
    #And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "get directions" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #When I click "mapView" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "map mobile" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    #And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    #When I click "mapPin" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "map mobile pin open" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Add test input for analytics check
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    #And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    #And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    #And I take a screenshot
    #Analytics checks for Input Search
    #And I get object data for "digitalData"
    #And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.search.searchInfo.searchType" value equals "test automation filter map generic list RANDOM[0-8] p3" for "digitalData"
    #And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"

  @TestPublishFilterMapGeneric-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Filter Map Generic post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-generic-list-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    #Post publish checks
    When I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I verify page is accessibility compliant
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I click "postcodeResult" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I verify "filterMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I verify "locationIcon" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on locationIcon
    And I verify "data-event" attribute is "site interaction" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "location icon" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "showTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on showTile1Details
    And I verify "data-event" attribute is "site interaction" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "show more details" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I click "showTile1Details" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "show details" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    And I verify "hideTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on hideTile1Details
    And I verify "data-event" attribute is "site interaction" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "hide details" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "primaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on primaryButton
    And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "visit website" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "secondaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on secondaryButton
    And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "get directions" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map generic list p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    When I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #Then I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-generic-list-p3.html" on "chrome" on "android-mobile"
    #And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I dismiss GDPR notification if it exists
    #And I dismiss emergency banner if it exists
    #Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #When I click "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    # Cannot click it on ios, need to press down+tab
    #And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    #And I enter "keys:DOWN" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "keys:TAB" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #When I click "listView" on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on listView
    #And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    #Then I verify "filterMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    #And I verify "showTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on showTile1Details
    #And I verify "data-event" attribute is "site interaction" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "accordion" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "show more details" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    #And I click "showTile1Details" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "show details" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #And I verify "hideTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on hideTile1Details
    #And I verify "data-event" attribute is "site interaction" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "accordion" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "hide details" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    #And I verify "primaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on primaryButton
    #And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "visit website" on "primaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "secondaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on secondaryButton
    #And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "goodyear autocare airport west" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "get directions" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    #When I click "mapView" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "map mobile" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    #And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    #When I click "mapPin" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "map mobile pin open" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Add test input for analytics check
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    #And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    #And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    #And I take a screenshot
    #Analytics checks for Input Search
    #And I get object data for "digitalData"
    #And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.search.searchInfo.searchType" value equals "test automation filter map generic list p3" for "digitalData"
    #And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishFilterMapGeneric-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Filter Map Generic post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-generic-list-p3.html" on "chrome" on "android-mobile"
    And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    # Cannot click it on ios, need to press down+tab
    #And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    And I enter "keys:DOWN" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "keys:TAB" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    When I click "listView" on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on listView
    And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    Then I verify "filterMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I verify "showTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on showTile1Details
    And I verify "data-event" attribute is "site interaction" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "show more details" on "showTile1Details" element on "aemTestFilterMapPublished" screen
    And I click "showTile1Details" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "show details" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    And I verify "hideTile1Details" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on hideTile1Details
    And I verify "data-event" attribute is "site interaction" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "accordion" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "hide details" on "hideTile1Details" element on "aemTestFilterMapPublished" screen
    And I verify "primaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on primaryButton
    And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "visit website" on "primaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "secondaryButton" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on secondaryButton
    And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "goodyear autocare airport west" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "get directions" on "secondaryButton" element on "aemTestFilterMapPublished" screen
    When I click "mapView" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "map mobile" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    When I click "mapPin" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "map mobile pin open" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map generic list p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringFilterMapRepairerMap-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author filter map component (Repairer Map) and verify published dispatcher component, accessibility and visually
    #launch AEM
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
    And I enter "test-automation-filter-map-repairer-map-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-filter-map-repairer-map-RANDOM[0-8]-p3.html"
    #Edit properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Filter Map" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary2" on "aemPageProperties" screen
    And I select "Filter Map" value for "clientLibrary2List" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "5" seconds before proceeding
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Add Filter Map component into Container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Filter Map" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "filterMapResult" on "aemInsertNewComponent" screen
    And I wait for "filterMapResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Filter map"
    #Configure Filter Map component
    When I click "filterMapInTree" on "aemTestFilterMapPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    #Select Repairer Map as view type
    Then I click "viewType" on "aemFilterMapComponentDialog" screen
    And I select "Repairer Map" value for "viewTypeList" drop down in "aemFilterMapComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "pinPath" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-pin-solid.svg" details in "pinPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-pin-solid-light.svg" details in "pinLightPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/icons/global/location-circle-solid.svg" details in "clusterPath" on "aemFilterMapComponentDialog" screen
    And I click "configurationsTab" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I enter "0" details in "minZoom" on "aemFilterMapComponentDialog" screen
    And I enter "18" details in "maxZoom" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I enter "Search" details in "searchLabel" on "aemFilterMapComponentDialog" screen
    And I enter "Search here" details in "searchPlaceholder" on "aemFilterMapComponentDialog" screen
    And I enter "Try again" details in "errorMessage" on "aemFilterMapComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFilterMapComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFilterMapComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check desktop"
    And I navigate to "URL/racv-home/utility/qa/test-automation-filter-map-repairer-map-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I verify page is accessibility compliant
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I click "postcodeResult" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I verify "repairerMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I verify "locationIcon" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on locationIcon
    And I verify "data-event" attribute is "site interaction" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "location icon" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I click "repairerMapTile1" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "tile open" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    And I click "zoomOut" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I click "zoomIn" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map repairer map RANDOM[0-8] p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/test-automation-filter-map-repairer-map-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I dismiss GDPR notification if it exists
    #And I dismiss emergency banner if it exists
    #Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #When I click "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    #And I wait for "repairerMapTile1Title" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #Verify analytics attributes on listView
    #And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    #Then I verify "repairerMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    #And I click "repairerMapTile1" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "list view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #When I click "mapView" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "map view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    #And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    #Add test input for analytics check
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    #And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    #And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    #And I take a screenshot
    #Analytics checks for Input Search
    #And I get object data for "digitalData"
    #And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.search.searchInfo.searchType" value equals "test automation filter map repairer map RANDOM[0-8] p3" for "digitalData"
    #And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    #And I close the browser

  @TestPublishFilterMapRepairer-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Filter map repairer post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-repairer-map-p3.html"
    #Post publish checks
    When I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I verify page is accessibility compliant
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I click "postcodeResult" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I verify "repairerMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I verify "locationIcon" element exists on "aemTestFilterMapPublished" screen
    #Verify analytics attributes on locationIcon
    And I verify "data-event" attribute is "site interaction" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "location icon" on "locationIcon" element on "aemTestFilterMapPublished" screen
    And I click "repairerMapTile1" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "tile open" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    And I click "zoomOut" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I click "zoomIn" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map repairer map p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-repairer-map-p3.html" on "chrome" on "android-mobile"
    #And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I dismiss GDPR notification if it exists
    #And I dismiss emergency banner if it exists
    #Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #When I click "searchBar" on "aemTestFilterMapPublished" screen
    #And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    #And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    #And I wait for "repairerMapTile1Title" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #Verify analytics attributes on listView
    #And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    #Then I verify "repairerMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    #And I click "repairerMapTile1" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "list view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #When I click "mapView" on "aemTestFilterMapPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "map view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    #And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    #And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    #Add test input for analytics check
    #Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    #And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    #And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    #And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    #And I take a screenshot
    #Analytics checks for Input Search
    #And I get object data for "digitalData"
    #And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    #And I verify "$.search.searchInfo.searchType" value equals "test automation filter map repairer map p3" for "digitalData"
    #And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    #And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishFilterMapRepairer-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Filter map repairer post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-filter-map-repairer-map-p3.html" on "chrome" on "android-mobile"
    And I wait for "searchTitle" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I dismiss emergency banner if it exists
    Then I verify "searchTitle" element is visible on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    When I click "searchBar" on "aemTestFilterMapPublished" screen
    And I enter "30000" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "errorMessage" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I verify "errorMessage" element is visible on "aemTestFilterMapPublished" screen
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "3500" details in "searchBar" on "aemTestFilterMapPublished" screen
    And I wait for "postcodeResultMobile" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I click "postcodeResultMobile" on "aemTestFilterMapPublished" screen
    And I wait for "repairerMapTile1Title" on "aemTestFilterMapPublished" screen or "5" seconds before proceeding
    And I take a screenshot
    #Verify analytics attributes on listView
    And I verify "data-event" attribute is "site interaction" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "listView" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "list view" on "listView" element on "aemTestFilterMapPublished" screen
    Then I verify "repairerMapTile1Title" element is visible on "aemTestFilterMapPublished" screen
    And I click "repairerMapTile1" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "list view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    When I click "mapView" on "aemTestFilterMapPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "map view" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, hide-google-map-layer"
    #Verify analytics attributes on mapView
    And I verify "data-event" attribute is "site interaction" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-type" attribute is "button" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-location" attribute is "filter map" on "mapView" element on "aemTestFilterMapPublished" screen
    And I verify "data-description" attribute is "map view" on "mapView" element on "aemTestFilterMapPublished" screen
    #Add test input for analytics check
    Then I clear contents of "searchBar" element on "aemTestFilterMapPublished" screen
    And I enter "Tarneit" details in "searchInputField" on "aemRepairerMapPage" screen
    And I click "filterMapResultTarneit" on "aemRepairerMapPage" screen
    And I wait for "filterMapResultTarneit" to disappear on "aemRepairerMapPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Analytics checks for Input Search
    And I get object data for "digitalData"
    And I verify "$.event[0].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "search-navigate" for "digitalData"
    And I verify "$.search.searchInfo.searchType" value equals "test automation filter map repairer map p3" for "digitalData"
    And I verify "$.search.searchInfo.sortBy" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.resultsCount" value equals "" for "digitalData"
    And I verify "$.search.searchInfo.term" value equals "tarneit vic" for "digitalData"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBFilterMapAPIFeed
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Filter Map API Feed variant on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story" on "chrome" on "desktop"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I refresh the page
    And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    #XL+L verification
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "firstTile" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #SM+M verification
    #And I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    #And I refresh the page
    #And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    #Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    #And I click "firstTile" on "storybookFilterMap" screen
    #And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #And I click "mapView" on "storybookFilterMap" screen
    #And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAPIFeed.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify Filter Map API Feed variant on storybook on android mobile
    #SM+M verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "firstTile" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    And I click "mapView" on "storybookFilterMap" screen
    And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAuthor
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Filter Map Author variant on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story" on "chrome" on "desktop"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I refresh the page
    And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    #XL+L verification
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "showMoreDetails" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #SM+M verification
    #And I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    #And I refresh the page
    #And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    #Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    #And I click "showMoreDetails" on "storybookFilterMap" screen
    #And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #And I click "mapView" on "storybookFilterMap" screen
    #And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"
    #And I click "milduraRoadcarePLPin" on "storybookFilterMap" screen
    #And I take a lambda snapshot "pin open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAuthor.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify Filter Map Author variant on storybook on android mobile
    #SM+M verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "showMoreDetails" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    And I click "mapView" on "storybookFilterMap" screen
    And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"
    #And I click "milduraRoadcarePLPin" on "storybookFilterMap" screen
    #And I take a lambda snapshot "pin open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAPIFeed
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Filter Map API Feed variant (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story&globals=theme:club" on "chrome" on "desktop"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I refresh the page
    And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    #XL+L verification
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "firstTile" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #SM+M verification
    #And I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story&globals=theme:club" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    #And I refresh the page
    #And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    #Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    #And I click "firstTile" on "storybookFilterMap" screen
    #And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #And I click "mapView" on "storybookFilterMap" screen
    #And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAPIFeed.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify Filter Map API Feed variant (club theme) on storybook on android mobile
    #SM+M verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=mapType:api_feed_version&id=components-filter-map--filter-map-story&globals=theme:club" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I wait for "firstTile" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "firstTile" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "firstTile" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    And I click "mapView" on "storybookFilterMap" screen
    And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAuthor
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Filter Map Author variant (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story&globals=theme:club" on "chrome" on "desktop"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I refresh the page
    And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    #XL+L verification
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "showMoreDetails" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #SM+M verification
    #And I close the browser
    #Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    #And I refresh the page
    #And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    #Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    #And I take a screenshot
    #And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    #And I click "showMoreDetails" on "storybookFilterMap" screen
    #And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    #And I click "mapView" on "storybookFilterMap" screen
    #And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"
    #And I click "milduraRoadcarePLPin" on "storybookFilterMap" screen
    #And I take a lambda snapshot "pin open" "hide-gdpr, hide-google-map-layer"

  @TestSBFilterMapAuthor.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify Filter Map Author variant (club theme) on storybook on android mobile
    #SM+M verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-filter-map--filter-map-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #Google map doesnt load in SB, need to refresh
    And I refresh the page
    And I wait for "showMoreDetails" on "storybookFilterMap" screen or "10" seconds before proceeding
    Then I verify "showMoreDetails" element is visible on "storybookFilterMap" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr, hide-google-map-layer"
    And I click "showMoreDetails" on "storybookFilterMap" screen
    And I take a lambda snapshot "tile open" "hide-gdpr, hide-google-map-layer"
    And I click "mapView" on "storybookFilterMap" screen
    And I take a lambda snapshot "map open" "hide-gdpr, hide-google-map-layer"
    #And I click "milduraRoadcarePLPin" on "storybookFilterMap" screen
    #And I take a lambda snapshot "pin open" "hide-gdpr, hide-google-map-layer"
