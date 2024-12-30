#Author: Viengcumm Thongvilu
Feature: This feature tests the Accordion in AEM authoring and storybook

  @TestAuthoringAccordion-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author accordion component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-accordion-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-accordion-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author components"
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
    #Add Accordion component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Accordion" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "accordionResult" on "aemInsertNewComponent" screen
    And I wait for "accordionResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Accordion component
    #Items tab
    When I click "accordionInTree" on "aemTestAccordionPage" screen
    And I click "configureButton" on "aemTestAccordionPage" screen
    And I take a screenshot
    #Add items in Accordion
    Then I click "addItem" on "aemAccordionComponentDialog" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I enter "Text1" details in "inputField1" on "aemAccordionComponentDialog" screen
    And I click "addItem" on "aemAccordionComponentDialog" screen
    And I enter "Button" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "buttonResult" on "aemInsertNewComponent" screen
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I enter "Button1" details in "inputField2" on "aemAccordionComponentDialog" screen
    #Properties tab
    When I click "propertiesTab" on "aemAccordionComponentDialog" screen
    And I click "singleItemExpansion" on "aemAccordionComponentDialog" screen
    And I click "expandedItem" on "aemAccordionComponentDialog" screen
    And I select "Text: Text1" value for "expandedItemList" drop down in "aemAccordionComponentDialog" screen using selection method "visibleText"
    And I enter "test-accordion" details in "idField" on "aemAccordionComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemAccordionComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemAccordionComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestAccordionPage" screen
    And I click "editButton" on "aemTestAccordionPage" screen
    And I take a screenshot
    #Go to text editor full screen (required for accordion)
    Then I click "textFullscreenIcon" on "aemTestAccordionPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Lorem ipsum dolor consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestAccordionPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestAccordionPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Refresh the page as theres issues clicking buttonInTree
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Edit Button component
    When I click "buttonInTree" on "aemTestAccordionPage" screen
    Then I click "configureButton" on "aemTestAccordionPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    #Accessibility tab
    When I click "accessibilityTab" on "aemButtonComponentDialog" screen
    And I enter "test button accessibility label" details in "labelField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    When I click "doneButton" on "aemAccordionComponentDialog" screen
    Then I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish the page"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-accordion-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "accordion" on "aemTestAccordionPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordion" element exists on "aemTestAccordionPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Check Text
    And I verify "textContent" element is visible on "aemTestAccordionPagePublished" screen
    And I click "text" on "aemTestAccordionPagePublished" screen
    #Verify analytics attributes on text
    And I verify "data-event" attribute is "site interaction" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-location" attribute is "accordion" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-description" attribute is "text1" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "textContent" element is not visible on "aemTestAccordionPagePublished" screen
    #Check Button
    And I verify "primaryButton" element is not visible on "aemTestAccordionPagePublished" screen
    And I click "button" on "aemTestAccordionPagePublished" screen
    #Verify analytics attributes on button
    And I verify "data-event" attribute is "site interaction" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-location" attribute is "accordion" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-description" attribute is "button1" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestAccordionPagePublished" screen
    And I take a screenshot

  @TestPublishAccordion-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Accordion post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-accordion-p3.html"
    #Post publish checks
    And I wait for "accordion" on "aemTestAccordionPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordion" element exists on "aemTestAccordionPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Check Text
    And I verify "textContent" element is visible on "aemTestAccordionPagePublished" screen
    And I click "text" on "aemTestAccordionPagePublished" screen
    #Verify analytics attributes on text
    And I verify "data-event" attribute is "site interaction" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-location" attribute is "accordion" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "data-description" attribute is "text1" on "text" element on "aemTestAccordionPagePublished" screen
    And I verify "textContent" element is not visible on "aemTestAccordionPagePublished" screen
    #Check Button
    And I verify "primaryButton" element is not visible on "aemTestAccordionPagePublished" screen
    And I click "button" on "aemTestAccordionPagePublished" screen
    #Verify analytics attributes on button
    And I verify "data-event" attribute is "site interaction" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-location" attribute is "accordion" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "data-description" attribute is "button1" on "button" element on "aemTestAccordionPagePublished" screen
    And I verify "primaryButton" element is visible on "aemTestAccordionPagePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBAccordion
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify accordion on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-accordion--accordion-story&viewMode=story"
    And I click "accordion2" on "storybookAccordion" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBAccordion
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify accordion (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-accordion--accordion-story&viewMode=story&globals=theme:club"
    And I click "accordion2" on "storybookAccordion" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"