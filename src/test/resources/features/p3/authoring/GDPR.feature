#Author: Viengcumm Thongvilu
Feature: This feature tests the GDPR in AEM authoring and storybook

  @TestAuthoringGDPR-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author GDPR with a link and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-gdpr-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-gdpr-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "gdprTab" on "aemPageProperties" screen
    And I click "gdprBody" on "aemPageProperties" screen
    And I update "gdprBody" innerHTML to '<a href="/content/racv/en/home/about-racv/corporate-governance/legal/privacy-charter.html" _rte_href="/content/racv/en/home/about-racv/corporate-governance/legal/privacy-charter.html">Privacy Charter</a>' on "aemPageProperties" screen
    And I take a screenshot
    And I click "enableGdpr" on "aemPageProperties" screen
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-gdpr-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "gdprText" on "aemTestGDPRPublished" screen or "5" seconds before proceeding
    And I verify "gdprText" element is visible on "aemTestGDPRPublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, normalize-template-hero-banner-h1"
    Then I click "hyperLink" on "aemTestGDPRPublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/about-racv/corporate-governance/legal/privacy-charter.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-gdpr-RANDOM[0-8]-p3.html"
    And I wait for "gdprText" on "aemTestGDPRPublished" screen or "5" seconds before proceeding
    Then I click "acceptButton" on "aemTestGDPRPublished" screen
    And I verify "gdprText" element is not visible on "aemTestGDPRPublished" screen
    And I take a screenshot

  @TestPublishGDPR-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Accordion post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-gdpr-p3.html"
    #Post publish checks
    When I wait for "gdprText" on "aemTestGDPRPublished" screen or "5" seconds before proceeding
    And I verify "gdprText" element is visible on "aemTestGDPRPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, normalize-template-hero-banner-h1"
    Then I click "hyperLink" on "aemTestGDPRPublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "URL/about-racv/corporate-governance/legal/privacy-charter.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-gdpr-p3.html"
    And I wait for "gdprText" on "aemTestGDPRPublished" screen or "5" seconds before proceeding
    Then I click "acceptButton" on "aemTestGDPRPublished" screen
    And I verify "gdprText" element is not visible on "aemTestGDPRPublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBGDPR
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify GDPR with link on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-gdpr--gdpr-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot"

  @TestSBGDPR
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify GDPR (club theme) with link on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-gdpr--gdpr-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot"