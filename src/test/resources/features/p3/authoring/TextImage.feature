#Author: Dheebanraj M
Feature: This feature tests the text image component in AEM authoring and storybook

  @TestAuthoringTextImage-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add text image components and configure, publish and view the page in AEM then delete and page
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
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-text-image-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-text-image-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Container"
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
    And I create a new test log node "Text 4 text  images"
    #Search and add text image component 1
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "text image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textImageResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textImageResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Text Image 2
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "text image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textImageResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textImageResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Text Image 3
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "text image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textImageResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textImageResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Text Image 4
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "text image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textImageResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textImageResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text image with large right side image"
    #Configure text image with large right side image
    When I click "TextImage" on "aemTestTextImagePage" screen
    And I click "configureButton" on "aemTestTextImagePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemTextImageComponentDialog" screen
    And I click "imageSizeDdn" on "aemTextImageComponentDialog" screen
    And I select "Large" value for "imageSizeDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I click "imagePositionDdn" on "aemTextImageComponentDialog" screen
    And I select "Right" value for "imagePositionDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemTextImageComponentDialog" screen
    And I enter "contents-insurance-1600x900.jpg" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I click "cardResult1" on "aemTextImageComponentDialog" screen
    And I click "selectButton" on "aemTextImageComponentDialog" screen
    And I click "layoutTab" on "aemTextImageComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemTextImageComponentDialog" screen
    And I click "doneButton" on "aemTextImageComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text heading in 1st text image component
    #Configure Text description in 1st text image component
    When I click "firstTextImageCompText" on "aemTextImageCompTextDialog" screen
    And I click "configureText" on "aemTextImageCompTextDialog" screen
    And I click "editTextField" on "aemTextImageCompTextDialog" screen
    And I enter "Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events." details in "editTextField" on "aemTextImageCompTextDialog" screen
    And I click "doneButton" on "aemTextImageCompTextDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageCompTextDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text image with large left side image"
    #Configure text image with large left side image
    When I click "TextImage" on "aemTestTextImagePage" screen
    And I click "configureButton" on "aemTestTextImagePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemTextImageComponentDialog" screen
    And I click "imageSizeDdn" on "aemTextImageComponentDialog" screen
    And I select "Large" value for "imageSizeDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I click "imagePositionDdn" on "aemTextImageComponentDialog" screen
    And I select "Left" value for "imagePositionDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemTextImageComponentDialog" screen
    And I enter "contents-insurance-1600x900.jpg" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I click "cardResult1" on "aemTextImageComponentDialog" screen
    And I click "selectButton" on "aemTextImageComponentDialog" screen
    And I click "layoutTab" on "aemTextImageComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemTextImageComponentDialog" screen
    And I click "doneButton" on "aemTextImageComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text heading in 1st text image component
    #Configure Text description in 1st text image component
    When I click "secondTextImageCompText" on "aemTextImageCompTextDialog" screen
    And I click "configureText" on "aemTextImageCompTextDialog" screen
    And I click "editTextField" on "aemTextImageCompTextDialog" screen
    And I enter "Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events." details in "editTextField" on "aemTextImageCompTextDialog" screen
    And I click "doneButton" on "aemTextImageCompTextDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageCompTextDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure text image with small right side image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text  image small right side image"
    When I click "TextImage" on "aemTestTextImagePage" screen
    And I click "configureButton" on "aemTestTextImagePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemTextImageComponentDialog" screen
    And I click "imageSizeDdn" on "aemTextImageComponentDialog" screen
    And I select "Small" value for "imageSizeDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I click "imagePositionDdn" on "aemTextImageComponentDialog" screen
    And I select "Right" value for "imagePositionDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemTextImageComponentDialog" screen
    And I enter "contents-insurance-1600x900.jpg" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I click "cardResult1" on "aemTextImageComponentDialog" screen
    And I click "selectButton" on "aemTextImageComponentDialog" screen
    And I click "layoutTab" on "aemTextImageComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemTextImageComponentDialog" screen
    And I click "doneButton" on "aemTextImageComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text heading in 1st text image component
    #Configure Text description in 1st text image component
    When I click "thirdTextImageCompText" on "aemTextImageCompTextDialog" screen
    And I click "configureText" on "aemTextImageCompTextDialog" screen
    And I click "editTextField" on "aemTextImageCompTextDialog" screen
    And I enter "Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events." details in "editTextField" on "aemTextImageCompTextDialog" screen
    And I click "doneButton" on "aemTextImageCompTextDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageCompTextDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure text image with small left side image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text image with small left side image"
    When I click "TextImage" on "aemTestTextImagePage" screen
    And I click "configureButton" on "aemTestTextImagePage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemTextImageComponentDialog" screen
    And I click "imageSizeDdn" on "aemTextImageComponentDialog" screen
    And I select "Small" value for "imageSizeDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I click "imagePositionDdn" on "aemTextImageComponentDialog" screen
    And I select "Left" value for "imagePositionDdnResult" drop down in "aemTextImageComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemTextImageComponentDialog" screen
    And I enter "contents-insurance-1600x900.jpg" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemTextImageComponentDialog" screen
    And I click "cardResult1" on "aemTextImageComponentDialog" screen
    And I click "selectButton" on "aemTextImageComponentDialog" screen
    And I click "layoutTab" on "aemTextImageComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemTextImageComponentDialog" screen
    And I click "doneButton" on "aemTextImageComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text heading in 1st text image component
    #Configure Text description in 1st text image component
    When I click "fourthTextImageCompText" on "aemTextImageCompTextDialog" screen
    And I click "configureText" on "aemTextImageCompTextDialog" screen
    And I click "editTextField" on "aemTextImageCompTextDialog" screen
    And I enter "Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events.Protects you for loss or damage to your business tools, equipment, contents and stock at the premises, or a building in the event of a fire, storm or other covered events." details in "editTextField" on "aemTextImageCompTextDialog" screen
    And I click "doneButton" on "aemTextImageCompTextDialog" screen
    And I wait for "doneButton" to disappear on "aemTextImageCompTextDialog" screen or "5" seconds before proceeding
    And I take a screenshot
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-text-image-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "textOne" on "aemTestTextImagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "textOne" element exists on "aemTestTextImagePublished" screen
    And I verify "textTwo" element exists on "aemTestTextImagePublished" screen
    And I verify "textThree" element exists on "aemTestTextImagePublished" screen
    And I verify "textFour" element exists on "aemTestTextImagePublished" screen
    And I verify "firstImage" element exists on "aemTestTextImagePublished" screen
    And I verify "secondImage" element exists on "aemTestTextImagePublished" screen
    And I verify "thirdImage" element exists on "aemTestTextImagePublished" screen
    And I verify "fourthImage" element exists on "aemTestTextImagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishTextImage-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Text image post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-text-image-p3.html"
    #Post publish checks
    And I wait for "textOne" on "aemTestTextImagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "textOne" element exists on "aemTestTextImagePublished" screen
    And I verify "textTwo" element exists on "aemTestTextImagePublished" screen
    And I verify "textThree" element exists on "aemTestTextImagePublished" screen
    And I verify "textFour" element exists on "aemTestTextImagePublished" screen
    And I verify "firstImage" element exists on "aemTestTextImagePublished" screen
    And I verify "secondImage" element exists on "aemTestTextImagePublished" screen
    And I verify "thirdImage" element exists on "aemTestTextImagePublished" screen
    And I verify "fourthImage" element exists on "aemTestTextImagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBTextImageRightSideLargeImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text image with right side large image varient  in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imagePosition:right&id=components-text-image--text-image-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageLeftSideLargeImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text image with left side large image varient  in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-text-image--text-image-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageRightSideSmallImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text image with right side small image varient  in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageSize:small;imagePosition:right&id=components-text-image--text-image-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageLeftSideSmallImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text image with left side small image varient  in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageSize:small&id=components-text-image--text-image-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageRightSideLargeImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text image with right side large image varient (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imagePosition:right&id=components-text-image--text-image-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageLeftSideLargeImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text image with left side large image varient (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-text-image--text-image-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageRightSideSmallImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text image with right side small image varient (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageSize:small;imagePosition:right&id=components-text-image--text-image-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextImageLeftSideSmallImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text image with left side small image varient (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=imageSize:small&id=components-text-image--text-image-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"