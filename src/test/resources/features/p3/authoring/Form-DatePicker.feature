#Author: Jing Zuo
Feature: This feature tests the Form Date Picker in AEM authoring and storybook

  @TestAuthoringFormDatePicker-p3
  @AuthoringRegression1-p3.chrome.desktop
  @Authoring-Forms-p3.chrome.desktop
  Scenario: Verify user is able to author Form Date Picker and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-form-date-picker-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-form-date-picker-RANDOM[0-8]-p3.html"
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
    #Configure Form Field component - DOB Picker
    When I click "formFieldInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFieldComponentDialog" screen
    Then I click "type" on "aemFormFieldComponentDialog" screen
    And I select "Date picker" value for "typeList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormFieldComponentDialog" screen
    And I select "Date1 (D)" value for "sfNameList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "label" on "aemFormFieldComponentDialog" screen
    And I enter "Start Date" details in "label" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    When I click "aboutTab" on "aemFormFieldComponentDialog" screen
    Then I enter "Please enter your start date" details in "helpMsg" on "aemFormFieldComponentDialog" screen
    And I click "enableTooltip" on "aemFormFieldComponentDialog" screen
    And I enter "Start date is the first day" details in "tooltipText" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    When I click "constraintsTab" on "aemFormFieldComponentDialog" screen
    And I click "requireConstrains" on "aemFormFieldComponentDialog" screen
    Then I enter "Start date is required" details in "requiredMsg" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    And I click "constraint" on "aemFormFieldComponentDialog" screen
    And I select "DOB" value for "constraintList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I enter "The constraint should be mapped and enabled as outlined on AP3 form validation table for each constraint name" details in "constraintMsg" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    #And I click "disablePastDates" on "aemFormFieldComponentDialog" screen
    And I click "doneButton" on "aemFormFieldComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFieldComponentDialog" screen or "5" seconds before proceeding
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
    #Configure Form Field component - DOB Picker
    When I click "formFieldInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFieldComponentDialog" screen
    Then I click "type" on "aemFormFieldComponentDialog" screen
    And I select "Date picker" value for "typeList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I click "sfName" on "aemFormFieldComponentDialog" screen
    And I select "Date2 (D)" value for "sfNameList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "label" on "aemFormFieldComponentDialog" screen
    And I enter "End Date" details in "label" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    When I click "aboutTab" on "aemFormFieldComponentDialog" screen
    Then I enter "Please enter your end date" details in "helpMsg" on "aemFormFieldComponentDialog" screen
    And I click "enableTooltip" on "aemFormFieldComponentDialog" screen
    And I enter "End date is the last day" details in "tooltipText" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    When I click "constraintsTab" on "aemFormFieldComponentDialog" screen
    And I click "requireConstrains" on "aemFormFieldComponentDialog" screen
    Then I enter "End date is required" details in "requiredMsg" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    And I click "constraint" on "aemFormFieldComponentDialog" screen
    And I select "DOB" value for "constraintList" drop down in "aemFormFieldComponentDialog" screen using selection method "visibleText"
    And I enter "The constraint should be mapped and enabled as outlined on AP3 form validation table for each constraint name" details in "constraintMsg" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    And I click "disablePastDates" on "aemFormFieldComponentDialog" screen
    And I click "calendarWidget" on "aemFormFieldComponentDialog" screen
    And I take a screenshot
    And I click "enableSunday" on "aemFormFieldComponentDialog" screen
    And I click "enableSaturday" on "aemFormFieldComponentDialog" screen
    And I click "doneButton" on "aemFormFieldComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFieldComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-form-date-picker-RANDOM[0-8]-p3.html"
    When I wait for "startDateLabel" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "startDateLabel" element is visible on "aemTestFormPagePublished" screen
    And I verify "endDateLabel" element is visible on "aemTestFormPagePublished" screen
    And I verify "startDateHelpMsg" element is visible on "aemTestFormPagePublished" screen
    And I verify "endDateHelpMsg" element is visible on "aemTestFormPagePublished" screen
    And I verify "submitButton" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Click Submit button and verify error states
    When I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requiredMsgStartDate" element is visible on "aemTestFormPagePublished" screen
    And I verify "requiredMsgEndDate" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Check Clear button
    When I enter "01/10/2023" details in "startDateField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "datepickerStartDate" on "aemTestFormPagePublished" screen
    And I verify "calendarWidget" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "clearButton" on "aemTestFormPagePublished" screen
    And I verify "calendarWidget" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select start date before today and verify past dates are enabled
    When I click "datepickerStartDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "prevMonthButton" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row of the calendar table as start date
    Then I click "startDateInCalendar" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select end date and verify Sundays and Saturdays are disabled
    And I click "endDateField" on "aemTestFormPagePublished" screen
    #When I click "datepickerEndDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "changeYearButton" on "aemTestFormPagePublished" screen
    #Select the second option
    And I click "yearOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "nextMonthButton" on "aemTestFormPagePublished" screen
    #Verify Sunday and Saturday in the second row of the calendar table are disabled
    And I verify "disabledSunday" element is visible on "aemTestFormPagePublished" screen
    And I verify "disabledSaturday" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Monday in the second row of the calendar table as end date
    And I click "endDateInCalendar" on "aemTestFormPagePublished" screen
    And I click "endDateToolip" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

  @TestPublishFormDatePicker-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Form date picker post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-form-date-picker-p3.html"
    When I wait for "startDateLabel" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "startDateLabel" element is visible on "aemTestFormPagePublished" screen
    And I verify "endDateLabel" element is visible on "aemTestFormPagePublished" screen
    And I verify "startDateHelpMsg" element is visible on "aemTestFormPagePublished" screen
    And I verify "endDateHelpMsg" element is visible on "aemTestFormPagePublished" screen
    And I verify "submitButton" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Click Submit button and verify error states
    When I click "submitButton" on "aemTestFormPagePublished" screen
    Then I verify "requiredMsgStartDate" element is visible on "aemTestFormPagePublished" screen
    And I verify "requiredMsgEndDate" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Check Clear button
    When I enter "01/10/2023" details in "startDateField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "datepickerStartDate" on "aemTestFormPagePublished" screen
    And I verify "calendarWidget" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "clearButton" on "aemTestFormPagePublished" screen
    And I verify "calendarWidget" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select start date before today and verify past dates are enabled
    When I click "datepickerStartDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "prevMonthButton" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Sunday in the second row of the calendar table as start date
    Then I click "startDateInCalendar" on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select end date and verify Sundays and Saturdays are disabled
    And I click "endDateField" on "aemTestFormPagePublished" screen
    #When I click "datepickerEndDate" on "aemTestFormPagePublished" screen
    And I take a screenshot
    Then I click "changeYearButton" on "aemTestFormPagePublished" screen
    #Select the second option
    And I click "yearOption" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "nextMonthButton" on "aemTestFormPagePublished" screen
    #Verify Sunday and Saturday in the second row of the calendar table are disabled
    And I verify "disabledSunday" element is visible on "aemTestFormPagePublished" screen
    And I verify "disabledSaturday" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #Select Monday in the second row of the calendar table as end date
    And I click "endDateInCalendar" on "aemTestFormPagePublished" screen
    And I click "endDateToolip" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

    Examples:
      | theme |
      | base  |
      | club  |