#Author: Dheebanraj M
Feature: This feature tests the offer cards component in AEM authoring and storybook

  @TestAuthoringOfferCardsWithImage-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add offer cards components with image and configure all the five variant with image, publish and view the page in AEM then delete and page
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
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-offer-cards-with-images-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-offer-cards-with-images-RANDOM[0-8]-p3.html"
    When I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
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
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring offer card components"
    #Search and add offer cards components and separator
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "offer cards" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "offerCardsResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "offerCardsResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I click "firstOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "addButton" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Copy and paste offer cards component for two times and add the separator
    When I click "firstOfferCardsComponent" on "aemTestOfferCardsPage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure second and thrid offer cards component and delete the cards as per our needs
    When I click "secondOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "thirdDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "layoutTab" on "aemOfferCardsComponentDialog" screen
    And I click "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I clear contents of "targetDivIdValue" element on "aemOfferCardsComponentDialog" screen
    And I enter "container_container_offercards2" details in "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "thirdOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "thirdDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "secondDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "layoutTab" on "aemOfferCardsComponentDialog" screen
    And I click "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I clear contents of "targetDivIdValue" element on "aemOfferCardsComponentDialog" screen
    And I enter "container_container_offercards3" details in "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component  1"
    #Configure first card in first offer cards component | Varient 1
    When I click "fstOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H2" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 1" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Save Upto 10%" details in "tagLabelField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in First card of First offer cards component
    When I click "fstOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 2 of component  1"
    #Configure second card in first offer cards component | Varient 2
    When I click "fstOfferCardsSecondCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H3" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 2" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in second card of First offer cards component
    And I wait for "fstOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "fstOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 3 of component  1"
    #Configure third card in first offer cards component | Varient 3
    When I click "fstOfferCardsThirdCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H4" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 3" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Save Upto 10%" details in "tagLabelField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "from" details in "priceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in Third card of First offer cards component
    And I wait for "fstOfferCardsThirdCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "fstOfferCardsThirdCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component 2"
    #Configure first card in second offer cards component | Varient 4
    When I click "secOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H5" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 4" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in first card of Second offer cards component
    And I wait for "secOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "secOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 2 of component 2"
    #Configure second card in second offer cards component | Varient 5
    When I click "secOfferCardsSecondCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H6" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 5" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Save Upto 10%" details in "tagLabelField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in second card of Second offer cards component
    And I wait for "secOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "secOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component 3"
    #Configure first card in third offer cards component | Varient 6
    When I click "thirdOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H6" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card with image - Variant 6" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "/content/dam/racv-assets/images/images/insurance/business/1600x900/home-business-insurance-1600x900.jpg" details in "desktopImgPathField" on "aemOfferCardDialog" screen
    And I enter "Save Upto 10%" details in "tagLabelField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "enableSecondaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I enter "Terms and Conditions" details in "termsAndConTxtField" on "aemOfferCardDialog" screen
    And I enter "https://www.racv.com.au" details in "termsAndConLinkField" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in first card of Third offer cards component
    And I wait for "thirdOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "thirdOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure secondary button in first card of Third offer cards component
    And I wait for "thirdOfferCardsFirstCardSecondaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "thirdOfferCardsFirstCardSecondaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Discover more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "30" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-with-images-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "firstOfferCardsComponent" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "secondOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "thirdOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "tagLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "offerBannerLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "locationLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "bookNowButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Book now button
    And I verify "data-event" attribute is "site interaction" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 5" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "book now" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "bookNowButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-with-images-RANDOM[0-8]-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "discoverMoreButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Discover more button
    And I verify "data-event" attribute is "site interaction" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 6" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "discover more" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-with-images-RANDOM[0-8]-p3.html"
    And I wait for "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "termsAndConditionLink" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Terms and Conditions
    And I verify "data-event" attribute is "site interaction" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 6" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "terms and conditions" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I click "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-with-images-RANDOM[0-8]-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

  @TestPublishOfferCardsWithImage-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Offer cards with image post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-with-images-p3.html"
    #Post publish checks
    And I wait for "firstOfferCardsComponent" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "secondOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "thirdOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "tagLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "offerBannerLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "locationLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "bookNowButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Book now button
    And I verify "data-event" attribute is "site interaction" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 5" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "book now" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "bookNowButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-with-images-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "discoverMoreButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Discover more button
    And I verify "data-event" attribute is "site interaction" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 6" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "discover more" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-with-images-p3.html"
    And I wait for "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "termsAndConditionLink" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Terms and Conditions
    And I verify "data-event" attribute is "site interaction" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card with image - variant 6" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "terms and conditions" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I click "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-with-images-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringOfferCardsWithoutImage-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add offer cards components without image and configure all the five variant without image, publish and view the page in AEM then delete and page
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
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-offer-cards-no-images-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-offer-cards-no-images-RANDOM[0-8]-p3.html"
    When I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
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
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure offer card components"
    #Search and add offer cards components
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "offer cards" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "offerCardsResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "offerCardsResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I click "firstOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "addButton" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Copy and paste offer cards component for two times
    When I click "firstOfferCardsComponent" on "aemTestOfferCardsPage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure second and thrid offer cards component and delete the cards as per our needs
    When I click "secondOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "thirdDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "layoutTab" on "aemOfferCardsComponentDialog" screen
    And I click "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I clear contents of "targetDivIdValue" element on "aemOfferCardsComponentDialog" screen
    And I enter "container_container_offercards2" details in "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "thirdOfferCardsComponent" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    And I click "thirdDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "secondDeleteIcon" on "aemOfferCardsComponentDialog" screen
    And I click "layoutTab" on "aemOfferCardsComponentDialog" screen
    And I click "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I clear contents of "targetDivIdValue" element on "aemOfferCardsComponentDialog" screen
    And I enter "container_container_offercards3" details in "targetDivIdValue" on "aemOfferCardsComponentDialog" screen
    And I click "doneButton" on "aemOfferCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardsComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component 1"
    #Configure first card in first offer cards component | Varient 1
    When I click "fstOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H2" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 1" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in First card of First offer cards component
    When I click "fstOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 2 of component 1"
    #Configure second card in first offer cards component | Varient 2
    When I click "fstOfferCardsSecondCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H3" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 2" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in second card of First offer cards component
    And I wait for "fstOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "fstOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 3 of component 1"
    #Configure third card in first offer cards component | Varient 3
    When I click "fstOfferCardsThirdCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H4" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 3" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "from" details in "priceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "Valued at" details in "valueAtTxtField" on "aemOfferCardDialog" screen
    And I enter "$162" details in "valueAtPriceField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in Third card of First offer cards component
    And I wait for "fstOfferCardsThirdCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "fstOfferCardsThirdCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component 2"
    #Configure first card in second offer cards component | Varient 4
    When I click "secOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H5" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 4" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I enter "Package price" details in "beforePriceTxtField" on "aemOfferCardDialog" screen
    And I enter "$180" details in "priceField" on "aemOfferCardDialog" screen
    And I enter "/per person" details in "afterPriceTxtField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in first card of Second offer cards component
    And I wait for "secOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "secOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 2 of component 2"
    #Configure second card in second offer cards component | Varient 5
    When I click "secOfferCardsSecondCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H6" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 5" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in second card of Second offer cards component
    And I wait for "secOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "secOfferCardsSecondCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure card 1 of component 3"
    #Configure first card in third offer cards component | Varient 6
    When I click "thirdOfferCardsFirstCard" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Configuration tab
    And I click "confirgurationsTab" on "aemOfferCardDialog" screen
    And I click "headingLevelDdn" on "aemOfferCardDialog" screen
    And I select "H6" value for "headingLevelDdnResults" drop down in "aemOfferCardDialog" screen using selection method "visibleText"
    And I enter "Offer card without image - Variant 6" details in "headingTxtField" on "aemOfferCardDialog" screen
    And I enter "Offer Banner Strip" details in "offerBannerStripField" on "aemOfferCardDialog" screen
    And I enter "Melbourne" details in "locTxtField" on "aemOfferCardDialog" screen
    And I enter "Limit summary content to under 95 characters. Alternative limit to no more than 2 short sentences." details in "descTxtField" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I click "addButton" on "aemOfferCardDialog" screen
    And I enter "RACV Member Benefit" details in "firstHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "BB" details in "secondHighlightTextField" on "aemOfferCardDialog" screen
    And I enter "4 Nights" details in "thirdHighlightTextField" on "aemOfferCardDialog" screen
    And I click "enablePrimaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I click "enableSecondaryBtnCheckBox" on "aemOfferCardDialog" screen
    And I enter "Terms and Conditions" details in "termsAndConTxtField" on "aemOfferCardDialog" screen
    And I enter "https://www.racv.com.au" details in "termsAndConLinkField" on "aemOfferCardDialog" screen
    And I click "doneButton" on "aemOfferCardDialog" screen
    And I wait for "doneButton" to disappear on "aemOfferCardDialog" screen or "5" seconds before proceeding
    #Configure primary button in first card of Third offer cards component
    And I wait for "thirdOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "thirdOfferCardsFirstCardPrimaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure secondary button in first card of Third offer cards component
    And I wait for "thirdOfferCardsFirstCardSecondaryBtn" on "aemTestOfferCardsPage" screen or "5" seconds before proceeding
    When I click "thirdOfferCardsFirstCardSecondaryBtn" on "aemTestOfferCardsPage" screen
    And I click "configureButton" on "aemTestOfferCardsPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Discover more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-no-images-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "firstOfferCardsComponent" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "secondOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "thirdOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "offerBannerLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "locationLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "bookNowButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Book now button
    And I verify "data-event" attribute is "site interaction" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 5" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "book now" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "bookNowButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-no-images-RANDOM[0-8]-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "discoverMoreButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Discover more button
    And I verify "data-event" attribute is "site interaction" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 6" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "discover more" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-no-images-RANDOM[0-8]-p3.html"
    And I wait for "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "termsAndConditionLink" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Terms and Conditions
    And I verify "data-event" attribute is "site interaction" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 6" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "terms and conditions" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I click "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/test-automation-offer-cards-no-images-RANDOM[0-8]-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

  @TestPublishOfferCardsWithoutImage-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Offer cards without image post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-no-images-p3.html"
    #Post publish checks
    And I wait for "firstOfferCardsComponent" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "secondOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "thirdOfferCardsComponent" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "offerBannerLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "locationLabelText" element exists on "aemTestOfferCardsPagePublished" screen
    And I verify "bookNowButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Book now button
    And I verify "data-event" attribute is "site interaction" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 5" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "book now" on "bookNowButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "bookNowButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-no-images-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "discoverMoreButton" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Discover more button
    And I verify "data-event" attribute is "site interaction" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 6" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "discover more" on "discoverMoreButton" element on "aemTestOfferCardsPagePublished" screen
    And I click "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-no-images-p3.html"
    And I wait for "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I verify "termsAndConditionLink" element exists on "aemTestOfferCardsPagePublished" screen
    #Verify analytics attributes on Terms and Conditions
    And I verify "data-event" attribute is "site interaction" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-location" attribute is "offer card | offer card without image - variant 6" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I verify "data-description" attribute is "terms and conditions" on "termsAndConditionLink" element on "aemTestOfferCardsPagePublished" screen
    And I click "termsAndConditionLink" on "aemTestOfferCardsPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "https://www.racv.com.au/"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-offer-cards-no-images-p3.html"
    And I wait for "discoverMoreButton" on "aemTestOfferCardsPagePublished" screen or "10" seconds before proceeding
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBOfferCards1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant one
    #Three Cards with Image, tag label, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=tagLabel:Tag%20Label;showOfferBannerStrip:false;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant two
    #Two Cards with Image,offer banner strip, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:;headingLevel:h3;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant three
    #Two Cards with Image, tag label, location, heading, description, package price,price, valued at, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:Tag%20Label;showOfferBannerStrip:false;headingLevel:h4;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant four
    #Two Cards with Image,offer banner strip, heading, description, package price,price, valued at, primary button, secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:;locationLabel:;headingLevel:h5;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0;priceText:;showtermsAndConditions:false&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant five
    #One Card with Image, tag label, offer banner strip, location, heading, description, highlights, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:1;tagLabel:Tag%20Label;headingLevel:h6;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:3;textFieldBeforePrice:;priceText:;priceField:;textFieldAfterPrice:;valuedAtTextLabel:;valuedAtPriceLabel:&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards6
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant six
    #Three Cards without Image, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false;tagLabel:Tag%20Label;showOfferBannerStrip:false;description:;highlights:3;priceText:&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards7
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant seven
    #Two Cards without Image,offer banner strip, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:;headingLevel:h3;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards8
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant eight
    #Two Cards without Image, location, heading, description, package price,price, valued at, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:Tag%20Label;showOfferBannerStrip:false;headingLevel:h4;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards9
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant nine
    #Two Cards without Image,offer banner strip, heading, description, package price,price, valued at, primary button, secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:;locationLabel:;headingLevel:h5;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0;priceText:;showtermsAndConditions:false&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards10
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify offer cards component in storybook - variant ten
    #One Card without Image, offer banner strip, location, heading, description, highlights, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:1;showImage:false;tagLabel:Tag%20Label;headingLevel:h6;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:3;textFieldBeforePrice:;priceText:;priceField:;textFieldAfterPrice:;valuedAtTextLabel:;valuedAtPriceLabel:&id=components-offer-card--offercard-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant one
    #Three Cards with Image, tag label, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=tagLabel:Tag%20Label;showOfferBannerStrip:false;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant two
    #Two Cards with Image,offer banner strip, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:;headingLevel:h3;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant three
    #Two Cards with Image, tag label, location, heading, description, package price,price, valued at, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:Tag%20Label;showOfferBannerStrip:false;headingLevel:h4;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant four
    #Two Cards with Image,offer banner strip, heading, description, package price,price, valued at, primary button, secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;tagLabel:;locationLabel:;headingLevel:h5;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0;priceText:;showtermsAndConditions:false&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant five
    #One Card with Image, tag label, offer banner strip, location, heading, description, highlights, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:1;tagLabel:Tag%20Label;headingLevel:h6;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:3;textFieldBeforePrice:;priceText:;priceField:;textFieldAfterPrice:;valuedAtTextLabel:;valuedAtPriceLabel:&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards6
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant six
    #Three Cards without Image, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false;tagLabel:Tag%20Label;showOfferBannerStrip:false;description:;highlights:3;priceText:&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards7
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant seven
    #Two Cards without Image,offer banner strip, location, heading, highlights, package price,price, valued at, primary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:;headingLevel:h3;description:;highlights:3;priceText:;showSecondaryButton:false&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards8
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant eight
    #Two Cards without Image, location, heading, description, package price,price, valued at, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:Tag%20Label;showOfferBannerStrip:false;headingLevel:h4;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards9
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant nine
    #Two Cards without Image,offer banner strip, heading, description, package price,price, valued at, primary button, secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:2;showImage:false;tagLabel:;locationLabel:;headingLevel:h5;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:0;priceText:;showtermsAndConditions:false&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBOfferCards10
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify offer cards component (club theme) in storybook - variant ten
    #One Card without Image, offer banner strip, location, heading, description, highlights, primary button,secondary button, Terms and conditions
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:1;showImage:false;tagLabel:Tag%20Label;headingLevel:h6;description:Limit%20summary%20content%20to%20under%2095%20characters%20alternative%20limit%20to%20no%20more%20than%20two%20short%20sentences;highlights:3;textFieldBeforePrice:;priceText:;priceField:;textFieldAfterPrice:;valuedAtTextLabel:;valuedAtPriceLabel:&id=components-offer-card--offercard-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"