#Author: Jing Zuo
Feature: This feature tests the Contact Footer in AEM authoring and storybook

  @TestAuthoringContactFooterNoThirdSection-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author contact footer component with the third section disabled, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-contact-footer-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-contact-footer-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure contact footer"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add contact footer component
    And I enter "Contact Footer" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "contactFooterResult" on "aemInsertNewComponent" screen
    And I wait for "contactFooterResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Contact Footer - No Third Section
    When I click "contactFooterInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemContactFooterComponentDialog" screen
    And I click "icon" on "aemContactFooterComponentDialog" screen
    And I select "Alarm Clock" value for "iconList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "Need Support" details in "firstSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Get answers to the most common questions we get asked about a range of topics" details in "firstSectionDescription" on "aemContactFooterComponentDialog" screen
    And I click "enableFirst2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I enter "Need emergency roadside assistance?" details in "secondSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Broken down and need assistance? We’re just a phone call away." details in "secondSectionDescription" on "aemContactFooterComponentDialog" screen
    And I click "enableSecond2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemContactFooterComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemContactFooterComponentDialog" screen or "2" seconds before proceeding
    #Configure Button 1
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 2
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 3
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Find out more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 4
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Contact us" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
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
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-contact-footer-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "firstSecHeading" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "secondSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "contact us" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen

  @TestPublishContactFooterNoThirdSection-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Contact footer no third section post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-contact-footer-p3.html"
    #Post publish checks
    When I wait for "firstSecHeading" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "secondSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "contact us" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringContactFooterWithThirdSection-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author contact footer component with the third section enabled, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-contact-footer-third-section-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-contact-footer-third-section-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure contact footer"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add contact footer component
    And I enter "Contact Footer" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "contactFooterResult" on "aemInsertNewComponent" screen
    And I wait for "contactFooterResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Contact Footer - with Third Section
    When I click "contactFooterInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemContactFooterComponentDialog" screen
    And I click "icon" on "aemContactFooterComponentDialog" screen
    And I select "Alarm Clock" value for "iconList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "Need Support" details in "firstSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Get answers to the most common questions we get asked about a range of topics" details in "firstSectionDescription" on "aemContactFooterComponentDialog" screen
    And I click "enableFirst2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I enter "Need emergency roadside assistance?" details in "secondSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Broken down and need assistance? We’re just a phone call away." details in "secondSectionDescription" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    #Enable Third Section
    When I click "enableThirdSection" on "aemContactFooterComponentDialog" screen
    And I enter "Need to make an insurance claim" details in "thirdSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Making a claim cannot be any simpler either online or over the phone you will be asked a series of questions in order to lodge your claim" details in "thirdSectionDescription" on "aemContactFooterComponentDialog" screen
    And I click "enableThird2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    Then I click "doneButton" on "aemContactFooterComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemContactFooterComponentDialog" screen or "2" seconds before proceeding
    #Configure Button 1
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 2
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 3
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Find out more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 4
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "13 13 13" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 5
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "13 11 11" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
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
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-contact-footer-third-section-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "firstSecHeading" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "secondSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "thirdSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an insurance claim" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 13 13" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an insurance claim" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 11 11" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen

  @TestPublishContactFooterWithThirdSection-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Contact footer with third section post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-contact-footer-third-section-p3.html"
    #Post publish checks
    When I wait for "firstSecHeading" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "secondSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I verify "thirdSecHeading" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need support" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need emergency roadside assistance?" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an insurance claim" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 13 13" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an insurance claim" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 11 11" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

	#Author: Dheebanraj M
  @TestAuthoringContactFooterTAndENoThirdSection-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author contact footer component travel and experience variation with the third section disabled, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-contact-footer-te-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-contact-footer-te-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure contact footer"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add contact footer component
    And I enter "Contact Footer" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "contactFooterResult" on "aemInsertNewComponent" screen
    And I wait for "contactFooterResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Contact Footer - with Third Section
    When I click "contactFooterInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemContactFooterComponentDialog" screen
    And I click "type" on "aemContactFooterComponentDialog" screen
    And I select "Product action" value for "typeList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "icon" on "aemContactFooterComponentDialog" screen
    And I select "Palm Tree Resort" value for "iconList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "Contact RACV Test City Club" details in "firstSectionHeading" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsOne" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconOne" on "aemContactFooterComponentDialog" screen
    And I select "Pin Drop Outline" value for "contactDetailsIconOneList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "contactDetailsLabelOne" on "aemContactFooterComponentDialog" screen
    And I enter "501 Bourke Street, Melbourne, Victoria 3000" details in "contactDetailsLabelOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsTwo" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconTwo" on "aemContactFooterComponentDialog" screen
    And I select "Phone Outline" value for "contactDetailsIconTwoList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "123456" details in "contactDetailsLabelTwo" on "aemContactFooterComponentDialog" screen
    And I select all text on "contactDetailsLabelTwo" element on "aemContactFooterComponentDialog" screen
    And I click "hyperLinkIconOne" on "aemContactFooterComponentDialog" screen
    And I enter "tel:123456" details in "pathTextFieldOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "applyButtonOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsThree" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconThree" on "aemContactFooterComponentDialog" screen
    And I select "Mail" value for "contactDetailsIconThreeList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "contactDetailsLabelThree" on "aemContactFooterComponentDialog" screen
    And I select all text on "contactDetailsLabelThree" element on "aemContactFooterComponentDialog" screen
    And I click "hyperLinkIconTwo" on "aemContactFooterComponentDialog" screen
    And I enter "mailto:digitalqa@racv.com.au" details in "pathTextFieldTwo" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "applyButtonTwo" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "enableFirst2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I enter "Enquire about booking your wedding" details in "secondSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Tell us a few details about your wedding plans, including preferred date and number of guests." details in "secondSectionDescription" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "enableSecond2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemContactFooterComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemContactFooterComponentDialog" screen or "2" seconds before proceeding
    #Configure Button 1
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 2
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 3
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Find out more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 4
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Contact us" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
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
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-contact-footer-te-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "firstSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I wait for "secondSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I verify "secondSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "telLink" element exists on "aemTestContactFooterPublished" screen
    And I verify "mailToLink" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "contact us" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen

  @TestPublishTandENoThirdSection-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: T&E No third section post publish checks
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-contact-footer-te-p3.html"
    #Post publish checks
    When I wait for "firstSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I wait for "secondSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I verify "secondSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "telLink" element exists on "aemTestContactFooterPublished" screen
    And I verify "mailToLink" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "contact us" on "button2InSecondSection" element on "aemTestContactFooterPublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringContactFooterTAndEWithThirdSection-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author contact footer component travel and experience variation with the third section enabled, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-contact-footer-te-third-section-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-contact-footer-te-third-section-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure contact footer"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add contact footer component
    And I enter "Contact Footer" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "contactFooterResult" on "aemInsertNewComponent" screen
    And I wait for "contactFooterResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Contact Footer - with Third Section
    When I click "contactFooterInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemContactFooterComponentDialog" screen
    And I click "type" on "aemContactFooterComponentDialog" screen
    And I select "Product action" value for "typeList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "icon" on "aemContactFooterComponentDialog" screen
    And I select "Palm Tree Resort" value for "iconList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "Contact RACV Test City Club" details in "firstSectionHeading" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsOne" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconOne" on "aemContactFooterComponentDialog" screen
    And I select "Pin Drop Outline" value for "contactDetailsIconOneList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "contactDetailsLabelOne" on "aemContactFooterComponentDialog" screen
    And I enter "501 Bourke Street, Melbourne, Victoria 3000" details in "contactDetailsLabelOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsTwo" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconTwo" on "aemContactFooterComponentDialog" screen
    And I select "Phone Outline" value for "contactDetailsIconTwoList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I click "contactDetailsLabelTwo" on "aemContactFooterComponentDialog" screen
    And I click "hyperLinkIconOne" on "aemContactFooterComponentDialog" screen
    And I enter "tel:123456" details in "pathTextFieldOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "applyButtonOne" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I enter "123456" details in "contactDetailsLabelTwo" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemContactFooterComponentDialog" screen
    And I click "enableContactDetailsThree" on "aemContactFooterComponentDialog" screen
    Then I take a screenshot
    And I click "contactDetailsIconThree" on "aemContactFooterComponentDialog" screen
    And I select "Mail" value for "contactDetailsIconThreeList" drop down in "aemContactFooterComponentDialog" screen using selection method "visibleText"
    Then I take a screenshot
    And I enter "digitalqa@racv.com.au" details in "contactDetailsLabelThree" on "aemContactFooterComponentDialog" screen
    And I select all text on "contactDetailsLabelThree" element on "aemContactFooterComponentDialog" screen
    And I click "hyperLinkIconTwo" on "aemContactFooterComponentDialog" screen
    And I enter "mailto:digitalqa@racv.com.au" details in "pathTextFieldTwo" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "applyButtonTwo" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I click "enableFirst2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    And I enter "Enquire about booking your wedding" details in "secondSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Tell us a few details about your wedding plans, including preferred date and number of guests." details in "secondSectionDescription" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    #Enable Third Section
    When I click "enableThirdSection" on "aemContactFooterComponentDialog" screen
    And I enter "Need to make an wedding insurance claim" details in "thirdSectionHeading" on "aemContactFooterComponentDialog" screen
    And I enter "Making a claim cannot be any simpler either online or over the phone you will be asked a series of questions in order to lodge your claim" details in "thirdSectionDescription" on "aemContactFooterComponentDialog" screen
    And I click "enableThird2" on "aemContactFooterComponentDialog" screen
    And I take a screenshot
    Then I click "doneButton" on "aemContactFooterComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemContactFooterComponentDialog" screen or "2" seconds before proceeding
    #Configure Button 1
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 2
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 3
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Find out more" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 4
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "13 13 13" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure Button 5
    #Properties tab
    When I click "buttonInTree" on "aemTestContactFooterPage" screen
    And I click "configureButton" on "aemTestContactFooterPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "13 11 11" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "autoCompleteResult1" on "aemEditorPage" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
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
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-contact-footer-te-third-section-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "firstSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I wait for "secondSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I verify "secondSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "thirdSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "telLink" element exists on "aemTestContactFooterPublished" screen
    And I verify "mailToLink" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an wedding insurance claim" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 13 13" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an wedding insurance claim" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 11 11" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen

  @TestPublishContactFooterTandEWithThirdSection-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: ContactFooter T&E With third section post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-contact-footer-te-third-section-p3.html"
    #Post publish checks
    When I wait for "firstSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "firstSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I wait for "secondSecHeadingTAndE" on "aemTestContactFooterPublished" screen or "2" seconds before proceeding
    And I verify "secondSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "thirdSecHeadingTAndE" element exists on "aemTestContactFooterPublished" screen
    And I verify "telLink" element exists on "aemTestContactFooterPublished" screen
    And I verify "mailToLink" element exists on "aemTestContactFooterPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on button1InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "get a quote" on "button1InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InFirstSection
    And I verify "data-event" attribute is "site interaction" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | contact racv test city club" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "button2InFirstSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InSecondSection
    And I verify "data-event" attribute is "site interaction" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | enquire about booking your wedding" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "find out more" on "button1InSecondSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button1InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an wedding insurance claim" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 13 13" on "button1InThirdSection" element on "aemTestContactFooterPublished" screen
    #Verify analytics attributes on button2InThirdSection
    And I verify "data-event" attribute is "site interaction" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-type" attribute is "link" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-location" attribute is "contact footer | need to make an wedding insurance claim" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen
    And I verify "data-description" attribute is "13 11 11" on "button2InThirdSection" element on "aemTestContactFooterPublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBContactFooterNoThirdSection
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Contact Footer visually in story book - 2 buttons in 1st section, main button in 2nd section, no 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=secondSectionButtons:1;showThirdSection:false;thirdSectionButtons:1&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterThirdSection
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Contact Footer visually in story book - 2 buttons in 1st section, main button in 2nd section, contact button in 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=secondSectionButtons:1;thirdSectionButtons:2&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterNoThirdSection
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Contact Footer (club theme) visually in story book - 2 buttons in 1st section, main button in 2nd section, no 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=secondSectionButtons:1;showThirdSection:false;thirdSectionButtons:1&id=components-contact-footer--contact-footer-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterThirdSection
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Contact Footer (club theme) visually in story book - 2 buttons in 1st section, main button in 2nd section, contact button in 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=secondSectionButtons:1;thirdSectionButtons:2&id=components-contact-footer--contact-footer-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterTAndENoThirdSection
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Contact Footer Travel and experience variation visually in story book - 2 buttons in 1st section, main button in 2nd section, no 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=variation:productaction;secondSectionButtons:1;showThirdSection:false;thirdSectionButtons:2&globals=&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterTAndEThirdSection
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Contact Footer Travel and experience variation visually in story book - 2 buttons in 1st section, main button in 2nd section, contact button in 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=variation:productaction;secondSectionButtons:1;thirdSectionButtons:2&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterTAndENoThirdSection
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Contact Footer Travel and experience variation (club theme) visually in story book - 2 buttons in 1st section, main button in 2nd section, no 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=variation:productaction;secondSectionButtons:1;showThirdSection:false;thirdSectionButtons:2&globals=theme:club&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBContactFooterTAndEThirdSection
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Contact Footer Travel and experience variation (club theme) visually in story book - 2 buttons in 1st section, main button in 2nd section, contact button in 3rd section
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=variation:productaction;secondSectionButtons:1;thirdSectionButtons:2&globals=theme:club&id=components-contact-footer--contact-footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"