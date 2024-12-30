#Author: Jing Zuo
Feature: This feature tests the Product Listing in AEM authoring and storybook

  @TestAuthoringProductListing-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author product listing component, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-product-listing-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-product-listing-RANDOM[0-8]-p3.html"
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
    #Configure newly added container as layout container
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I click "enabelCurve" on "aemContainerDialog" screen
    And I take a screenshot
    And I click "theme" on "aemContainerDialog" screen
    And I select "Stone" value for "themeList" drop down in "aemContainerDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveButton" on "aemContainerDialog" screen
    And I wait for "saveButton" to disappear on "aemContainerDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product listing"
    #Add Title component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Title" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "titleResult" on "aemInsertNewComponent" screen
    And I wait for "titleResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Title component to add a title
    When I click "firstTitle" on "aemTestTitlePage" screen
    And I click "configureButton" on "aemTestTitlePage" screen
    And I click "propertiesTab" on "aemTitleComponentDialog" screen
    And I enter "Popular RACV products and services" details in "titleField" on "aemTitleComponentDialog" screen
    Then I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "2" seconds before proceeding
    When I click "firstTitle" on "aemTestTitlePage" screen
    And I click "stylesButton" on "aemTestTitlePage" screen
    And I select "Centre" value for "titleAlignmentStyleList" drop down in "aemTestTitlePage" screen using selection method "visibleText"
    Then I click "applyStyle" on "aemTestTitlePage" screen
    And I wait for "applyStyle" to disappear on "aemTestTitlePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Add Product Listing component into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Product Listing" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "productListingResult" on "aemInsertNewComponent" screen
    Then I wait for "productListingResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Product Listing component
    When I click "productListingInTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductListingComponentDialog" screen
    And I click "illustration" on "aemProductListingComponentDialog" screen
    And I select "House Hero" value for "illustrationList" drop down in "aemProductListingComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addButton" on "aemProductListingComponentDialog" screen
    And I click "addButton" on "aemProductListingComponentDialog" screen
    And I click "addButton" on "aemProductListingComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemProductListingComponentDialog" screen
    And I verify "warningMsg" element is visible on "aemProductListingComponentDialog" screen
    And I click "closeWarning" on "aemProductListingComponentDialog" screen
    And I take a screenshot
    Then I click "deleteSeventhProduct" on "aemProductListingComponentDialog" screen
    And I wait for "deleteSeventhProduct" to disappear on "aemProductListingComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    And I click "doneButton" on "aemProductListingComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductListingComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 1"
    #Configure Product component 1
    When I click "product1InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "House With Car Plane Solar Hero" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Aircon Heating" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/insurance" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Insurance" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 1 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "Car Insurance" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/insurance/car-insurance" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 1 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "Home Insurance" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/insurance/home-insurance" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "Arrow" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 1 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Travel Insurance" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/insurance/travel-insurance" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "External" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 2"
    #Configure Product component 2
    When I click "product2InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "House With Car Plane Hero" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Alarm Clock" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/travel-experiences" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Travel" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 2 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "RACV resorts" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 2 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "Holidays" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/holidays" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "Arrow" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 2 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Special offers" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/travel-deals" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "Download" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 3"
    #Configure Product component 3
    When I click "product3InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "House With Dog Hero" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Armchair With Sidetable" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/home" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Home Services" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 3 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "Home Maintenance" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/home/repairs-maintenance" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 3 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "Emergency Trades" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/home/emergency-home-assist" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 3 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Solar" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/home/solar" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 4"
    #Configure Product component 4
    When I click "product4InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "House With Solar Hero" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Car" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/cars-transport" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Car" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 4 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "ERA" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/cars-transport/roadside-assistance" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 4 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "New Car Loans" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/cars-transport/car-loans/new" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 4 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Buying an Electric Vehicle" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/cars-transport/electric-vehicles/buying" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 5"
    #Configure Product component 5
    When I click "product5InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "Letter Detail" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Member Card" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/membership" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Membership" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 5 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "Member Benefits" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/membership/member-discounts" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 5 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "About Membership" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/membership/about-membership" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 5 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Account" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/membership/account" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author product 6"
    #Configure Product component 6
    When I click "product6InTree" on "aemTestProductListingPage" screen
    And I click "configureButton" on "aemTestProductListingPage" screen
    And I click "configurationsTab" on "aemProductComponentDialog" screen
    And I click "categoryIllustration" on "aemProductComponentDialog" screen
    And I select "Lightbulb With Leaf And Plug Hero" value for "categoryIllustrationList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "mobileIcon" on "aemProductComponentDialog" screen
    And I select "Heart" value for "mobileIconList" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/royalauto" details in "headingLink" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "listHeading" on "aemProductComponentDialog" screen
    And I enter "Lifestyle" details in "listHeading" on "aemProductComponentDialog" screen
    And I take a screenshot
    #Configure Product component 6 - add link 1
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "News" details in "linkTitle1" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/news" details in "linkUrl1" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType1" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType1List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 6 - add link 2
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "Transport" details in "linkTitle2" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/transport" details in "linkUrl2" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType2" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType2List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    #Configure Product component 6 - add link 3
    And I click "addLinkButton" on "aemProductComponentDialog" screen
    And I click "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "Property" details in "linkTitle3" on "aemProductComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/property" details in "linkUrl3" on "aemProductComponentDialog" screen
    And I click "dropDownFirstResult" on "aemProductComponentDialog" screen
    And I click "iconType3" on "aemProductComponentDialog" screen
    And I select "No Icon" value for "iconType3List" drop down in "aemProductComponentDialog" screen using selection method "visibleText"
    Then I click "doneButton" on "aemProductComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemProductComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-product-listing-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "title" on "aemTestProductListingPagePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "productListingGroup" element exists on "aemTestProductListingPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "product1" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product2" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product3" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product4" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product5" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product6" element is visible on "aemTestProductListingPagePublished" screen
    And I click "product1" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-product-listing-RANDOM[0-8]-p3.html"
    And I click "product1Link1" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/car-insurance.html"
    And I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/test-automation-product-listing-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I verify "productListingGroup" element exists on "aemTestProductListingPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "product1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product2Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product3Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product4Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product5Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product6Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I click "product1Mobile" on "aemTestProductListingPagePublished" screen
    #Then I check the page address contains "/insurance.html"
    #And I take a screenshot
    #When I navigate to "URL/racv-home/utility/qa/test-automation-product-listing-RANDOM[0-8]-p3.html"
    #And I click "product1MobileButton" on "aemTestProductListingPagePublished" screen
    #And I verify "product1Link1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I click "product1Link1Mobile" on "aemTestProductListingPagePublished" screen
    #Then I check the page address contains "/car-insurance.html"
    #And I take a screenshot
    #And I close the browser

  @TestPublishProductListing-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Product listing post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html"
    #Post publish checks
    When I wait for "title" on "aemTestProductListingPagePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "productListingGroup" element exists on "aemTestProductListingPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "product1" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product2" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product3" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product4" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product5" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product6" element is visible on "aemTestProductListingPagePublished" screen
    And I click "product1" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html"
    And I click "product1Link1" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/car-insurance.html"
    And I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I verify "productListingGroup" element exists on "aemTestProductListingPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "product1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product2Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product3Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product4Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product5Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I verify "product6Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I click "product1Mobile" on "aemTestProductListingPagePublished" screen
    #Then I check the page address contains "/insurance.html"
    #And I take a screenshot
    #When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html"
    #And I click "product1MobileButton" on "aemTestProductListingPagePublished" screen
    #And I verify "product1Link1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    #And I click "product1Link1Mobile" on "aemTestProductListingPagePublished" screen
    #Then I check the page address contains "/car-insurance.html"
    #And I take a screenshot
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishProductListing-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Product listing post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    And I verify "productListingGroup" element exists on "aemTestProductListingPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "product1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product2Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product3Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product4Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product5Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I verify "product6Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I click "product1Mobile" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-product-listing-p3.html"
    And I click "product1MobileButton" on "aemTestProductListingPagePublished" screen
    And I verify "product1Link1Mobile" element is visible on "aemTestProductListingPagePublished" screen
    And I click "product1Link1Mobile" on "aemTestProductListingPagePublished" screen
    Then I check the page address contains "/car-insurance.html"
    And I take a screenshot
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBProductListing1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify prodict listing visually in story book - desktop, 5 product categories, 3 link list items
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story" on "chrome" on "android-mobile"
    #When I dismiss GDPR notification if it exists
    #And I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "productList1MobileButton" on "storybookProductListing" screen
    #And I take a screenshot
    #And I take a lambda snapshot "product category 1" "hide-gdpr"
    #And I close the browser

  @TestSBProductListing1.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify prodict listing visually in story book - desktop, 5 product categories, 3 link list items on android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story" on "chrome" on "android-mobile"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "productList1MobileButton" on "storybookProductListing" screen
    And I take a screenshot
    And I take a lambda snapshot "product category 1" "hide-gdpr"
    And I close the browser

  @TestSBProductListing2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify prodict listing visually in story book - desktop, 6 product categories, 4 link list items
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story" on "chrome" on "android-mobile"
    #When I dismiss GDPR notification if it exists
    #And I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "productList1MobileButton" on "storybookProductListing" screen
    #And I take a screenshot
    #And I take a lambda snapshot "product category 1" "hide-gdpr"
    #And I close the browser

  @TestSBProductListing2.chrome.android-mobile
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify prodict listing visually in story book - desktop, 6 product categories, 4 link list items on android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story" on "chrome" on "android-mobile"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "productList1MobileButton" on "storybookProductListing" screen
    And I take a screenshot
    And I take a lambda snapshot "product category 1" "hide-gdpr"
    And I close the browser

  @TestSBProductListing1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify prodict listing visually (club theme) in story book - desktop, 5 product categories, 3 link list items
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #When I dismiss GDPR notification if it exists
    #And I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr" for mobile
    #And I click "productList1MobileButton" on "storybookProductListing" screen
    #And I take a screenshot
    #And I take a lambda snapshot "product category 1" "hide-gdpr"
    #And I close the browser

  @TestSBProductListing1.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify prodict listing visually (club theme) in story book - desktop, 5 product categories, 3 link list items on android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr" for mobile
    And I click "productList1MobileButton" on "storybookProductListing" screen
    And I take a screenshot
    And I take a lambda snapshot "product category 1" "hide-gdpr"
    And I close the browser

  @TestSBProductListing2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify prodict listing visually (club theme) in story book - desktop, 6 product categories, 4 link list items
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #When I dismiss GDPR notification if it exists
    #And I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "productList1MobileButton" on "storybookProductListing" screen
    #And I take a screenshot
    #And I take a lambda snapshot "product category 1" "hide-gdpr"
    #And I close the browser

  @TestSBProductListing2.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify prodict listing visually (club theme) in story book - desktop, 6 product categories, 4 link list items on android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfProductCategories:6;numberOfLinkListItems:4&id=components-product-listing--product-listing-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "productList1MobileButton" on "storybookProductListing" screen
    And I take a screenshot
    And I take a lambda snapshot "product category 1" "hide-gdpr"
    And I close the browser