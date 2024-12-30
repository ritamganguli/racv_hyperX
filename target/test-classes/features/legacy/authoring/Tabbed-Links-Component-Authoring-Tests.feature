#Author: Sumanta Roy
#Date created - 6 Apr 2021
Feature: This feature tests the authoring of Tabbed Links component

  #SR 06 Apr 2021 DAC-6880
  @TestTabbedLinkComponent
  #@AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Tabbed Link component, configure, publish and verify published changes
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
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-tabbed-links-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-tabbed-links-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Tabbed Links component
    And I enter "Tabbed Links" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "tabbedLinksOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "tabbedLinksOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    And I wait for "tabbedLinkComponent" on "aemTabbedLinksCompPage" screen or "10" seconds before proceeding
    And I wait for "contentTreeButton" on "aemTabbedLinksCompPage" screen or "10" seconds before proceeding
    And I click "tabbedLinkComponent" on "aemTabbedLinksCompPage" screen
    And I click "configureTabbedLinkButton" on "aemTabbedLinksCompPage" screen
    #Verify Configuration tab
    And I click "configurationTab" on "aemTabbedLinksCompPage" screen
    And I click "browseAreaButton" on "aemTabbedLinksCompPage" screen
    And I click "businessAreaTag" on "aemTabbedLinksCompPage" screen
    And I click "racvTag" on "aemTabbedLinksCompPage" screen
    And I click "selectTagsConfirmButton" on "aemTabbedLinksCompPage" screen
    And I verify "racvTagLabel" element exists on "aemTabbedLinksCompPage" screen
    And I enter "/content/racv/en/home" details in "heirarchyBasePath" on "aemTabbedLinksCompPage" screen
    And I clear contents of "heading" element on "aemTabbedLinksCompPage" screen
    And I enter "Test Heading" details in "heading" on "aemTabbedLinksCompPage" screen
    And I click "tabFiltersCheckBox" on "aemTabbedLinksCompPage" screen
    And I click "dropdownCheckBox" on "aemTabbedLinksCompPage" screen
    #Click twice to uncheck default selection and re-check, since no attributes are changing dynamically
    And I click "searchDropdownCheckBox" on "aemTabbedLinksCompPage" screen
    And I click "searchDropdownCheckBox" on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    #Tabs selection
    And I clear contents of "allTabLabel" element on "aemTabbedLinksCompPage" screen
    And I enter "All Tab Label" details in "allTabLabel" on "aemTabbedLinksCompPage" screen
    And I select "Price Tag" value for "allTabIcon" drop down in "aemTabbedLinksCompPage" screen using selection method "visibleText"
    And I verify "defaultTabCheckBox" element exists on "aemTabbedLinksCompPage" screen
    And I click "tabsAddButton" on "aemTabbedLinksCompPage" screen
    And I enter "/content/cq:tags/racv/discount-categories/hot-offers" details in "tabFilter1Tag" on "aemTabbedLinksCompPage" screen
    And I click "tabFilter1Icon" on "aemTabbedLinksCompPage" screen
    And I click "tabFilter1IconAnytime" on "aemTabbedLinksCompPage" screen
    And I click "tabsAddButton" on "aemTabbedLinksCompPage" screen
    And I enter "/content/cq:tags/racv/discount-categories/entertainment" details in "tabFilter2Tag" on "aemTabbedLinksCompPage" screen
    And I click "tabFilter2Icon" on "aemTabbedLinksCompPage" screen
    And I click "tabFilter2IconArrowDown" on "aemTabbedLinksCompPage" screen
    And I click "defaultTabOption1CheckBox" on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    #Dropdown selection
    And I clear contents of "allDropdownLabel" element on "aemTabbedLinksCompPage" screen
    And I enter "All Locations" details in "allDropdownLabel" on "aemTabbedLinksCompPage" screen
    And I click "defaultDropdownCheckbox" on "aemTabbedLinksCompPage" screen
    And I click "dropDownAddButton" on "aemTabbedLinksCompPage" screen
    And I enter "/content/cq:tags/racv/countries/australia/national-partners" details in "dropDownOption1" on "aemTabbedLinksCompPage" screen
    And I click "dropDownAddButton" on "aemTabbedLinksCompPage" screen
    And I enter "/content/cq:tags/racv/countries/australia/victoria/metropolitan-melbourne" details in "dropDownOption2" on "aemTabbedLinksCompPage" screen
    And I click "defaultDropDownOption1" on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    #Search Selection
    And I enter "Search here" details in "searchLabel" on "aemTabbedLinksCompPage" screen
    And I verify "noResultText" element exists on "aemTabbedLinksCompPage" screen
    And I enter "Error Text" details in "errorText" on "aemTabbedLinksCompPage" screen
    And I verify "tileCtaLabel" element exists on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    #Sorting
    And I select "Published Date" value for "resultsSortBy" drop down in "aemTabbedLinksCompPage" screen using selection method "visibleText"
    And I select "Descending" value for "sortOrder" drop down in "aemTabbedLinksCompPage" screen using selection method "visibleText"
    #Load more
    And I verify "loadMoreLabel" element exists on "aemTabbedLinksCompPage" screen
    And I enter "5" details in "loadMoreCount" on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemTabbedLinksCompPage" screen
    And I verify "targetDivId" field contains a value on "aemTabbedLinksCompPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemTabbedLinksCompPage" screen
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-tabbed-links-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "heading" element exists on "tabbedLinkPublishedPage1" screen
    And I verify "searchBox" element exists on "tabbedLinkPublishedPage1" screen
    And I verify "defaultSelectionLocationDropdown" element exists on "tabbedLinkPublishedPage1" screen
    #check default selection
    And I verify "hotOffersDefaultSelection" element exists on "tabbedLinkPublishedPage1" screen
    And I take a screenshot
    #change category and check listing
    And I click "entertainmentCategory" on "tabbedLinkPublishedPage1" screen
    And I verify "moviesListingEntertainmentCategory" element exists on "tabbedLinkPublishedPage1" screen
    And I take a screenshot
    And I verify "allTabCategory" element exists on "tabbedLinkPublishedPage1" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTabbedLinkComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot