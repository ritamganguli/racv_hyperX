#Author: Vaishnavi Avadhanula
#Date: 26 June 2023
Feature: This feature tests the Embed component in AEM authoring and publisher

  @TestAuthoringEmbedComponent-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author all Embed component variants and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-embed-component-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-embed-component-RANDOM[0-8]-p3.html"
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
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
    And I create a new test log node "Authoring Embod components"
    #Add  Embed component 1 into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Embed" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "embedResult" on "aemInsertNewComponent" screen
    And I wait for "embedResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Add  Embed component 2 into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Embed" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "embedResult" on "aemInsertNewComponent" screen
    And I wait for "embedResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Add  Embed component 3 into Container
    When I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Embed" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "embedResult" on "aemInsertNewComponent" screen
    And I wait for "embedResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure embed component 1"
    #Youtube Fixed Layout
    #Configure Embed  component first : Youtube
    When I click "firstEmbed" on "aemTestEmbedcomponentPage" screen
    And I click "configureButton" on "aemTestEmbedcomponentPage" screen
    And I take a screenshot
    And I click "embedDropdown" on "aemEmbedComponentDialog" screen
    And I select "YouTube" value for "openInResultsYoutubeEmbed" drop down in "aemEmbedComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "videoID" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "wSHVyT2EtLw" details in "videoID" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I click "youtubeWidth" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "200" details in "youtubeWidth" on "aemEmbedComponentDialog" screen using JavaScript
    #And I click "radioButtonResponsive" on "aemTestEmbedcomponentPage" screen
    And I take a screenshot
    And I click "youtubeHeight" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "300" details in "youtubeHeight" on "aemEmbedComponentDialog" screen using JavaScript
    And I take a screenshot
    And I click "doneButton" on "aemEmbedComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemEmbedComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure embed component 2"
    #Youtube Responsive Layout
    #Configure Embed  component2 : Responsive
    When I click "secondEmbed" on "aemTestEmbedcomponentPage" screen
    And I click "configureButton" on "aemTestEmbedcomponentPage" screen
    And I take a screenshot
    And I click "embedDropdown" on "aemEmbedComponentDialog" screen
    And I select "YouTube" value for "openInResultsYoutubeEmbed" drop down in "aemEmbedComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "radioButtonResponsive" on "aemEmbedComponentDialog" screen using JavaScript
    And I click "videoID" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "wSHVyT2EtLw" details in "videoID" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I click "youtubeAspectRatio" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "2" details in "youtubeAspectRatio" on "aemEmbedComponentDialog" screen using JavaScript
    And I take a screenshot
    And I click "doneButton" on "aemEmbedComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemEmbedComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure embed component 3"
    #Embed Iframe
    #Configure Embed  component3 : iframe
    When I click "lastEmbed" on "aemTestEmbedcomponentPage" screen
    And I click "configureButton" on "aemTestEmbedcomponentPage" screen
    And I take a screenshot
    And I click "embedDropdown" on "aemEmbedComponentDialog" screen
    And I select "Iframe" value for "openInResultsYoutubeEmbed" drop down in "aemEmbedComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "url" on "aemEmbedComponentDialog" screen
    And I enter "https://data.aaa.asn.au/visualisation/victoria-costs-q4-2021/" details in "url" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "400" details in "iframeWidth" on "aemEmbedComponentDialog" screen using JavaScript
    And I take a screenshot
    And I click "iframeHeight" on "aemEmbedComponentDialog" screen
    And I take a screenshot
    And I enter "500" details in "iframeHeight" on "aemEmbedComponentDialog" screen using JavaScript
    And I click "doneButton" on "aemEmbedComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemEmbedComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    And I click "contentTreeButton" on "aemEditorPage" screen
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-embed-component-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "playButton1" on "aemTestEmbedPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "playButton1" element exists on "aemTestEmbedPagePublished" screen
    And I verify "playButton2" element exists on "aemTestEmbedPagePublished" screen
    And I verify "iframe3" element exists on "aemTestEmbedPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot

  @TestPublishEmbed-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Embed post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-embed-component-p3.html"
    #Post publish checks
    And I wait for "playButton1" on "aemTestEmbedPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "playButton1" element exists on "aemTestEmbedPagePublished" screen
    And I verify "playButton2" element exists on "aemTestEmbedPagePublished" screen
    And I verify "iframe3" element exists on "aemTestEmbedPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |