Feature: This feature tests the Image component in AEM authoring

  @TestAuthoringImage-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  Scenario: Verify user is able to author image component, publish and verify dispatcher
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
    And I enter "test-automation-image-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-image-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add Container component
    When I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    Then I click "lastContainerInTree" on "aemTestLinkListPage" screen
    And I click "stylesButton" on "aemTestLinkListPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestLinkListPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add 1st image component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "imageResult" on "aemInsertNewComponent" screen
    And I wait for "imageResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 1st image
    When I click "image1Component" on "aemTestImagePage" screen
    And I click "configureButton" on "aemTestImagePage" screen
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemImageComponentDialog" screen
    And I enter "contents-insurance-1600x900.jpg" details in "omniSearch" on "aemImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemImageComponentDialog" screen
    And I click "cardResult1" on "aemImageComponentDialog" screen
    And I click "selectButton" on "aemImageComponentDialog" screen
    #Clear then tick the inherit alt text box
    #And I clear contents of "inheritDescriptionCheckbox" element on "aemImageComponentDialog" screen
    #And I click "inheritDescriptionCheckbox" on "aemImageComponentDialog" screen
    And I take a screenshot
    #leave the ID field blank to autogenerate it
    #Save all changes
    And I take a screenshot
    And I click "doneButton" on "aemImageComponentDialog" screen
    #Add 2nd image component
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Image" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "imageResult" on "aemInsertNewComponent" screen
    And I wait for "imageResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure 2nd image
    When I click "image2Component" on "aemTestImagePage" screen
    And I click "configureButton" on "aemTestImagePage" screen
    And I take a screenshot
    And I wait for "dropAssetIcon" on "aemImageComponentDialog" screen or "5" seconds before proceeding
    And I click "dropAssetIcon" on "aemImageComponentDialog" screen
    And I enter "home-insurance-1600x900.jpg" details in "omniSearch" on "aemImageComponentDialog" screen
    And I enter "keys:ENTER" details in "omniSearch" on "aemImageComponentDialog" screen
    And I click "cardResult2" on "aemImageComponentDialog" screen
    And I click "selectButton" on "aemImageComponentDialog" screen
    #Clear the alt text checkbox and enter custom text
    And I clear contents of "inheritDescriptionCheckbox" element on "aemImageComponentDialog" screen
    And I clear contents of "altText" element on "aemImageComponentDialog" screen
    And I enter "my alt text" details in "altText" on "aemImageComponentDialog" screen
    And I take a screenshot
    #populate the id field
    And I click "metaDataTab" on "aemImageComponentDialog" screen
    And I enter "my id" details in "idField" on "aemImageComponentDialog" screen
    #Save all changes
    And I take a screenshot
    And I click "doneButton" on "aemImageComponentDialog" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-image-RANDOM[0-8]-p3.html"
    #Post publish checks - accessibility and visual testing
    And I wait for "image1Component" on "aemTestImagePublished" screen or "10" seconds before proceeding
    #verify image displays
    And I verify "image1Component" element is visible on "aemTestImagePublished" screen
    #verify image alt text and id (by xpath)
    And I verify "image2Component" element is visible on "aemTestImagePublished" screen
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishImage-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Image post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-image-p3.html"
    #Post publish checks - accessibility and visual testing
    And I wait for "image1Component" on "aemTestImagePublished" screen or "10" seconds before proceeding
    #verify image displays
    And I verify "image1Component" element is visible on "aemTestImagePublished" screen
    #verify image alt text and id (by xpath)
    And I verify "image2Component" element is visible on "aemTestImagePublished" screen
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |