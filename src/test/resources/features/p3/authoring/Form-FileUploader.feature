#Author: Jing Zuo
Feature: This feature tests the Form File Uploader in AEM authoring and storybook

  @TestAuthoringFormFileUploader-p3
  @AuthoringRegression1-p3.chrome.desktop
  @Authoring-Forms-p3.chrome.desktop
  Scenario: Verify user is able to author Form File Uploader and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-form-file-uploader-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-form-file-uploader-RANDOM[0-8]-p3.html"
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
    And I create a new test log node "Form File Uploader component"
    #Add Form File Uploader component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "File Uploader" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "fileUploaderResult" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure File Uploader
    When I click "fileUploaderInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFileUploaderComponentDialog" screen
    Then I click "title" on "aemFormFileUploaderComponentDialog" screen
    And I enter "Attachment 1" details in "title" on "aemFormFileUploaderComponentDialog" screen
    And I verify "targetId" element is visible on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    When I click "constraintsTab" on "aemFormFileUploaderComponentDialog" screen
    And I click "requireConstraints" on "aemFormFileUploaderComponentDialog" screen
    Then I enter "This attachment is required" details in "requiredMsg" on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormFileUploaderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFileUploaderComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form File Uploader component"
    #Add Form File Uploader component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "File Uploader" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "fileUploaderResult" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure File Uploader - disable document types
    When I click "fileUploaderInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFileUploaderComponentDialog" screen
    Then I click "title" on "aemFormFileUploaderComponentDialog" screen
    And I enter "Attachment 2" details in "title" on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    And I click "disableDocumentTypes" on "aemFormFileUploaderComponentDialog" screen
    And I enter "Document types are not allowed" details in "helperText" on "aemFormFileUploaderComponentDialog" screen
    And I verify "targetId" element is visible on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    When I click "constraintsTab" on "aemFormFileUploaderComponentDialog" screen
    And I click "requireConstraints" on "aemFormFileUploaderComponentDialog" screen
    Then I enter "This attachment is required" details in "requiredMsg" on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormFileUploaderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFileUploaderComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Form File Uploader component"
    #Add Form File Uploader component into Container
    When I wait for "addComponentsInFormContainerParsys" on "aemTestFormPage" screen or "10" seconds before proceeding
    And I click "addComponentsInFormContainerParsys" on "aemTestFormPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "File Uploader" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "fileUploaderResult" on "aemInsertNewComponent" screen
    And I wait for "fileUploaderResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure File Uploader - disable image types
    When I click "fileUploaderInTree" on "aemTestFormPage" screen
    And I click "configureButton" on "aemTestFormPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemFormFileUploaderComponentDialog" screen
    Then I click "title" on "aemFormFileUploaderComponentDialog" screen
    And I enter "Attachment 3" details in "title" on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    And I click "disableImageTypes" on "aemFormFileUploaderComponentDialog" screen
    And I enter "Image types are not allowed" details in "helperText" on "aemFormFileUploaderComponentDialog" screen
    And I verify "targetId" element is visible on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    When I click "constraintsTab" on "aemFormFileUploaderComponentDialog" screen
    And I click "requireConstraints" on "aemFormFileUploaderComponentDialog" screen
    Then I enter "This attachment is required" details in "requiredMsg" on "aemFormFileUploaderComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFormFileUploaderComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFormFileUploaderComponentDialog" screen or "5" seconds before proceeding
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
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-form-file-uploader-RANDOM[0-8]-p3.html?disableCaptcha=true"
    When I wait for "label1" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #upload valid xlsx to file upload 1 (all  files accepted)
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_xlsx.xlsx"
    And I verify "fileOutput1" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 1 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "fileOutput1Delete" element is visible on "aemTestFormPagePublished" screen
    And I click "fileOutput1Delete" on "aemTestFormPagePublished" screen
    And I verify "fileOutput1" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 1 deleted" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I refresh the page
    #Successfuly upload jpg and delete
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_jpg.jpg"
    And I verify "fileOutput1New" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "new file 1 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload uppercase PNG - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png5.PNG"
    And I verify "fileOutput2Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 2 uploading error" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload png - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png2.png"
    And I verify "fileOutput2" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 2 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload uppercase PDF - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_pdf5.PDF"
    And I verify "fileOutput3Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 3 uploading error" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload docx - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_docx.docx"
    And I verify "fileOutput3" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "file 3 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Mimetype test - Upload zip renamed as jpg - fail
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_zip.jpg"
    And I verify "fileOutput4Error" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #submit
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

  @TestPublishFileUploader-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: File uploader post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-form-file-uploader-p3.html?disableCaptcha=true"
    When I wait for "label1" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #upload valid xlsx to file upload 1 (all  files accepted)
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_xlsx.xlsx"
    And I verify "fileOutput1" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 1 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "fileOutput1Delete" element is visible on "aemTestFormPagePublished" screen
    And I click "fileOutput1Delete" on "aemTestFormPagePublished" screen
    And I verify "fileOutput1" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 1 deleted" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I refresh the page
    #Successfuly upload jpg and delete
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_jpg.jpg"
    And I verify "fileOutput1New" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "new file 1 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload uppercase PNG - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png5.PNG"
    And I verify "fileOutput2Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 2 uploading error" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload png - pass
    And I upload an attachment for "fileInput2" on "aemTestFormPagePublished" from "test_png2.png"
    And I verify "fileOutput2" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 2 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload uppercase PDF - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_pdf5.PDF"
    And I verify "fileOutput3Error" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 3 uploading error" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Upload docx - pass
    And I upload an attachment for "fileInput3" on "aemTestFormPagePublished" from "test_docx.docx"
    And I verify "fileOutput3" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "file 3 uploaded" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Mimetype test - Upload zip renamed as jpg - fail
    And I upload an attachment for "fileInput1" on "aemTestFormPagePublished" from "test_zip.jpg"
    And I verify "fileOutput4Error" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #submit
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"

    Examples:
      | theme |
      | base  |
      | club  |