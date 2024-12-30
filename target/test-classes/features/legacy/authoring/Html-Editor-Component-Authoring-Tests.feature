#Author: Sumanta Roy
#Date created - 10 Feb 2021
Feature: This feature tests the HTML Editor Component

  #SR 10 Feb 2021 DAC-6875
  #Dry run completed on QA
  @TestHtmlEditorComponent
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression2.chrome.desktop
  Scenario: Verify user is able to create new page, add HTML Editor component, configure, publish and verify published changes
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
    And I enter "test-automation-html-editor-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-html-editor-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add HTML Editor component first
    And I enter "HTML Editor" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "htmlEditorOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "htmlEditorOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemHtmlEditorCompPage" screen
    And I click "contentTreeButton" on "aemHtmlEditorCompPage" screen
    And I click "htmlEditorComponent" on "aemHtmlEditorCompPage" screen
    And I click "configureButton" on "aemHtmlEditorCompPage" screen
    And I wait for "contentFrame" on "aemHtmlEditorCompPage" screen or "5" seconds before proceeding
    #Configure tab
    #Switch iFrame
    And I switch "to" iFrame "contentFrame" on "aemHtmlEditorCompPage" screen
    And I click "configurationTab" on "aemHtmlEditorCompPage" screen
    #Click on Source edit button
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    #Enter HTML source code
    And I enter "<h1 style=\"color:blue;\">A Blue Heading</h1><p style=\"color:red;\">A red paragraph.</p>" details in "textArea" on "aemHtmlEditorCompPage" screen
    #Click on Source edit again to retain changes
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    And I take a screenshot
    #Adaptive Show/Hide tab
    And I click "adaptiveShowHideTab" on "aemHtmlEditorCompPage" screen
    #Hide on Desktop
    And I verify "hideOnDesktopLabel" element exists on "aemHtmlEditorCompPage" screen
    And I verify "hideOnDesktopCheckbox" element exists on "aemHtmlEditorCompPage" screen
    #Hide on Tablet
    And I verify "hideOnTabletLabel" element exists on "aemHtmlEditorCompPage" screen
    And I click "hideOnTabletCheckbox" on "aemHtmlEditorCompPage" screen
    #Hide on Mobile
    And I verify "hideOnMobileLabel" element exists on "aemHtmlEditorCompPage" screen
    And I click "hideOnMobileCheckbox" on "aemHtmlEditorCompPage" screen
    And I take a screenshot
    #Switch out of iFrame
    And I switch "from" iFrame "hideOnMobileCheckbox" on "aemHtmlEditorCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemHtmlEditorCompPage" screen
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/utility/test-automation-html-editor-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #Post publish checks
    And I verify "htmlHeader" element exists on "aemHtmlEditorCompPublished" screen
    And I verify "htmlParagraph" element exists on "aemHtmlEditorCompPublished" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestHtmlEditorComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    #Click force delete popup
    #And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot
