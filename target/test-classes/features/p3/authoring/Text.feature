Feature: This feature tests the text component AEM authoring and storybook

  @TestAuthoringText-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add fixed-width container with text and use the various text features, publish and view the page in AEM then delete and page
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
    And I enter "test-automation-text-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-text-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring"
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
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text authoring"
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    #Go to text editor full screen
    Then I click "textFullscreenIcon" on "aemTestContainerPage" screen
    And I clear contents of "textFullscreenEditor" element on "aemTextFullscreenPage" screen
    #paragraph format
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "paraformatButton" on "aemTextFullscreenPage" screen
    And I click "heading1Format" on "aemTextFullscreenPage" screen
    And I wait for "heading1Format" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "paraformatButton" on "aemTextFullscreenPage" screen
    And I click "paraformat" on "aemTextFullscreenPage" screen
    #bold
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "boldButton" on "aemTextFullscreenPage" screen
    And I wait for "boldButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #italic
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "italicButton" on "aemTextFullscreenPage" screen
    And I wait for "italicButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #underline
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "underlineButton" on "aemTextFullscreenPage" screen
    And I wait for "underlineButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #subscript
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "subscriptButton" on "aemTextFullscreenPage" screen
    And I wait for "subscriptButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #superscript
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "superscriptButton" on "aemTextFullscreenPage" screen
    And I wait for "superscriptButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter " consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #center align
    And I click "centerAlignButton" on "aemTextFullscreenPage" screen
    And I wait for "centerAlignButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #right align
    And I click "rightAlignButton" on "aemTextFullscreenPage" screen
    And I wait for "rightAlignButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #justify text
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi." details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I click "justifyText" on "aemTextFullscreenPage" screen
    And I wait for "justifyText" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #left align
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi." details in "textFullscreenEditor" on "aemTextFullscreenPage" screen using Action class
    And I click "leftAlignButton" on "aemTextFullscreenPage" screen
    And I wait for "leftAlignButton" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #unordered list
    And I click "listUnordered" on "aemTextFullscreenPage" screen
    And I wait for "listUnordered" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listIndent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Aenean commodo ligula" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listIndent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listOutdent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listOutdent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #ordered list
    And I click "listOrdered" on "aemTextFullscreenPage" screen
    And I wait for "listOrdered" to disappear on "aemTextFullscreenPage" screen or "5" seconds before proceeding
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listIndent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Aenean commodo ligula" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listIndent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "consectetuer adipiscing elit" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listOutdent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "listOutdent" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I enter "keys:ENTER" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    #special char menu
    And I enter "Lorem ipsum dolor" details in "textFullscreenEditor" on "aemTextFullscreenPage" screen
    And I click "starButton" on "aemTextFullscreenPage" screen
    And I click "coprightChar" on "aemTextFullscreenPage" screen
    And I click "starButton" on "aemTextFullscreenPage" screen
    And I click "euroChar" on "aemTextFullscreenPage" screen
    And I click "starButton" on "aemTextFullscreenPage" screen
    And I click "registeredChar" on "aemTextFullscreenPage" screen
    And I click "starButton" on "aemTextFullscreenPage" screen
    And I click "tmChar" on "aemTextFullscreenPage" screen
    And I take a screenshot
    #verify spell check
    #Spell check errors not visible yet as we have not clicked spell check button
    And I verify "spellCheckErrors" element is not visible on "aemTextFullscreenPage" screen
    And I verify "noSpellCheckErrors" element is visible on "aemTextFullscreenPage" screen
    And I click "spellCheckButton" on "aemTextFullscreenPage" screen
    And I take a screenshot
    #Spell check errors should be highlighed now that we clicked the button
    And I verify "spellCheckErrors" element is visible on "aemTextFullscreenPage" screen
    And I verify "noSpellCheckErrors" element is not visible on "aemTextFullscreenPage" screen
    And I take a screenshot
    #Save and exit
    And I click "exitTextFullscreenIcon" on "aemTextFullscreenPage" screen
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-text-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I wait for "text" on "aemTestTextPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "text" element exists on "aemTestTextPagePublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishText-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Text post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-text-p3.html"
    #Post publish checks
    And I wait for "text" on "aemTestTextPagePublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "text" element exists on "aemTestTextPagePublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBText
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify various text on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--default&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedCross
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify text cross unordered list on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--cross&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedTick
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify text tick unordered list on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--tick&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedDefault
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify text default unordered list on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--unordered&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLink
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify text link with none link type on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-link--text-link-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkArrow
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text link with arrow link type on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:ArrowRight&id=atom-text-link--text-link-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkExternal
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text link with external link type on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:Launch&id=atom-text-link--text-link-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkDownload
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify text link with download link type on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:DownloadSolid&id=atom-text-link--text-link-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBText
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify various text on (club theme) storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--default&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedCross
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text cross unordered list (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--cross&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedTick
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text tick unordered list (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--tick&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextUnorderedDefault
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text default unordered list (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-component--unordered&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLink
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text link with none link type (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-text-link--text-link-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkArrow
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text link with arrow link type (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:ArrowRight&id=atom-text-link--text-link-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkExternal
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text link with external link type (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:Launch&id=atom-text-link--text-link-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"

  @TestSBTextLinkDownload
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify text link with download link type (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=iconType:DownloadSolid&id=atom-text-link--text-link-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "page" "hide-gdpr"