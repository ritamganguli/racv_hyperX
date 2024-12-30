#Author: Jing Zuo
Feature: This feature tests the button themes

  @TestAuthoringButtonThemes-p3
  #TODO: Need to rework these tests as we can no longer have multiple hero banners on the page
  #@AuthoringSanity-p3.chrome.desktop
  #@AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Hero Banner and Banner component to verify button themes
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
    And I enter "test-automation-button-themes-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-button-themes-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Hero 1 config"
    #Configure 1st Hero Banner and select Digital Communication theme
    When I click "firstHeroBanner" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I click "enableSecondaryButton" on "aemHeroBannerComponentDialog" screen
    And I enter "Hero Banner" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Basic Banner Type, Digital Communication Theme" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Basic" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "basicBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Digital communication" value for "basicBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure first button
    When I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "firstButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Configure second button
    When I click "secondButton" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I clear contents of "textField" element on "aemButtonComponentDialog" screen
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
    #Copy and paste Hero Banner component multiple times
    ###############
    ## NODE
    ###############
    And I create a new test log node "Copy paste"
    And I take a screenshot
    And I click "firstHeroBanner" on "aemTestHeroBannerPage" screen
    Then I click "copyButton" on "aemTestHeroBannerPage" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "secondHeroBanner" on "aemTestHeroBannerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "thirdHeroBanner" on "aemTestHeroBannerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "fourthHeroBanner" on "aemTestHeroBannerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Hero 2 config"
    #Configure 2nd Hero Banner and select Feature and Promotion theme
    When I click "secondHeroBanner" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I clear contents of "description" element on "aemHeroBannerComponentDialog" screen
    And I enter "Basic Banner Type, Feature and Promotion Theme" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Basic" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "basicBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Feature and promotion" value for "basicBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure 3rd Hero Banner and select Product and Brand theme
    ###############
    ## NODE
    ###############
    And I create a new test log node "Hero 3 config"
    When I click "thirdHeroBanner" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I clear contents of "description" element on "aemHeroBannerComponentDialog" screen
    And I enter "Basic Banner Type, Product and Brand Theme" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Basic" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "basicBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Product and brand" value for "basicBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Hero Banner and select Support and Help theme
    ###############
    ## NODE
    ###############
    And I create a new test log node "Hero 4 config"
    When I click "fourthHeroBanner" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    Then I clear contents of "description" element on "aemHeroBannerComponentDialog" screen
    And I enter "Product, Help & Support Banner Type, Product and Brand Theme" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Product, Help & Support" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I click "productBannerThemes" on "aemHeroBannerComponentDialog" screen
    And I select "Support and help" value for "productBannerThemesList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
    #Add Banner component into Container
    And I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component and select Product Action Theme
    #Configurations tab
    ###############
    ## NODE
    ###############
    And I create a new test log node "Banner config"
    When I click "bannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Banner" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "Product Action Theme" details in "description" on "aemBannerComponentDialog" screen
    And I enter "Get a quote" details in "buttonLabel" on "aemBannerComponentDialog" screen
    And I enter "https://www.google.com" details in "buttonLink" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Product action" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-button-themes-RANDOM[0-8]-p3.html"
    And I wait for "primaryCtaInTheme1" on "aemTestButtonThemePagePublished" screen or "10" seconds before proceeding
    And I verify "primaryCtaInTheme1" element exists on "aemTestButtonThemePagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"

  @TestSBButtonTheme1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button theme Digital Communication on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-button-theme--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button theme Product and Brand on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-brand&id=atom-button-theme--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button theme Feature and Promotion on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=atom-button-theme--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button theme Product Action on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=atom-button-theme--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button theme Support and Help on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help&id=atom-button-theme--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button theme Digital Communication (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-button-theme--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button theme Product and Brand (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-brand&id=atom-button-theme--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button theme Feature and Promotion (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:fea-prom&id=atom-button-theme--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button theme Product Action (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:prod-act&id=atom-button-theme--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButtonTheme5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button theme Support and Help (club theme) on Storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:supp-help&id=atom-button-theme--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"