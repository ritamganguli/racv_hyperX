#Author: Jing Zuo
Feature: This feature tests the Loan Calculator component in AEM authoring and storybook

  @TestAuthoringLoanCalculator-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author loan calculator and its variants and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-loan-calculator-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-loan-calculator-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Add Loan Calculator component into root container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Loan Calculator" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "loanCalculatorResult" on "aemInsertNewComponent" screen
    And I wait for "loanCalculatorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Loan Calcultor"
    #Configure Loan Calculator component
    When I click "loanCalculatorInTree" on "aemTestLoanCalculatorPage" screen
    And I click "configureButton" on "aemTestLoanCalculatorPage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemLoanCalculatorComponentDialog" screen
    Then I enter "5000" details in "amountMinValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "100000" details in "amountMaxValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "25000" details in "amountDefaultValue" on "aemLoanCalculatorComponentDialog" screen
    And I take a screenshot
    And I enter "4" details in "rateMinValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "18" details in "rateMaxValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "7.29" details in "rateDefaultValue" on "aemLoanCalculatorComponentDialog" screen
    And I take a screenshot
    And I enter "1" details in "termMinValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "7" details in "termMaxValue" on "aemLoanCalculatorComponentDialog" screen
    And I enter "5" details in "termDefaultValue" on "aemLoanCalculatorComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/membership" details in "buttonLink" on "aemLoanCalculatorComponentDialog" screen
    And I enter "Apply Now" details in "buttonLabel" on "aemLoanCalculatorComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLoanCalculatorComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLoanCalculatorComponentDialog" screen or "2" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "20" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-loan-calculator-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen or "5" seconds before proceeding
    And I verify "loanAmountField" element exists on "aemTestLoanCalculatorPagePublished" screen
    #Accessibility check failed due to https://racvone.atlassian.net/browse/DAC-13948
    #And I verify page is accessibility compliant
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I click "fortnightlyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    Then I click "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "loanAmountField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter "0" details in "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I click "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "interestRateField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter ".9" details in "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    And I click "monthlyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on apply button
    And I verify "data-event" attribute is "site interaction" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-type" attribute is "button" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-location" attribute is "loan calculator" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-description" attribute is "apply now" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I click "applyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "/membership.html"

  @TestPublishLoanCalculator-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Loan calculator post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-loan-calculator-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen or "5" seconds before proceeding
    And I verify "loanAmountField" element exists on "aemTestLoanCalculatorPagePublished" screen
    #Accessibility check failed due to https://racvone.atlassian.net/browse/DAC-13948
    #And I verify page is accessibility compliant
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I click "fortnightlyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    Then I click "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "loanAmountField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter "0" details in "loanAmountField" on "aemTestLoanCalculatorPagePublished" screen
    And I click "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I clear contents of "interestRateField" element on "aemTestLoanCalculatorPagePublished" screen
    And I enter ".9" details in "interestRateField" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    And I click "monthlyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on apply button
    And I verify "data-event" attribute is "site interaction" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-type" attribute is "button" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-location" attribute is "loan calculator" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I verify "data-description" attribute is "apply now" on "applyButton" element on "aemTestLoanCalculatorPagePublished" screen
    And I click "applyButton" on "aemTestLoanCalculatorPagePublished" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check the page address contains "/membership.html"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBLoanCalculator
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Loan Calculator on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-loan-calculator--loan-calculator-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBLoanCalculator
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Loan Calculator (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-loan-calculator--loan-calculator-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"