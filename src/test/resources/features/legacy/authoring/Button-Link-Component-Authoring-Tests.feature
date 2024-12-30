#Author: Sumanta Roy
#Date created -10 Sep 2020
Feature: This feature tests the Button and Link component and it's variants from authoring regression perspective.

  #SR 10 Sep 2020 AEMU-963
  #Dry run completed in QA without delete step on 10 Sep 2020
  @TestButtonComponentVariants
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add a Button component, update styling as Primary, Secondary, Primary Ghost, Secondary Ghost, Black Ghost and Tertiary and verify published changes
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
    And I enter "test-automation-button-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Button/Link component
    And I enter "Button/Link" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "buttonLinkOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "buttonLinkOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure the Button component
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    #Update Configurations Tab
    And I click "configTab" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvRootButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvEnButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvHomeButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchConfirmButton" on "aemButtonLinkConfigDialog" screen
    And I enter "-Test" details in "linkText" on "aemButtonLinkConfigDialog" screen
    And I enter "-Test" details in "linkTitle" on "aemButtonLinkConfigDialog" screen
    And I verify "hashTagField" element exists on "aemButtonLinkConfigDialog" screen
    And I enter "button-test-id" details in "linkId" on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsUrlField" element exists on "aemButtonLinkConfigDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Update Style Tab , Primary - excluding icon, as it's no longer used
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Button" value for "type" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I select "Primary" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Verify Analytics Tab - no updates
    And I click "analyticsTab" on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsLocationField" element exists on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsDescriptionField" element exists on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    #Verify Layout Tab - no updates
    And I click "layoutTab" on "aemButtonLinkConfigDialog" screen
    And I verify "targetDivIdField" element exists on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Primary button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonPrimary" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Update Style - Secondary Button
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Secondary Button" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Secondary button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonSecondary" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Update Style - Primary Ghost
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Primary Ghost Button" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Primary ghost button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonPrimaryGhost" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Update Style - Secondary Ghost
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Secondary Ghost Button" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Secondary ghost button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonSecondaryGhost" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Update Style - Black Ghost
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Black Ghost Button" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Black ghost button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonBlackGhost" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Update Style - Tertiary
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-button-component-1.html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Tertiary Button" value for "buttonStyle" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Black ghost button post publish validation
    And I navigate to "URL/utility/test-automation-button-component-1.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "buttonTertiary" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestButtonComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot

  #SR 10 Sep 2020 AEMU-963
  #Dry run completed in QA without delete step on 10 Sep 2020
  @TestButtonComponentLinkType
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add a Button component, update Type to Link and verify published changes
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
    And I enter "test-automation-button-component-2" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-button-component-2.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Button/Link component
    And I enter "Button/Link" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "buttonLinkOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "buttonLinkOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure the Button component
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    #Update Configurations Tab
    And I click "configTab" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvRootButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvEnButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchRacvHomeButton" on "aemButtonLinkConfigDialog" screen
    And I click "linkPathSearchConfirmButton" on "aemButtonLinkConfigDialog" screen
    And I enter "-Link-Test" details in "linkText" on "aemButtonLinkConfigDialog" screen
    And I enter "-Link-Test" details in "linkTitle" on "aemButtonLinkConfigDialog" screen
    And I verify "hashTagField" element exists on "aemButtonLinkConfigDialog" screen
    And I enter "link-test-id" details in "linkId" on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsUrlField" element exists on "aemButtonLinkConfigDialog" screen
    And I select "Same Tab" value for "openingMode" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Update Style Tab , Type as Link - excluding icon, as it's no longer used
    And I click "styleTab" on "aemButtonLinkConfigDialog" screen
    And I select "Link" value for "type" drop down in "aemButtonLinkConfigDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Verify Analytics Tab - no updates
    And I click "analyticsTab" on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsLocationField" element exists on "aemButtonLinkConfigDialog" screen
    And I verify "analyticsDescriptionField" element exists on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    #Verify Layout Tab - no updates
    And I click "layoutTab" on "aemButtonLinkConfigDialog" screen
    And I verify "targetDivIdField" element exists on "aemButtonLinkConfigDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Link post publish validation
    And I navigate to "URL/utility/test-automation-button-component-2.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I click "linkPublished" on "aemTestButtonLinkPublishedPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestButtonComponent2PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot