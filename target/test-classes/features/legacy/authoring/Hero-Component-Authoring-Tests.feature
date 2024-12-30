#Author: Sumanta Roy
#Date created - 28 May 2020
#SR 11 Aug 2020 AEMU-818 changes for AEM 6.5 upgrade
Feature: This feature tests the Hero component and it's variants from authoring regression perspective.

  #SR 29 May 2020 DAC-5175
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestHeroComponentBackgroundColorVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, change Hero component to background color variant, update configuration and verify published changes
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
    And I enter "test-automation-hero-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-hero-component-1.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "Hero Banner With Background Color" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    And I enter "Test-Title" details in "heroBannerTitle" on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideTitleCheckBox" element exists on "aemHeroBannerDialog" screen
    And I enter "Test-SubTitle" details in "heroBannerSubTitle" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "heroBannerSwitchSubTitleCheckBox" on "aemHeroBannerDialog" screen
    And I enter "Test-Description" details in "heroBannerDescription" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I verify "heroBannerEnableFirstCTACheckBox" element exists on "aemHeroBannerDialog" screen
    And I click "heroBannerEnableSecondCTACheckBox" on "aemHeroBannerDialog" screen
    And I click "heroBannerTextLeftAlignCheckBox" on "aemHeroBannerDialog" screen
    And I click "heroBannerDisplayContactCheckBox" on "aemHeroBannerDialog" screen
    And I enter "0400000000" details in "heroBannerDisplayContactInfo" on "aemHeroBannerDialog" screen
    And I click "heroBannerDisplayContactLeftCheckBox" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on configuration tab
    And I verify "heroBannerDisplayOverlappedHtmlCheckBox" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerDisplayOverlappedImageCheckBox" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerOverlapImagePath" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerOverlapImageAltText" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerSearchRedirectCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on properties tab
    And I click "heroBannerPropertiesTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerNextCompOverlapping" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerAddExtraClass" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideBreadCrumbCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save changes
    And I click "heroBannerSaveChangesCheck" on "aemHeroBannerDialog" screen
    And I wait for "heroBannerSaveChangesCheck" to disappear on "aemHeroBannerDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-hero-component-1.html"
    And I dismiss GDPR notification if it exists
    And I wait for "leftAlignedText" on "testHeroComponent1Published" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations
    #Verify text on hero banner are left aligned
    Then I verify "leftAlignedText" element exists on "testHeroComponent1Published" screen
    #Verify copy text and subtitle appears before title
    And I verify "subTitleBeforeTitle" element exists on "testHeroComponent1Published" screen
    And I verify "subTitleBeforeTitle" copy text on "testHeroComponent1Published" screen
    #Verify copy text and title appears after sub-title
    And I verify "titleAfterSubtitle" element exists on "testHeroComponent1Published" screen
    And I verify "titleAfterSubtitle" copy text on "testHeroComponent1Published" screen
    #Verify copy text on Description
    And I verify "description" element exists on "testHeroComponent1Published" screen
    #Verify contact details element exists and is left aligned
    And I verify "contactDetails" element exists on "testHeroComponent1Published" screen
    #Verify CTA button 1
    And I verify "ctaButton1" element exists on "testHeroComponent1Published" screen
    #Verify CTA button 2
    And I verify "ctaButton2" element exists on "testHeroComponent1Published" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestHeroComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 4 Jun 2020 DAC-5176
  #NOTE - Subtitle config is there but it's NA as per auth guide
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestHeroComponentImageBackgroundVariant
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, change Hero component to image background variant, update configuration and verify published changes
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
    And I enter "test-automation-hero-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-hero-component-2.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "Hero Banner With Image Background" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    And I select "Image(600px)-Font(48px-24px)" value for "heroImageFontSize" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    And I enter "/content/dam/racv/images/legacy/gift-card-cta-banner-1300x300.jpg" details in "desktopImagePath" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/images/legacy/repco-fathers-day-600x400.jpg" details in "altTabImagePath" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/images/legacy/repco-fathers-day-600x400.jpg" details in "altMobileImagePath" on "aemHeroBannerDialog" screen
    And I enter "hero banner image" details in "imageAltText" on "aemHeroBannerDialog" screen
    And I enter "Test-Title" details in "heroBannerTitle" on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideTitleCheckBox" element exists on "aemHeroBannerDialog" screen
    And I click "leftAlignTitleCheckBox" on "aemHeroBannerDialog" screen
    And I enter "Test-SubTitle" details in "heroBannerSubTitle" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "heroBannerSwitchSubTitleCheckBox" on "aemHeroBannerDialog" screen
    And I enter "Test-Description" details in "heroBannerDescription" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I verify "heroBannerEnableFirstCTACheckBox" element exists on "aemHeroBannerDialog" screen
    And I click "heroBannerEnableSecondCTACheckBox" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on configuration tab
    And I verify "heroBannerDisplayOverlappedHtmlCheckBox" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerDisplayOverlappedImageCheckBox" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerOverlapImagePath" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerOverlapImageAltText" element exists on "aemHeroBannerDialog" screen
    #Set a quick link
    And I click "displayQuickLinkCheckBox" on "aemHeroBannerDialog" screen
    And I click "displayQuickLinkListCheckBox" on "aemHeroBannerDialog" screen
    And I verify "quickLinkListHeading" element exists on "aemHeroBannerDialog" screen
    And I click "addButtonCheckList" on "aemHeroBannerDialog" screen
    And I enter "Book a resort" details in "quickLinkListTitle" on "aemHeroBannerDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "quickLinkListDestination" on "aemHeroBannerDialog" screen
    And I verify "heroBannerSearchRedirectCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on properties tab
    And I click "heroBannerPropertiesTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerNextCompOverlapping" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideBreadCrumbCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save changes
    And I click "heroBannerSaveChangesCheck" on "aemHeroBannerDialog" screen
    And I wait for "heroBannerSaveChangesCheck" to disappear on "aemHeroBannerDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I click "publishOptionSecondary" if found on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify dispatcher
    And I navigate to "URL/utility/test-automation-hero-component-2.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I refresh the page
    #Post publishing validations
    #verify image object
    And I verify "imageObject" element exists on "testHeroComponent2Published" screen
    #verify title copy text and font size is 48 px
    Then I verify css attribute "font-size" is "48px" for "title" on "testHeroComponent2Published"
    #Verify title on hero banner is left aligned
    And I verify css attribute "text-align" is "left" for "title" on "testHeroComponent2Published"
    #Verify copy text on Description and is left aligned
    And I verify "description" element exists on "testHeroComponent2Published" screen
    And I verify css attribute "text-align" is "left" for "description" on "testHeroComponent2Published"
    #Verify CTA button 1
    And I verify "ctaButton1" element exists on "testHeroComponent2Published" screen
    #Verify CTA button 2
    And I verify "ctaButton2" element exists on "testHeroComponent2Published" screen
    #verify quick link is displayed
    And I verify "quickLinkWidget" element exists on "testHeroComponent2Published" screen
    #verify Book a resort link on quick links
    And I click "bookAResortQuickLink" on "testHeroComponent2Published" screen
    And I check the page address contains "/travel-experiences/resorts.html"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestHeroComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 10 Jun 2020 - DAC-5174
  #SR 11 Aug 2020 AEMU-818 changes for v6.5, dry run completed on Sandbox
  @TestHeroComponentImageBackgroundTileVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, change Hero component to image background with tile variant, update configuration and verify published changes
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
    And I enter "test-automation-hero-component-3" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-hero-component-3.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "Hero Banner With Image Background And Tile" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    And I enter "/content/dam/racv/images/legacy/RACV-MB-Website-hero-banner-1600x600-v3.jpg" details in "desktopImagePath" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/images/legacy/Emmylou-Past-Hero.jpg" details in "altTabImagePath" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/images/legacy/Emmylou-Past-Hero.jpg" details in "altMobileImagePath" on "aemHeroBannerDialog" screen
    And I enter "hero banner image" details in "imageAltText" on "aemHeroBannerDialog" screen
    And I enter "Test-Title" details in "heroBannerTitle" on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideTitleCheckBox" element exists on "aemHeroBannerDialog" screen
    And I enter "Test-SubTitle" details in "heroBannerSubTitle" on "aemHeroBannerDialog" screen
    And I click "heroBannerSwitchSubTitleCheckBox" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I enter "Test-Description" details in "heroBannerDescription" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I verify "heroBannerEnableFirstCTACheckBox" element exists on "aemHeroBannerDialog" screen
    And I click "heroBannerEnableSecondCTACheckBox" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on properties tab
    And I click "heroBannerPropertiesTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerNextCompOverlapping" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideBreadCrumbCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save changes
    And I click "heroBannerSaveChangesCheck" on "aemHeroBannerDialog" screen
    And I wait for "heroBannerSaveChangesCheck" to disappear on "aemHeroBannerDialog" screen or "5" seconds before proceeding
    #Configure Tile component, basic only
    And I click "heroBannerTileComponent" on "aemTestHeroComponentPage" screen using JavaScript
    And I click "heroBannerEditTileButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I select "Link Tile" value for "tileLayout" drop down in "aemTileDialog" screen using selection method "visibleText"
    And I enter "Test-Tile-Title" details in "tileTitle" on "aemTileDialog" screen
    And I take a screenshot
    And I click "saveChangesButton" on "aemTestHeroComponentPage" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I click "publishOptionSecondary" if found on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-hero-component-3.html"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    #Post publishing validations
    #verify image object
    And I verify "imageObject" element exists on "testHeroComponent3Published" screen
    #Verify title text
    And I verify "title" element exists on "testHeroComponent3Published" screen
    #verify sub-title is after title
    And I verify "subtitleAfterTitle" element exists on "testHeroComponent3Published" screen
    #Verify subtitle text
    And I verify "subtitle" element exists on "testHeroComponent3Published" screen
    #Verify copy text on Description
    And I verify "description" element exists on "testHeroComponent3Published" screen
    #Verify CTA button 1
    And I verify "ctaButton1" element exists on "testHeroComponent3Published" screen
    #Verify CTA button 2
    And I verify "ctaButton2" element exists on "testHeroComponent3Published" screen
    #verify Tile is displayed
    And I verify "tile" element exists on "testHeroComponent3Published" screen
    #verify tile title
    And I verify "tileTitle" element exists on "testHeroComponent3Published" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestHeroComponent3PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 20 Aug 2020, AEMU-842
  #Dry run completed on 21 Aug 20 on sandbpx
  @TestHeroComponentFunnelSearchVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create new page, change Hero component to Funnel Search variant, update configuration and verify published changes
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
    And I enter "test-automation-hero-component-4" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-hero-component-4.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "Hero Banner With Funnel Search" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    #Increment number field thrice - Initial Search Items to load
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    #Decrement number field once - Initial Search Items to load
    And I click "searchItemsLoadDecrementButton" on "aemHeroBannerDialog" screen
    #Verify field is set to 2
    And I verify "searchItemsLoadCurrentValue" element exists on "aemHeroBannerDialog" screen
    #Increment number field thrice - Initial Quick links and Suggested search to load
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    #Decrement number field once - Initial Quick links and Suggested search to load
    And I click "quickLinksDecrementButton" on "aemHeroBannerDialog" screen
    #Verify field is set to 2
    And I verify "quickLinksCurrentValue" element exists on "aemHeroBannerDialog" screen
    And I enter "Search" details in "searchButtonLabel" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "showBreadcrumbCheckbox" on "aemHeroBannerDialog" screen
    And I click "showCatgoryCheckbox" on "aemHeroBannerDialog" screen
    And I click "showImagesCheckbox" on "aemHeroBannerDialog" screen
    And I enter "Search RACV" details in "helpText" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I enter "Sort By: " details in "sortByLabel" on "aemHeroBannerDialog" screen
    And I enter "Relevance" details in "relevanceFilterLabel" on "aemHeroBannerDialog" screen
    And I enter "Date" details in "dateFilterLabel" on "aemHeroBannerDialog" screen
    And I enter "Load more results" details in "loadMoreLabel" on "aemHeroBannerDialog" screen
    And I enter "Searches related to" details in "titleRelatedSearch" on "aemHeroBannerDialog" screen
    And I enter "Sorry your search did not return any results" details in "noResultsText" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on properties tab
    And I click "heroBannerPropertiesTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerNextCompOverlapping" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerAddExtraClass" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerHideBreadCrumbCheckBox" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save changes
    And I click "heroBannerSaveChangesCheck" on "aemHeroBannerDialog" screen
    And I wait for "heroBannerSaveChangesCheck" to disappear on "aemHeroBannerDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-hero-component-4.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations
    #Verify default search text and search box
    Then I verify "searchTextBox" element exists on "testHeroComponent4Published" screen
    And I verify "searchButton" element exists on "testHeroComponent4Published" screen
    And I verify "noSearchResultsText" element exists on "testHeroComponent4Published" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestHeroComponent4PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 30 Apr 2021 DAC-6876
  #Dry run completed in QA 30 Apr 2021
  @TestClubHeroComponentVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create club new page, configure the banner component and verify published changes
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/travel-leisure/racv-club/footer"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    And I click "createPageOption" on "aemLandingPage" screen
    #select club page template
    And I click "clubbasePageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-club-hero-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-hero-component-1.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "Default View" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    And I enter "/content/dam/racv/racv-club/city-club/image/club-reception-hero-new.jpg" details in "clubHeroBannerImage" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/racv-club/city-club/image/cc-stayheader-banner.jpg" details in "altTabImagePath" on "aemHeroBannerDialog" screen
    And I enter "/content/dam/racv/racv-club/city-club/image/cc-stayheader-banner.jpg" details in "altMobileImagePath" on "aemHeroBannerDialog" screen
    And I enter "hero banner image" details in "imageAltText" on "aemHeroBannerDialog" screen
    And I enter "Test-Title" details in "clubHeroBannerTitle" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "leftAlignTitleCheckBox" on "aemHeroBannerDialog" screen
    And I enter "Test-Description" details in "heroBannerDescription" on "aemHeroBannerDialog" screen
    #Button doesnt seem to be used
    #And I click "clubHeroBannerEnableCTA" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "clubDisplayQuickLinkCheckBox" on "aemHeroBannerDialog" screen
    And I clear contents of "quickLinkListHeading" element on "aemHeroBannerDialog" screen
    And I enter "I want to test..." details in "quickLinkListHeading" on "aemHeroBannerDialog" screen
    And I click "addButtonCheckList" on "aemHeroBannerDialog" screen
    And I enter "Quick Link Test Title" details in "quickLinkListTitle" on "aemHeroBannerDialog" screen
    And I enter "Quick Link Test SubTitle" details in "quickLinkSubTitle" on "aemHeroBannerDialog" screen
    And I enter "/content/racv/en/home/travel-leisure/racv-club/whats-on" details in "quickLinkListDestination" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save Changes
    And I click "saveChangesButton" on "aemTilesCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemTilesCompDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-hero-component-1.html"
    And I capture the address navigated to
    And I take a screenshot
    And I verify "title" element exists on "testClubHeroComponentPublished" screen
    And I verify "description" element exists on "testClubHeroComponentPublished" screen
    And I verify "quickLinksTitle" element exists on "testClubHeroComponentPublished" screen
    And I verify "quickLinksLink" element exists on "testClubHeroComponentPublished" screen
    #Verify text
    And I verify "title" copy text on "testClubHeroComponentPublished" screen
    And I verify "description" copy text on "testClubHeroComponentPublished" screen
    And I verify "quickLinksTitle" copy text on "testClubHeroComponentPublished" screen
    And I verify "quickLinksLink" copy text on "testClubHeroComponentPublished" screen
    #verify quick link function
    And I click "quickLinksLink" on "testClubHeroComponentPublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-leisure/racv-club/whats-on.html"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestClubHeroComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #VT 30 Apr 2021 DAC-6876
  #Dry run completed in QA 30 Apr 2021
  @TestClubHeroComponentFunnelSearchVariant
  @AuthoringRegression1.chrome.desktop
  Scenario: Verify user is able to create club new page, configure the banner component funnel search variant and verify published changes
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/travel-leisure/racv-club/footer"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "clubbasePageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-club-hero-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/travel-leisure/racv-club/footer/test-automation-club-hero-component-2.html"
    #Edit hero banner
    And I click "heroBannerOverlay" on "aemTestHeroComponentPage" screen
    And I click "heroBannerEditButton" on "aemTestHeroComponentPage" screen using JavaScript
    And I take a screenshot
    #Select variant
    And I select "FunnelBack Search View" value for "heroBannerViewType" drop down in "aemHeroBannerDialog" screen using selection method "visibleText"
    #Increment number field thrice - Initial Search Items to load
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    And I click "searchItemsLoadIncrementButton" on "aemHeroBannerDialog" screen
    #Decrement number field once - Initial Search Items to load
    And I click "searchItemsLoadDecrementButton" on "aemHeroBannerDialog" screen
    #Verify field is set to 12
    And I verify "clubSearchItemsLoadCurrentValue" element exists on "aemHeroBannerDialog" screen
    #Increment number field thrice - Initial Quick links and Suggested search to load
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    And I click "quickLinksIncrementButton" on "aemHeroBannerDialog" screen
    #Decrement number field once - Initial Quick links and Suggested search to load
    And I click "quickLinksDecrementButton" on "aemHeroBannerDialog" screen
    #Verify field is set to 2
    And I verify "quickLinksCurrentValue" element exists on "aemHeroBannerDialog" screen
    And I clear contents of "searchButtonLabel" element on "aemHeroBannerDialog" screen
    And I enter "Search!" details in "searchButtonLabel" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I click "showBreadcrumbCheckbox" on "aemHeroBannerDialog" screen
    And I click "showCatgoryCheckbox" on "aemHeroBannerDialog" screen
    And I click "showImagesCheckbox" on "aemHeroBannerDialog" screen
    And I clear contents of "helpText" element on "aemHeroBannerDialog" screen
    And I enter "Search RACV!" details in "helpText" on "aemHeroBannerDialog" screen
    And I take a screenshot
    And I clear contents of "sortByLabel" element on "aemHeroBannerDialog" screen
    And I enter "Sort By!: " details in "sortByLabel" on "aemHeroBannerDialog" screen
    And I clear contents of "relevanceFilterLabel" element on "aemHeroBannerDialog" screen
    And I enter "Relevance!" details in "relevanceFilterLabel" on "aemHeroBannerDialog" screen
    And I clear contents of "dateFilterLabel" element on "aemHeroBannerDialog" screen
    And I enter "Date!" details in "dateFilterLabel" on "aemHeroBannerDialog" screen
    And I clear contents of "loadMoreLabel" element on "aemHeroBannerDialog" screen
    And I enter "Load more results!" details in "loadMoreLabel" on "aemHeroBannerDialog" screen
    And I clear contents of "titleRelatedSearch" element on "aemHeroBannerDialog" screen
    And I enter "Searches related to!" details in "titleRelatedSearch" on "aemHeroBannerDialog" screen
    #And I clear contents of "noResultsText" element on "aemHeroBannerDialog" screen
    And I enter "keys:ENTER" details in "noResultsText" on "aemHeroBannerDialog" screen
    And I enter "Sorry your search did not return any results!" details in "noResultsText" on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on layout tab
    And I click "heroBannerLayoutTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerTargetDivId" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Verify default options are available on Image layout configuration tab
    And I click "heroBannerImageLayoutConfigTab" on "aemHeroBannerDialog" screen
    And I verify "heroBannerDesktopImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerMobileImageConfig" element exists on "aemHeroBannerDialog" screen
    And I verify "heroBannerTabletImageConfig" element exists on "aemHeroBannerDialog" screen
    And I take a screenshot
    #Save changes
    And I click "heroBannerSaveChangesCheck" on "aemHeroBannerDialog" screen
    And I wait for "heroBannerSaveChangesCheck" to disappear on "aemHeroBannerDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/travel-leisure/racv-club/footer/test-automation-club-hero-component-2.html"
    And I capture the address navigated to
    And I take a screenshot
    #Post publishing validations
    #Verify default search text and search box
    Then I verify "searchTextBox" element exists on "testClubHeroComponent2Published" screen
    And I verify "searchButton" element exists on "testClubHeroComponent2Published" screen
    And I verify "noSearchResultsText" element exists on "testClubHeroComponent2Published" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestClubHeroComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot
