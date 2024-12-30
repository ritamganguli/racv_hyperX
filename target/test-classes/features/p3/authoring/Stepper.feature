#Author: Viengcumm Thongvilu & Dheebanraj M
Feature: This feature tests the stepper in AEM authoring and storybook

  @TestAuthoringStepper-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add stepper components and configure, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-stepper-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-stepper-RANDOM[0-8]-p3.html"
    #Search and add container component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
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
    #Search and add 5 stepper component
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "stepper" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "stepperResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "stepperResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Stepper2
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "stepper" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "stepperResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "stepperResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Stepper3
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "stepper" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "stepperResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "stepperResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Configure Stepper1
    When I click "stepper1Component" on "aemTestStepperPage" screen
    And I click "configureStepper" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step1
    When I click "step1Stepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "Australian" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Stop and secure the area" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 1
    When I click "step1TextStepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Take down the details of the people involved and take photos of the incident scene and damage." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step2 in Stepper 1
    When I click "step2Stepper1" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "two" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Exchange information" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 2
    And I wait for "step2TextStepper1" on "aemTestStepperPage" screen or "10" seconds before proceeding
    When I click "step2TextStepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Turn off the engine and turn on your hazard lights.If you need emergency services,call 000.If you need to be towed,call us on 13 19 03." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step3 in Stepper 1
    When I click "step3Stepper1" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "three" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h4" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I enter "Make a claim" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 3
    When I click "step3TextStepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "It’s best to lodge a claim as soon as possible. You can do this online or over the phone in around 10 minutes." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step4 in Stepper 1
    When I click "step4Stepper1" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "four" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h5" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I enter "Manage your claim" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 4
    When I click "step4TextStepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Stay updated on the progress of your claim using the online tracker." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step5 in Stepper 1
    When I click "step5Stepper1" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "five" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h6" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I enter "Exchange information" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 5
    When I click "step5TextStepper1" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Limit summary content to under 150 characters. Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Stepper2
    When I click "stepper2Component" on "aemTestStepperPage" screen
    And I click "configureStepper" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step1
    When I click "step1Stepper2" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "Australian" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Stop and secure the area" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 1
    When I click "step1TextStepper2" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Take down the details of the people involved and take photos of the incident scene and damage." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step2 in Stepper 2
    When I click "step2Stepper2" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "two" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Exchange information" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 2
    When I click "step2TextStepper2" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Turn off the engine and turn on your hazard lights.If you need emergency services,call 000.If you need to be towed,call us on 13 19 03." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step3 in Stepper 2
    When I click "step3Stepper2" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "three" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h4" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I enter "Make a claim" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 3
    When I click "step3TextStepper2" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "It’s best to lodge a claim as soon as possible. You can do this online or over the phone in around 10 minutes." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step4 in Stepper 2
    When I click "step4Stepper2" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "Child In Water" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h5" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I enter "Manage your claim" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 4
    When I click "step4TextStepper2" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Stay updated on the progress of your claim using the online tracker." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Stepper3
    When I click "stepper3Component" on "aemTestStepperPage" screen
    And I click "configureStepper" on "aemTestStepperPage" screen
    And I click "addButton" on "aemTestStepperPage" screen
    And I click "enableCTACheckbox" on "aemTestStepperPage" screen using Action class
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step1
    When I click "step1Stepper3" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "one" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Stop and secure the area" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 1
    When I click "step1TextStepper3" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Take down the details of the people involved and take photos of the incident scene and damage." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step2 in Stepper 3
    When I click "step2Stepper3" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "two" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h3" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Exchange information" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 2
    When I click "step2TextStepper3" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "Turn off the engine and turn on your hazard lights.If you need emergency services,call 000.If you need to be towed,call us on 13 19 03." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Step3 in Stepper 3
    When I click "step3Stepper3" on "aemTestStepperPage" screen using JavaScript
    And I click "configureStep" on "aemTestStepperPage" screen
    And I click "stepIconDropDown" on "aemTestStepDialog" screen
    And I select "three" value for "stepIconResult" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I click "headingLevelDropDown" on "aemTestStepDialog" screen
    And I select "h4" value for "headingLevelDropDownResults" drop down in "aemTestStepDialog" screen using selection method "visibleText"
    And I clear contents of "headingField" element on "aemTestStepDialog" screen
    And I enter "Make a claim" details in "headingField" on "aemTestStepDialog" screen
    And I click "doneButton" on "aemTestStepDialog" screen
    And I wait for "doneButton" to disappear on "aemTestStepDialog" screen or "5" seconds before proceeding
    #Configure Text in step 3
    When I click "step3TextStepper3" on "aemTestStepperPage" screen
    And I click "configureStep" on "aemTestStepperPage" screen
    And I enter "It’s best to lodge a claim as soon as possible. You can do this online or over the phone in around 10 minutes." details in "editTextFiled" on "aemTestStepperPage" screen
    And I click "doneButton" on "aemTestStepperPage" screen
    And I wait for "doneButton" to disappear on "aemTestStepperPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure CTA button in Stepper 3
    When I click "ctaButton" on "aemTestStepperPage" screen
    And I click "configureButton" on "aemTestStepperPage" screen
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Claim Now" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    #And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    Then I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-stepper-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "stepperOne" on "aemTestStepperPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "stepperOne" element exists on "aemTestStepperPublished" screen
    And I verify "stepperTwo" element exists on "aemTestStepperPublished" screen
    And I verify "stepperThree" element exists on "aemTestStepperPublished" screen
    And I verify "ctaButton" element exists on "aemTestStepperPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on ctaButton
    And I verify "data-event" attribute is "site interaction" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-type" attribute is "link" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-location" attribute is "stepper" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-description" attribute is "claim now" on "ctaButton" element on "aemTestStepperPublished" screen

  @TestPublishStepper-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Stepper post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-stepper-p3.html"
    #Post publish checks
    And I wait for "stepperOne" on "aemTestStepperPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "stepperOne" element exists on "aemTestStepperPublished" screen
    And I verify "stepperTwo" element exists on "aemTestStepperPublished" screen
    And I verify "stepperThree" element exists on "aemTestStepperPublished" screen
    And I verify "ctaButton" element exists on "aemTestStepperPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot
    #Verify analytics attributes on ctaButton
    And I verify "data-event" attribute is "site interaction" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-type" attribute is "link" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-location" attribute is "stepper" on "ctaButton" element on "aemTestStepperPublished" screen
    And I verify "data-description" attribute is "claim now" on "ctaButton" element on "aemTestStepperPublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBStepper1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify stepper according to stepper matrix test 1 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-stepper--stepper-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify stepper according to stepper matrix test 2 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=ctaBtn[0]:showCtaButton;steps:3&id=components-stepper--stepper-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify stepper according to stepper matrix test 3 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=steps:4&id=components-stepper--stepper-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify stepper according to stepper matrix test 4 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=ctaBtn[0]:showCtaButton;steps:5&id=components-stepper--stepper-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify stepper (club theme) according to stepper matrix test 1 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-stepper--stepper-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify stepper (club theme) according to stepper matrix test 2 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=ctaBtn[0]:showCtaButton;steps:3&id=components-stepper--stepper-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify stepper (club theme) according to stepper matrix test 3 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=steps:4&id=components-stepper--stepper-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBStepper4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify stepper (club theme) according to stepper matrix test 4 storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=ctaBtn[0]:showCtaButton;steps:5&id=components-stepper--stepper-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"