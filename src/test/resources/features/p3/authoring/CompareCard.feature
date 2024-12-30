#Author: Jing Zuo
#Date: 25 Jan 2023
Feature: This feature tests the Compare Card in AEM authoring and storybook

  @TestAuthoringCompareCard-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author compare card component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-compare-card-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-compare-card-RANDOM[0-8]-p3.html"
    #Edit properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Compare Card" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    When I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    Then I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card component"
    #Add Compare Cards component into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Compare Cards" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "compareCardsResult" on "aemInsertNewComponent" screen
    And I wait for "compareCardsResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Compare Cards component
    When I click "compareCardsInTree" on "aemTestCompareCardsPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemCompareCardsComponentDialog" screen
    Then I click "deleteCard1" on "aemCompareCardsComponentDialog" screen
    And I verify "warningMsg" element exists on "aemCompareCardsComponentDialog" screen
    And I take a screenshot
    And I click "closeWarning" on "aemCompareCardsComponentDialog" screen
    And I click "cancelButton" on "aemCompareCardsComponentDialog" screen
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "compareCardsInTree" on "aemTestCompareCardsPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemCompareCardsComponentDialog" screen
    #Add Card
    Then I click "addCards" on "aemCompareCardsComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCompareCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCompareCardsComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 1st Compare Card
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 1"
    When I click "compareCard1" on "aemTestCompareCardsPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    Then I click "heading" on "aemCompareCardComponentDialog" screen
    And I clear contents of "heading" element on "aemCompareCardComponentDialog" screen
    And I enter "Compare card 1 product" details in "heading" on "aemCompareCardComponentDialog" screen
    And I click "productIcon" on "aemCompareCardComponentDialog" screen
    And I select "Car" value for "productIconList" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "merchandiseHat" on "aemCompareCardComponentDialog" screen
    And I enter "Most popular" details in "merchandiseHatLabel" on "aemCompareCardComponentDialog" screen
    #Price 2 Fields
    And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    And I enter "1 vehicle" details in "optionText" on "aemCompareCardComponentDialog" screen
    And I enter "From" details in "priceBefore" on "aemCompareCardComponentDialog" screen
    And I enter "$11.67" details in "priceField" on "aemCompareCardComponentDialog" screen
    And I enter "per monthly or $134 per yearly*" details in "priceAfter" on "aemCompareCardComponentDialog" screen
    And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    And I enter "2 vehicles" details in "optionText2" on "aemCompareCardComponentDialog" screen
    And I enter "From" details in "priceBefore2" on "aemCompareCardComponentDialog" screen
    And I enter "$19.00" details in "priceField2" on "aemCompareCardComponentDialog" screen
    And I enter "per month or $222 per year*" details in "priceAfter2" on "aemCompareCardComponentDialog" screen
    And I enter "Cover for collision damage to your car and unintentional collision damage to other peoples property including vehicles regardless of who is at fault" details in "description" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 1
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType1" on "aemCompareCardComponentDialog" screen
    Then I select "Plus" value for "primaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "No excess for windscreen, sunroof and window glass damage" details in "primaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I enter "Testing primary benefit 1" details in "primaryBenefitTooltip1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 2
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Tick" value for "primaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any licensed driver is covered" details in "primaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 3
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType3" on "aemCompareCardComponentDialog" screen
    Then I select "Tick" value for "primaryIconTypeList3" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Hire Car after a theft or attempted theft" details in "primaryBenefitDescription3" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    When I click "enableSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    Then I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    #Secondary benefit 1
    And I click "secondaryIconType1" on "aemCompareCardComponentDialog" screen
    And I select "Tick" value for "secondaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any repairer" details in "secondaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I enter "Testing secondary benefit 1" details in "secondaryBenefitTooltip1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Secondary benefit 2
    When I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "secondaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Tick" value for "secondaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Flexible excess payment" details in "secondaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I enter "Testing secondary benefit 2" details in "secondaryBenefitTooltip2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCompareCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCompareCardComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 2nd Compare Card
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 2"
    When I click "compareCard2" on "aemTestCompareCardsPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    Then I click "heading" on "aemCompareCardComponentDialog" screen
    And I clear contents of "heading" element on "aemCompareCardComponentDialog" screen
    And I enter "Compare card 2 product" details in "heading" on "aemCompareCardComponentDialog" screen
    And I click "productIcon" on "aemCompareCardComponentDialog" screen
    And I select "Car" value for "productIconList" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Price 1 Field
    And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    And I enter "1 vehicle" details in "optionText" on "aemCompareCardComponentDialog" screen
    And I enter "From" details in "priceBefore" on "aemCompareCardComponentDialog" screen
    And I enter "$11.67" details in "priceField" on "aemCompareCardComponentDialog" screen
    And I enter "per monthly or $134 per yearly*" details in "priceAfter" on "aemCompareCardComponentDialog" screen
    #And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    #And I enter "2 vehicles" details in "optionText2" on "aemCompareCardComponentDialog" screen
   	#And I enter "From" details in "priceBefore2" on "aemCompareCardComponentDialog" screen
    #And I enter "$19.00" details in "priceField2" on "aemCompareCardComponentDialog" screen
    #And I enter "per month or $222 per year*" details in "priceAfter2" on "aemCompareCardComponentDialog" screen
    And I enter "Cover for collision damage to your car and unintentional collision damage to other peoples property including vehicles regardless of who is at fault" details in "description" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 1
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType1" on "aemCompareCardComponentDialog" screen
    Then I select "Plus" value for "primaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "No excess for windscreen, sunroof and window glass damage" details in "primaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 2
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Tick" value for "primaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any licensed driver is covered" details in "primaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 3
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType3" on "aemCompareCardComponentDialog" screen
    Then I select "Cross" value for "primaryIconTypeList3" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Hire Car after a theft or attempted theft" details in "primaryBenefitDescription3" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    When I click "enableSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    Then I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    #Secondary benefit 1
    And I click "secondaryIconType1" on "aemCompareCardComponentDialog" screen
    And I select "Tick" value for "secondaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any repairer" details in "secondaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Secondary benefit 2
    When I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "secondaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Cross" value for "secondaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Flexible excess payment" details in "secondaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCompareCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCompareCardComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 3rd Compare Card
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 3"
    When I click "compareCard3" on "aemTestCompareCardsPage" screen
    And I click "configureButton" on "aemTestCompareCardsPage" screen
    Then I click "heading" on "aemCompareCardComponentDialog" screen
    And I clear contents of "heading" element on "aemCompareCardComponentDialog" screen
    And I enter "Compare card 3 product" details in "heading" on "aemCompareCardComponentDialog" screen
    And I click "productIcon" on "aemCompareCardComponentDialog" screen
    And I select "Car" value for "productIconList" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #No Price Field
    #And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    #And I enter "1 vehicle" details in "optionText" on "aemCompareCardComponentDialog" screen
    #And I enter "From" details in "priceBefore" on "aemCompareCardComponentDialog" screen
    #And I enter "$11.67" details in "priceField" on "aemCompareCardComponentDialog" screen
    #And I enter "per monthly or $134 per yearly*" details in "priceAfter" on "aemCompareCardComponentDialog" screen
    #And I click "addPriceButton" on "aemCompareCardComponentDialog" screen
    #And I enter "2 vehicles" details in "optionText2" on "aemCompareCardComponentDialog" screen
    #And I enter "From" details in "priceBefore2" on "aemCompareCardComponentDialog" screen
    #And I enter "$19.00" details in "priceField2" on "aemCompareCardComponentDialog" screen
    #And I enter "per month or $222 per year*" details in "priceAfter2" on "aemCompareCardComponentDialog" screen
    And I enter "Cover for collision damage to your car and unintentional collision damage to other peoples property including vehicles regardless of who is at fault" details in "description" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 1
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType1" on "aemCompareCardComponentDialog" screen
    Then I select "Plus" value for "primaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "No excess for windscreen, sunroof and window glass damage" details in "primaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 2
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Cross" value for "primaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any licensed driver is covered" details in "primaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Primary benefit 3
    When I click "addPrimaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "primaryIconType3" on "aemCompareCardComponentDialog" screen
    Then I select "Cross" value for "primaryIconTypeList3" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Hire Car after a theft or attempted theft" details in "primaryBenefitDescription3" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    When I click "enableSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    Then I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    #Secondary benefit 1
    And I click "secondaryIconType1" on "aemCompareCardComponentDialog" screen
    And I select "Cross" value for "secondaryIconTypeList1" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Any repairer" details in "secondaryBenefitDescription1" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    #Secondary benefit 2
    When I click "addSecondaryBenefits" on "aemCompareCardComponentDialog" screen
    And I click "secondaryIconType2" on "aemCompareCardComponentDialog" screen
    Then I select "Cross" value for "secondaryIconTypeList2" drop down in "aemCompareCardComponentDialog" screen using selection method "visibleText"
    And I enter "Flexible excess payment" details in "secondaryBenefitDescription2" on "aemCompareCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCompareCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCompareCardComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-compare-card-RANDOM[0-8]-p3.html"
    When I wait for "hat" on "aemTestCompareCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "hat" element exists on "aemTestCompareCardsPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    And I verify page is accessibility compliant
    And I take a screenshot
    And I verify "price" element exists on "aemTestCompareCardsPagePublished" screen
    And I verify "tooltip1" element exists on "aemTestCompareCardsPagePublished" screen
    #Verify analytics attributes on tooltip1
    And I verify "data-event" attribute is "site interaction" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-type" attribute is "tooltip" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-location" attribute is "compare card 1 product" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-description" attribute is "no excess for windscreen, sunroof and window glass damage" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "showAll" element exists on "aemTestCompareCardsPagePublished" screen
    #Verify analytics attributes on showAll
    And I verify "data-event" attribute is "site interaction" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-location" attribute is "compare card 1 product" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-description" attribute is "show all" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    When I click "showAll" on "aemTestCompareCardsPagePublished" screen
    And I verify "secondaryBenefit1" element exists on "aemTestCompareCardsPagePublished" screen
    And I verify "secondaryBenefit2" element exists on "aemTestCompareCardsPagePublished" screen
    Then I take a screenshot
    #And I take a lambda snapshot "show secondary benefits snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "show secondary benefits snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"

  @TestPublishCompareCard-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Compare card post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-compare-card-p3.html"
    When I wait for "hat" on "aemTestCompareCardsPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "hat" element exists on "aemTestCompareCardsPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    And I verify page is accessibility compliant
    And I take a screenshot
    And I verify "price" element exists on "aemTestCompareCardsPagePublished" screen
    And I verify "tooltip1" element exists on "aemTestCompareCardsPagePublished" screen
    #Verify analytics attributes on tooltip1
    And I verify "data-event" attribute is "site interaction" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-type" attribute is "tooltip" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-location" attribute is "compare card 1 product" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-description" attribute is "no excess for windscreen, sunroof and window glass damage" on "tooltip1" element on "aemTestCompareCardsPagePublished" screen
    And I verify "showAll" element exists on "aemTestCompareCardsPagePublished" screen
    #Verify analytics attributes on showAll
    And I verify "data-event" attribute is "site interaction" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-location" attribute is "compare card 1 product" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    And I verify "data-description" attribute is "show all" on "showAll" element on "aemTestCompareCardsPagePublished" screen
    When I click "showAll" on "aemTestCompareCardsPagePublished" screen
    And I verify "secondaryBenefit1" element exists on "aemTestCompareCardsPagePublished" screen
    And I verify "secondaryBenefit2" element exists on "aemTestCompareCardsPagePublished" screen
    Then I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "show secondary benefits snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "show secondary benefits snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBCompareCard1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify 3 Compare Cards showing CTA buttons and secondary benefits on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-compare-card--compare-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"

  #Clicking show all doesn't work in lambda at the moment
  #When I click "showAll" on "storybookCompareCards" screen
  #And I take a screenshot
  #Then I take a lambda snapshot "show secondary benefits" "hide-gdpr"
  #Then I take a lambda snapshot "show secondary benefits" "hide-gdpr" "enable-js"

  @TestSBCompareCard2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify 4 Compare Cards showing CTA buttons on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=cards:5;showSecBenefits:false&id=components-compare-card--compare-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"

  @TestSBCompareCard3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify 5 Compare Cards, select 2nd merchndise hat on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=cards:5;recommendedProd:2;showCTABtns:false;showSecBenefits:false&id=components-compare-card--compare-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"

  @TestSBCompareCard1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify 3 Compare Cards showing CTA buttons and secondary benefits (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-compare-card--compare-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"

  #Clicking show all doesn't work in lambda at the moment
  #When I click "showAll" on "storybookCompareCards" screen
  #And I take a screenshot
  #Then I take a lambda snapshot "show secondary benefits" "hide-gdpr"
  #Then I take a lambda snapshot "show secondary benefits" "hide-gdpr" "enable-js"

  @TestSBCompareCard2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify 4 Compare Cards showing CTA buttons (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=cards:5;showSecBenefits:false&id=components-compare-card--compare-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"

  @TestSBCompareCard3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify 5 Compare Cards, select 2nd merchndise hat (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=cards:5;recommendedProd:2;showCTABtns:false;showSecBenefits:false&id=components-compare-card--compare-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"
    #And I take a lambda snapshot "main" "hide-gdpr" "enable-js"