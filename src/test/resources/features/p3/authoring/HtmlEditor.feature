#Author: Dheebanraj M
Feature: This feature tests the html editor component in AEM authoring

  @TestAuthoringHtmlEditor-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add html editor component and configure, publish and view the page in AEM
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
    And I enter "test-automation-htmleditor-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-htmleditor-RANDOM[0-8]-p3.html"
    And I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
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
    #Search and add html editor component & Title in the container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Title" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "titleResult" on "aemInsertNewComponent" screen
    And I wait for "titleResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "html editor" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "htmlEditorResult" on "aemInsertNewComponent" screen
    And I wait for "htmlEditorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #configure html editor component & Title
    When I click "firstTitle" on "aemTestTitlePage" screen
    And I click "configureButton" on "aemTestTitlePage" screen
    And I take a screenshot
    #Properties tab
    And I enter "Test page to verify HTML Editor component" details in "titleField" on "aemTitleComponentDialog" screen
    And I click "typeDropDown" on "aemTitleComponentDialog" screen
    And I select "h2" value for "typeDropDownResults" drop down in "aemTitleComponentDialog" screen using selection method "visibleText"
    And I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    When I click "htmlEditorComponent" on "aemTestHtmlEditorPage" screen
    And I click "configureHtmlEditor" on "aemTestHtmlEditorPage" screen
    And I take a screenshot
    And I wait for "markUpField" on "aemTesthtmlEditorDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I enter "<form name=\"input\" action=\"\" method=\"get\"><div><div><label class=\"paddingleft10\">Quote number</label></div><div><input name=\"QuoteNumber\" id=\"QuoteNumber\" maxlength=\"12\" type=\"text\">&nbsp;</div></div><div><div><label class=\"paddingleft10\">Postcode</label></div><div><input name=\"Postcode\" id=\"Postcode\" maxlength=\"4\" type=\"text\">&nbsp;</div></div><div>&nbsp;</div><div><input id=\"submitButton\" class=\"c-btn\" onclick=\"validateForm()\" value=\"Retrieve quote\">&nbsp;</div></form>" details in "markUpField" on "aemTesthtmlEditorDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTesthtmlEditorDialog" screen
    And I wait for "doneButton" to disappear on "aemTesthtmlEditorDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-htmleditor-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "title" on "aemTestHtmlEditorPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "title" element exists on "aemTestHtmlEditorPublished" screen
    And I verify "htmlEditor" element exists on "aemTestHtmlEditorPublished" screen
    And I enter "7704386AAA" details in "quoteNumberField" on "aemTestHtmlEditorPublished" screen
    And I enter "3000" details in "postcodeField" on "aemTestHtmlEditorPublished" screen
    And I take a screenshot
    And I clear contents of "quoteNumberField" element on "aemTestHtmlEditorPublished" screen
    And I clear contents of "postcodeField" element on "aemTestHtmlEditorPublished" screen
    And I verify "retrieveQuote" element exists on "aemTestHtmlEditorPublished" screen
    And I take a screenshot
    #HTML editor is not a visual component, so lambda is not required
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"