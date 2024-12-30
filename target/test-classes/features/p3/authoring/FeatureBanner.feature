#Author: Dheebanraj M
Feature: This feature tests the Feature Banner type of Banner component in AEM authoring and storybook

  @TestAuthoringFeatureBanner-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author feature banner types and its variants and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-feature-banner-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Add 1st Banner component into root container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Feature banner Product Action"
    #Configure Banner component, select Feature as Banner type and Product action Theme
    #Configurations tab
    When I click "firstBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    And I click "bannerType" on "aemBannerComponentDialog" screen
    And I select "Feature" value for "bannerTypeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I click "bannerThemeFeature" on "aemBannerComponentDialog" screen
    And I select "Product action" value for "bannerThemeFeatureList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    Then I enter "Title 1 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "1 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image1" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I click "primaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I click "secondaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I click "journeyDeviceCheckBox" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure primary and secondary button
    And I wait for "firstPrimaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "firstPrimaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now1" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure secondary button
    And I wait for "firstSecondaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "firstSecondaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Discover more1" details in "textField" on "aemButtonComponentDialog" screen
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
    And I create a new test log node "Feature banner Feature and promotion"
    #Add 2nd Banner component into root Container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component, select Feature as Banner type and Feature and promotion Theme
    #Configurations tab
    When I click "secondBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    And I click "bannerType" on "aemBannerComponentDialog" screen
    And I select "Feature" value for "bannerTypeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I click "bannerThemeFeature" on "aemBannerComponentDialog" screen
    And I select "Feature and promotion" value for "bannerThemeFeatureList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    Then I enter "Title 2 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "2 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image2" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I click "primaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I click "secondaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I click "journeyDeviceCheckBox" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure primary and secondary button
    And I wait for "secondPrimaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "secondPrimaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now2" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure secondary button
    And I wait for "secondSecondaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "secondSecondaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Discover more2" details in "textField" on "aemButtonComponentDialog" screen
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
    And I create a new test log node "Feature banner Product Action without secondary button or journey device"
    #Add 3rd Banner component into root container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component, select Feature as Banner type and Product action Theme without secondary button and journey device
    #Configurations tab
    When I click "thirdBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    And I click "bannerType" on "aemBannerComponentDialog" screen
    And I select "Feature" value for "bannerTypeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I click "bannerThemeFeature" on "aemBannerComponentDialog" screen
    And I select "Product action" value for "bannerThemeFeatureList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    Then I enter "Title 3 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "3 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image3" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I click "primaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure primary and secondary button
    And I wait for "thirdPrimaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "thirdPrimaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now3" details in "textField" on "aemButtonComponentDialog" screen
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
    And I create a new test log node "Feature banner promotion theme without secondary button and journey device"
    #Add 4nd Banner component into root Container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component, select Feature as Banner type and Feature and promotion Theme without secondary button and journey device
    #Configurations tab
    When I click "fouthBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    And I click "bannerType" on "aemBannerComponentDialog" screen
    And I select "Feature" value for "bannerTypeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I click "bannerThemeFeature" on "aemBannerComponentDialog" screen
    And I select "Feature and promotion" value for "bannerThemeFeatureList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    Then I enter "Title 4 are short succinct and focussed on providing value" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "4 Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct" details in "description" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemBannerComponentDialog" screen
    And I enter "banner image4" details in "altTextImage" on "aemBannerComponentDialog" screen
    And I click "primaryBtnCheckBox" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure primary and secondary button
    And I wait for "fourthPrimaryButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    When I click "fourthPrimaryButton" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Book now4" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Primary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
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
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "heading1" on "aemTestBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I verify "heading1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "SecondaryButton1" element is visible on "aemTestBannerPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on primaryButton1
    And I verify "data-event" attribute is "site interaction" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 1 are short succinct and focussed on providing value" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now1" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on SecondaryButton1
    And I verify "data-event" attribute is "site interaction" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 1 are short succinct and focussed on providing value" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "discover more1" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    And I click "SecondaryButton1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "SecondaryButton2" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton2
    And I verify "data-event" attribute is "site interaction" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 2 are short succinct and focussed on providing value" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now2" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on SecondaryButton2
    And I verify "data-event" attribute is "site interaction" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 2 are short succinct and focussed on providing value" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "discover more2" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    And I click "SecondaryButton2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton3" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton3
    And I verify "data-event" attribute is "site interaction" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 3 are short succinct and focussed on providing value" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now3" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton3" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/test-automation-feature-banner-RANDOM[0-8]-p3.html"
    Then I verify "heading4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton4" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton4
    And I verify "data-event" attribute is "site interaction" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 4 are short succinct and focussed on providing value" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now4" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton4" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"

  @TestPublishFeatureBanner-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Feature banner post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "heading1" on "aemTestBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I verify "heading1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton1" element is visible on "aemTestBannerPagePublished" screen
    And I verify "SecondaryButton1" element is visible on "aemTestBannerPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on primaryButton1
    And I verify "data-event" attribute is "site interaction" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 1 are short succinct and focussed on providing value" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now1" on "primaryButton1" element on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on SecondaryButton1
    And I verify "data-event" attribute is "site interaction" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 1 are short succinct and focussed on providing value" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "discover more1" on "SecondaryButton1" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    And I click "SecondaryButton1" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    Then I verify "heading2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton2" element is visible on "aemTestBannerPagePublished" screen
    And I verify "SecondaryButton2" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton2
    And I verify "data-event" attribute is "site interaction" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 2 are short succinct and focussed on providing value" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now2" on "primaryButton2" element on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on SecondaryButton2
    And I verify "data-event" attribute is "site interaction" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 2 are short succinct and focussed on providing value" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "discover more2" on "SecondaryButton2" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    And I click "SecondaryButton2" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    Then I verify "heading3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image3" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton3" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton3
    And I verify "data-event" attribute is "site interaction" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 3 are short succinct and focussed on providing value" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now3" on "primaryButton3" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton3" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feature-banner-p3.html"
    Then I verify "heading4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "description4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "image4" element is visible on "aemTestBannerPagePublished" screen
    And I verify "primaryButton4" element is visible on "aemTestBannerPagePublished" screen
    #Verify analytics attributes on primaryButton4
    And I verify "data-event" attribute is "site interaction" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-location" attribute is "feature banner | title 4 are short succinct and focussed on providing value" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I verify "data-description" attribute is "book now4" on "primaryButton4" element on "aemTestBannerPagePublished" screen
    And I click "primaryButton4" on "aemTestBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://www.racv.com.au"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBFeatureBannerFeatureAndPromotion1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner on storybook with secondary button, description and journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner on storybook with secondary button, journey device and without description
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showDescription:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner on storybook with description, journey device and without secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner on storybook with description, secondary button and without journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showJourneyDevice:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action theme of feature banner on storybook with secondary button, description and journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action theme of feature banner on storybook with secondary button, journey device and without description
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showDescription:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action theme of feature banner on storybook with description, journey device and without secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showSecondaryButton:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify product action theme of feature banner on storybook with description, secondary button and without journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showJourneyDevice:false&id=components-banner--feature-banner-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner (club theme) on storybook with secondary button, description and journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner (club theme) on storybook with secondary button, journey device and without description
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showDescription:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner (club theme) on storybook with description, journey device and without secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerFeatureAndPromotion4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify feature and promotion theme of feature banner (club theme) on storybook with description, secondary button and without journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showJourneyDevice:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action theme of feature banner (club theme) on storybook with secondary button, description and journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action theme of feature banner (club theme) on storybook with secondary button, journey device and without description
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showDescription:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action theme of feature banner (club theme) on storybook with description, journey device and without secondary button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showSecondaryButton:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBFeatureBannerProductAction4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify product action theme of feature banner (club theme) on storybook with description, secondary button and without journey device
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act;showJourneyDevice:false&id=components-banner--feature-banner-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"