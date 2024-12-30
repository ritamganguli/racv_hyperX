#Author: Viengcumm Thongvilu
Feature: This feature tests the Related Information component in AEM authoring and storybook

  @TestAuthoringRelatedInformationPageList-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author related information component and specify select criteria as Page List, and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-related-information-page-list-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-related-information-page-list-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author components"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Related Information component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "related information" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "relatedInformationResult" on "aemInsertNewComponent" screen
    And I wait for "relatedInformationResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure Related Information component
    When I click "relatedInformationInTree" on "aemTestRelatedInformationPage" screen
    And I click "configureButton" on "aemTestRelatedInformationPage" screen
    And I take a screenshot
    And I click "confirgurationsTab" on "aemRelatedInformationComponentDialog" screen
    Then I click "selection" on "aemRelatedInformationComponentDialog" screen
    And I select "Page List" value for "selectionList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add 4 Page Paths
    When I click "addPagePath" on "aemRelatedInformationComponentDialog" screen
    And I click "addPagePath" on "aemRelatedInformationComponentDialog" screen
    And I click "addPagePath" on "aemRelatedInformationComponentDialog" screen
    And I click "addPagePath" on "aemRelatedInformationComponentDialog" screen
    Then I enter "/content/racv/en/home/insurance/travel-insurance" details in "pagePath1" on "aemRelatedInformationComponentDialog" screen
    And I click "pagePath1Result" on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/about-racv" details in "pagePath2" on "aemRelatedInformationComponentDialog" screen
    And I click "pagePath2Result" on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/membership" details in "pagePath3" on "aemRelatedInformationComponentDialog" screen
    And I click "pagePath3Result" on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/finance/personal-loans" details in "pagePath4" on "aemRelatedInformationComponentDialog" screen
    And I click "pagePath4Result" on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    And I verify "ctaLabel" field contains a value on "aemRelatedInformationComponentDialog" screen
    And I click "doneButton" on "aemRelatedInformationComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemRelatedInformationComponentDialog" screen or "5" seconds before proceeding
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
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-page-list-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "insuranceHeading" on "aemTestRelatedInformationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "insuranceHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify there're 4 related information cards
    And I verify "relatedInformationCard4" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard5" element is not visible on "aemTestRelatedInformationPagePublished" screen
    #Verify analytics attributes on ctaButtonInFirst
    And I verify "data-event" attribute is "site interaction" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-type" attribute is "link" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-location" attribute is "related items | travel insurance" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-description" attribute is "find out more" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton1" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance/travel-insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-page-list-RANDOM[0-8]-p3.html"
    And I take a screenshot
    And I verify "aboutHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton2" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-page-list-RANDOM[0-8]-p3.html"
    And I take a screenshot
    And I verify "membershipHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton3" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-page-list-RANDOM[0-8]-p3.html"
    And I take a screenshot
    And I verify "plHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton4" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/finance/personal-loans.html"
    And I take a screenshot

  @TestPublishRelatedInformationPageList-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Related information page list post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-page-list-p3.html"
    #Post publish checks
    And I wait for "insuranceHeading" on "aemTestRelatedInformationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "insuranceHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify there're 4 related information cards
    And I verify "relatedInformationCard4" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard5" element is not visible on "aemTestRelatedInformationPagePublished" screen
    #Verify analytics attributes on ctaButtonInFirst
    And I verify "data-event" attribute is "site interaction" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-type" attribute is "link" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-location" attribute is "related items | insurance" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    And I verify "data-description" attribute is "find out more" on "ctaButtonInFirst" element on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton1" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-leisure/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-page-list-p3.html"
    And I take a screenshot
    And I verify "aboutHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton2" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-page-list-p3.html"
    And I take a screenshot
    And I verify "membershipHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton3" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-page-list-p3.html"
    And I take a screenshot
    And I verify "plHeading" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "ctaButton4" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/finance/personal-loans.html"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringRelatedInformationCustomFilter-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author related information component and specify select criteria as Custom Filter, and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-related-information-custom-filter-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-related-information-custom-filter-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author components"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Related Information component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "related information" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "relatedInformationResult" on "aemInsertNewComponent" screen
    And I wait for "relatedInformationResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure Related Information component
    When I click "relatedInformationInTree" on "aemTestRelatedInformationPage" screen
    And I click "configureButton" on "aemTestRelatedInformationPage" screen
    And I take a screenshot
    And I click "confirgurationsTab" on "aemRelatedInformationComponentDialog" screen
    Then I click "selection" on "aemRelatedInformationComponentDialog" screen
    And I select "Custom Filter" value for "selectionList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add Root path
    When I click "addRootPath" on "aemRelatedInformationComponentDialog" screen
    And I enter "/content/racv/en/home" details in "rootPath" on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    Then I click "numItems" on "aemRelatedInformationComponentDialog" screen
    And I clear contents of "numItems" element on "aemRelatedInformationComponentDialog" screen
    And I enter "6" details in "numItems" on "aemRelatedInformationComponentDialog" screen
    And I click "showMoreRequired" on "aemRelatedInformationComponentDialog" screen
    And I verify "showMoreLabel" field contains a value on "aemRelatedInformationComponentDialog" screen
    And I take a screenshot
    #Add Property filters
    When I click "addPropFilters" on "aemRelatedInformationComponentDialog" screen
    Then I enter "jcr:content/cq:template" details in "propName" on "aemRelatedInformationComponentDialog" screen
    And I enter "/conf/racvaem/settings/wcm/templates/content-hub-article-page-template" details in "propValue" on "aemRelatedInformationComponentDialog" screen
    And I click "propFiltersOperation" on "aemRelatedInformationComponentDialog" screen
    And I select "And" value for "propFiltersOperationList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    #Add Tag filters
    When I click "browseAreaButton" on "aemRelatedInformationComponentDialog" screen
    And I click "racvTag" on "aemRelatedInformationComponentDialog" screen
    And I click "contentHubTag" on "aemRelatedInformationComponentDialog" screen
    And I click "sustainabilityTag" on "aemRelatedInformationComponentDialog" screen
    And I click "recyclingTag" on "aemRelatedInformationComponentDialog" screen
    Then I click "selectTagsConfirmButton" on "aemRelatedInformationComponentDialog" screen
    And I wait for "selectTagsConfirmButton" to disappear on "aemRelatedInformationComponentDialog" screen or "2" seconds before proceeding
    And I verify "tagLabel" element exists on "aemRelatedInformationComponentDialog" screen
    And I click "tagFiltersOperation" on "aemRelatedInformationComponentDialog" screen
    And I select "And" value for "tagFiltersOperationList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    #Add Sort criteria
    When I click "addSortCriteria" on "aemRelatedInformationComponentDialog" screen
    And I click "sortProperty" on "aemRelatedInformationComponentDialog" screen
    And I select "Title" value for "sortPropertyList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    And I click "sortOrder" on "aemRelatedInformationComponentDialog" screen
    And I select "Ascending" value for "sortOrderList" drop down in "aemRelatedInformationComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I verify "ctaLabel" field contains a value on "aemRelatedInformationComponentDialog" screen
    And I click "doneButton" on "aemRelatedInformationComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemRelatedInformationComponentDialog" screen or "5" seconds before proceeding
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
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-custom-filter-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "firstSustainabilityTag" on "aemTestRelatedInformationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSustainabilityTag" element exists on "aemTestRelatedInformationPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    Then I click "firstSustainabilityTag" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/sustainability/tips-for-a-sustainable-christmas.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-related-information-custom-filter-RANDOM[0-8]-p3.html"
    #Verify there're 6 related information cards
    And I verify "relatedInformationCard6" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard7" element is not visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "showMore" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "showMore" on "aemTestRelatedInformationPagePublished" screen
    #Verify there're 12 related information cards
    And I verify "relatedInformationCard12" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard13" element is not visible on "aemTestRelatedInformationPagePublished" screen
    And I take a screenshot

  @TestPublishRelatedInformationCustomFilter-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Related information custom filter post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-custom-filter-p3.html"
    #Post publish checks
    And I wait for "firstSustainabilityTag" on "aemTestRelatedInformationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSustainabilityTag" element exists on "aemTestRelatedInformationPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    Then I click "firstSustainabilityTag" on "aemTestRelatedInformationPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/sustainability/tips-for-a-sustainable-christmas.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-related-information-custom-filter-p3.html"
    #Verify there're 6 related information cards
    And I verify "relatedInformationCard6" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard7" element is not visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "showMore" element exists on "aemTestRelatedInformationPagePublished" screen
    Then I click "showMore" on "aemTestRelatedInformationPagePublished" screen
    #Verify there're 12 related information cards
    And I verify "relatedInformationCard12" element is visible on "aemTestRelatedInformationPagePublished" screen
    And I verify "relatedInformationCard13" element is not visible on "aemTestRelatedInformationPagePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBRelatedInformationPage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify the related information template page on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=templateClass:racv&id=templates--related-info-page&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBRelatedInformationPage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify the related information template page (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=templateClass:racv&id=templates--related-info-page&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"