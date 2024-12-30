#Author: Jing Zuo
Feature: This feature tests the Author Information component in AEM authoring and storybook

  @TestAuthoringAuthorInformation-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to test author information and its variants and verify published dispatcher component, accessibility and visually
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
    #Navigate to experience fragment to create a new XF
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create a new Experience Fragment"
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-social-share" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-social-share/master.html"
    ##############
    # NODE
    ##############
    And I create a new test log node "Author Social Share component"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Text component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Social Share" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "socialShareResult" on "aemInsertNewComponent" screen
    And I wait for "socialShareResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Social Share component
    When I wait for "socialShareInTree" on "aemExperienceFragmentsSocialShare" screen or "5" seconds before proceeding
    And I click "socialShareInTree" on "aemExperienceFragmentsSocialShare" screen
    And I wait for "configureButton" on "aemExperienceFragmentsSocialShare" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemExperienceFragmentsSocialShare" screen
    And I take a screenshot
    Then I click "configurationTab" on "aemSocialLinksComponentDialog" screen
    And I click "addButton" on "aemSocialLinksComponentDialog" screen
    And I click "service1" on "aemSocialLinksComponentDialog" screen
    And I select "Facebook" value for "service1List" drop down in "aemSocialLinksComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addButton" on "aemSocialLinksComponentDialog" screen
    And I click "service2" on "aemSocialLinksComponentDialog" screen
    And I select "Twitter" value for "service2List" drop down in "aemSocialLinksComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "addButton" on "aemSocialLinksComponentDialog" screen
    And I click "service3" on "aemSocialLinksComponentDialog" screen
    And I select "Linked In" value for "service3List" drop down in "aemSocialLinksComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    Then I click "doneButton" on "aemSocialLinksComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSocialLinksComponentDialog" screen or "5" seconds before proceeding
    #Publish the EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ##############
    # NODE
    ##############
    And I create a new test log node "Create a new page - Content Hub Article Page Template"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "contentHubArticlePageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    #Enter racv resorts primary tag
    And I enter "racv:resorts" details in "primaryTag" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "primaryTag" on "aemCreatePageWizard" screen
    And I take a screenshot
    #Enter page title
    And I enter "test-automation-author-information-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-author-information-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "basicTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-social-share/master/jcr:content/root/container/socialshare" details in "socialSharePath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "advancedTab" on "aemPageProperties" screen
    And I enter "Testing Author" details in "authorName" on "aemPageProperties" screen
    And I take a screenshot
    And I click "publishedDatepicker" on "aemPageProperties" screen
    #Select date from the second row and the third coloum of the calendar table
    And I click "selectedDate" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    #Publish test automation page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ##############
    # NODE
    ##############
    And I create a new test log node "Publish checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-author-information-RANDOM[0-8]-p3.html"
    And I dismiss GDPR notification if it exists
    And I verify "authorName" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "facebookIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "twitterIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "linkedinIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Verify analytics attributes on Facebook
    And I verify "data-event" attribute is "site interaction" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "facebook" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    #Verify analytics attributes on Twitter
    And I verify "data-event" attribute is "site interaction" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "twitter" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    #Verify analytics attributes on Linkedin
    And I verify "data-event" attribute is "site interaction" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "linked in" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen

  @TestPublishAuthorInformation-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Author Information post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-author-information-p3.html"
    And I dismiss GDPR notification if it exists
    And I verify "authorName" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "facebookIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "twitterIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I verify "linkedinIcon" element is visible on "aemTestAuthorInformationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Verify analytics attributes on Facebook
    And I verify "data-event" attribute is "site interaction" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "facebook" on "facebookIcon" element on "aemTestAuthorInformationPagePublished" screen
    #Verify analytics attributes on Twitter
    And I verify "data-event" attribute is "site interaction" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "twitter" on "twitterIcon" element on "aemTestAuthorInformationPagePublished" screen
    #Verify analytics attributes on Linkedin
    And I verify "data-event" attribute is "site interaction" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-type" attribute is "social share" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-location" attribute is "author information" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen
    And I verify "data-description" attribute is "linked in" on "linkedinIcon" element on "aemTestAuthorInformationPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBAuthorInformation
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Author Information on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-author-information--author-info-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBAuthorInformationHideSocialShare
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Author Information on storybook - no social share
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSocialShare:false&id=components-author-information--author-info-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBAuthorInformation
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Author Information (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-author-information--author-info-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBAuthorInformationHideSocialShare
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Author Information (club theme) on storybook - no social share
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSocialShare:false&id=components-author-information--author-info-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"