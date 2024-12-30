#Author: Jing Zuo
Feature: This feature tests the Trades Search Widget in AEM authoring and storybook

  @TestAuthoringTradesWidget-Postcode-Only-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author trades search widget component postcode only variant and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-trades-widget-postcode-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-trades-widget-postcode-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Trades Search" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "RACV Trades" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Find a trusted, local tradie to help with emergencies and everyday household repairs and maintenance" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/racv-step-inspection-trades-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/locksmith-repair-front-door-1600x900.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "trades search widget" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I enter "https://my.racv.com.au/trades/s/trades-quotes" details in "urlPath" on "aemHeroBannerComponentDialog" screen
    And I enter "Get a quote" details in "buttonLabel" on "aemHeroBannerComponentDialog" screen
    And I click "enablePostcodeSearch" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "defaultTrade" on "aemHeroBannerComponentDialog" screen
    And I select "Plumbing" value for "defaultTradeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I verify "postcodeLabel" field contains a value on "aemHeroBannerComponentDialog" screen
    And I verify "postcodePlaceholder" field contains a value on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-trades-widget-postcode-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "heading" on "aemTestTradesWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "heading" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "description" element is visible on "aemTestTradesWidgetPagePublished" screen
    #Verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Failed due to https://racvone.atlassian.net/browse/AP3-3399
    #And I verify page is accessibility compliant
    #Click submit and verify required field error states
    When I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I verify "postcodeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter 2000 and verify invalid postcode error states
    And I enter "2000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "postcodeInvalidError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3999 and verify RACV trades not available error states
    And I refresh the page
    And I enter "3999" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "noTradesProductError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3000 and select result
    And I refresh the page
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I wait for "getQuoteButton" to disappear on "aemTestTradesWidgetPagePublished" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Plumbing&postCode=3000%2C%20Melbourne"
    And I take a screenshot

  @TestPublishTradeWidget-Postcode-Only-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Trade widget postcode only post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-trades-widget-postcode-p3.html"
    #Post publish checks
    When I wait for "heading" on "aemTestTradesWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "heading" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "description" element is visible on "aemTestTradesWidgetPagePublished" screen
    #Verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Failed due to https://racvone.atlassian.net/browse/AP3-3399
    #And I verify page is accessibility compliant
    #Click submit and verify required field error states
    When I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I verify "postcodeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter 2000 and verify invalid postcode error states
    And I enter "2000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "postcodeInvalidError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3999 and verify RACV trades not available error states
    And I refresh the page
    And I enter "3999" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "noTradesProductError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3000 and select result
    And I refresh the page
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I wait for "getQuoteButton" to disappear on "aemTestTradesWidgetPagePublished" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Plumbing&postCode=3000%2C%20Melbourne"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringTradesWidget-Postcode-Trade-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author trades search widget component postcode and trade variant and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-trades-widget-postcode-trade-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-trades-widget-postcode-trade-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author hero banner"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Hero Banner
    When I click "heroBannerInTree" on "aemTestHeroBannerPage" screen
    And I click "configureButton" on "aemTestHeroBannerPage" screen
    And I click "configurationsTab" on "aemHeroBannerComponentDialog" screen
    And I click "bannerType" on "aemHeroBannerComponentDialog" screen
    And I select "Trades Search" value for "bannerTypeList" drop down in "aemHeroBannerComponentDialog" screen using selection method "visibleText"
    And I enter "RACV Trades" details in "heading" on "aemHeroBannerComponentDialog" screen
    And I enter "Find a trusted, local tradie to help with emergencies and everyday household repairs and maintenance" details in "description" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/racv-step-inspection-trades-1600x900.jpg" details in "desktopImage" on "aemHeroBannerComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/home/trades/1600x900/locksmith-repair-front-door-1600x900.jpg" details in "tabletImage" on "aemHeroBannerComponentDialog" screen
    And I enter "trades search widget" details in "altTextImage" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I enter "https://my.racv.com.au/trades/s/trades-quotes" details in "urlPath" on "aemHeroBannerComponentDialog" screen
    And I enter "Get a quote" details in "buttonLabel" on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I verify "postcodeLabel" field contains a value on "aemHeroBannerComponentDialog" screen
    And I verify "postcodePlaceholder" field contains a value on "aemHeroBannerComponentDialog" screen
    And I verify "tradeLabel" field contains a value on "aemHeroBannerComponentDialog" screen
    And I verify "tradePlaceholder" field contains a value on "aemHeroBannerComponentDialog" screen
    And I verify "tradeFieldDropdown" field contains a value on "aemHeroBannerComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemHeroBannerComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHeroBannerComponentDialog" screen or "5" seconds before proceeding
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-trades-widget-postcode-trade-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "heading" on "aemTestTradesWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "heading" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "description" element is visible on "aemTestTradesWidgetPagePublished" screen
    #Verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "tradePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Failed due to https://racvone.atlassian.net/browse/AP3-3399
    #And I verify page is accessibility compliant
    #Click submit and verify error states
    When I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I verify "postcodeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "tradeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3000 and select result
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter abcd and verify trade field no result error states
    And I enter "abcd" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "tradeNoResultError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter carpentry and verify unavailable trade in postcode error states
    And I enter "3825" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I enter "carpentry" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I wait for "noTradeInPostcodeError" on "aemTestTradesWidgetPagePublished" screen or "30" seconds before proceeding
    And I verify "noTradeInPostcodeError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter drain and select first result
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I enter "drain" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I wait for "getQuoteButton" to disappear on "aemTestTradesWidgetPagePublished" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Plumbing&postCode=3000%2C%20Melbourne"
    And I take a screenshot

  @TestPublishTradeWidget-Potscode-Trade-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Trade widget postcode trade post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-trades-widget-postcode-trade-p3.html"
    #Post publish checks
    When I wait for "heading" on "aemTestTradesWidgetPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "heading" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "description" element is visible on "aemTestTradesWidgetPagePublished" screen
    #Verify place holder text
    And I verify "postcodePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "tradePlaceHolder" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr" "enable-js"
    #Failed due to https://racvone.atlassian.net/browse/AP3-3399
    #And I verify page is accessibility compliant
    #Click submit and verify error states
    When I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I verify "postcodeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I verify "tradeInputError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter 3000 and select result
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Enter abcd and verify trade field no result error states
    And I enter "abcd" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I verify "tradeNoResultError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter carpentry and verify unavailable trade in postcode error states
    And I enter "3825" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I enter "carpentry" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I verify "noTradeInPostcodeError" element is visible on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I refresh the page
    #Enter drain and select first result
    And I enter "3000" details in "postcodeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "postcodeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I enter "drain" details in "tradeInput" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    And I click "tradeFirstResult" on "aemTestTradesWidgetPagePublished" screen
    And I take a screenshot
    #Click get a quote and ensure redirect to MOA
    Then I click "getQuoteButton" on "aemTestTradesWidgetPagePublished" screen
    And I wait for "getQuoteButton" to disappear on "aemTestTradesWidgetPagePublished" screen or "30" seconds before proceeding
    And I check the page address contains "/trades/s/trades-quotes?category=Plumbing&postCode=3000%2C%20Melbourne"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBTradesWidget-p3
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify trades widget visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?id=components-trade-widget--trade-widget-story&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #postcode no result
    And I enter "2222" details in "postcodeField" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "postcode no result" "hide-gdpr"
    #postcode search
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    And I enter "3000" details in "postcodeField" on "storybookTradeWidget" screen
    #And I verify "postcodeResults" element exists on "storybookTradeWidget" screen
    And I wait for "postcodeResults" on "storybookTradeWidget" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I take a lambda snapshot "postcode box" "hide-gdpr"
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    #Trade default
    And I click "tradeField" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "trades default" "hide-gdpr"
    #Trade search no result
    When I enter "aergerg" details in "tradeField" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "trades search no result" "hide-gdpr"
    #Trade search
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    And I enter "drain" details in "tradeField" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "trades search" "hide-gdpr"
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    And I enter "keys:ESCAPE" details in "tradeField" on "storybookTradeWidget" screen
    #Error state
    When I click "getAQuoteButton" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "error state" "hide-gdpr"

  @TestSBTradesWidgetPostcodeVariant-p3
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify trades widget (postcode only variant) visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showTradeField:false&id=components-trade-widget--trade-widget-story&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #postcode no result
    And I enter "2222" details in "postcodeField" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "postcode no result" "hide-gdpr"
    #postcode search
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    And I enter "3000" details in "postcodeField" on "storybookTradeWidget" screen
    And I wait for "postcodeResults" on "storybookTradeWidget" screen or "5" seconds before proceeding
    And I take a screenshot
    Then I take a lambda snapshot "postcode box" "hide-gdpr"
    And I click "clearFieldButton" on "storybookTradeWidget" screen
    #Error state
    When I click "getAQuoteButton" on "storybookTradeWidget" screen
    And I take a screenshot
    Then I take a lambda snapshot "error state" "hide-gdpr"