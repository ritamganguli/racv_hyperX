#Author: Sumanta Roy
#Date created - 23 June 2020
#SR 11 Aug 2020 AEMU-818 changes for AEM 6.5 upgrade
Feature: This feature tests the Banner component and it's variants from authoring regression perspective.

  #SR 23 June 2020 DAC-5200
  #Dry run completed on 29 June 2020
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestBannerComponentBlackVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Black variant, update configuration and verify published changes
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
    And I enter "test-automation-banner-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-1.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    #And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Black" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I clear contents of "heading" element on "aemBannerCompDialog" screen
    And I enter "Banner Black" details in "heading" on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab - NA for this variant
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I verify "headingLevelDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #Configure Banner RTE
    And I click "bannerRTE" on "aemBannerCompPage" screen
    And I click "editBannerRTE" on "aemBannerCompPage" screen
    And I switch "to" iFrame "bannerRTEditorFrame" on "aemBannerCompPage" screen
    And I enter "This is Black banner variant description" details in "bannerRTEditor" on "aemBannerCompPage" screen
    And I switch "from" iFrame "bannerRTEditor" on "aemBannerCompPage" screen
    And I click "bannerRTEditorSaveButton" on "aemBannerCompPage" screen
    And I take a screenshot
    #Configure CTA
    And I click "ctaOnBanner" on "aemBannerCompPage" screen
    And I click "configureCtaButton" on "aemBannerCompPage" screen
    And I enter "/content/racv/en/home" details in "linkPath" on "aemButtonLinkConfigDialog" screen
    And I enter "Click here" details in "linkText" on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-banner-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "blackBannerTitle" on "aemBannerCompPage1Published" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I click "blackBannerTitle" on "aemBannerCompPage1Published" screen
    Then I verify css attribute "color" is "rgba(69, 72, 73, 1)" for "blackBanner" on "aemBannerCompPage1Published"
    And I verify "blackBannerTitle" element exists on "aemBannerCompPage1Published" screen
    And I verify "blackBannerDescription" element exists on "aemBannerCompPage1Published" screen
    And I verify "blackBannerCTA" element exists on "aemBannerCompPage1Published" screen
    And I verify "blackBannerCTA" copy text on "aemBannerCompPage1Published" screen
    And I click "blackBannerCTA" on "aemBannerCompPage1Published" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 29 June 2020 DAC-5202
  #Dry run completed on 29 June 2020
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestBannerComponentImageVariant
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Image variant, update configuration and verify published changes
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
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-2.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Image" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I clear contents of "heading" element on "aemBannerCompDialog" screen
    And I enter "Banner Image" details in "heading" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/legacy/resorts-gift-card-1600x600.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/legacy/pinp-penguins-600x400.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/legacy/pinp-penguins-600x400.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Image Banner" details in "altText" on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab - NA for this variant
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I verify "headingLevelDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #Configure CTA
    And I click "ctaOnImageBanner" on "aemBannerCompPage" screen
    And I click "configureCtaButton" on "aemBannerCompPage" screen
    And I enter "/content/racv/en/home" details in "linkPath" on "aemButtonLinkConfigDialog" screen
    And I enter "Click here" details in "linkText" on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I refresh the page
    And I click "imageBanner" on "aemBannerCompPage2Published" screen
    #verify image object
    Then I verify "imageObject" element exists on "aemBannerCompPage2Published" screen
    #verify title
    And I verify "imageBannerTitle" element exists on "aemBannerCompPage2Published" screen
    #verify CTA
    And I verify "imageBannerCTA" element exists on "aemBannerCompPage2Published" screen
    And I verify "imageBannerCTA" copy text on "aemBannerCompPage2Published" screen
    And I click "imageBannerCTA" on "aemBannerCompPage2Published" screen
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 29 June 2020 DAC-5201
  #Dry run completed on 30 Jun 2020
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestBannerComponentFeatureDefaultVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Feature Default variant, update configuration and verify published changes
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
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-3.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Feature" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Feature Default" details in "heading" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Feature Banner Default" details in "altText" on "aemBannerCompDialog" screen
    #link config
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "Feature Banner CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I enter "View More" details in "ctaId" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab - Go with default pre-selected
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Heading Level tab
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I verify "headingLevelDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #Configure Description on banner
    And I click "bannerRTE" on "aemBannerCompPage" screen
    And I click "editBannerRTE" on "aemBannerCompPage" screen
    And I switch "to" iFrame "bannerRTEditorFrame" on "aemBannerCompPage" screen
    And I enter "This is Default feature banner variant description" details in "featureBannerRTEditor" on "aemBannerCompPage" screen
    And I switch "from" iFrame "featureBannerRTEditor" on "aemBannerCompPage" screen
    And I click "bannerRTEditorSaveButton" on "aemBannerCompPage" screen
    And I wait for "bannerRTEditorSaveButton" to disappear on "aemBannerCompPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-3.html"
    And I dismiss GDPR notification if it exists
    And I wait for "imageObject" on "aemBannerCompPage3Published" screen or "10" seconds before proceeding
    #Post publish checks
    And I verify "defaultFeatureBanner" element exists on "aemBannerCompPage3Published" screen
    #verify image object
    Then I verify "imageObject" element exists on "aemBannerCompPage3Published" screen
    #verify title
    And I verify "bannerTitle" element exists on "aemBannerCompPage3Published" screen
    #verify description
    And I verify "bannerDescription" element exists on "aemBannerCompPage3Published" screen
    #verify CTA
    And I verify "bannerCTA" element exists on "aemBannerCompPage3Published" screen
    And I verify "bannerCTA" copy text on "aemBannerCompPage3Published" screen
    And I click "bannerCTA" on "aemBannerCompPage3Published" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 1 July 2020 DAC-5622
  #Dry run completed on 1 Jul 2020
  #SR 12 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestBannerComponentFeatureWhiteVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Feature White variant, update configuration and verify published changes
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
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-4.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Feature" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Feature White" details in "heading" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Feature Banner White" details in "altText" on "aemBannerCompDialog" screen
    #link config
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "Feature White CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I enter "View More" details in "ctaId" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "20px - Base" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "20px - Base" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Select White in Theme tab
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I select "White" value for "themeDropDown" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Check default in Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I verify "headingLevelDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #Configure Description on banner
    #And I click "bannerRTE" on "aemBannerCompPage" screen
    And I click "bannerRTE" on "aemBannerCompPage" screen
    And I click "editBannerRTE" on "aemBannerCompPage" screen
    And I switch "to" iFrame "bannerRTEditorFrame" on "aemBannerCompPage" screen
    And I enter "This is White feature banner variant description" details in "featureBannerRTEditor" on "aemBannerCompPage" screen
    And I switch "from" iFrame "featureBannerRTEditor" on "aemBannerCompPage" screen
    And I click "bannerRTEditorSaveButton" on "aemBannerCompPage" screen
    And I wait for "bannerRTEditorSaveButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-4.html"
    And I dismiss GDPR notification if it exists
    And I wait for "imageObject" on "aemBannerCompPage4Published" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I click "whiteFeatureBanner" on "aemBannerCompPage4Published" screen
    #verify image object
    Then I verify "imageObject" element exists on "aemBannerCompPage4Published" screen
    #verify title
    And I verify "bannerTitle" element exists on "aemBannerCompPage4Published" screen
    #verify description
    And I verify "bannerDescription" element exists on "aemBannerCompPage4Published" screen
    #verify CTA
    And I verify "bannerCTA" element exists on "aemBannerCompPage4Published" screen
    And I verify "bannerCTA" copy text on "aemBannerCompPage4Published" screen
    And I click "bannerCTA" on "aemBannerCompPage4Published" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 2 July 2020 DAC-5205
  #Dry run completed on 2 july 2020
  #SR 12 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestBannerComponentTitleDefaultVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Title default variant, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-5" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-5.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Title" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I select "Left" value for "textAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Title Default" details in "heading" on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "20px - Base" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "20px - Base" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Select h3 in Heading Level tab
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I select "h3" value for "headingLevelDropDown" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-5.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I click "defaultTitleBanner" on "aemBannerCompPage5Published" screen
    #verify title and header level
    Then I verify "bannerTitle" element exists on "aemBannerCompPage5Published" screen
    #verify text is left aligned
    And I verify css attribute "text-align" is "left" for "bannerTitle" on "aemBannerCompPage5Published"
    #verify background color
    And I verify css attribute "background-color" is "rgba(31, 90, 165, 1)" for "bannerArticle" on "aemBannerCompPage5Published"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent5PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 22 December 2020 DAC-6864
  #Dry run completed on 22 December 2020
  @TestBannerComponent5050Variant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to 50-50 variant, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-6" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-6.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "50 - 50" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Heading Default" details in "heading" on "aemBannerCompDialog" screen
    #image config
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Feature 50-50" details in "altText" on "aemBannerCompDialog" screen
    And I take a screenshot
    #link config
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "5050 Banner CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    #discount config
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I enter "View More" details in "ctaId" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "20px - Base" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "20px - Base" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Select Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Banner RTE
    And I wait for "bannerRTE" on "aemBannerCompPage" screen or "10" seconds before proceeding
    And I click "bannerRTE" on "aemBannerCompPage" screen
    And I click "editBannerRTE" on "aemBannerCompPage" screen
    And I switch "to" iFrame "bannerRTEditorFrame" on "aemBannerCompPage" screen
    And I enter "This is 50-50 banner variant description" details in "bannerRTEditor" on "aemBannerCompPage" screen
    And I switch "from" iFrame "bannerRTEditor" on "aemBannerCompPage" screen
    And I click "bannerRTEditorSaveButton" on "aemBannerCompPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-6.html"
    And I dismiss GDPR notification if it exists
    Then I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I click "defaultTitleBanner" on "aemBannerCompPage6Published" screen
    #verify title
    Then I verify "bannerTitle" element exists on "aemBannerCompPage6Published" screen
    #verify text is left aligned
    And I verify css attribute "text-align" is "left" for "bannerTitle" on "aemBannerCompPage6Published"
    #verify background color
    And I verify css attribute "background-color" is "rgba(31, 90, 165, 1)" for "bannerArticle" on "aemBannerCompPage6Published"
    #verify picture
    And I verify "imageElement" element exists on "aemBannerCompPage6Published" screen
    #verify text
    And I verify "5050Description" element exists on "aemBannerCompPage6Published" screen
    And I verify "bannerCTA" element exists on "aemBannerCompPage6Published" screen
    And I verify "bannerCTA" copy text on "aemBannerCompPage6Published" screen
    #verify cta
    And I verify "bannerCTA" element exists on "aemBannerCompPage6Published" screen
    And I take a screenshot
    And I click "bannerCTA" on "aemBannerCompPage6Published" screen
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent6PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 22 December 2020 DAC-6864
  #Dry run completed on 22 December 2020
  #SR 8Jul21 DAC-8906 - Updated test with description field and font color checks
  @TestBannerComponentThinVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page using Standard template, add a Banner component, update to Thin variant, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-7" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-7.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Thin" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Heading Default" details in "heading" on "aemBannerCompDialog" screen
    And I enter "We are thrilled to be working with CEP.Energy to deliver this project" details in "description" on "aemBannerCompDialog" screen
    And I take a screenshot
    #image config
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Feature Thin" details in "altText" on "aemBannerCompDialog" screen
    And I take a screenshot
    #link config
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "Thin Banner CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    #discount config
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I enter "View More" details in "ctaId" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "20px - Base" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "20px - Base" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Select Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "5" seconds before proceeding
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-7.html"
    And I dismiss GDPR notification if it exists
    And I wait for "bannerImage" on "aemBannerCompPage7Published" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I click "defaultTitleBanner" on "aemBannerCompPage7Published" screen
    Then I verify "bannerTitle" element exists on "aemBannerCompPage7Published" screen
    And I verify css attribute "color" is "rgba(255, 255, 255, 1)" for "bannerTitle" on "aemBannerCompPage7Published"
    And I verify "bannerDescription" element exists on "aemBannerCompPage7Published" screen
    And I verify css attribute "color" is "rgba(255, 255, 255, 1)" for "bannerDescription" on "aemBannerCompPage7Published"
    #verify image
    And I verify "bannerImage" element exists on "aemBannerCompPage7Published" screen
    And I take a screenshot
    #verify cta
    And I verify "bannerCTA" element exists on "aemBannerCompPage7Published" screen
    And I take a screenshot
    And I click "bannerCTA" on "aemBannerCompPage7Published" screen
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent7PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 22 December 2020 DAC-6864
  #Dry run completed on 22 December 2020
  @TestBannerComponentImageLinkVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, add a Banner component, update to Image Link variant, update configuration and verify published changes
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
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-banner-component-8" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-8.html"
    #Add banner component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Image Link" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Mazda-MX5-On-Great-Ocean-Road-At-Sunset-RACV-Membership1600x380px.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Image Banner" details in "altText" on "aemBannerCompDialog" screen
    And I take a screenshot
    #configure link
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "Feature Banner CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure subcategory
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab - NA for this variant
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I verify "headingLevelDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-8.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #verify image object
    Then I verify "bannerImage" element exists on "aemBannerCompPage8Published" screen
    #verify banner link
    And I click "bannerImage" on "aemBannerCompPage8Published" screen
    And I check page address is "URL/"
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent8PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 08 July 2021 DAC-8906
  #Dry run completed on - 9 Jul 21
  #SR 1 Oct 21 DAC-9408 - Updated locator for parsys post popular topics changes
  @TestBannerComponentThinVariantContentHub
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page using Content hub Category template, add a Banner component, update to Thin variant, update configuration and verify published changes
    #launch AEM
    Given I launch app page "AEM/"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-banner-component-9" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-banner-component-9.html"
    #Add banner component
    And I click "addComponentsParsysContentHubCategory" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Banner component
    And I enter "banner" details in "searchInputField" on "aemInsertCompDialog" screen
    And I click "bannerOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Change variant
    And I click "bannerComponent" on "aemBannerCompPage" screen
    And I click "configureBannerButton" on "aemBannerCompPage" screen
    And I select "Thin" value for "selectView" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter " Heading Default" details in "heading" on "aemBannerCompDialog" screen
    And I enter "We are thrilled to be working with CEP.Energy to deliver this project" details in "description" on "aemBannerCompDialog" screen
    And I take a screenshot
    #image config
    And I enter "/content/dam/racv/images/_generic_marketing/banners/Fimage6.jpg" details in "desktopImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "tabImagePath" on "aemBannerCompDialog" screen
    And I enter "/content/dam/racv/images/_generic_marketing/banners/cta-banner-bg.jpg" details in "mobileImagePath" on "aemBannerCompDialog" screen
    And I enter "Feature Thin" details in "altText" on "aemBannerCompDialog" screen
    And I take a screenshot
    #link config
    And I enter "/content/racv/en/home" details in "linkPath" on "aemBannerCompDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I enter "Thin Banner CTA" details in "ctaAltText" on "aemBannerCompDialog" screen
    And I verify "analyticsURL" element exists on "aemBannerCompDialog" screen
    And I click "subCategoryButton" on "aemBannerCompDialog" screen
    And I take a screenshot
    #discount config
    And I click "discountCategoryOption" on "aemBannerCompDialog" screen
    And I click "automotiveCategoryOption" on "aemBannerCompDialog" screen
    And I click "subCategoryConfirmButton" on "aemBannerCompDialog" screen
    #verify sub-category is added
    And I verify "subCategoryList" element exists on "aemBannerCompDialog" screen
    And I enter "View More" details in "ctaId" on "aemBannerCompDialog" screen
    And I take a screenshot
    #Configure Layout tab
    And I click "layoutTab" on "aemBannerCompDialog" screen
    And I verify "targetDivField" element exists on "aemBannerCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemBannerCompDialog" screen
    And I select "20px - Base" value for "topSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    And I select "20px - Base" value for "bottomSpacingDesktop" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Update desktop image layout and check defaults in Image layout config tab
    And I click "imageLayoutTab" on "aemBannerCompDialog" screen
    And I verify "desktopBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I click "desktopBannerCheckBox" on "aemBannerCompDialog" screen
    And I select "Left" value for "desktopHorzAlignment" drop down in "aemBannerCompDialog" screen using selection method "visibleText"
    And I verify "desktopVerticalAlignment" element exists on "aemBannerCompDialog" screen
    And I verify "mobileBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "tabletBannerCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Adaptive Show/Hide tab
    And I click "adaptShowHideTab" on "aemBannerCompDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnTabletCheckBox" element exists on "aemBannerCompDialog" screen
    And I verify "hideOnMobileCheckBox" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Check defaults in Theme tab
    And I click "themesTab" on "aemBannerCompDialog" screen
    And I verify "themeDropDown" element exists on "aemBannerCompDialog" screen
    And I take a screenshot
    #Select Heading Level tab - NA for this variant
    And I click "headingLevelTab" on "aemBannerCompDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemBannerCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemBannerCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-banner-component-9.html"
    And I dismiss GDPR notification if it exists
    And I wait for "bannerImage" on "aemBannerCompPage7Published" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    #aemBannerCompPage7Published's objects has been re-used
    And I click "defaultTitleBanner" on "aemBannerCompPage7Published" screen
    #verify title and description
    Then I verify "bannerTitle" element exists on "aemBannerCompPage7Published" screen
    And I verify css attribute "color" is "rgba(255, 255, 255, 1)" for "bannerTitle" on "aemBannerCompPage7Published"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "bannerTitle" on "aemBannerCompPage7Published"
    And I verify css attribute "font-style" is "normal" for "bannerTitle" on "aemBannerCompPage7Published"
    And I verify css attribute "font-size" is "28px" for "bannerTitle" on "aemBannerCompPage7Published"
    And I verify css attribute "font-weight" is "700" for "bannerTitle" on "aemBannerCompPage7Published"
    #description
    And I verify "bannerDescription" element exists on "aemBannerCompPage7Published" screen
    And I verify css attribute "color" is "rgba(255, 255, 255, 1)" for "bannerDescription" on "aemBannerCompPage7Published"
    And I verify css attribute "font-family" is "proxima-nova, sans-serif" for "bannerDescription" on "aemBannerCompPage7Published"
    And I verify css attribute "font-size" is "16px" for "bannerDescription" on "aemBannerCompPage7Published"
    And I verify css attribute "font-weight" is "400" for "bannerDescription" on "aemBannerCompPage7Published"
    #verify image
    And I verify "bannerImage" element exists on "aemBannerCompPage7Published" screen
    And I take a screenshot
    #verify cta
    And I verify "bannerCTA" element exists on "aemBannerCompPage7Published" screen
    And I take a screenshot
    And I click "bannerCTA" on "aemBannerCompPage7Published" screen
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestBannerComponent9PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot