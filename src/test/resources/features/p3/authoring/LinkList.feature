#Author: Viengcumm Thongvilu
Feature: This feature tests the Link List in AEM authoring and storybook

  #Author: Jing Zuo
  #Date: 17 Nov 2022
  @TestAuthoringLinkList-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author Link List component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-link-list-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add Container component
    When I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    Then I click "lastContainerInTree" on "aemTestLinkListPage" screen
    And I click "stylesButton" on "aemTestLinkListPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestLinkListPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author link list 1"
    #Add 1st Link List component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "link list" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "linkListResult" on "aemInsertNewComponent" screen
    And I wait for "linkListResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 1st Link List
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/insurance" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Child Pages" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Child pages" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "increaseChildDepth" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv/corporate-responsibility" details in "parentPageInChild" on "aemLinkListComponentDialog" screen
    And I click "iconTypeInChild" on "aemLinkListComponentDialog" screen
    And I select "Arrow" value for "iconTypeListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "orderByInChild" on "aemLinkListComponentDialog" screen
    And I select "Page Order" value for "orderByListInChild" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Add 2nd Link List component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "link list" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "linkListResult" on "aemInsertNewComponent" screen
    And I wait for "linkListResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 2nd Link List
    When I click "linkListInTree" on "aemTestLinkListPage" screen
    And I click "configureButton" on "aemTestLinkListPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/royalauto/transport" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Fixed list" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/transport/cars" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Cars test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/transport/electric-vehicles" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Electric vehicle test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Add 3rd Link List component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "link list" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "linkListResult" on "aemInsertNewComponent" screen
    And I wait for "linkListResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 3rd Link List
    When I click "linkListInTree" on "aemTestLinkListPage" screen
    And I click "configureButton" on "aemTestLinkListPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/cars-transport" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Search" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Search" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/cars-transport/roadside-assistance" details in "searchIn" on "aemLinkListComponentDialog" screen
    And I click "searchQuery" on "aemLinkListComponentDialog" screen
    And I enter "bike assist" details in "searchQuery" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "iconTypeInSearch" on "aemLinkListComponentDialog" screen
    And I select "External" value for "iconTypeListInSearch" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "orderByInSearch" on "aemLinkListComponentDialog" screen
    And I select "Title" value for "orderByListInSearch" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Add 4th Link List component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "link list" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "linkListResult" on "aemInsertNewComponent" screen
    And I wait for "linkListResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 4th Link List
    When I click "linkListInTree" on "aemTestLinkListPage" screen
    And I click "configureButton" on "aemTestLinkListPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I enter "/content/racv/en/home/membership" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "coralSelectListResult1" on "aemEditorPage" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Tags" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Tags" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/membership/member-discounts" details in "parentPageInTags" on "aemLinkListComponentDialog" screen
    And I click "browseAreaButton" on "aemLinkListComponentDialog" screen
    And I click "racvTag" on "aemLinkListComponentDialog" screen
    And I click "discountCategories" on "aemLinkListComponentDialog" screen
    And I click "shoppingTagThumbnail" on "aemLinkListComponentDialog" screen
    And I click "selectTagsConfirmButton" on "aemLinkListComponentDialog" screen
    And I wait for "selectTagsConfirmButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    And I verify "tagLabel" element exists on "aemLinkListComponentDialog" screen
    And I click "matchTags" on "aemLinkListComponentDialog" screen
    And I select "All tags" value for "matchTagsList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I click "iconTypeInTags" on "aemLinkListComponentDialog" screen
    And I select "Download" value for "iconTypeListInTags" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "orderByInTags" on "aemLinkListComponentDialog" screen
    And I select "Last modified date" value for "orderByListInTags" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I click "sortOrderDropDown" on "aemLinkListComponentDialog" screen
    And I select "Ascending" value for "sortOrderDropDownOptions" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I enter "10" details in "maxItems" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Publish the page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    #Post publish checks - accessibility and visual testing
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Post publish validation - Child pages
    #Link List heading
    And I verify "childPages" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on childPages
    And I verify "data-event" attribute is "site interaction" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | child pages" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "child pages" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I click "childPages" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance.html"
    #Child page
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    And I verify "ourCommunity" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on ourCommunity
    And I verify "data-event" attribute is "site interaction" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | child pages" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "our community" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I click "ourCommunity" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv/corporate-responsibility/community-involvement.html"
    #Post publish validation - Fixed list
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    Then I verify "fixedList" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on fixedList
    And I verify "data-event" attribute is "site interaction" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | fixed list" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "fixed list" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I click "fixedList" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/transport.html"
    #Fixed list
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    And I verify "cars" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on cars
    And I verify "data-event" attribute is "site interaction" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | fixed list" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "cars test" on "cars" element on "aemTestLinkListPagePublished" screen
    And I click "cars" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/transport/cars.html"
    #Post publish validation - Search
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    Then I verify "search" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on search
    And I verify "data-event" attribute is "site interaction" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | search" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "search" on "search" element on "aemTestLinkListPagePublished" screen
    And I click "search" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    #Search
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    And I verify "bikeAssist" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on bikeAssist
    And I verify "data-event" attribute is "site interaction" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | search" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "bike assist" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I click "bikeAssist" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport/roadside-assistance/bike-assist.html "
    #Post publish validation - Tags
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    Then I verify "tags" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on tags
    And I verify "data-event" attribute is "site interaction" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | tags" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "tags" on "tags" element on "aemTestLinkListPagePublished" screen
    And I click "tags" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    #Tags
    When I navigate to "URL/racv-home/utility/qa/test-automation-link-list-RANDOM[0-8]-p3.html"
    And I verify "woolworths" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on woolworths
    And I verify "data-event" attribute is "site interaction" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | tags" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "woolworths gift cards" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I click "woolworths" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "woolworths"

  @TestPublishLinkList-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Link list post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    #Post publish checks - accessibility and visual testing
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Post publish validation - Child pages
    #Link List heading
    And I verify "childPages" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on childPages
    And I verify "data-event" attribute is "site interaction" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | child pages" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "child pages" on "childPages" element on "aemTestLinkListPagePublished" screen
    And I click "childPages" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance.html"
    #Child page
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    And I verify "ourCommunity" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on ourCommunity
    And I verify "data-event" attribute is "site interaction" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | child pages" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "our community" on "ourCommunity" element on "aemTestLinkListPagePublished" screen
    And I click "ourCommunity" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv/corporate-responsibility/community-involvement.html"
    #Post publish validation - Fixed list
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    Then I verify "fixedList" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on fixedList
    And I verify "data-event" attribute is "site interaction" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | fixed list" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "fixed list" on "fixedList" element on "aemTestLinkListPagePublished" screen
    And I click "fixedList" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/transport.html"
    #Fixed list
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    And I verify "cars" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on cars
    And I verify "data-event" attribute is "site interaction" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | fixed list" on "cars" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "cars test" on "cars" element on "aemTestLinkListPagePublished" screen
    And I click "cars" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/transport/cars.html"
    #Post publish validation - Search
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    Then I verify "search" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on search
    And I verify "data-event" attribute is "site interaction" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | search" on "search" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "search" on "search" element on "aemTestLinkListPagePublished" screen
    And I click "search" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    #Search
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    And I verify "bikeAssist" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on bikeAssist
    And I verify "data-event" attribute is "site interaction" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | search" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "bike assist" on "bikeAssist" element on "aemTestLinkListPagePublished" screen
    And I click "bikeAssist" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport/roadside-assistance/bike-assist.html "
    #Post publish validation - Tags
    #Link List heading
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    Then I verify "tags" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on tags
    And I verify "data-event" attribute is "site interaction" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | tags" on "tags" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "tags" on "tags" element on "aemTestLinkListPagePublished" screen
    And I click "tags" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    #Tags
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-link-list-p3.html"
    And I verify "woolworths" element exists on "aemTestLinkListPagePublished" screen
    #Verify analytics attributes on woolworths
    And I verify "data-event" attribute is "site interaction" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-type" attribute is "links" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-location" attribute is "link list | tags" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I verify "data-description" attribute is "woolworths gift cards" on "woolworths" element on "aemTestLinkListPagePublished" screen
    And I click "woolworths" on "aemTestLinkListPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "woolworths"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBLinkList
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Link list on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-link-list--link-list-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBLinkList
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Link list (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-link-list--link-list-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"