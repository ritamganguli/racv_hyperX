#Author: Jing Zuo
Feature: This feature tests the Form Option in AEM authoring and storybook

  @TestAuthoringFormOptions-p3
  @AuthoringRegression1-p3.chrome.desktop
  @Authoring-Forms-p3.chrome.desktop
  Scenario: Verify user is able to author Form Options and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-form-options-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-form-options-RANDOM[0-8]-p3.html"
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
    Then I enter "Form Test" details in "formName" on "aemFormContainerComponentDialog" screen
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
    And I select "Lead" value for "analyticsFormTypeList" drop down in "aemFormContainerComponentDialog" screen using selection method "visibleText"
    And I enter "Lead_Form" details in "analyticsFormName" on "aemFormContainerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormContainerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormContainerComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form Field component"
    #Add Form Field component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Form Field" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "formFieldResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "formFieldResult" on "aemInsertNewComponent" screen
    And I wait for "formFieldResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Form Field component - text input email
    When I click "formFieldInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFieldComponentDialog" screen
    Then I click "type" on "aemFormFieldComponentDialog" screen
    And I select "Text" value for "typeList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormFieldComponentDialog" screen
    And I select "Email (S)" value for "sfNameList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "label" on "aemFormFieldComponentDialog" screen
    And I enter "Email" details in "label" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    When I click "aboutTab" on "aemFormFieldComponentDialog" screen
    Then I enter "Please enter your email" details in "helpMsg" on "aemFormFieldComponentDialog" screen
    And I enter "e.g. testing@gmail.com" details in "placeholder" on "aemFormFieldComponentDialog" screen
    And I click "enableTooltip" on "aemFormFieldComponentDialog" screen
    And I enter "Enter email ID" details in "tooltipText" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormFieldComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFieldComponentDialog" screen or "5" seconds before proceeding
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
    #Configure Form Options component as required - checkbox
    When I click "formOptionsInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormOptionsComponentDialog" screen
    Then I click "type" on "aemFormOptionsComponentDialog" screen
    And I select "Checkbox" value for "typeList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormOptionsComponentDialog" screen
    And I select "input__state1 (S)" value for "sfNameList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "title" on "aemFormOptionsComponentDialog" screen
    And I enter "State" details in "title" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "VIC" details in "option1Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Victoria" details in "option1Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "NSW" details in "option2Text" on "aemFormOptionsComponentDialog" screen
    And I enter "New South Wales" details in "option2Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Others" details in "option3Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Other States" details in "option3Value" on "aemFormOptionsComponentDialog" screen
    And I click "layout" on "aemFormOptionsComponentDialog" screen
    And I select "Vertical" value for "layoutList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    When I click "aboutTab" on "aemFormOptionsComponentDialog" screen
    Then I enter "Please select a state" details in "helpMsg" on "aemFormOptionsComponentDialog" screen
    And I click "enableTooltip" on "aemFormOptionsComponentDialog" screen
    And I enter "States" details in "tooltipText" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    ##TODO - Once https://racvone.atlassian.net/browse/AP3-2956 is fixed
    #Configure required field
    #When I click "constraintsTab" on "aemFormOptionsComponentDialog" screen
    #Then I click "requireConstrains" on "aemFormOptionsComponentDialog" screen
    #And I enter "Select a state" details in "requiredMsg" on "aemFormOptionsComponentDialog" screen
    #And I take a screenshot
    #Configure Show/Hide option
    When I click "showHideTab" on "aemFormOptionsComponentDialog" screen
    Then I click "enableShowHide" on "aemFormOptionsComponentDialog" screen
    And I click "showHide" on "aemFormOptionsComponentDialog" screen
    And I select "Show" value for "showHideList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addConditions" on "aemFormOptionsComponentDialog" screen
    And I click "selectionCondition1" on "aemFormOptionsComponentDialog" screen
    And I select "Email" value for "selectionCondition1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "operation1" on "aemFormOptionsComponentDialog" screen
    And I select "contains" value for "operation1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I enter "qa" details in "value1Input" on "aemFormOptionsComponentDialog" screen
    And I click "doneButton" on "aemFormOptionsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormOptionsComponentDialog" screen or "5" seconds before proceeding
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
    And I select "Type Of Insurance (D)" value for "sfNameList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "title" on "aemFormOptionsComponentDialog" screen
    And I enter "Car Insurance" details in "title" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Complete Care" details in "option1Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Complete Care Car Insurance" details in "option1Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Comprehensive" details in "option2Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Comprehensive Car Insurance" details in "option2Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Third Party" details in "option3Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Third Party Fire and Theft Insurance" details in "option3Value" on "aemFormOptionsComponentDialog" screen
    And I click "layout" on "aemFormOptionsComponentDialog" screen
    And I select "Vertical" value for "layoutList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    When I click "aboutTab" on "aemFormOptionsComponentDialog" screen
    Then I enter "Please select a car insurance" details in "helpMsg" on "aemFormOptionsComponentDialog" screen
    And I click "enableTooltip" on "aemFormOptionsComponentDialog" screen
    And I enter "Car insurance" details in "tooltipText" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    ##TODO - Once https://racvone.atlassian.net/browse/AP3-2956 is fixed
    #Configure required field
    #When I click "constraintsTab" on "aemFormOptionsComponentDialog" screen
    #Then I click "requireConstrains" on "aemFormOptionsComponentDialog" screen
    #And I enter "Select a car insurance" details in "requiredMsg" on "aemFormOptionsComponentDialog" screen
    #And I take a screenshot
    #Configure Show/Hide option
    When I click "showHideTab" on "aemFormOptionsComponentDialog" screen
    Then I click "enableShowHide" on "aemFormOptionsComponentDialog" screen
    And I click "showHide" on "aemFormOptionsComponentDialog" screen
    And I select "Hide" value for "showHideList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addConditions" on "aemFormOptionsComponentDialog" screen
    And I click "selectionCondition1" on "aemFormOptionsComponentDialog" screen
    And I select "State" value for "selectionCondition1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "operation1" on "aemFormOptionsComponentDialog" screen
    And I select "is equal to" value for "operation1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "value1" on "aemFormOptionsComponentDialog" screen
    And I select "Other States" value for "value1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "doneButton" on "aemFormOptionsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormOptionsComponentDialog" screen or "5" seconds before proceeding
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
    #Configure Form Options component - dropdown
    When I click "formOptionsInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormOptionsComponentDialog" screen
    Then I click "type" on "aemFormOptionsComponentDialog" screen
    And I select "Dropdown" value for "typeList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormOptionsComponentDialog" screen
    And I select "Title (S)" value for "sfNameList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "title" on "aemFormOptionsComponentDialog" screen
    And I enter "Title" details in "title" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Mr" details in "option1Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Mr" details in "option1Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Ms" details in "option2Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Ms" details in "option2Value" on "aemFormOptionsComponentDialog" screen
    And I click "addOptions" on "aemFormOptionsComponentDialog" screen
    And I enter "Other" details in "option3Text" on "aemFormOptionsComponentDialog" screen
    And I enter "Other" details in "option3Value" on "aemFormOptionsComponentDialog" screen
    When I click "aboutTab" on "aemFormOptionsComponentDialog" screen
    Then I enter "Please select a title" details in "helpMsg" on "aemFormOptionsComponentDialog" screen
    And I click "enableTooltip" on "aemFormOptionsComponentDialog" screen
    And I enter "Select a title" details in "tooltipText" on "aemFormOptionsComponentDialog" screen
    And I take a screenshot
    ##TODO - Once https://racvone.atlassian.net/browse/AP3-2956 is fixed
    #Configure required field
    #When I click "constraintsTab" on "aemFormOptionsComponentDialog" screen
    #Then I click "requireConstrains" on "aemFormOptionsComponentDialog" screen
    #And I enter "Select a title" details in "requiredMsg" on "aemFormOptionsComponentDialog" screen
    #And I take a screenshot
    #Configure Show/Hide option
    When I click "showHideTab" on "aemFormOptionsComponentDialog" screen
    Then I click "enableShowHide" on "aemFormOptionsComponentDialog" screen
    And I click "showHide" on "aemFormOptionsComponentDialog" screen
    And I select "Hide" value for "showHideList" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addConditions" on "aemFormOptionsComponentDialog" screen
    And I click "selectionCondition1" on "aemFormOptionsComponentDialog" screen
    And I select "State" value for "selectionCondition1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "operation1" on "aemFormOptionsComponentDialog" screen
    And I select "is equal to" value for "operation1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "value1" on "aemFormOptionsComponentDialog" screen
    And I select "Other States" value for "value1List" drop down in "aemFormOptionsComponentDialog" screen using selection method "visibleText"
    And I click "doneButton" on "aemFormOptionsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormOptionsComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-form-options-RANDOM[0-8]-p3.html?disableCaptcha=true"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element is visible on "aemTestFormPagePublished" screen
    And I verify "stateCheckbox" element is not visible on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is visible on "aemTestFormPagePublished" screen
    And I verify "submitButton" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #TO DO - Once https://racvone.atlassian.net/browse/AP3-3056 is fixed
    #And I verify page is accessibility compliant
    When I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I click "insuranceRadioButton" on "aemTestFormPagePublished" screen
    And I verify "stateCheckbox" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "show checkbox" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I click "stateOthers" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is not visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "hide radio button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I click "stateOthers" on "aemTestFormPagePublished" screen
    When I click "stateVIC" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is visible on "aemTestFormPagePublished" screen
    Then I click "completeInsurance" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "titleDropdown" on "aemTestFormPagePublished" screen
    And I click "mrOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

  @TestPublishFormOption-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Form option post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-form-options-p3.html?disableCaptcha=true"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element is visible on "aemTestFormPagePublished" screen
    And I verify "stateCheckbox" element is not visible on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is visible on "aemTestFormPagePublished" screen
    And I verify "submitButton" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #TO DO - Once https://racvone.atlassian.net/browse/AP3-3056 is fixed
    #And I verify page is accessibility compliant
    When I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I click "insuranceRadioButton" on "aemTestFormPagePublished" screen
    And I verify "stateCheckbox" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "show checkbox" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I click "stateOthers" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is not visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "hide radio button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I click "stateOthers" on "aemTestFormPagePublished" screen
    When I click "stateVIC" on "aemTestFormPagePublished" screen
    And I click "stateCheckbox" on "aemTestFormPagePublished" screen
    And I verify "insuranceRadioButton" element is visible on "aemTestFormPagePublished" screen
    And I verify "titleDropdown" element is visible on "aemTestFormPagePublished" screen
    Then I click "completeInsurance" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "titleDropdown" on "aemTestFormPagePublished" screen
    And I click "mrOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

    Examples:
      | theme |
      | base  |
      | club  |