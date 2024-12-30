#Author: Viengcumm Thongvilu
#Date created - 23 Mar 2021
Feature: This feature tests the authoring of Fuel Price Component

  #VT 23 Mar 2021
  #Dry run completed on QA
  @TestFuelPriceComponentAuthoring
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Fuel Price component, configure, publish and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-fuel-price-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-fuel-price-component-1.html"
    #open page properties and configure google maps client library
    And I click "pageInfoButton" on "aemLandingPage" screen
    And I click "openPropertiesOption" on "aemLandingPage" screen
    And I click "advancedTabLink" on "aemAuthoringPageProperties" screen
    And I click "clientLibraryAddFieldButton" on "aemAuthoringPageProperties" screen
    And I select "Fuelprice" value for "clientLibraryDropDown" drop down in "aemAuthoringPageProperties" screen using selection method "visibleText"
    And I click "clientLibraryAddFieldButton" on "aemAuthoringPageProperties" screen
    And I select "Google Map" value for "clientLibraryDropDown" drop down in "aemAuthoringPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveAndCloseButton" on "aemAuthoringPageProperties" screen
    #add component to page
    And I wait for "addComponentsParsys" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "addComponentsParsys" on "aemTestComponentPage" screen
    And I click "addComponentsPlusIcon" on "aemTestComponentPage" screen
    #search and add fuel price component first
    And I enter "Fuel" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "fuelpriceOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "fuelpriceOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "fuelPriceComponentPage" screen
    And I click "contentTreeButton" on "fuelPriceComponentPage" screen
    And I click "fuelPriceComponent" on "fuelPriceComponentPage" screen
    And I click "configureButton" on "fuelPriceComponentPage" screen
    And I wait for "configureButton" to disappear on "fuelPriceComponentPage" screen or "5" seconds before proceeding
    #Configure tabs
    And I enter "3" details in "preselectedFuelType" on "fuelPriceComponentPage" screen
    And I enter "sorry no results" details in "noResultMessage" on "fuelPriceComponentPage" screen
    And I take a screenshot
    #buying guide tab
    And I click "buyingGuideTab" on "fuelPriceComponentPage" screen
    And I clear contents of "buyNowHeading" element on "fuelPriceComponentPage" screen
    And I clear contents of "priceTrendHeading" element on "fuelPriceComponentPage" screen
    And I clear contents of "priceTrendParagraph" element on "fuelPriceComponentPage" screen
    And I enter "buy now" details in "buyNowHeading" on "fuelPriceComponentPage" screen
    And I enter "price trend" details in "priceTrendHeading" on "fuelPriceComponentPage" screen
    And I enter "price trend paragraph" details in "priceTrendParagraph" on "fuelPriceComponentPage" screen
    And I take a screenshot
    #todays price tab
    And I click "todaysPriceTab" on "fuelPriceComponentPage" screen
    And I enter "todays price" details in "todaysPriceText" on "fuelPriceComponentPage" screen
    And I take a screenshot
    #fuel price trends
    And I click "fuelPriceTrendsTab" on "fuelPriceComponentPage" screen
    And I enter "fuel price trend" details in "fuelPriceTrendsText" on "fuelPriceComponentPage" screen
    And I enter "wholesale legend" details in "wholesaleLegendsText" on "fuelPriceComponentPage" screen
    And I enter "retail legend" details in "retailLegendsText" on "fuelPriceComponentPage" screen
    And I clear contents of "lowestPriceText" element on "fuelPriceComponentPage" screen
    And I enter "lowest price" details in "lowestPriceText" on "fuelPriceComponentPage" screen
    And I enter "highest price" details in "highestPriceText" on "fuelPriceComponentPage" screen
    And I take a screenshot
    #layout tab
    And I click "layoutTab" on "fuelPriceComponentPage" screen
    And I verify "targetDivId" field contains a value on "fuelPriceComponentPage" screen
    And I take a screenshot
    #Click on Save changes
    And I click "saveChangesButton" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-fuel-price-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "buyNowText" element exists on "aemFuelPricePublishedPage" screen
    And I verify "priceTrendParagraph" element exists on "aemFuelPricePublishedPage" screen
    And I verify "todaysPriceText" element exists on "aemFuelPricePublishedPage" screen
    And I click "priceTrendText" on "aemFuelPricePublishedPage" screen
    And I take a screenshot
    And I click "fuelPriceTrendText" on "aemFuelPricePublishedPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemFuelPriceComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot