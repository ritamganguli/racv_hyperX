Feature: This feature tests the Solar Calculator component in AEM authoring

  @TestAuthoringSolarCalculator-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author solar calculator component, publish and verify dispatcher
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
    And I enter "test-automation-solar-calculator-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-solar-calculator-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Solar Calculator Authoring"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add Container component
    When I enter "Solar Calculator" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "solarCalculatorResult" on "aemInsertNewComponent" screen
    And I wait for "solarCalculatorResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I refresh the page
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure solar calculator component
    When I click "solarCalculatorInTree" on "aemTestSolarCalculatorPage" screen
    And I click "configureButton" on "aemTestSolarCalculatorPage" screen
    And I take a screenshot
    And I click "configurationTab" on "aemSolarCalculatorComponentDialog" screen
    Then I enter "/content/dam/racv-assets/config/solar/solar-data.csv" details in "csvFile" on "aemSolarCalculatorComponentDialog" screen
    And I verify "energyUseHeading" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "energyUseTooltip" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "sysSizeHeading" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "costLabel" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "savingsLabel" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "energySavingsLabel" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I verify "energyMeasurementLabel" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I enter "*This is just a general guide" details in "disclaimer" on "aemSolarCalculatorComponentDialog" screen
    And I verify "buttonLabel" field contains a value on "aemSolarCalculatorComponentDialog" screen
    And I enter "/content/racv/en/home" details in "buttonLink" on "aemSolarCalculatorComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSolarCalculatorComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSolarCalculatorComponentDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-solar-calculator-RANDOM[0-8]-p3.html"
    When I wait for "energyUseHeading" on "aemTestSolarCalculatorPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "energyUseHeading" element exists on "aemTestSolarCalculatorPagePublished" screen
    And I verify "energyUse2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Flow 1
    When I click "getQuoteButton" on "aemTestSolarCalculatorPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-solar-calculator-RANDOM[0-8]-p3.html"
    #Flow 2
    When I click "energyUse1" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    #Flow 3
    When I click "systemSize4" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize4Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    #Flow 4
    When I click "energyUse3" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    And I click "systemSize2" on "aemTestSolarCalculatorPagePublished" screen
    And I verify "energyUse3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    And I click "getQuoteButton" on "aemTestSolarCalculatorPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot

  @TestPublishSolarCalc-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Solar Calc post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-solar-calculator-p3.html"
    When I wait for "energyUseHeading" on "aemTestSolarCalculatorPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "energyUseHeading" element exists on "aemTestSolarCalculatorPagePublished" screen
    And I verify "energyUse2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Flow 1
    When I click "getQuoteButton" on "aemTestSolarCalculatorPagePublished" screen
    Then I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-solar-calculator-p3.html"
    #Flow 2
    When I click "energyUse1" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    #Flow 3
    When I click "systemSize4" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse1Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize4Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    #Flow 4
    When I click "energyUse3" on "aemTestSolarCalculatorPagePublished" screen
    Then I verify "energyUse3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    And I click "systemSize2" on "aemTestSolarCalculatorPagePublished" screen
    And I verify "energyUse3Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I verify "systemSize2Selected" element is visible on "aemTestSolarCalculatorPagePublished" screen
    And I take a screenshot
    And I click "getQuoteButton" on "aemTestSolarCalculatorPagePublished" screen
    And I capture the address navigated to
    And I check page address is "URL/"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |