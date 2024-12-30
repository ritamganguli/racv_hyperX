#Author: Jing Zuo
Feature: This feature tests the Form track my patrol analytics in AEM authoring and storybook

  @TestAuthoringFormTMPAnalytics-p3
  @AuthoringRegression1-p3.chrome.desktop
  @Authoring-Forms-p3.chrome.desktop
  Scenario: Verify user is able to author Form and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-form-tmp-analytics-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-form-tmp-analytics-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    When I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    Then I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form Container component"
    #Add Form Container component into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Form Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "formContainerResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "formContainerResult" on "aemInsertNewComponent" screen
    And I wait for "formContainerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Form Container component
    When I click "formContainerInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormContainerComponentDialog" screen
    Then I enter "Track My Patrol Feedback" details in "formName" on "aemFormContainerComponentDialog" screen
    And I click "actionType" on "aemFormContainerComponentDialog" screen
    And I take a screenshot
    And I select "Send Email" value for "actionTypeList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I enter "aem-forms-staging@cms.racv.com.au" details in "fromEmail" on "aemFormContainerComponentDialog" screen
    And I click "addMailToButton" on "aemFormContainerComponentDialog" screen
    And I enter "digitalqa@racv.com.au" details in "mailTo1" on "aemFormContainerComponentDialog" screen
    And I click "adminTemplate" on "aemFormContainerComponentDialog" screen
    And I select "Test Admin" value for "adminTemplateList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I click "endUserTemplate" on "aemFormContainerComponentDialog" screen
    And I select "Test Enduser" value for "endUserTemplateList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I enter "Receive Test Form Successfully" details in "subject" on "aemFormContainerComponentDialog" screen
    And I click "emailParameter" on "aemFormContainerComponentDialog" screen
    And I select "Email (S)" value for "emailParameterList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Please enter a valid email" details in "errorMsg" on "aemFormContainerComponentDialog" screen
    And I enter "/content/racv/en/home/utility/contact-us/thank-you" details in "thankYouPage" on "aemFormContainerComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I click "saveInSalesforce" on "aemFormContainerComponentDialog" screen
    And I enter "AEM_RACV_Golf_Membership_Sign-up" details in "salesforceId" on "aemFormContainerComponentDialog" screen
    And I enter "Fail to save in Salesforce" details in "saveSalesforceErrorMsg" on "aemFormContainerComponentDialog" screen
    And I take a screenshot
    And I enter "Please try valid input, XSS error" details in "xssFilterErrorMessage" on "aemFormContainerComponentDialog" screen
    When I click "analyticsTab" on "aemFormContainerComponentDialog" screen
    Then I click "analyticsFormType" on "aemFormContainerComponentDialog" screen
    And I select "Survey" value for "analyticsFormTypeList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I enter "track my patrol feedback" details in "analyticsFormName" on "aemFormContainerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormContainerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormContainerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form Options component"
    #Add Form Options component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Form Options" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "formOptionsResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "formOptionsResult" on "aemInsertNewComponent" screen
    And I wait for "formOptionsResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Form Options component - radio button
    When I click "formOptionsInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormOptionsComponentDialog" screen
    Then I click "type" on "aemFormOptionsComponentDialog" screen
    And I select "Radio Button" value for "typeList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormOptionsComponentDialog" screen
    And I select "Question1 (D)" value for "sfNameList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "title" on "aemFormOptionsComponentDialog" screen
    And I enter "How did we go?" details in "title" on "aemFormOptionsComponentDialog" screen
    And I click "enableIcon" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    When I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Great" details in "option1Text" on "aemFormOptionsComponentDialog" screen
    And I enter "great" details in "option1Value" on "aemFormOptionsComponentDialog" screen
    Then I click "option1Icon" on "aemFormOptionsComponentDialog" screen
    And I select "Smiley Green" value for "option1IconList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Average" details in "option2Text" on "aemFormOptionsComponentDialog" screen
    And I enter "average" details in "option2Value" on "aemFormOptionsComponentDialog" screen
    And I click "option2Icon" on "aemFormOptionsComponentDialog" screen
    And I select "Smiley Yellow" value for "option2IconList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Not Great" details in "option3Text" on "aemFormOptionsComponentDialog" screen
    And I enter "not great" details in "option3Value" on "aemFormOptionsComponentDialog" screen
    And I click "option3Icon" on "aemFormOptionsComponentDialog" screen
    And I select "Smiley Red" value for "option3IconList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "layout" on "aemFormOptionsComponentDialog" screen
    And I select "Horizontal" value for "layoutList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    When I click "constraintsTab" on "aemFormOptionsComponentDialog" screen
    And I click "requireConstrains" on "aemFormOptionsComponentDialog" screen
    Then I enter "This option is required" details in "requiredMsg" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormOptionsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormOptionsComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Honeypot component"
    #Add Honeypot component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Honeypot" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "honeypotResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "honeypotResult" on "aemInsertNewComponent" screen
    And I wait for "honeypotResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Honeypot component
    When I click "honeypotInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemHoneypotComponentDialog" screen
    Then I verify "constraintMsg" element exists on "aemHoneypotComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHoneypotComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHoneypotComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "reCaptcha component"
    #Add reCaptcha component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "reCaptcha" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "reCaptchaResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "reCaptchaResult" on "aemInsertNewComponent" screen
    And I wait for "reCaptchaResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form Button component"
    #Add Form Button component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Form Button" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "formButtonResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "formButtonResult" on "aemInsertNewComponent" screen
    And I wait for "formButtonResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Form Button component
    When I click "formButtonInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormButtonComponentDialog" screen
    Then I verify "title" element exists on "aemFormButtonComponentDialog" screen
    And I click "doneButton" on "aemFormButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormButtonComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-form-tmp-analytics-RANDOM[0-8]-p3.html"
    When I wait for "tmpTitle" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish checks" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on Great
    Then I verify "data-event" attribute is "site interaction" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "great" on "tmpGreen" element on "aemTestFormPagePublished" screen
    #Verify analytics attributes on Average
    And I verify "data-event" attribute is "site interaction" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "average" on "tmpYellow" element on "aemTestFormPagePublished" screen
    #Verify analytics attributes on Not great
    And I verify "data-event" attribute is "site interaction" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "not great" on "tmpRed" element on "aemTestFormPagePublished" screen

  @TestPublishFormTMPAnalytics-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Form TMP Analytics post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-form-tmp-analytics-p3.html"
    When I wait for "tmpTitle" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish checks" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on Great
    Then I verify "data-event" attribute is "site interaction" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpGreen" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "great" on "tmpGreen" element on "aemTestFormPagePublished" screen
    #Verify analytics attributes on Average
    And I verify "data-event" attribute is "site interaction" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpYellow" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "average" on "tmpYellow" element on "aemTestFormPagePublished" screen
    #Verify analytics attributes on Not great
    And I verify "data-event" attribute is "site interaction" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-type" attribute is "button" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-location" attribute is "track my patrol feedback | how did we go" on "tmpRed" element on "aemTestFormPagePublished" screen
    And I verify "data-description" attribute is "not great" on "tmpRed" element on "aemTestFormPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |