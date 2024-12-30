#Author: Jing Zuo
Feature: This feature tests the Feedback in AEM authoring and storybook

  @TestAuthoringFeedback-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author feedback component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-feedback-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-feedback-RANDOM[0-8]-p3.html"
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
    When I click "accordionInTree" on "aemTestFeedbackPage" screen
    And I click "configureButton" on "aemTestFeedbackPage" screen
    And I take a screenshot
    #Add items in Accordion
    Then I click "addItem" on "aemAccordionComponentDialog" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I enter "Hello" details in "inputField1" on "aemAccordionComponentDialog" screen
    And I click "doneButton" on "aemAccordionComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemAccordionComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Add components into the container
    #Add Accordion component into Container
    When I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I wait for "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    Then I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Feedback" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "feedbackResult" on "aemInsertNewComponent" screen
    And I wait for "feedbackResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestFeedbackPage" screen
    And I click "editButton" on "aemTestFeedbackPage" screen
    And I enter "Lorem ipsum dolor consectetuer adipiscing elit" details using Action class
    And I click "textSaveIcon" on "aemTestFeedbackPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestFeedbackPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Feedback component
    When I click "feedbackInTree" on "aemTestFeedbackPage" screen
    And I click "configureButton" on "aemTestFeedbackPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemFeedbackComponentDialog" screen
    Then I verify "title" element exists on "aemFeedbackComponentDialog" screen
    And I verify "yesMsg" element exists on "aemFeedbackComponentDialog" screen
    And I clear contents of "noMsg" element on "aemFeedbackComponentDialog" screen
    And I enter "Please go to home page" details in "noMsg" on "aemFeedbackComponentDialog" screen
    And I click "doneButton" on "aemFeedbackComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFeedbackComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-feedback-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "accordionTitle" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordionTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "expandButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "yesButton" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on yesButton
    And I verify "data-event" attribute is "site interaction" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-type" attribute is "button" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-location" attribute is "feedback | hello" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-details" attribute is "yes" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    Then I verify "feedbackTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "yesButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "yesFeedback" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I verify "yesFeedback" element is visible on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot - yes" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    When I refresh the page
    And I wait for "accordionTitle" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordionTitle" element exists on "aemTestFeedbackPagePublished" screen
    # After refreshing we dont need to click expand again as the browser remembers the state
    #And I click "expandButton" on "aemTestFeedbackPagePublished" screen using Action class
    And I wait for "noButton" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on noButton
    And I verify "data-event" attribute is "site interaction" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-type" attribute is "button" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-location" attribute is "feedback | hello" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-details" attribute is "no" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    Then I verify "feedbackTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "noButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "noFeedback" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I verify "noFeedback" element is visible on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot - no" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishFeedback-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Feedback post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-feedback-p3.html"
    #Post publish checks
    When I wait for "accordionTitle" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordionTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "expandButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "yesButton" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on yesButton
    And I verify "data-event" attribute is "site interaction" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-type" attribute is "button" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-location" attribute is "feedback | hello" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-details" attribute is "yes" on "yesButton" element on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    Then I verify "feedbackTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "yesButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "yesFeedback" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I verify "yesFeedback" element is visible on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot - yes" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    When I refresh the page
    And I wait for "accordionTitle" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "accordionTitle" element exists on "aemTestFeedbackPagePublished" screen
    # After refreshing we dont need to click expand again as the browser remembers the state
    #And I click "expandButton" on "aemTestFeedbackPagePublished" screen using Action class
    And I wait for "noButton" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on noButton
    And I verify "data-event" attribute is "site interaction" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-type" attribute is "button" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-location" attribute is "feedback | hello" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I verify "data-details" attribute is "no" on "noButton" element on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    Then I verify "feedbackTitle" element exists on "aemTestFeedbackPagePublished" screen
    And I click "noButton" on "aemTestFeedbackPagePublished" screen
    And I wait for "noFeedback" on "aemTestFeedbackPagePublished" screen or "10" seconds before proceeding
    And I verify "noFeedback" element is visible on "aemTestFeedbackPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot - no" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBFeedback
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify accordion on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=responseNo:Please%20go%20to%20home%20page&id=components-feedback--feedback-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "yes" on "storybookFeedback" screen
    And I take a screenshot
    And I take a lambda snapshot "positive feedback" "hide-gdpr"
    Then I refresh the page
    And I click "no" on "storybookFeedback" screen
    And I take a screenshot
    And I take a lambda snapshot "negative feedback" "hide-gdpr"

  @TestSBFeedback
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify accordion (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=responseNo:Please%20go%20to%20home%20page&id=components-feedback--feedback-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "yes" on "storybookFeedback" screen
    And I take a screenshot
    And I take a lambda snapshot "positive feedback" "hide-gdpr"
    Then I refresh the page
    And I click "no" on "storybookFeedback" screen
    And I take a screenshot
    And I take a lambda snapshot "negative feedback" "hide-gdpr"