#Author: Viengcumm Thongvilu
#Date created - 07 Apr 2020
Feature: This feature tests the Accordion component and it's variants from authoring regression perspective.

  #VT 07 Apr 2020 DAC-6872
  #Dry run completed on 09 Apr 2021
  @TestAccordionComponentVariants
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add canvas and accordion component, publish, edit accordion variant and republish and verify published changes
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #select page
    And I click "createPageOption" on "aemLandingPage" screen
    #select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-accordion-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-accordion-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Side panel
    And I click "sidePanelButton" on "aemAccordionCompPage" screen
    And I click "contentTreeButton" on "aemAccordionCompPage" screen
    #select canvas and click add component
    And I click "canvasParsys" on "aemAccordionCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add accordion component
    And I enter "accordion" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "accordionOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "accordionOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure accordion
    And I click "contentTreeAccordion" on "aemAccordionCompPage" screen
    And I click "configureAccordionButton" on "aemAccordionCompPage" screen
    #Configuration tab
    And I click "configurationTab" on "aemAccordionCompDialog" screen
    And I select "Default" value for "accordionLayout" drop down in "aemAccordionCompDialog" screen using selection method "visibleText"
    And I clear contents of "accordionTitle" element on "aemAccordionCompDialog" screen
    And I enter "My title" details in "accordionTitle" on "aemAccordionCompDialog" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemAccordionCompDialog" screen
    And I verify "targetDivField" field contains a value on "aemAccordionCompDialog" screen
    #Save Changes
    And I click "saveChangesButton" on "aemAccordionCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemAccordionCompDialog" screen or "5" seconds before proceeding
    #edit RTE
    And I click "accordionRTE" on "aemAccordionCompPage" screen
    And I click "editRteComponentIcon" on "aemAccordionCompPage" screen
    And I switch "to" iFrame "editRteIFrame" on "aemAccordionCompPage" screen
    And I enter "Test " details in "rteComponentEditor" on "aemAccordionCompPage" screen
    And I switch "from" iFrame "rteComponentEditor" on "aemAccordionCompPage" screen
    And I click "rteEditorSaveIcon" on "aemAccordionCompPage" screen
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-accordion-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "myTitle" element exists on "aemAccordionPublished" screen
    And I verify "accordionCompressed" element exists on "aemAccordionPublished" screen
    And I click "accordionCompressed" on "aemAccordionPublished" screen
    And I verify "accordionContent" element exists on "aemAccordionPublished" screen
    And I take a screenshot
    #go back to aem and change variant
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-accordion-component-1.html"
    And I click "contentTreeButton" on "aemAccordionCompPage" screen
    And I click "contentTreeAccordion" on "aemAccordionCompPage" screen
    And I click "configureAccordionButton" on "aemAccordionCompPage" screen
    And I click "configurationTab" on "aemAccordionCompDialog" screen
    And I select "Help" value for "accordionLayout" drop down in "aemAccordionCompDialog" screen using selection method "visibleText"
    #change to allow all variant
    And I click "allowAllCheckbox" on "aemAccordionCompDialog" screen
    And I click "expandCheckbox" on "aemAccordionCompDialog" screen
    #Save Changes
    And I click "saveChangesButton" on "aemAccordionCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemAccordionCompDialog" screen or "5" seconds before proceeding
    #select accordion editable area to add button to accordion
    And I click "accordionParsys" on "aemAccordionCompPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add button component
    And I enter "button" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "buttonLinkOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "buttonLinkOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-accordion-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    And I verify "myTitle" element exists on "aemAccordionPublished" screen
    And I verify "accordionExpanded" element exists on "aemAccordionPublished" screen
    And I verify "button" element exists on "aemAccordionPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestAccordionComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot