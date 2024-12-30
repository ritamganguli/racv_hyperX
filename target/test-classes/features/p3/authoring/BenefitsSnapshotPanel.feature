#Author: Dheebanraj M
Feature: This feature tests the benefit snapshot panel in AEM authoring

  @TestAuthoringBenefitSnapshotPanel-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author benefit snapshot panel component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-benefits-snapshot-panel-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-benefits-snapshot-panel-RANDOM[0-8]-p3.html"
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Benefit" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "benefitSnapshotResult" on "aemInsertNewComponent" screen
    And I wait for "benefitSnapshotResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure benefits snapshot panel component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Benefits snapshot configuration"
    When I click "benefitsSnapshotPanelInTree" on "aemTestBenefitsSnapshotPanelPage" screen
    And I click "configureButton" on "aemTestBenefitsSnapshotPanelPage" screen
    And I take a screenshot
    #Configuration tab
    And I click "confirgurationsTab" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "headingLevelDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "H2" value for "headingLevelDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I enter "Test the benefit snapshot panel component using automation" details in "headingTxtField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "racv:business-area/racv" details in "globalTagField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "/content/racv/en/home" details in "rootPathField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "addButton" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "defaultTabCheckBox" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "racv:discount-categories/popular" details in "firstTagField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "firstIconDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "Car" value for "firstIconDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I enter "Click Here To Explore" details in "firstExploreTextField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "View all" details in "firstButtonLabelTextField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "https://racv.clubconnect.com.au/en" details in "firstButtonLinkField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "firstOpenInDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "New Tab" value for "firstOpenInDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addButton" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "racv:discount-categories/fuel-motoring" details in "secondTagField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "secondIconDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "Tickets" value for "secondIconDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I enter "Explore all hot offers (150+)" details in "secondExploreTextField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "View all" details in "secondButtonLabelTextField" on "aemBenefitsSnapshotPanelDialog" screen
    And I enter "https://racv.clubconnect.com.au/en/listing/Fuel%20and%20motoring" details in "secondButtonLinkField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "secondOpenInDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "New Tab" value for "secondOpenInDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I enter "Explore All" details in "benefitsCardsLabelField" on "aemBenefitsSnapshotPanelDialog" screen
    And I click "sortByDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "Title" value for "sortByDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I click "sortOrderDdn" on "aemBenefitsSnapshotPanelDialog" screen
    And I select "Ascending" value for "sortOrderDdnResults" drop down in "aemBenefitsSnapshotPanelDialog" screen using selection method "visibleText"
    And I click "layoutTab" on "aemBenefitsSnapshotPanelDialog" screen
    And I verify "targetDivIdValue" element exists on "aemBenefitsSnapshotPanelDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemBenefitsSnapshotPanelDialog" screen
    Then I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish Desktop checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-benefits-snapshot-panel-RANDOM[0-8]-p3.html"
    And I wait for "benefitsHeading" on "aemTestBenefitsSnapshotPanelPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "benefitsHeading" element is visible on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "popularTab" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #Author: Vaishnavi 14/07/2023
    #Verify analytics attributes in benfits snapshot panel for popularTab
    And I verify "data-event" attribute is "site interaction" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "tab" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "popular" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #verify View all button
    And I verify "viewAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes in benfits snapshot panel for View all button
    And I verify "data-event" attribute is "site interaction" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "button" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "view all" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    #verify the analytics of panel card
    And I verify "cardOnePanel" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-event" attribute is "site interaction" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #And I verify "data-location" attribute is "benefits snapshot panel | airport parking and transfers" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "explore all" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    # end of analytics code
    And I click "fuelAndMotoringTab" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "fuelAndMotoringTabFirstCard" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "exploreAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "exploreAllText" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    And I click "popularTab" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #verify at least 1 card appears
    And I verify "popularTabFirstCard" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    And I verify "exploreAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I click "exploreAllButton" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    Then I capture the address navigated to
    And I check the page address contains "URL/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-benefits-snapshot-panel-RANDOM[0-8]-p3.html"
    And I wait for "benefitsHeading" on "aemTestBenefitsSnapshotPanelPagePublished" screen or "10" seconds before proceeding
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #TODO: https://racvone.atlassian.net/browse/DAC-13964
    #And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishBenefitsSnapshot-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Benefits snapshot post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-benefits-snapshot-panel-p3.html"
    And I wait for "benefitsHeading" on "aemTestBenefitsSnapshotPanelPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "benefitsHeading" element is visible on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "popularTab" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #Author: Vaishnavi 14/07/2023
    #Verify analytics attributes in benfits snapshot panel for popularTab
    And I verify "data-event" attribute is "site interaction" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "tab" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "popular" on "popularTab" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #verify View all button
    And I verify "viewAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes in benfits snapshot panel for View all button
    And I verify "data-event" attribute is "site interaction" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "button" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-location" attribute is "benefits snapshot panel" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "view all" on "viewAllButton" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    #verify the analytics of panel card
    And I verify "cardOnePanel" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-event" attribute is "site interaction" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-type" attribute is "link" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #And I verify "data-location" attribute is "benefits snapshot panel | airport parking and transfers" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "data-description" attribute is "explore all" on "cardOnePanel" element on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    # end of analytics code
    And I click "fuelAndMotoringTab" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "fuelAndMotoringTabFirstCard" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "exploreAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I verify "exploreAllText" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    And I click "popularTab" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    #verify at least 1 card appears
    And I verify "popularTabFirstCard" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I take a screenshot
    And I verify "exploreAllButton" element exists on "aemTestBenefitsSnapshotPanelPagePublished" screen
    And I click "exploreAllButton" on "aemTestBenefitsSnapshotPanelPagePublished" screen
    Then I capture the address navigated to
    And I check the page address contains "URL/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-benefits-snapshot-panel-p3.html"
    And I wait for "benefitsHeading" on "aemTestBenefitsSnapshotPanelPagePublished" screen or "10" seconds before proceeding
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #TODO: https://racvone.atlassian.net/browse/DAC-13964
    #And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBBenefitsSnapshotPanel
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify benefits snapshot panel on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-benefits-snapshot-panel--benefits-snapshot-panel-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
