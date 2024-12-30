#Author: Jing Zuo
#Date Created : 09 Jan 23
Feature: This feature tests the AEM Experience Fragment in AEM authoring and storybook

  @TestAuthoringExperienceFragment-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  Scenario: Verify user is able to author Experience Fragment and verify published dispatcher component, accessibility and visually
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
    And I create a new test log node "Authoring EF"
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
    And I enter "test-automation-RANDOM[0-8]-p3-experience-fragment" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-experience-fragment/master.html"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Text component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "text" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    When I wait for "textComponent" on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I click "textComponent" on "aemTestCreationPage" screen
    And I click "editButton" on "aemTestCreationPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestCreationPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    And I enter "Experience Fragment" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Limit summary content to under 150 characters Alternative limit to no more than 2 short sentences which should be short and succinct with a clear cta" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I take a screenshot
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestCreationPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCreationPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Click Style button
    When I click "stylesButton" on "aemExperienceFragmentCreation" screen
    And I take a screenshot
    Then I select "Small" value for "topSpacingStyleList" drop down in "aemExperienceFragmentCreation" screen using selection method "visibleText"
    And I take a screenshot
    And I select "Large" value for "bottomSpacingStyleList" drop down in "aemExperienceFragmentCreation" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemExperienceFragmentCreation" screen
    And I wait for "applyStyle" to disappear on "aemExperienceFragmentCreation" screen or "5" seconds before proceeding
    #Publish the EF
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
    And I create a new test log node "Authoring Page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-experience-fragment-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-experience-fragment-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure newly added container to fixed-width
    And I click "containerNonRoot1InTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Experience Fragment component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Experience Fragment" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "experienceFragmentResult" on "aemInsertNewComponent" screen
    And I wait for "experienceFragmentResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Experience Fragment component
    When I click "EFInTree" on "aemTestExperienceFragmentPage" screen
    And I click "configureButton" on "aemTestExperienceFragmentPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemExperienceFragmentComponentDialog" screen
    Then I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-experience-fragment/master" details in "variation" on "aemExperienceFragmentComponentDialog" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemExperienceFragmentComponentDialog" screen
    And I click "doneButton" on "aemExperienceFragmentComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemExperienceFragmentComponentDialog" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-experience-fragment-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "text" on "aemExperienceFragmentPublished" screen or "10" seconds before proceeding
    And I verify "text" element exists on "aemExperienceFragmentPublished" screen
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

  @TestPublishExperienceFragment-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Experience fragment post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-experience-fragment-p3.html"
    #Post publish checks
    And I wait for "text" on "aemExperienceFragmentPublished" screen or "10" seconds before proceeding
    And I verify "text" element exists on "aemExperienceFragmentPublished" screen
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant

    Examples:
      | theme |
      | base  |
      | club  |