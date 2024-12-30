#Author: Jing Zuo
Feature: This feature tests the Hero Banner in AEM authoring and storybook

  @TestAuthoringHeroBannerBasic-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author basic hero banner component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-hero-banner-basic-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-basic-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Basic Banner Type" details in "description" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "basic banner image" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Basic" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "basicBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Feature and promotion" value for "basicBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-basic-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionBasic" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on primaryButton
    And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on secondaryButton
    And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen

  @TestPublishHeroBannerBasic-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero Banner basic post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-basic-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionBasic" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on primaryButton
    And I verify "data-event" attribute is "site interaction" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryButton" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on secondaryButton
    And I verify "data-event" attribute is "site interaction" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryButton" element on "aemTestHeroBannerPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeroBannerCategory-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author category banner component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-hero-banner-category-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-category-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Category Banner Type" details in "description" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "category banner image" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Category" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "enableQuickLinks" on "aemHeroBannerComponentDialog" screen
    #Configure quick links
    When I verify "quickLinksHeading" element exists on "aemHeroBannerComponentDialog" screen
    And I enter "I am interested in" details in "quickLinksHeading" on "aemHeroBannerComponentDialog" screen
    #Quick link 1
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    Then I enter "/content/racv/en/home/on-the-road/insurance/car-insurance" details in "linkUrl1" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" if found on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel1" on "aemHeroBannerComponentDialog" screen
    And I enter "Car insurance testing" details in "linkLabel1" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon1" on "aemHeroBannerComponentDialog" screen
    And I select "Car" value for "linkIcon1List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 2
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road" details in "linkUrl2" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel2" on "aemHeroBannerComponentDialog" screen
    And I enter "On the road testing" details in "linkLabel2" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon2" on "aemHeroBannerComponentDialog" screen
    And I select "Accident" value for "linkIcon2List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 3
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "linkUrl3" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel3" on "aemHeroBannerComponentDialog" screen
    And I enter "RACV Resorts testing" details in "linkLabel3" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon3" on "aemHeroBannerComponentDialog" screen
    And I select "Balcony" value for "linkIcon3List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 4
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/membership" details in "linkUrl4" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel4" on "aemHeroBannerComponentDialog" screen
    And I enter "Membership testing" details in "linkLabel4" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon4" on "aemHeroBannerComponentDialog" screen
    And I select "Buildings" value for "linkIcon4List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 5
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/business-solutions" details in "linkUrl5" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel5" on "aemHeroBannerComponentDialog" screen
    And I enter "Business solutions testing" details in "linkLabel5" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon5" on "aemHeroBannerComponentDialog" screen
    And I select "Desk" value for "linkIcon5List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 6
    And I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences" details in "linkUrl6" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel6" on "aemHeroBannerComponentDialog" screen
    And I enter "Travel testing" details in "linkLabel6" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon6" on "aemHeroBannerComponentDialog" screen
    And I select "BBQ" value for "linkIcon6List" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Verify maximum 6 items are allowed
    When I click "addQuickLinks" on "aemHeroBannerComponentDialog" screen
    And I verify "warningMessage" element exists on "aemHeroBannerComponentDialog" screen
    And I click "closeWarning" on "aemHeroBannerComponentDialog" screen
    And I wait for "closeWarning" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    And I verify "warningMessage" element is not visible on "aemHeroBannerComponentDialog" screen
    #Delete the last newly addded item
    Then I click "deleteLastLink" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-category-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionCategory" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Quick Links
    And I verify "quickLinksHeading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link1" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link2" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link3" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link4" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link5" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link6" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on link1
    And I verify "data-event" attribute is "site interaction" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "car insurance testing" on "link1" element on "aemTestHeroBannerPagePublished" screen

  @TestPublishHeroBannerCategory-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero banner category post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-category-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionCategory" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Quick Links
    And I verify "quickLinksHeading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link1" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link2" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link3" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link4" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link5" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link6" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on link1
    And I verify "data-event" attribute is "site interaction" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "car insurance testing" on "link1" element on "aemTestHeroBannerPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeroBannerProduct-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author product, help & support banner component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-hero-banner-product-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-product-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Product Banner Type" details in "description" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "category banner image" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Product, Help & Support" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "productBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Support and help" value for "productBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "enableFixedSubhead" on "aemHeroBannerComponentDialog" screen
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure Fixed Subhead
    When I click "fixedSubheadInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    Then I click "enableFixedSubheadPrimaryButton" on "aemFixedSubheadComponentDialog" screen
    And I click "enableFixedSubheadSecondaryButton" on "aemFixedSubheadComponentDialog" screen
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 1
    And I enter "Fixed Subhead1" details in "fixedSubheadLinkLabel1" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte1" details in "fixedSubheadLinkUrl1" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 2
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I enter "Fixed Subhead2" details in "fixedSubheadLinkLabel2" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte2" details in "fixedSubheadLinkUrl2" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 3
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I enter "Fixed Subhead3" details in "fixedSubheadLinkLabel3" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte3" details in "fixedSubheadLinkUrl3" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 4
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I enter "Fixed Subhead4" details in "fixedSubheadLinkLabel4" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte4" details in "fixedSubheadLinkUrl4" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 5
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I enter "Fixed Subhead5" details in "fixedSubheadLinkLabel5" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte5" details in "fixedSubheadLinkUrl5" on "aemFixedSubheadComponentDialog" screen
    #Fixed Subhead 6
    And I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I enter "Fixed Subhead6" details in "fixedSubheadLinkLabel6" on "aemFixedSubheadComponentDialog" screen
    And I enter "#rte6" details in "fixedSubheadLinkUrl6" on "aemFixedSubheadComponentDialog" screen
    #Verify maximum 6 items are allowed
    When I click "addFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I verify "warningMessage" element exists on "aemFixedSubheadComponentDialog" screen
    And I click "closeWarning" on "aemFixedSubheadComponentDialog" screen
    And I wait for "closeWarning" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    And I verify "warningMessage" element is not visible on "aemFixedSubheadComponentDialog" screen
    #Delete the last newly addded item
    Then I click "deleteLastFixedSubhead" on "aemFixedSubheadComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFixedSubheadComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFixedSubheadComponentDialog" screen or "5" seconds before proceeding
    #Configure 1st button in Fixed Subhead
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "button1InFixedSubhead" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure 2nd button in Fixed Subhead
    When I click "button2InFixedSubhead" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Button 2" details in "textField" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Add content for fixed subhead
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    Then I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Text component into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    Then I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Copy and paste Text component multiple times
    When I click "text1InTree" on "aemTestHeroBannerPage" screen
    Then I click "copyButton" on "aemTestHeroBannerPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I wait for "text2InTree" on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I wait for "text3InTree" on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I wait for "text4InTree" on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I wait for "text5InTree" on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I wait for "text6InTree" on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I verify "text6InTree" element exists on "aemTestHeroBannerPage" screen
    And I take a screenshot
    #Edit 1st Text component
    When I click "text1InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I take a screenshot
    And I enter below details using Action class
      """
      Tab Links Title 1"

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 1st Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte1" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Edit 2nd Text component
    When I click "text2InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I take a screenshot
    And I enter below details using Action class
      """
      Tab Links Title 2"

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 2nd Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte2" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Edit 3rd Text component
    When I click "text3InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I take a screenshot
    And I enter below details using Action class
      """
      Tab Links Title 3

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 3rd Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte3" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Edit 4th Text component
    When I click "text4InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I enter below details using Action class
      """
      Tab Links Title 4

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 4th Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte4" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Edit 5th Text component
    When I click "text5InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I take a screenshot
    And I enter below details using Action class
      """
      Tab Links Title 5

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 5th Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte5" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Edit 6th Text component
    When I click "text6InTree" on "aemTestHeroBannerPage" screen
    And I click "editButton" on "aemTestHeroBannerPage" screen
    And I enter below details using Action class
      """
      Tab Links Title 6

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.

      If you are using Webpack or RequireJS without flickity.pkgd.js, you need to install and require flickity-as-nav-for separately.

      See details in Extras. asNavFor requires the flickity-as-nav-for package. It already is included with flickity.pkgd.js, but not with Flickity as a stand-alone package.
      """
    And I click "textSaveIcon" on "aemTestHeroBannerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHeroBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 6th Text component
    When I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    And I enter "rte6" details in "textId" on "aemTextComponentDialog" screen
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-product-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I verify page is accessibility compliant
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionProduct" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Fixed Subhead
    And I verify "button1InFixedSubhead" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "button2InFixedSubhead" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on button1InFixedSubhead
    And I verify "data-event" attribute is "site interaction" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "fixed subhead" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on button2InFixedSubhead
    And I verify "data-event" attribute is "site interaction" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "fixed subhead" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "button 2" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on tab2
    And I verify "data-event" attribute is "site interaction" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "fixed subhead2" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    #Click tab 2 and scroll to title 2
    And I click "tab2" on "aemTestHeroBannerPagePublished" screen
    And I wait for "title1" to disappear on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    #And I take a lambda snapshot "click tab2" "hide-emergency-banner, hide-gdpr"
    #Mobile view verficiation
    #Then I close the browser
    #Given I launch app page "URL/racv-home/utility/qa/test-automation-hero-banner-product-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "descriptionProduct" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Click tab 2 and scroll to title 2
    #And I click "tab2" on "aemTestHeroBannerPagePublished" screen
    #And I wait for "title1" to disappear on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot "click tab2" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "click tab2" "hide-emergency-banner, hide-gdpr" "enable-js"
    #And I close the browser

  @TestPublishHeroBannerProduct-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero banner product post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-product-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I verify page is accessibility compliant
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionProduct" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Fixed Subhead
    And I verify "button1InFixedSubhead" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "button2InFixedSubhead" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on button1InFixedSubhead
    And I verify "data-event" attribute is "site interaction" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "fixed subhead" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on button2InFixedSubhead
    And I verify "data-event" attribute is "site interaction" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "button" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "fixed subhead" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "button 2" on "button2InFixedSubhead" element on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on tab2
    And I verify "data-event" attribute is "site interaction" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "fixed subhead2" on "tab2" element on "aemTestHeroBannerPagePublished" screen
    #Click tab 2 and scroll to title 2
    And I click "tab2" on "aemTestHeroBannerPagePublished" screen
    And I wait for "title1" to disappear on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click tab2" "hide-emergency-banner, hide-gdpr"
    #Mobile view verficiation
    #Then I close the browser
    #Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-product-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "descriptionProduct" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Click tab 2 and scroll to title 2
    #And I click "tab2" on "aemTestHeroBannerPagePublished" screen
    #And I wait for "title1" to disappear on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "click tab2" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "click tab2" "hide-emergency-banner, hide-gdpr" "enable-js"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishHeroBannerProduct-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Hero banner product post publish checks on <theme> theme on android mobile
    #Mobile view verficiation
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-product-p3.html" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionProduct" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Click tab 2 and scroll to title 2
    And I click "tab2" on "aemTestHeroBannerPagePublished" screen
    And I wait for "title1" to disappear on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click tab2" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "click tab2" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeroBannerHomepage-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author homepage hero banner component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-hero-banner-homepage-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-homepage-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Homepage Banner Type" details in "description" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "homepage banner image" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Home Page" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Configure quick links
    #Quick link 1
    When I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    Then I enter "/content/racv/en/home/on-the-road/insurance/car-insurance" details in "linkUrl1Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" if found on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel1Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "Car insurance testing" details in "linkLabel1Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon1Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "Car" value for "linkIcon1ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Verify minimum of items is 6
    And I verify "minItemsErrorIcon" element is visible on "aemHeroBannerComponentDialog" screen
    And I hover on "minItemsErrorIcon" on "aemHeroBannerComponentDialog" screen using Action class
    And I verify "minItemsErrorMsg" element is visible on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    #Quick link 2
    And I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road" details in "linkUrl2Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel2Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "On the road testing" details in "linkLabel2Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon2Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "Accident" value for "linkIcon2ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 3
    And I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "linkUrl3Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel3Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "RACV Resorts testing" details in "linkLabel3Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon3Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "Balcony" value for "linkIcon3ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 4
    And I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/membership" details in "linkUrl4Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel4Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "Membership testing" details in "linkLabel4Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon4Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "Buildings" value for "linkIcon4ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 5
    And I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/business-solutions" details in "linkUrl5Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel5Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "Business solutions testing" details in "linkLabel5Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon5Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "Desk" value for "linkIcon5ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Quick link 6
    And I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences" details in "linkUrl6Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel6Homepage" on "aemHeroBannerComponentDialog" screen
    And I enter "Travel testing" details in "linkLabel6Homepage" on "aemHeroBannerComponentDialog" screen
    And I click "linkIcon6Homepage" on "aemHeroBannerComponentDialog" screen
    And I select "BBQ" value for "linkIcon6ListHomepage" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Verify maximum of items is 6
    When I click "addHomepageLinksButton" on "aemHeroBannerComponentDialog" screen
    And I click "linkLabel1Homepage" on "aemHeroBannerComponentDialog" screen
    And I verify "maxItemsErrorIcon" element is visible on "aemHeroBannerComponentDialog" screen
    And I hover on "maxItemsErrorIcon" on "aemHeroBannerComponentDialog" screen using Action class
    And I verify "maxItemsErrorMsg" element is visible on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    #Delete the last newly addded item
    Then I click "deleteLastLinkHomepage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-homepage-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionHomepage" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Quick Links
    And I verify "link1" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link2" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link3" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link4" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link5" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link6" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on link1
    And I verify "data-event" attribute is "site interaction" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "car insurance testing" on "link1" element on "aemTestHeroBannerPagePublished" screen

  @TestPublishHeroBannerHomePage-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero banner homepage post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-homepage-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "heading" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "descriptionHomepage" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "secondaryButton" element is visible on "aemTestHeroBannerPagePublished" screen
    #Check Quick Links
    And I verify "link1" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link2" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link3" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link4" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link5" element is visible on "aemTestHeroBannerPagePublished" screen
    And I verify "link6" element is visible on "aemTestHeroBannerPagePublished" screen
    #Verify analytics attributes on link1
    And I verify "data-event" attribute is "site interaction" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-type" attribute is "link" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-location" attribute is "hero banner quicklink" on "link1" element on "aemTestHeroBannerPagePublished" screen
    And I verify "data-description" attribute is "car insurance testing" on "link1" element on "aemTestHeroBannerPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeroBannerError401-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author error 401 hero banner component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-hero-banner-error-401-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-error-401-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner Error" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Error Banner Type - 401" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Error" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "errorType" on "aemHeroBannerComponentDialog" screen
    And I select "401" value for "errorTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-error-401-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "error401" element is visible on "aemTestHeroBannerPagePublished" screen

  @TestPublishHeroBannerError401-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero banner error 401 post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-error-401-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    And I verify page is accessibility compliant
    Then I verify "error401" element is visible on "aemTestHeroBannerPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeroBannerTnEWidget-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author hero banner t&e search widget component and verify published dispatcher component, accessibility and visually
    #Launch AEM
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
    And I enter "test-automation-hero-banner-t&e-search-widget-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-t-e-search-widget-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Travel & Experience Search Widget" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "Hero Banner - Travel & Experience Search Widget" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Limit summary content to under 100 characters" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "travel & experience search widget" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Button"
    #Configure first button
    When I refresh the page
    Then I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButtonInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButtonInTree" on "aemTestTnESearchWidgetPage" screen
    Then I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author T&E Search Widget"
    #Configure T&E Search Widget
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "teSearchWidgetInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "configurationsTab" on "aemTnESearchWidgetComponentDialog" screen
    #Tab1 - Things to do 1
    Then I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Things to do" value for "tabType1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Things to do" details in "tabTitle1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find attractions and activities" details in "tabSubHeading1" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabActive1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon1" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Balcony" value for "tabIcon1List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel1" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/things-to-do" details in "tabPagePath1" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    #Tab2 - Things to do 2
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Things to do" value for "tabType2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Things to do 2" details in "tabTitle2" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find attractions and activities 2" details in "tabSubHeading2" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon2" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Spa Bath" value for "tabIcon2List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel2" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab3 - Things to do 3
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Things to do" value for "tabType3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Things to do 3" details in "tabTitle3" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find attractions and activities 3" details in "tabSubHeading3" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon3" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hotel Building" value for "tabIcon3List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel3" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab4 - Holiday Packages 1
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Holiday Packages" value for "tabType4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Holiday Packages" details in "tabTitle4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Holiday Package" details in "tabSubHeading4" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon4" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hot Tub" value for "tabIcon4List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel4" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/holiday-and-packages" details in "tabPagePath4" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab5 - Tours 1
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Tours" value for "tabType5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Tours" details in "tabTitle5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Tour" details in "tabSubHeading5" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon5" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Suitcase" value for "tabIcon5List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel5" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/tours" details in "tabPagePath5" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab6 - Cruises
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruises" value for "tabType6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Cruises" details in "tabTitle6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Cruises" details in "tabSubHeading6" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon6" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Cruise Ship" value for "tabIcon6List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel6" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/cruises" details in "tabPagePath6" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab7 - Travel Insurance
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Travel Insurance" value for "tabType7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Travel Insurance" details in "tabTitle7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Travel Insurance" details in "tabSubHeading7" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon7" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Accident" value for "tabIcon7List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel7" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/travel-insurance" details in "tabPagePath7" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab8 - Holiday Packages 2
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType8" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Holiday Packages" value for "tabType8List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Holiday Packages 2" details in "tabTitle8" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Holiday Package 2" details in "tabSubHeading8" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon8" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Hot Tub" value for "tabIcon8List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel8" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/holiday-and-packages" details in "tabPagePath8" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    #Tab9 - Tours 2
    When I click "addButton" on "aemTnESearchWidgetComponentDialog" screen
    And I click "tabType9" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Tours" value for "tabType9List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Tours 2" details in "tabTitle9" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "Find a Tour 2" details in "tabSubHeading9" on "aemTnESearchWidgetComponentDialog" screen
    And I take a screenshot
    And I click "tabIcon9" on "aemTnESearchWidgetComponentDialog" screen
    And I select "Suitcase" value for "tabIcon9List" drop down in "aemTnESearchWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Search" details in "tabButtonLabel9" on "aemTnESearchWidgetComponentDialog" screen
    And I enter "/content/racv/lists/travel-and-experience-widget/tours" details in "tabPagePath9" on "aemTnESearchWidgetComponentDialog" screen
    Then I take a screenshot
    And I click "doneButton" on "aemTnESearchWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTnESearchWidgetComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-t-e-search-widget-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "teTab1" on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "teTab1" element exists on "aemTestHeroBannerPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #https://racvone.atlassian.net/browse/AP3-5295
    #And I verify page is accessibility compliant
    When I click "teTab1Dropdown" on "aemTestHeroBannerPagePublished" screen
    And I click "teTab1SecondOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    Then I click "teTab1Search" on "aemTestHeroBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://racv.clubconnect.com.au"
    And I take a screenshot
    And I navigate back to the previous page
    When I click "rightArrowBtn" if found on "aemTestHeroBannerPagePublished" screen
    And I wait for "moreBtn" on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I verify "moreBtn" element is visible on "aemTestHeroBannerPagePublished" screen
    And I click "moreBtn" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "more options" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "more options" "hide-emergency-banner, hide-gdpr" "enable-js"
    Then I click "teMoreMenuSecondOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I click "teMoreTab2Dropdown" on "aemTestHeroBannerPagePublished" screen
    And I click "teMoreTab2DropdownThirdOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I click "teMoreTab2Search" on "aemTestHeroBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://travel.racv.com.au/"
    And I take a screenshot

  @TestPublishHeroBanerTnEWidget-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero Banner Travel & Experience Search Widget post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-te-search-widget-p3.html"
    And I refresh the page
    #Post publish checks
    And I wait for "teTab1" on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "teTab1" element exists on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #https://racvone.atlassian.net/browse/AP3-5295
    #And I verify page is accessibility compliant
    When I click "teTab1Dropdown" on "aemTestHeroBannerPagePublished" screen
    And I click "teTab1SecondOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    Then I click "teTab1Search" on "aemTestHeroBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://racv.clubconnect.com.au"
    And I take a screenshot
    And I navigate back to the previous page
    When I click "rightArrowBtn" if found on "aemTestHeroBannerPagePublished" screen
    And I wait for "moreBtn" on "aemTestHeroBannerPagePublished" screen or "5" seconds before proceeding
    And I verify "moreBtn" element is visible on "aemTestHeroBannerPagePublished" screen
    And I click "moreBtn" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot "more options" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "more options" "hide-emergency-banner, hide-gdpr" "enable-js"
    Then I click "teMoreMenuSecondOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I click "teMoreTab2Dropdown" on "aemTestHeroBannerPagePublished" screen
    And I click "teMoreTab2DropdownThirdOption" on "aemTestHeroBannerPagePublished" screen
    And I take a screenshot
    And I click "teMoreTab2SearchButton" on "aemTestHeroBannerPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://travel.racv.com.au/"
    And I take a screenshot

    Examples:
      | theme |
      | base  |

  @TestAuthoringHeroBannerResortBooking-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author hero banner resort booking component and verify published dispatcher component, accessibility and visually
    #Launch AEM
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
    And I enter "test-automation-hero-banner-resorts-booking-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hero-banner-resorts-booking-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Resorts Booking" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "Hero Banner - Resort Booking" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Limit summary content to under 100 characters" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemHeroBannerComponentDialog" screen
    And I enter "resort booking" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Button"
    #Configure first button
    When I refresh the page
    Then I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButtonInTree" on "aemTestTnESearchWidgetPage" screen
    And I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButtonInTree" on "aemTestTnESearchWidgetPage" screen
    Then I click "configureButton" on "aemTestTnESearchWidgetPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Resort Booking Widget"
    #Open side panel
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Resort Booking Widget
    When I click "resortBookingWidgetInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    #Configurations tab
    And I click "configurationsTab" on "aemResortBookingWidgetComponentDialog" screen
    Then I enter "Search" details in "searchButtonLabel" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts/search" details in "searchButtonLink" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I verify "locationLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "locationDefaultValueLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesPlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "datesPromoCodeError" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "guestsLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "adultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "adultAgeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "maxAdultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "defaultAdultLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "childrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "childrenAgeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "maxChildrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "defaultChildrenLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberTypeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberTypePlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "tooltipText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "memberSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "autoClubSubLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Promotions tab
    And I click "promotionsTab" on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoCodeLabel" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalHeading" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalDescription" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalPlaceholderText" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "promoModalErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Overlay Settings tab
    And I click "overlayTab" on "aemResortBookingWidgetComponentDialog" screen
    And I click "clubMemberLogo" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACV Club Logo Gold" value for "clubMemberLogoList" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I verify "clubMemberDescription" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberForgotNumber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "clubMemberForgotNumberLink" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "disclaimber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "invalidDetailsErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I verify "servcieDownErrorMsg" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Auto Club Members" details in "autoClubHeading" on "aemResortBookingWidgetComponentDialog" screen
    And I verify "autoClubDisclaimber" field contains a value on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 1
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "NRMA Logo" value for "autoClubMemberIcon1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "NRMA Members" details in "autoClubMembershipLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 2
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACQ Logo" value for "autoClubMemberIcon2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACQ Members" details in "autoClubMembershipLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 3
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon3" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RAC Logo" value for "autoClubMemberIcon3List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RAC Members" details in "autoClubMembershipLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 4
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon4" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACT Logo" value for "autoClubMemberIcon4List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RACT Members" details in "autoClubMembershipLabel4" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel4" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 5
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon5" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RAA Logo" value for "autoClubMemberIcon5List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "RAA Members" details in "autoClubMembershipLabel5" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "Save up to 20%" details in "autoClubMembershipSubLabel5" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Add auto club member 6
    And I click "autoClubAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I click "autoClubMemberIcon6" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Balcony" value for "autoClubMemberIcon6List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I enter "Other Auto Club Members" details in "autoClubMembershipLabel6" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    #Resort List tab
    And I click "resortListTab" on "aemResortBookingWidgetComponentDialog" screen
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    #VIC resorts
    And I enter "VIC" details in "state1" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Victoria" details in "allResortsLabel1" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cape Schanck Resort" value for "resort1State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort2State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cobram Resort" value for "resort2State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort3State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Goldfields Resort" value for "resort3State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort4State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Torquay Resort" value for "resort4State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort5State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Inverloch Resort" value for "resort5State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort6State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Healesville Country Club & Resort" value for "resort6State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState1" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort7State1" on "aemResortBookingWidgetComponentDialog" screen
    And I select "RACV City Club" value for "resort7State1List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #QLD resorts
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "QLD" details in "state2" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Queensland" details in "allResortsLabel2" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState2" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Royal Pines Resort, Gold Coast" value for "resort1State2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "resortsAddButtonState2" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort2State2" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Noosa Resort" value for "resort2State2List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #TAS resorts
    And I click "statesAddButton" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "TAS" details in "state3" on "aemResortBookingWidgetComponentDialog" screen
    And I enter "All resorts in Tasmania" details in "allResortsLabel3" on "aemResortBookingWidgetComponentDialog" screen
    And I take a screenshot
    And I click "resortsAddButtonState3" on "aemResortBookingWidgetComponentDialog" screen
    And I click "resort1State3" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Hobart Hotel" value for "resort1State3List" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "enableDefaultResorts" on "aemResortBookingWidgetComponentDialog" screen
    And I click "defaultResort" on "aemResortBookingWidgetComponentDialog" screen
    And I select "Cape Schanck Resort" value for "defaultResortList" drop down in "aemResortBookingWidgetComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemResortBookingWidgetComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemResortBookingWidgetComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hero-banner-resorts-booking-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "location" on "aemTestResortBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I verify "location" element exists on "aemTestResortBookingWidgetPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5299
    #And I verify page is accessibility compliant
    And I take a screenshot
    When I click "location" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "allVicCheckbox" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "guests" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "childrenIncreaseButton" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I click "childrenIncreaseButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    And I verify "memberTypeEmptyErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "addPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "racvMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    Then I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Club Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr"
    Then I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I enter "123456" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "Test" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "memberInvalidErr" on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "memberInvalidErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "cancelButton" on "aemTestResortBookingWidgetPagePublished" screen
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    Then I enter "DATAMAP[clubMemberNumber]" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "clubMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Other Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "otherMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "auto club members snapshot" "hide-gdpr"
    Then I click "nrmaMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Guest
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "guest" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "addPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "add promo code snapshot" "hide-gdpr"
    Then I enter "1122334" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I clear contents of "promoCodeInput" element on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "RACVSTAFF" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitPromoCode" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "travel-experiences/resorts/search.html"

  @TestPublishHeroBanerResortBooking-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hero Banner Resort Booking post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hero-banner-resorts-booking-p3.html"
    And I refresh the page
    #Post publish checks
    And I wait for "location" on "aemTestResortBookingWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "location" element exists on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #defect - https://racvone.atlassian.net/browse/AP3-5299
    #And I verify page is accessibility compliant
    And I take a screenshot
    When I click "location" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "allVicCheckbox" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "dates" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "aemTestResortBookingWidgetPagePublished" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "applyButton" on "aemTestHotelBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "guests" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "childrenIncreaseButton" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I click "childrenIncreaseButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "empty error snapshot" "hide-gdpr"
    #Then I take a lambda snapshot with "<theme>" appended named "empty error snapshot" "hide-gdpr" "enable-js"
    And I verify "memberTypeEmptyErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "addPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "racvMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    Then I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #RACV Club Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "club validation modal snapshot" "hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "club validation modal snapshot" "hide-gdpr" "enable-js"
    Then I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I enter "123456" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "Test" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "memberInvalidErr" on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "memberInvalidErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "cancelButton" on "aemTestResortBookingWidgetPagePublished" screen
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "racvClubMember" on "aemTestResortBookingWidgetPagePublished" screen
    Then I enter "DATAMAP[clubMemberNumber]" details in "membershipMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "memberFamilyName" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "membershipNumberErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberFamilyNameErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "memberInvalidErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I verify "clubMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Other Member
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "otherMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "auto club members snapshot" "hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "auto club members snapshot" "hide-gdpr" "enable-js"
    Then I click "nrmaMember" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I click "closePromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    #Guest
    When I click "memberType" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "guest" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "addPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "add promo code snapshot" "hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "add promo code snapshot" "hide-gdpr" "enable-js"
    Then I enter "1122334" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is visible on "aemTestResortBookingWidgetPagePublished" screen
    And I clear contents of "promoCodeInput" element on "aemTestResortBookingWidgetPagePublished" screen
    And I enter "RACVSTAFF" details in "promoCodeInput" on "aemTestResortBookingWidgetPagePublished" screen
    And I click "submitPromoCode" on "aemTestResortBookingWidgetPagePublished" screen
    And I verify "promoCodeErr" element is not visible on "aemTestResortBookingWidgetPagePublished" screen
    And I wait for "submitPromoCode" to disappear on "aemTestResortBookingWidgetPagePublished" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I click "searchButton" on "aemTestResortBookingWidgetPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "travel-experiences/resorts/search.html"

    Examples:
      | theme |
      | base  |

  @TestSBBasicHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Digital Communication theme in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:dig-comm&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Digital Communication theme and primary button hidden in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showPrimaryButton:false;theme:dig-comm&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Feature and Promotion theme in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Feature and Promotion theme and secondary button hidden in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:false;theme:fea-prom&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Product and Brand theme in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner6
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Basic Hero Banner with Product and Brand theme and image hidden in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-hero-banner--basic-hero-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBCategoryHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Category Hero Banner in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--category-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBCategoryHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Category Hero Banner with quick links hidden in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showLinks:false&id=components-hero-banner--category-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBProductHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Product Hero Banner with Digital Communication theme and 2 fixed subhead tabs in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=fixedSubheadNumberOfTabs:2&id=components-hero-banner--product-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "tab2" on "storybookHeroBanner" screen
    And I take a screenshot
    Then I take a lambda snapshot "click tab2" "hide-gdpr"

  @TestSBProductHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Product Hero Banner with Support and Help theme, image hidden, and 6 fixed subhead tabs in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false;theme:supp-help&id=components-hero-banner--product-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBHomepageHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Homepage Hero Banner in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--homepage-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBHomepageHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Homepage Hero Banner with image hidden in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-hero-banner--homepage-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Error Hero Banner 401 in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--error-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Error Hero Banner 403 in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:403&id=components-hero-banner--error-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Error Hero Banner 404 in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:404&id=components-hero-banner--error-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Error Hero Banner 500 in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:500&id=components-hero-banner--error-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Error Hero Banner 503 in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:503&id=components-hero-banner--error-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBHeroBannerTnESearchWidget
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Hero Banner Travel & Experience Search Widget in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--travel-experience-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    When I verify "moreBtn" element is visible on "storybookHeroBannerTnESearchWidget" screen
    And I click "moreBtn" on "storybookHeroBannerTnESearchWidget" screen
    And I take a screenshot
    And I take a lambda snapshot "more options" "hide-gdpr"
    #And I take a lambda snapshot "more options" "hide-gdpr" "enable-js"
    Then I click "tab7" on "storybookHeroBannerTnESearchWidget" screen
    And I take a screenshot
    And I click "tab7Dropdown" on "storybookHeroBannerTnESearchWidget" screen
    And I click "tab7DropdownFirstOption" on "storybookHeroBannerTnESearchWidget" screen
    And I take a screenshot

  @TestSBHeroBannerResortBooking
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Hero Banner Resort Booking in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&globals=&id=components-hero-banner--resorts-booking-banner-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"
    When I click "dates" on "storybookHeroBannerResortBooking" screen
    #Select Sunday in the second row from the second month container of the calendar table as start date
    And I click "startDate" on "storybookHeroBannerResortBooking" screen
    #Select Saturday in the second row from the second month container of the calendar table as end date
    And I click "endDate" on "storybookHeroBannerResortBooking" screen
    And I click "applyButton" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I click "guests" on "storybookHeroBannerResortBooking" screen
    And I verify "childrenIncreaseButton" element is visible on "storybookHeroBannerResortBooking" screen
    And I click "childrenIncreaseButton" on "storybookHeroBannerResortBooking" screen
    And I click "searchButton" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    Then I take a lambda snapshot "empty error snapshot" "hide-gdpr"
    #Then I take a lambda snapshot "empty error snapshot" "hide-gdpr" "enable-js"
    And I verify "memberTypeEmptyErr" element is visible on "storybookHeroBannerResortBooking" screen
    And I verify "addPromoCode" element is visible on "storybookHeroBannerResortBooking" screen
    #RACV Member
    When I click "memberType" on "storybookHeroBannerResortBooking" screen
    And I click "racvMember" on "storybookHeroBannerResortBooking" screen
    And I verify "racvMemberForPromoCode" element is visible on "storybookHeroBannerResortBooking" screen
    Then I take a screenshot
    And I click "closePromoCode" on "storybookHeroBannerResortBooking" screen
    #RACV Club Member
    When I click "memberType" on "storybookHeroBannerResortBooking" screen
    And I click "racvClubMember" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr"
    #And I take a lambda snapshot "club validation modal snapshot" "hide-gdpr" "enable-js"
    Then I click "submitButton" on "storybookHeroBannerResortBooking" screen
    And I verify "membershipNumberErr" element is visible on "storybookHeroBannerResortBooking" screen
    And I verify "memberFamilyNameErr" element is visible on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I click "cancelButton" on "storybookHeroBannerResortBooking" screen
    #Other Member
    When I click "memberType" on "storybookHeroBannerResortBooking" screen
    And I click "otherMember" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I take a lambda snapshot "auto club members snapshot" "hide-gdpr"
    #And I take a lambda snapshot "auto club members snapshot" "hide-gdpr" "enable-js"
    Then I click "nrmaMember" on "storybookHeroBannerResortBooking" screen
    And I verify "nrmaMemberForPromoCode" element is visible on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I click "closePromoCode" on "storybookHeroBannerResortBooking" screen
    #Guest
    When I click "memberType" on "storybookHeroBannerResortBooking" screen
    And I click "guest" on "storybookHeroBannerResortBooking" screen
    And I click "addPromoCode" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot
    And I take a lambda snapshot "add promo code snapshot" "hide-gdpr"
    #And I take a lambda snapshot "add promo code snapshot" "hide-gdpr" "enable-js"
    Then I enter "1122334" details in "promoCodeInput" on "storybookHeroBannerResortBooking" screen
    And I click "submitPromoCode" on "storybookHeroBannerResortBooking" screen
    And I verify "promoCodeErr" element is visible on "storybookHeroBannerResortBooking" screen
    And I click "cancelPromoCode" on "storybookHeroBannerResortBooking" screen
    And I take a screenshot

  @TestSBBasicHeroBanner1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Digital Communication theme (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:dig-comm&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Digital Communication theme and primary button hidden (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showPrimaryButton:false;theme:dig-comm&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Feature and Promotion theme (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Feature and Promotion theme and secondary button hidden (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:false;theme:fea-prom&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Product and Brand theme (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBBasicHeroBanner6
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Basic Hero Banner with Product and Brand theme and image hidden (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-hero-banner--basic-hero-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBCategoryHeroBanner1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Category Hero Banner (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--category-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBCategoryHeroBanner2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Category Hero Banner with quick links hidden (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showLinks:false&id=components-hero-banner--category-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBProductHeroBanner1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Product Hero Banner with Digital Communication theme and 2 fixed subhead tabs (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=fixedSubheadNumberOfTabs:2&id=components-hero-banner--product-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "tab2" on "storybookHeroBanner" screen
    And I take a screenshot
    Then I take a lambda snapshot "click tab2" "hide-gdpr"

  @TestSBProductHeroBanner2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Product Hero Banner with Support and Help theme, image hidden, and 6 fixed subhead tabs (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false;theme:supp-help&id=components-hero-banner--product-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBHomepageHeroBanner1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Homepage Hero Banner (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--homepage-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBHomepageHeroBanner2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Homepage Hero Banner with image hidden (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-hero-banner--homepage-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Error Hero Banner 401 (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-hero-banner--error-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Error Hero Banner 403 (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:403&id=components-hero-banner--error-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Error Hero Banner 404 (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:404&id=components-hero-banner--error-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Error Hero Banner 500 (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:500&id=components-hero-banner--error-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"

  @TestSBErrorHeroBanner5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Error Hero Banner 503 (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=errorType:503&id=components-hero-banner--error-banner-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I take a lambda snapshot "main snapshot" "hide-gdpr" "enable-js"