#Author: Jing Zuo
Feature: This feature tests the Navigation Sidebar in AEM authoring and storybook

  @TestAuthoringNavigationSidebar-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author navigation sidebar component and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-navigation-sidebar-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-navigation-sidebar-RANDOM[0-8]-p3.html"
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
    And I create a new test log node "Author Navigation side bar"
    #Add Navigation Sidebar component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Navigation" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "navSidebarResult" on "aemInsertNewComponent" screen
    And I wait for "navSidebarResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Link List
    When I click "linkListInTree" on "aemTestNavigationSidebarPage" screen
    And I click "configureButton" on "aemTestNavigationSidebarPage" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    Then I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "In This Section" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "#claim_1" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Claim 1" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "#claim_2" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Claim 2" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "#claim_3" details in "linkUrl3" on "aemLinkListComponentDialog" screen
    And I enter "Claim 3" details in "linkTitle3" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "#claim_4" details in "linkUrl4" on "aemLinkListComponentDialog" screen
    And I enter "Claim 4" details in "linkTitle4" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author side bar components"
    #Add components in to Container
    When I wait for "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Title" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "titleResult" on "aemInsertNewComponent" screen
    And I wait for "titleResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I wait for "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    And I wait for "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Button" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "buttonResult" on "aemInsertNewComponent" screen
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    And I wait for "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsSecondLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Accordion" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "accordionResult" on "aemInsertNewComponent" screen
    And I wait for "accordionResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Title component
    When I click "titleInTree" on "aemTestNavigationSidebarPage" screen
    And I click "configureButton" on "aemTestNavigationSidebarPage" screen
    And I take a screenshot
    #Properties tab
    And I click "propertiesTab" on "aemTitleComponentDialog" screen
    Then I enter "Car Insurance Claim, Titles are short succinct and focused on providing value" details in "titleField" on "aemTitleComponentDialog" screen
    And I enter "claim_1" details in "idField" on "aemTitleComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTitleComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTitleComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestNavigationSidebarPage" screen
    And I click "editButton" on "aemTestNavigationSidebarPage" screen
    And I take a screenshot
    And I enter "Home Insurance Claim" details using Action class
    And I enter "keys:ENTER" details using Action class
    And I enter "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu mi bibendum neque egestas congue quisque egestas. Varius morbi enim nunc faucibus a pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu mi bibendum neque egestas congue quisque egestas. Varius morbi enim nunc faucibus a pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu mi bibendum neque egestas congue quisque egestas. Varius morbi enim nunc faucibus a pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu mi bibendum neque egestas congue quisque egestas. Varius morbi enim nunc faucibus a pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec sagittis." details using Action class
    And I click "textSaveIcon" on "aemTestNavigationSidebarPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestNavigationSidebarPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text component
    When I click "configureButton" on "aemTestNavigationSidebarPage" screen
    And I click "propertiesTab" on "aemTextComponentDialog" screen
    Then I enter "claim_2" details in "textId" on "aemTextComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTextComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTextComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Button component
    When I click "buttonInTree" on "aemTestNavigationSidebarPage" screen
    And I click "configureButton" on "aemTestNavigationSidebarPage" screen
    And I take a screenshot
    #Properties tab
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Test automation navigation sidebar button Varius morbi enim nunc faucibus a pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec sagittis. Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct." details in "textField" on "aemButtonComponentDialog" screen
    And I enter "claim_3" details in "idField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Accordion component
    When I click "accordionInTree" on "aemTestNavigationSidebarPage" screen
    And I click "configureButton" on "aemTestNavigationSidebarPage" screen
    And I take a screenshot
    Then I click "addItem" on "aemAccordionComponentDialog" screen
    #Add Feedback to Accordion
    And I enter "Feedback" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "feedbackResult" on "aemInsertNewComponent" screen
    And I wait for "feedbackResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I enter "Feedback in Accordion" details in "inputField1" on "aemAccordionComponentDialog" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemAccordionComponentDialog" screen
    And I click "singleItemExpansion" on "aemAccordionComponentDialog" screen
    And I click "expandedItem" on "aemAccordionComponentDialog" screen
    And I select "Feedback: Feedback in Accordion" value for "expandedItemList" drop down in "aemAccordionComponentDialog" screen using selection method "visibleText"
    And I enter "claim_4" details in "idField" on "aemAccordionComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemAccordionComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemAccordionComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-navigation-sidebar-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "navSidebarHeading" on "aemTestNavigationSidebarPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "navSidebarHeading" element exists on "aemTestNavigationSidebarPublished" screen
    And I verify "titleElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I click "thirdSection" on "aemTestNavigationSidebarPublished" screen
    #Verify analytics attributes on thirdSection
    And I verify "data-event" attribute is "site interaction" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "links" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "navigation sidebar" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "claim 3" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "buttonElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "accordionElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "feedbackElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "yesButton" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "noButton" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "click section" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verifiy analytics attributes on Feedback buttons
    #Yes Button
    And I verify "data-event" attribute is "site interaction" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "button" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "feedback | feedback in accordion" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-details" attribute is "yes" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    #No Button
    And I verify "data-event" attribute is "site interaction" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "button" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "feedback | feedback in accordion" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-details" attribute is "no" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/test-automation-navigation-sidebar-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I verify "navSidebarSection" element exists on "aemTestNavigationSidebarPublished" screen
    #And I dismiss GDPR notification if it exists
    #And I verify "navSidebarSection" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I verify "titleElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #When I click "navSidebarSection" on "aemTestNavigationSidebarPublished" screen
    #Verify analytics attributes on navSidebarSection
    #And I verify "data-event" attribute is "site interaction" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-type" attribute is "accordion" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-location" attribute is "navigation sidebar" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-description" attribute is "in this section" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #Then I click "thirdSection" on "aemTestNavigationSidebarPublished" screen
    #And I wait for "buttonElement" on "aemTestNavigationSidebarPublished" screen or "5" seconds before proceeding
    #And I verify "buttonElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I verify "feedbackElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click section" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

  @TestPublishNavigationSidebar-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Navigation side bar post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-navigation-sidebar-p3.html"
    #Post publish checks
    When I wait for "navSidebarHeading" on "aemTestNavigationSidebarPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "navSidebarHeading" element exists on "aemTestNavigationSidebarPublished" screen
    And I verify "titleElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I click "thirdSection" on "aemTestNavigationSidebarPublished" screen
    #Verify analytics attributes on thirdSection
    And I verify "data-event" attribute is "site interaction" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "links" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "navigation sidebar" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "claim 3" on "thirdSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "buttonElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "accordionElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "feedbackElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "yesButton" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "noButton" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click section" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verifiy analytics attributes on Feedback buttons
    #Yes Button
    And I verify "data-event" attribute is "site interaction" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "button" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "feedback | feedback in accordion" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-details" attribute is "yes" on "yesButton" element on "aemTestNavigationSidebarPublished" screen
    #No Button
    And I verify "data-event" attribute is "site interaction" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "button" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "feedback | feedback in accordion" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "did this answer your question?" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-details" attribute is "no" on "noButton" element on "aemTestNavigationSidebarPublished" screen
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-navigation-sidebar-p3.html" on "chrome" on "android-mobile"
    #And I verify "navSidebarSection" element exists on "aemTestNavigationSidebarPublished" screen
    #And I dismiss GDPR notification if it exists
    #And I verify "navSidebarSection" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I verify "titleElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #When I click "navSidebarSection" on "aemTestNavigationSidebarPublished" screen
    #Verify analytics attributes on navSidebarSection
    #And I verify "data-event" attribute is "site interaction" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-type" attribute is "accordion" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-location" attribute is "navigation sidebar" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I verify "data-description" attribute is "in this section" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #Then I click "thirdSection" on "aemTestNavigationSidebarPublished" screen
    #And I wait for "buttonElement" on "aemTestNavigationSidebarPublished" screen or "5" seconds before proceeding
    #And I verify "buttonElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I verify "feedbackElement" element is visible on "aemTestNavigationSidebarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "click section" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishNavigationSidebar-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Navigation side bar post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-navigation-sidebar-p3.html" on "chrome" on "android-mobile"
    And I verify "navSidebarSection" element exists on "aemTestNavigationSidebarPublished" screen
    And I dismiss GDPR notification if it exists
    And I verify "navSidebarSection" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "titleElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    When I click "navSidebarSection" on "aemTestNavigationSidebarPublished" screen
    #Verify analytics attributes on navSidebarSection
    And I verify "data-event" attribute is "site interaction" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-type" attribute is "accordion" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-location" attribute is "navigation sidebar" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    And I verify "data-description" attribute is "in this section" on "navSidebarSection" element on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    Then I click "thirdSection" on "aemTestNavigationSidebarPublished" screen
    And I wait for "buttonElement" on "aemTestNavigationSidebarPublished" screen or "5" seconds before proceeding
    And I verify "buttonElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I verify "feedbackElement" element is visible on "aemTestNavigationSidebarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click section" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBNavigationSidebar
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify header visually in story book - desktop
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "item1" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "item1" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story" on "chrome" on "android-mobile"
    #When I take a screenshot
    #And I dismiss GDPR notification if it exists
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "navSidebarSection" on "storybookNavigationSidebar" screen
    #And I take a screenshot
    #And I take a lambda snapshot "expand navigation sidebar" "hide-gdpr"
    #And I click "item1" on "storybookNavigationSidebar" screen
    #And I take a screenshot
    #And I take a lambda snapshot "item1" "hide-gdpr"
    #And I close the browser

  @TestSBNavigationSidebar.chrome.android-mobile
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify header visually in story book - android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story" on "chrome" on "android-mobile"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "navSidebarSection" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "expand navigation sidebar" "hide-gdpr"
    And I click "item1" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "item1" "hide-gdpr"
    And I close the browser

  @TestSBNavigationSidebar
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify header visually (club theme) in story book - desktop
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story&globals=theme:club"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "item1" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "item1" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "navSidebarSection" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "expand navigation sidebar" "hide-gdpr"
    And I click "item1" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "item1" "hide-gdpr"
    And I close the browser

  @TestSBNavigationSidebar.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify header visually (club theme) in story book - android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-navigation-sidebar--navigation-sidebar-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "navSidebarSection" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "expand navigation sidebar" "hide-gdpr"
    And I click "item1" on "storybookNavigationSidebar" screen
    And I take a screenshot
    And I take a lambda snapshot "item1" "hide-gdpr"
    And I close the browser