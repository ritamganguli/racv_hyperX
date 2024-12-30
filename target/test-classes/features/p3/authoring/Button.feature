#Author: Viengcumm Thongvilu
#Date Created : 05 Sep 22
Feature: This feature tests the Button in AEM authoring and storybook

  @TestAuthoringButton-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add 6 button components and configure, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-button-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring buttons"
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    Then I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Search and add 6 button component with text inbetween to space it out
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    When I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "button" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "buttonResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "buttonResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure the 6 buttons
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 1 config"
    #configure button 1 - Primary no icon
    Then I click "button1Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    #Enter internal link
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    #Accessibility tab
    When I click "accessibilityTab" on "aemButtonComponentDialog" screen
    And I enter "test button accessibility label" details in "labelField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #configure button 2 - Secondary before text icon
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 2 config"
    And I click "button2Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter external link
    And I enter "https://www.racv.com.au/insurance" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Button 2" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I wait for "openInDropDown" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #configure button 3 - Ghost after text icon
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 3 config"
    And I click "button3Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter internal link
    Then I enter "/content/racv/en/home/insurance" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Button 3" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Ghost" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "After Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #configure button 4 - Primary no label with icon
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 4 config"
    And I click "button4Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter external link
    And I enter "https://www.google.com" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Accessibility tab
    When I click "accessibilityTab" on "aemButtonComponentDialog" screen
    And I enter "no text button accessibility label" details in "labelField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure button 5 - Primary mailto button
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 5 config"
    And I click "button5Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter mailto link
    And I enter "mailto:HomeServAdmin@racv.com.au" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Button 5" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    Then I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I take a screenshot
    #Configure button 6 - Secondary tel button
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button 6 config"
    And I click "button6Component" on "aemTestButtonPage" screen
    And I click "configureButton" on "aemTestButtonPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    #Enter Tel number
    And I enter "tel:137228" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Button 6" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    And I wait for "button1" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    #xpath contain id, classes, aria-label etc checks
    Then I verify "button1" element exists on "aemButtonPagePublished" screen
    And I verify "button2" element exists on "aemButtonPagePublished" screen
    And I verify "button3" element exists on "aemButtonPagePublished" screen
    And I verify "button4" element exists on "aemButtonPagePublished" screen
    And I verify "button5" element exists on "aemButtonPagePublished" screen
    And I verify "button6" element exists on "aemButtonPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot
    And I verify page is accessibility compliant
    #Verify FDV button
    When I click "button1Interactable" on "aemButtonPagePublished" screen
    And I check the page address contains "/royalauto.html?int_cam=test-analytics-parameter#test-hash-tag"
    And I switch to "new" browser tab
    Then I check the page address contains "google.com"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    And I wait for "button2" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button2Interactable" on "aemButtonPagePublished" screen
    And I switch to "new" browser tab
    Then I check the page address contains "https://www.racv.com.au/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    And I wait for "button3" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button3Interactable" on "aemButtonPagePublished" screen
    Then I check the page address contains "/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    And I wait for "button4" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button4Interactable" on "aemButtonPagePublished" screen
    Then I check the page address contains "google.com"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/test-automation-button-RANDOM[0-8]-p3.html"
    When I wait for "button6" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on button6Interactable
    And I verify "data-event" attribute is "site interaction" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-type" attribute is "link" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-location" attribute is "button" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-description" attribute is "button 6" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I click "button6Interactable" on "aemButtonPagePublished" screen
    Then I take a screenshot

  @TestPublishButton-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Button post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-button-p3.html"
    And I wait for "button1" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    #xpath contain id, classes, aria-label etc checks
    Then I verify "button1" element exists on "aemButtonPagePublished" screen
    And I verify "button2" element exists on "aemButtonPagePublished" screen
    And I verify "button3" element exists on "aemButtonPagePublished" screen
    And I verify "button4" element exists on "aemButtonPagePublished" screen
    And I verify "button5" element exists on "aemButtonPagePublished" screen
    And I verify "button6" element exists on "aemButtonPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot
    And I verify page is accessibility compliant
    #Verify FDV button
    When I click "button1Interactable" on "aemButtonPagePublished" screen
    And I check the page address contains "/royalauto.html?int_cam=test-analytics-parameter#test-hash-tag"
    And I switch to "new" browser tab
    Then I check the page address contains "google.com"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-button-p3.html"
    And I wait for "button2" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button2Interactable" on "aemButtonPagePublished" screen
    And I switch to "new" browser tab
    Then I check the page address contains "https://www.racv.com.au/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-button-p3.html"
    And I wait for "button3" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button3Interactable" on "aemButtonPagePublished" screen
    Then I check the page address contains "/insurance.html"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-button-p3.html"
    And I wait for "button4" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    And I click "button4Interactable" on "aemButtonPagePublished" screen
    Then I check the page address contains "google.com"
    And I take a screenshot
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-button-p3.html"
    When I wait for "button6" on "aemButtonPagePublished" screen or "10" seconds before proceeding
    #Verify analytics attributes on button6Interactable
    And I verify "data-event" attribute is "site interaction" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-type" attribute is "link" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-location" attribute is "button" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I verify "data-description" attribute is "button 6" on "button6Interactable" element on "aemButtonPagePublished" screen
    And I click "button6Interactable" on "aemButtonPagePublished" screen
    Then I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBButton1
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 1 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:left;quickExit[0]:quickExitClass&id=atom-button--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton2
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 2 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:right;quickExit[0]:quickExitClass&id=atom-button--secondary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 3 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;quickExit[0]:quickExitClass&id=atom-button--ghost&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton4
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 4 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=label:;iconLocation:left;buttonSize:extraLarge&id=atom-button--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton5
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 5 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;buttonSize:extraLarge&id=atom-button--secondary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton6
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 6 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;buttonSize:extraLarge;reversed:reverse&id=atom-button--ghost&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton7
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 7 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;disabled[0]:disabled;buttonSize:small&id=atom-button--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton8
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 8 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;disabled[0]:disabled;buttonSize:small&id=atom-button--secondary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton9
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 9 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;disabled[0]:disabled;buttonSize:small&id=atom-button--ghost&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton10
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 10 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;iconSize:small;buttonSize:small&id=atom-button--primary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton11
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 11 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;iconSize:small;buttonSize:small&id=atom-button--secondary&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton12
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify button test 12 on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;iconSize:small;buttonSize:small;reversed:reversed-yellow&id=atom-button--ghost&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton1
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 1 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:left;quickExit[0]:quickExitClass&id=atom-button--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton2
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 2 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:right;quickExit[0]:quickExitClass&id=atom-button--secondary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 3 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;quickExit[0]:quickExitClass&id=atom-button--ghost&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton4
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 4 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=label:;iconLocation:left;buttonSize:extraLarge&id=atom-button--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton5
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 5 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;buttonSize:extraLarge&id=atom-button--secondary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton6
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 6 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;buttonSize:extraLarge;reversed:reverse&id=atom-button--ghost&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton7
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 7 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;disabled[0]:disabled;buttonSize:small&id=atom-button--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton8
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 8 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;disabled[0]:disabled;buttonSize:small&id=atom-button--secondary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton9
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 9 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;disabled[0]:disabled;buttonSize:small&id=atom-button--ghost&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton10
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 10 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;iconSize:small;buttonSize:small&id=atom-button--primary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton11
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 11 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=TargetLocation:true;iconLocation:right;iconSize:small;buttonSize:small&id=atom-button--secondary&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"

  @TestSBButton12
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify button test 12 (club theme) on Storybook according to matrix
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconLocation:left;iconSize:small;buttonSize:small;reversed:reversed-yellow&id=atom-button--ghost&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main" "hide-gdpr"