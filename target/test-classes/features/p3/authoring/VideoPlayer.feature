#Author: Dheebanraj M
Feature: This feature tests the video player component in AEM authoring and storybook

  @TestAuthoringVideoPlayer-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsEventsAuthoring-p3
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to create new page, add video component and configure, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-video-player-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-video-player-RANDOM[0-8]-p3.html"
    When I wait for "addComponentsRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
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
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Search and add video component
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "video" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "videoResult" on "aemInsertNewComponent" screen using Action class
    And I wait for "videoResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    #Configure video player component
    ###############
    ## NODE
    ###############
    And I create a new test log node "Video player config"
    When I click "video" on "aemTestVideoPlayerPage" screen
    And I click "configureButton" on "aemTestVideoPlayerPage" screen
    #Configuration tab and layout tab
    And I click "confirgurationsTab" on "aemVideoComponentDialog" screen
    And I click "videoThumbnailImageField" on "aemVideoComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/banner-XL-L-720x540.jpg" details in "videoThumbnailImageField" on "aemVideoComponentDialog" screen
    And I click "youtubeVideoPathField" on "aemVideoComponentDialog" screen
    And I enter "https://www.youtube.com/watch?v=JhlI825_rqI" details in "youtubeVideoPathField" on "aemVideoComponentDialog" screen
    And I click "videoTitle" on "aemVideoComponentDialog" screen
    And I enter "RACV Torquay Resort" details in "videoTitle" on "aemVideoComponentDialog" screen
    And I click "videoRunTime" on "aemVideoComponentDialog" screen
    And I enter "0:15" details in "videoRunTime" on "aemVideoComponentDialog" screen
    And I take a screenshot
    And I click "layoutTab" on "aemVideoComponentDialog" screen
    And I verify "targetDivIdValue" element exists on "aemVideoComponentDialog" screen
    And I click "doneButton" on "aemVideoComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemVideoComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-video-player-RANDOM[0-8]-p3.html"
    And I wait for "videoComponent" on "aemTestVideoPlayerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "videoComponent" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoTitle" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoDurationIcon" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoDuration" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "playButton" element exists on "aemTestVideoPlayerPublished" screen
    #And I take a lambda snapshot "video snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Start - first press play button then check analytics
    And I click "playButton" on "aemTestVideoPlayerPublished" screen
    And I get object data for "digitalData"
    Then I verify "$.video.videoInfo.title" value equals "racv torquay resort" for "digitalData"
    And I verify "$.video.videoInfo.player" value equals "youtube" for "digitalData"
    And I verify "$.video.videoInfo.progress" value contains "" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "video-navigate" for "digitalData"
    ##And I take a lambda snapshot "video modal snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot
    #Video is finished playing when the replay button appears - check analytics
    When I wait for "replayButton" on "aemTestVideoPlayerPublished" screen or "90" seconds before proceeding
    And I get object data for "digitalData"
    And I click "crossButton" on "aemTestVideoPlayerPublished" screen
    Then I verify "$.video.videoInfo.title" value equals "racv torquay resort" for "digitalData"
    And I verify "$.video.videoInfo.player" value equals "youtube" for "digitalData"
    And I verify "$.video.videoInfo.progress" value equals "100" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "video-navigate" for "digitalData"
    And I wait for "playButton" on "aemTestVideoPlayerPublished" screen or "30" seconds before proceeding
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishVideoPlayer-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Video player post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-video-player-p3.html"
    And I wait for "videoComponent" on "aemTestVideoPlayerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "videoComponent" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoTitle" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoDurationIcon" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "videoDuration" element exists on "aemTestVideoPlayerPublished" screen
    And I verify "playButton" element exists on "aemTestVideoPlayerPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "video snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Start - first press play button then check analytics
    And I click "playButton" on "aemTestVideoPlayerPublished" screen
    And I get object data for "digitalData"
    Then I verify "$.video.videoInfo.title" value equals "racv torquay resort" for "digitalData"
    And I verify "$.video.videoInfo.player" value equals "youtube" for "digitalData"
    And I verify "$.video.videoInfo.progress" value contains "" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "video-navigate" for "digitalData"
    And I take a lambda snapshot with "<theme>" appended named "video modal snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I take a screenshot
    #Video is finished playing when the replay button appears - check analytics
    When I wait for "replayButton" on "aemTestVideoPlayerPublished" screen or "90" seconds before proceeding
    And I get object data for "digitalData"
    And I click "crossButton" on "aemTestVideoPlayerPublished" screen
    Then I verify "$.video.videoInfo.title" value equals "racv torquay resort" for "digitalData"
    And I verify "$.video.videoInfo.player" value equals "youtube" for "digitalData"
    And I verify "$.video.videoInfo.progress" value equals "100" for "digitalData"
    And I verify "$.event[1].eventAction" value equals "video-navigate" for "digitalData"
    And I wait for "playButton" on "aemTestVideoPlayerPublished" screen or "30" seconds before proceeding
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBVideoWithTitle
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify video player component with title in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=playTime:&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBVideoWithTimeDuration
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify video player component with time duration in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;playTime:02%2041&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextVideoWithBothTitleAndTimeDuration
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify video player component with title and time duration in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=playTime:02%2041&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "playButton" on "storybookVideoPlayer" screen
    #And I take a screenshot
    #And I take a lambda snapshot "video modal snapshot" "hide-gdpr"
    #And I click "crossButton" on "storybookVideoPlayer" screen
    #And I take a screenshot

  @TestSBTextVideoWithoutTitleAndTimeDuration
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify video player component without title and time duration in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;playTime:&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBVideoWithTitle
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify video player component with title (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=playTime:&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBVideoWithTimeDuration
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify video player component with time duration (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;playTime:02%2041&id=components-video--video-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBTextVideoWithBothTitleAndTimeDuration
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify video player component with title and time duration (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=playTime:02%2041&id=components-video--video-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "playButton" on "storybookVideoPlayer" screen
    #And I take a screenshot
    #And I take a lambda snapshot "video modal snapshot" "hide-gdpr"
    #And I click "crossButton" on "storybookVideoPlayer" screen
    #And I take a screenshot

  @TestSBTextVideoWithoutTitleAndTimeDuration
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify video player component without title and time duration (club theme) in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;playTime:&id=components-video--video-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"