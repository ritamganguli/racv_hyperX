#Author: Dheebanraj M
#Date created - 17 Dec 2021
Feature: This feature tests the T&L search widget component and it's variants from authoring regression perspective.

  #DM 17 Dec 2021
  #Dry run completed in QA
  @TestTravelSearchWidgetComponent
  #@AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add T&L search widget component, publish, edit T&L product tab order and republish and verify published changes
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
    And I enter "test-automation-travel-search-widget-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-travel-search-widget-component-1.html"
    #check the include resorts clientlib on this page on advanced tab from page properties
    And I click "pageInfoButton" on "travelSearchWidgetCompPage" screen
    And I click "openPropertiesOption" on "travelSearchWidgetCompPage" screen
    And I wait for "advancedTab" on "travelSearchWidgetCompPage" screen or "5" seconds before proceeding
    And I click "advancedTab" on "travelSearchWidgetCompPage" screen
    And I click "addFieldClientLib" on "travelSearchWidgetCompPage" screen
    And I select "Resorts" value for "clientLibraryDropDown" drop down in "travelSearchWidgetCompPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveAndCloseButton" on "travelSearchWidgetCompPage" screen
    #Drop the travel and leisure search wigdet component
    And I wait for "addComponentsParsys" on "aemLandingPage" screen or "10" seconds before proceeding
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "travel" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "travelSearchWidgetOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "travelSearchWidgetOption" on "aemInsertCompDialog" screen using Action class
    And I wait for "travelSearchWidgetOption" to disappear on "aemInsertCompDialog" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "travelSearchWidgetCompPage" screen
    And I click "contentTreeButton" on "travelSearchWidgetCompPage" screen
    #Configure travel and leisure search widget component
    And I click "contentTreeTravelSearchWidget" on "travelSearchWidgetCompPage" screen
    And I click "configureTravelSearchWidgetButton" on "travelSearchWidgetCompPage" screen
    #Configuration tab
    And I wait for "configurationTab" on "travelSearchWidgetCompDialog" screen or "5" seconds before proceeding
    And I click "configurationTab" on "travelSearchWidgetCompDialog" screen
    # Resorts tab config
    And I click "selectTheTabType1" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue1" on "travelSearchWidgetCompDialog" screen
    #And I enter "Resorts" details in "enterTheTabTitle1" on "travelSearchWidgetCompDialog" screen
    And I enter "Find an RACV Resort" details in "tabSubHeading1" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive1" on "travelSearchWidgetCompDialog" screen
    #And I enter "" details in "tabDropDownData1" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab1" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue1" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab1" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    # Things To Do tab config
    And I click "selectTheTabType2" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue2" on "travelSearchWidgetCompDialog" screen
    And I enter "Find attractions and activities" details in "enterTheTabTitle2" on "travelSearchWidgetCompDialog" screen
    And I enter "Browse offers for thrill seekers, foodies, families and more" details in "tabSubHeading2" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive2" on "travelSearchWidgetCompDialog" screen
    #And I enter "/content/racv/lists/travel-and-experience-widget/things-to-do" details in "tabDropDownData2" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab2" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue2" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab2" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    # tours tab config
    And I click "selectTheTabType3" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue3" on "travelSearchWidgetCompDialog" screen
    #And I enter "Find a Tours" details in "enterTheTabTitle3" on "travelSearchWidgetCompDialog" screen
    And I enter "Explore close to home or farther afield with tailor made and group tours" details in "tabSubHeading3" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive3" on "travelSearchWidgetCompDialog" screen
    #And I enter "/content/racv/lists/travel-and-experience-widget/tours" details in "tabDropDownData3" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab3" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue3" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab3" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    # Cruises config
    And I click "selectTheTabType4" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue4" on "travelSearchWidgetCompDialog" screen
    #And I enter "Find a cruise" details in "enterTheTabTitle4" on "travelSearchWidgetCompDialog" screen
    And I enter "Explore large ,small or private group cruises -near and far away" details in "tabSubHeading4" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive4" on "travelSearchWidgetCompDialog" screen
    #And I enter "/content/racv/lists/travel-and-experience-widget/cruises" details in "tabDropDownData4" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab4" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue4" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab4" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    # Hotels and Packages config
    And I click "selectTheTabType5" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue5" on "travelSearchWidgetCompDialog" screen
    #And I enter "Find a Holiday package" details in "enterTheTabTitle5" on "travelSearchWidgetCompDialog" screen
    And I enter "Browse tailored accommodation packages with bonus perks for RACV Members" details in "tabSubHeading5" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive5" on "travelSearchWidgetCompDialog" screen
    #And I enter "/content/racv/lists/travel-and-experience-widget/holiday-and-packages" details in "tabDropDownData5" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab5" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue5" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab5" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "travelSearchWidgetCompDialog" screen
    And I verify "targetDivId" field contains a value on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "travelSearchWidgetCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "travelSearchWidgetCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-travel-search-widget-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish check
    And I verify "travelProductSearchComponent" element exists on "travelSearchWidgetPublished" screen
    And I verify "activeTab" element exists on "travelSearchWidgetPublished" screen
    And I verify "resortsText" element exists on "travelSearchWidgetPublished" screen
    And I click "thingsToDoTab" on "travelSearchWidgetPublished" screen
    And I verify "thingsToDoDropDown" element exists on "travelSearchWidgetPublished" screen
    And I click "toursTab" on "travelSearchWidgetPublished" screen
    And I verify "toursDropDown" element exists on "travelSearchWidgetPublished" screen
    And I click "cruisesTab" on "travelSearchWidgetPublished" screen
    And I verify "cruisesDropDown" element exists on "travelSearchWidgetPublished" screen
    And I click "hotelsAndPackagesTab" on "travelSearchWidgetPublished" screen
    And I verify "PackagesDropDown" element exists on "travelSearchWidgetPublished" screen
    And I take a screenshot
    #go back to aem and change variant
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-travel-search-widget-component-1.html"
    And I click "contentTreeButton" on "travelSearchWidgetCompPage" screen
    And I click "contentTreeTravelSearchWidget" on "travelSearchWidgetCompPage" screen
    And I click "configureTravelSearchWidgetButton" on "travelSearchWidgetCompPage" screen
    #Configuration tab
    And I click "configurationTab" on "travelSearchWidgetCompDialog" screen
    # Things To Do tab config
    And I click "selectTheTabType1" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue6" on "travelSearchWidgetCompDialog" screen
    And I clear contents of "enterTheTabTitle1" element on "travelSearchWidgetCompDialog" screen
    And I enter "Find attractions and activities" details in "enterTheTabTitle1" on "travelSearchWidgetCompDialog" screen
    And I clear contents of "tabSubHeading1" element on "travelSearchWidgetCompDialog" screen
    And I enter "Browse offers for thrill seekers, foodies, families and more" details in "tabSubHeading1" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToActive1" on "travelSearchWidgetCompDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/things-to-do" details in "tabDropDownData1" on "travelSearchWidgetCompDialog" screen
    And I click "iconTab1" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue8" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab1" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    # Resorts tab config
    And I click "selectTheTabType2" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "selectTheTabValue7" on "travelSearchWidgetCompDialog" screen
    And I clear contents of "enterTheTabTitle2" element on "travelSearchWidgetCompDialog" screen
    And I enter "Resorts" details in "enterTheTabTitle2" on "travelSearchWidgetCompDialog" screen
    And I clear contents of "tabSubHeading2" element on "travelSearchWidgetCompDialog" screen
    And I enter "Find an RACV Resort" details in "tabSubHeading2" on "travelSearchWidgetCompDialog" screen
    And I click "checkboxToActive2" on "travelSearchWidgetCompDialog" screen
    And I clear contents of "tabDropDownData2" element on "travelSearchWidgetCompDialog" screen
    And I click "iconTab2" on "travelSearchWidgetCompDialog" screen using Action class
    And I click "iconTabValue9" on "travelSearchWidgetCompDialog" screen
    #And I click "checkboxToNewTab2" on "travelSearchWidgetCompDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "travelSearchWidgetCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "travelSearchWidgetCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-travel-search-widget-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish check
    And I verify "travelProductSearchComponent" element exists on "travelSearchWidgetPublished" screen
    And I verify "activeTab" element exists on "travelSearchWidgetPublished" screen
    And I verify "resortsText" element exists on "travelSearchWidgetPublished" screen
    And I click "thingsToDoTab" on "travelSearchWidgetPublished" screen
    And I verify "findAttractionText" element exists on "travelSearchWidgetPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestTraveleSearchWidgetComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot