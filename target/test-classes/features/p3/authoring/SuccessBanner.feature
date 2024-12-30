#Author: Jing Zuo
#Date Created : 14 May 2024
Feature: This feature tests the Success Banner in AEM authoring and storybook

  @TestAuthoringSuccessBanner-ReferenceNumber-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Success Banner with Reference Number and verify published dispatcher component, accessibility and visually
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
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create Success Banner Experience Fragments"
    #Navigate to experience fragment to create a new XF
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-success-banner-reference-number" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-success-banner-reference-number/master.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Success Banner Variation - With Reference Number"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "variationsButton" on "aemEditorPage" screen
    #Rename the first variation
    And I click "renameVariation" on "aemEditorPage" screen
    And I clear contents of "variationTitle" element on "aemEditorPage" screen
    And I enter "Reference Number" details in "variationTitle" on "aemEditorPage" screen
    And I click "variationTitle" on "aemEditorPage" screen
    Then I click "confirmRename" on "aemEditorPage" screen
    And I wait for "confirmRename" to disappear on "aemEditorPage" screen or "2" seconds before proceeding
    And I take a screenshot
    #Search and add Container component
    When I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    Then I click "applyStyle" on "aemTestContainerPage" screen
    #Add Success Banner component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Success Banner" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    And I click "successBannerResult" on "aemInsertNewComponent" screen
    Then I wait for "successBannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Success Banner - With Reference Number
    When I click "successBannerInTree" on "aemExperienceFragmentsSuccessBanner" screen
    And I click "configureButton" on "aemExperienceFragmentsSuccessBanner" screen
    And I take a screenshot
    And I enter "Thank you for contacting us" details in "title" on "aemSuccessBannerComponentDialog" screen
    And I enter "We'll contact you within 72 hours and may ask for this reference number" details in "successDescription" on "aemSuccessBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSuccessBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSuccessBannerComponentDialog" screen or "2" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create thank-you page"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-thankyou-reference-number-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-thankyou-reference-number-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "navigationTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-success-banner-reference-number/master/jcr:content/root" details in "thankYouSectionContentPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create form testing page"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-success-banner-reference-number-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-success-banner-reference-number-RANDOM[0-8]-p3.html"
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
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    When I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I wait for "containerStylesWidthList" on "aemTestContainerPage" screen or "5" seconds before proceeding
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
    And I enter "/content/racv/en/home/racv-home/utility/qa/test-automation-thankyou-reference-number-RANDOM[0-8]-p3" details in "thankYouPage" on "aemFormContainerComponentDialog" screen
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-success-banner-reference-number-RANDOM[0-8]-p3.html"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element exists on "aemTestFormPagePublished" screen
    And I verify "submitButton" element exists on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant
    And I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I verify "refTitle" element is visible on "aemTestFormPagePublished" screen
    And I verify "refText" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, normalize-salesforce-reference-number"

  @TestPublishSuccessBanner-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Success banner post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-success-banner-reference-number-p3.html"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element exists on "aemTestFormPagePublished" screen
    And I verify "submitButton" element exists on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant
    And I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I verify "refTitle" element is visible on "aemTestFormPagePublished" screen
    And I verify "refText" element is visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1, normalize-salesforce-reference-number"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringSuccessBanner-NoReferenceNumber-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Success Banner with No Reference Number and verify published dispatcher component, accessibility and visually
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
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create Success Banner Experience Fragments"
    #Navigate to experience fragment to create a new XF
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-success-banner-no-reference-number" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-success-banner-no-reference-number/master.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author Success Banner Variation - No Reference Number"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "variationsButton" on "aemEditorPage" screen
    #Rename the first variation
    And I click "renameVariation" on "aemEditorPage" screen
    And I clear contents of "variationTitle" element on "aemEditorPage" screen
    And I enter "No Reference Number" details in "variationTitle" on "aemEditorPage" screen
    And I click "variationTitle" on "aemEditorPage" screen
    Then I click "confirmRename" on "aemEditorPage" screen
    And I wait for "confirmRename" to disappear on "aemEditorPage" screen or "2" seconds before proceeding
    And I take a screenshot
    #Search and add Container component
    When I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    Then I click "applyStyle" on "aemTestContainerPage" screen
    #Add Success Banner component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Success Banner" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    And I click "successBannerResult" on "aemInsertNewComponent" screen
    Then I wait for "successBannerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Success Banner - No Reference Number
    When I click "successBannerInTree" on "aemExperienceFragmentsSuccessBanner" screen
    And I click "configureButton" on "aemExperienceFragmentsSuccessBanner" screen
    And I take a screenshot
    And I enter "Thank you for subscribing" details in "title" on "aemSuccessBannerComponentDialog" screen
    And I click "showRefNumber" on "aemSuccessBannerComponentDialog" screen
    And I enter "You'll be sent the latest news, exclusive offers and competitions to your inbox" details in "successDescription" on "aemSuccessBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSuccessBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSuccessBannerComponentDialog" screen or "2" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create thank-you page"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-thankyou-no-reference-number-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-thankyou-no-reference-number-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "navigationTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-success-banner-no-reference-number/master/jcr:content/root" details in "thankYouSectionContentPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create form testing page"
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-success-banner-no-reference-number-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-success-banner-no-reference-number-RANDOM[0-8]-p3.html"
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
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    When I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I wait for "containerStylesWidthList" on "aemTestContainerPage" screen or "5" seconds before proceeding
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
    And I enter "/content/racv/en/home/racv-home/utility/qa/test-automation-thankyou-no-reference-number-RANDOM[0-8]-p3" details in "thankYouPage" on "aemFormContainerComponentDialog" screen
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-success-banner-no-reference-number-RANDOM[0-8]-p3.html"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element exists on "aemTestFormPagePublished" screen
    And I verify "submitButton" element exists on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant
    And I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I verify "noRefTitle" element is visible on "aemTestFormPagePublished" screen
    And I verify "refText" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishSuccessBanner-NoReferenceNumber-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Success banner no reference number post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-success-banner-no-reference-number-p3.html"
    When I wait for "emailField" on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "emailField" element exists on "aemTestFormPagePublished" screen
    And I verify "submitButton" element exists on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I verify page is accessibility compliant
    And I enter "digitalqa@racv.com.au" details in "emailField" on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I click "submitButton" on "aemTestFormPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestFormPagePublished" screen or "5" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "?referenceNo=FMD"
    And I verify "noRefTitle" element is visible on "aemTestFormPagePublished" screen
    And I verify "refText" element is not visible on "aemTestFormPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBSuccessBannerReferenceNumber
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Success Banner showing reference text on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-success-banner--success-banner-story&viewMode=story"
    And I verify "refText" element is visible on "storybookSuccessBanner" screen
    And I verify "refNumber" element is visible on "storybookSuccessBanner" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "refNumberButton" on "storybookSuccessBanner" screen
    Then I take a screenshot
    And I take a lambda snapshot "Reference number copied" "hide-gdpr"

  @TestSBSuccessBannerNoReferenceNumber
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Success Banner not showing reference text on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showReferenceText:false&id=components-success-banner--success-banner-story&viewMode=story"
    And I verify "refText" element is not visible on "storybookSuccessBanner" screen
    And I verify "refNumber" element is not visible on "storybookSuccessBanner" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSuccessBannerReferenceNumber
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Success Banner showing reference text (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-success-banner--success-banner-story&viewMode=story&globals=theme:club"
    And I verify "refText" element is visible on "storybookSuccessBanner" screen
    And I verify "refNumber" element is visible on "storybookSuccessBanner" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    When I click "refNumberButton" on "storybookSuccessBanner" screen
    Then I take a screenshot
    And I take a lambda snapshot "Reference number copied" "hide-gdpr"

  @TestSBSuccessBannerNoReferenceNumber
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Success Banner not showing reference text (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showReferenceText:false&id=components-success-banner--success-banner-story&viewMode=story&globals=theme:club"
    And I verify "refText" element is not visible on "storybookSuccessBanner" screen
    And I verify "refNumber" element is not visible on "storybookSuccessBanner" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"