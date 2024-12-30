#Author: Jing Zuo
Feature: Misc AEM authoring tests

  @TestAuthoringResizeBanner-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  Scenario: Verify user is able to author Banner and resize the component
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
    And I enter "test-automation-resize-banner-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-resize-banner-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
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
    And I create a new test log node "Author components"
    #Add Banner component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Banner component
    #Configurations tab
    When I click "firstBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Banner Resize" details in "heading" on "aemBannerComponentDialog" screen
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Feature and promotion" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Resize Banner component
    When I click "firstBanner" on "aemTestBannerPage" screen
    And I wait for "layoutButton" on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I click "layoutButton" on "aemTestBannerPage" screen
    Then I drag "bannerRightEdge" element "-400","0" on "aemTestBannerPage" screen
    #We need to refresh as after refreshing the page refreshes but automation cannot detect the refresh
    And I refresh the page
    #And I wait for "closeLayoutButton" to disappear on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-resize-banner-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishResizeBanner-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Resize Banner post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-resize-banner-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHideBanner-p3
  @AuthoringSanity-p3.chrome.desktop
  Scenario: Verify user is able to author 4 banner components and hide each component on their respective breakpoint
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
    And I enter "test-automation-hide-banner-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-hide-banner-RANDOM[0-8]-p3.html"
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
    And I create a new test log node "Author components"
    #Add Banner component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Banner" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "bannerResult" on "aemInsertNewComponent" screen
    And I wait for "bannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure 1st Banner component
    #Configurations tab
    When I click "firstBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I enter "Banner Hide XL" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "Testing Banner hidden on XL breakpoint view" details in "description" on "aemBannerComponentDialog" screen
    And I take a screenshot
    And I click "bannerTheme" on "aemBannerComponentDialog" screen
    And I select "Product and brand" value for "bannerThemeList" drop down in "aemBannerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Copy and paste Banner component multiple times
    When I click "firstBanner" on "aemTestBannerPage" screen
    Then I click "copyButton" on "aemTestBannerPage" screen
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    And I wait for "pasteComponentIcon" to disappear on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure the copied Banners
    #Configure 2nd Banner component
    When I click "secondBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I clear contents of "heading" element on "aemBannerComponentDialog" screen
    And I clear contents of "description" element on "aemBannerComponentDialog" screen
    And I enter "Banner Hide L" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "Testing Banner hidden on L breakpoint view" details in "description" on "aemBannerComponentDialog" screen
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure 3rd Banner component
    When I click "thirdBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I clear contents of "heading" element on "aemBannerComponentDialog" screen
    And I clear contents of "description" element on "aemBannerComponentDialog" screen
    And I enter "Banner Hide M" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "Testing Banner hidden on M breakpoint view" details in "description" on "aemBannerComponentDialog" screen
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Banner component
    When I click "fouthBanner" on "aemTestBannerPage" screen
    And I click "configureButton" on "aemTestBannerPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemBannerComponentDialog" screen
    Then I clear contents of "heading" element on "aemBannerComponentDialog" screen
    And I clear contents of "description" element on "aemBannerComponentDialog" screen
    And I enter "Banner Hide S" details in "heading" on "aemBannerComponentDialog" screen
    And I enter "Testing Banner hidden on S breakpoint view" details in "description" on "aemBannerComponentDialog" screen
    And I click "doneButton" on "aemBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemBannerComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Go to Layout mode
    #Hide 1st Banner component
    When I click "modeSelectButton" on "aemEditorPage" screen
    And I click "layoutOption" without scrolling on "aemEditorPage" screen
    And I take a screenshot
    Then I click "xlargeView" on "aemEditorPage" screen
    And I click "firstBannerInLayout" on "aemTestBannerPage" screen
    And I wait for "hideButton" on "aemTestBannerPage" screen or "2" seconds before proceeding
    And I click "hideButton" on "aemTestBannerPage" screen
    And I wait for "firstBannerInLayout" to disappear on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    #Hide 2nd Banner component
    When I click "largeView" on "aemEditorPage" screen
    And I click "secondBannerInLayout" on "aemTestBannerPage" screen
    And I wait for "hideButton" on "aemTestBannerPage" screen or "2" seconds before proceeding
    Then I click "hideButton" on "aemTestBannerPage" screen
    And I wait for "secondBannerInLayout" to disappear on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    #Hide 3rd Banner component
    When I click "mediumView" on "aemEditorPage" screen
    And I click "thirdBannerInLayout" on "aemTestBannerPage" screen
    And I wait for "hideButton" on "aemTestBannerPage" screen or "2" seconds before proceeding
    Then I click "hideButton" on "aemTestBannerPage" screen
    And I wait for "thirdBannerInLayout" to disappear on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    #Hide 4th Banner component
    When I click "smallView" on "aemEditorPage" screen
    And I click "fouthBannerInLayout" on "aemTestBannerPage" screen
    And I wait for "hideButton" on "aemTestBannerPage" screen or "2" seconds before proceeding
    Then I click "hideButton" on "aemTestBannerPage" screen
    And I wait for "fouthBannerInLayout" to disappear on "aemTestBannerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-hide-banner-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishHideBanner-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Hide banner post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-hide-banner-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestCreateAEMTestPage-p3
  @Sanity-p3.chrome.desktop
  Scenario Template: Create new page on <theme> theme, add text component into layout container, check mandatory values cannot be saved, copy, paste, undo, publish and view the page in AEM, check replication to p1 and p2, delete the component and page
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-aem-page-RANDOM[0-8]-<theme>-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    #Open properties and set theme
    And I click "pageInfoButton" on "aemLandingPage" screen
    And I click "openPropertiesOption" on "aemLandingPage" screen
    And I click "advancedTab" on "aemPageProperties" screen
    And I click "<theme>ThemeOption" on "aemPageProperties" screen
    And I click "saveClose" on "aemPageProperties" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring hero banner negative checks"
    #check mandatory values are working (on Hero Banner)
    #Open side panel
    When I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #configure Hero banner without any values to validate mandatory values are being enforced
    And I click "heroBannerComponent" on "aemTestCreationPage" screen
    And I click "configureButton" on "aemTestCreationPage" screen
    And I click "layoutTab" on "aemHeroBannerComponentDialog" screen
    And I clear contents of "targetIdFiled" element on "aemHeroBannerComponentDialog" screen
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I verify "targetIdFieldErrored" element is visible on "aemHeroBannerComponentDialog" screen
    And I click "cancelButton" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author text component"
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add Text component
    And I enter "text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Click configuration button of Text component
    Then I click "textComponent" on "aemTestCreationPage" screen
    And I click "configureButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to Properties tab and enter ID
    When I click "propertiesTab" on "aemTextComponentDialog" screen
    Then I enter "text-component-testing-1" details in "textId" on "aemTextComponentDialog" screen
    And I take a screenshot
    When I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    Then I take a screenshot
    #Edit Text component
    When I wait for "textComponent" on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I click "textComponent" on "aemTestCreationPage" screen
    And I click "editButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestCreationPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Text for RTE 1" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Text for RTE 2" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestCreationPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Copy and Paste Text component
    #When I click "textComponent" on "aemTestCreationPage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    #Edit the copied Text component
    When I wait for "textComponentCopied" on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I click "textComponentCopied" on "aemTestCreationPage" screen
    And I click "editButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestCreationPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Copied Text for RTE 1" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Copied Text for RTE 2" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestCreationPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    #Post publish validation
    When I navigate to "URL/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    And I wait for "text1" on "aemTestCreationPagePublished" screen or "10" seconds before proceeding
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2" element exists on "aemTestCreationPagePublished" screen
    And I verify "text1Copied" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2Copied" element exists on "aemTestCreationPagePublished" screen
    #We dont need accessibility check here as are validating copied components which will fail with duplicate IDs
    #And I verify page is accessibility compliant
    And I take a screenshot
    #Delete the copied component
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "textComponentCopied" on "aemTestCreationPage" screen
    And I click "deleteButton" on "aemTestCreationPage" screen
    And I click "confirmDeleteButton" on "aemTestCreationPage" screen
    Then I wait for "textComponentCopied" to disappear on "aemTestCreationPage" screen or "2" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    When I navigate to "URL/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    And I wait for "text1" on "aemTestCreationPagePublished" screen or "10" seconds before proceeding
    And I verify page is accessibility compliant
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2" element exists on "aemTestCreationPagePublished" screen
    And I verify "text1Copied" element is not visible on "aemTestCreationPagePublished" screen
    And I verify "text2Copied" element is not visible on "aemTestCreationPagePublished" screen
    And I take a screenshot
    #Check page is replicated to and visible on pub1
    When I navigate to "PURL1/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    #Check page is replicated to and visible on pub2
    When I navigate to "PURL2/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3.html"
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Delete page"
    #Delete page
    When I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemSitesPage" screen
    And I wait for '//*[@data-foundation-collection-item-id="/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3"]/coral-columnview-item-thumbnail/img' on "XPATH" screen or "10" seconds before proceeding
    And I click '//*[@data-foundation-collection-item-id="/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-RANDOM[0-8]-<theme>-p3"]/coral-columnview-item-thumbnail/img' on "XPATH" screen using JavaScript
    And I click "deleteButton" on "aemSitesPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemSitesPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemSitesPage" screen or "5" seconds before proceeding
    Then I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |
      | none  |

  #Blocked due to DAC-11091
  @TestAuthoringConsoleError-p3
  #@AuthoringSanity-p3.chrome.desktop
  #@AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify if any console appears during authoring of a page with some test components and during deletion of the page
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-aem-page-errorcheck-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-errorcheck-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    When I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #configure Hero banner without any values to validate mandatory values are being enforced
    And I click "heroBannerComponent" on "aemTestCreationPage" screen
    And I click "configureButton" on "aemTestCreationPage" screen
    And I click "layoutTab" on "aemHeroBannerComponentDialog" screen
    And I clear contents of "targetIdFiled" element on "aemHeroBannerComponentDialog" screen
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I verify "targetIdFieldErrored" element is visible on "aemHeroBannerComponentDialog" screen
    And I click "cancelButton" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author text component"
    #Search and add Text component
    And I enter "text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Click configuration button of Text component
    Then I click "textComponent" on "aemTestCreationPage" screen
    And I click "configureButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to Properties tab and enter ID
    When I click "propertiesTab" on "aemTextComponentDialog" screen
    Then I enter "text-component-testing-1" details in "textId" on "aemTextComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I wait for "textComponent" on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I click "textComponent" on "aemTestCreationPage" screen
    And I click "stylesButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Default value for top spacing is medium, bottom spacing is medium
    And I click "applyStyle" on "aemTestCreationPage" screen
    And I wait for "applyStyle" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    #Edit Text component
    #When I wait for "textComponent" on "aemTestCreationPage" screen or "5" seconds before proceeding
    #And I click "textComponent" on "aemTestCreationPage" screen
    And I click "editButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestCreationPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Text for RTE 1" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Text for RTE 2" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestCreationPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Copy and Paste Text component
    When I click "textComponent" on "aemTestCreationPage" screen
    Then I click "copyButton" on "aemTestCreationPage" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "pasteComponentIcon" on "aemEditorPage" screen
    #Edit the copied Text component
    When I wait for "textComponentCopied" on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I click "textComponentCopied" on "aemTestCreationPage" screen
    And I click "editButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestCreationPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Copied Text for RTE 1" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Copied Text for RTE 2" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestCreationPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    #Post publish validation
    When I navigate to "URL/racv-home/utility/qa/test-automation-aem-page-errorcheck-RANDOM[0-8]-p3.html"
    And I wait for "text1" on "aemTestCreationPagePublished" screen or "10" seconds before proceeding
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2" element exists on "aemTestCreationPagePublished" screen
    And I verify "text1Copied" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2Copied" element exists on "aemTestCreationPagePublished" screen
    #We dont need accessibility check here as are validating copied components which will fail with duplicate IDs
    #And I verify page is accessibility compliant
    And I take a screenshot
    #Delete the copied component
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-errorcheck-RANDOM[0-8]-p3.html"
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "textComponentCopied" on "aemTestCreationPage" screen
    And I click "deleteButton" on "aemTestCreationPage" screen
    And I click "confirmDeleteButton" on "aemTestCreationPage" screen
    Then I wait for "textComponentCopied" to disappear on "aemTestCreationPage" screen or "2" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-aem-page-errorcheck-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "text1" on "aemTestCreationPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify page is accessibility compliant
    Then I verify "text1" element exists on "aemTestCreationPagePublished" screen
    And I verify "text2" element exists on "aemTestCreationPagePublished" screen
    And I verify "text1Copied" element is not visible on "aemTestCreationPagePublished" screen
    And I verify "text2Copied" element is not visible on "aemTestCreationPagePublished" screen
    And I take a screenshot
    And I check the console for errors
    ###############
    ## NODE
    ###############
    And I create a new test log node "Delete the page"
    #Delete page
    When I switch to "parent" browser tab
    And I scroll "aemSeventhColumn" element by "100" percent on "aemSitesPage" screen
    And I click '//*[@data-foundation-collection-item-id="/content/racv/en/home/racv-home/utility/qa/test-automation-aem-page-errorcheck-RANDOM[0-8]-p3"]/coral-columnview-item-thumbnail/img' on "XPATH" screen using JavaScript
    And I click "deleteButton" on "aemSitesPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemSitesPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemSitesPage" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I check the console for errors