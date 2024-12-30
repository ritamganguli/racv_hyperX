#Author: Sumanta Roy
#Date Created : 23 Dec 19
Feature: This feature tests the AEM Authoring

  #Dry run completed on 23 Dec 19
  #NOTE - This test is specific to QA since parameterization is not possible
  #SR 21 May 2020 - DAC-4887 - Renamed, updated URLs and creds
  #SR 10 Jul 2020 - AEMU-776 - Updated URLs for sandbox
  @TestAuthoringAvailibility
  Scenario: Verify AEM environment is up and running and user is able to log into the AEM for authoring
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I verify "sitesLink" element exists on "aemLandingPage" screen
    And I check page address is "AEM/aem/start.html"
    And I capture the address navigated to
    #Logout out of AEM
    And I click "userIcon" on "aemLandingPage" screen
    And I click "signOutButton" on "aemLandingPage" screen
    And I capture the address navigated to
    And I check the page address contains "AEM/libs/granite/core/content/login.html"
    And I take a screenshot

  #Dry run completed on 24 Dec 19
  #NOTE - This test is specific to QA since parameterization is not possible
  #SR 21 May 2020 - DAC-4887 - Updated URL, credentials and page location to /home/utility
  @TestCreateNewPagePublishAEM
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  Scenario: Verify user is able to create new page, add a button component, publish and view the page in AEM, delete the component and page
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
    #Navigate to utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
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
    And I enter "test-automation-createnewpage-RANDOM[0-8]" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-createnewpage-RANDOM[0-8].html"
    #Add a component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Button/Link component
    And I enter "Button/Link" details in "searchInputField" on "aemInsertCompDialog" screen
    #And I click "buttonLinkOption" on "aemInsertCompDialog" screen
    And I click "buttonLinkOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure the component
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "configureNewButtonLink" on "aemTestComponentPage" screen
    #Update link text
    And I clear contents of "linkText" element on "aemButtonLinkConfigDialog" screen
    And I enter "Button-Test" details in "linkText" on "aemButtonLinkConfigDialog" screen
    And I clear contents of "linkPath" element on "aemButtonLinkConfigDialog" screen
    And I wait for "linkAlertIcon" on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    And I hover on "linkAlertIcon" on "aemButtonLinkConfigDialog" screen using Action class
    And I verify "linkErrorMessage" element exists on "aemButtonLinkConfigDialog" screen
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonLinkConfigDialog" screen or "5" seconds before proceeding
    #Verify Button Link Component can't be saved when mandatory field is empty
    And I verify "buttonLinkComponent" element exists on "aemTestComponentPage" screen
    And I take a screenshot
    And I enter "#" details in "linkPath" on "aemButtonLinkConfigDialog" screen
    And I click "doneButton" on "aemButtonLinkConfigDialog" screen
    #Verify CTA button to check Button Link Component can be saved when mandatory field is not empty
    And I click "CTAButton" on "aemTestComponentPage" screen
    And I verify "CTAConfigure" element exists on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    When I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    Then I navigate to "URL/utility/test-automation-createnewpage-RANDOM[0-8].html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I verify "testButtonLink" copy text on "publishedTestComponentPage" screen
    #Delete the Button/Link Component
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-createnewpage-RANDOM[0-8].html"
    And I click "newButtonLink" on "aemTestComponentPage" screen
    And I click "deleteNewButtonLink" on "aemTestComponentPage" screen
    And I click "confirmDeleteButton" on "aemTestComponentPage" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click '//*[@data-foundation-collection-item-id="/content/racv/en/home/utility/test-automation-createnewpage-RANDOM[0-8]"]/coral-columnview-item-thumbnail/img' on "XPATH" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot