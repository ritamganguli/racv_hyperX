#Author: Sumanta Roy
#Date created -11 Sep 2020
Feature: This feature tests the Rich Text Editor component and it's variants from authoring regression perspective.

  #SR 11 Sep 2020 AEMU-962
  #Dry run completed in QA without delete step on 14 Sep 2020
  @TestRTEComponentVariants
  @AuthoringSanity.chrome.desktop
  @AuthoringRegression3.chrome.desktop
  Scenario: Verify user is able to create new page, add Rich Text Editor component, update styling as Default, Ordered, Unordered, Cross, Tick and Chevron and verify published changes
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
    And I enter "test-automation-rte-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #search and add Canvas component first
    And I enter "canvas" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "canvasOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "canvasOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Add RTE
    And I click "canvasAddComponentParsys" on "aemTestComponentPage" screen
    And I click "canvasAddComponentParsysPlusIcon" on "aemTestComponentPage" screen
    And I enter "rich" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "rteOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "rteOption" on "aemInsertCompDialog" screen using Action class
    And I take a screenshot
    #Configure the RTE component
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    #Update Styles Tab to Default
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Default" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "aemRteComponentDialog" screen
    And I verify "targetDivField" element exists on "aemRteComponentDialog" screen
    And I take a screenshot
    #Adaptive Show Hide tab
    And I click "adaptiveSHTab" on "aemRteComponentDialog" screen
    And I verify "hideOnDesktopCheckBox" element exists on "aemRteComponentDialog" screen
    And I click "hideOnTabletCheckBox" on "aemRteComponentDialog" screen
    And I click "hideOnMobileCheckBox" on "aemRteComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    And I take a screenshot
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I switch "to" iFrame "editRteIFrame" on "aemTestComponentPage" screen
    And I enter "Text for Default RTE" details in "rteComponentEditor" on "aemTestComponentPage" screen
    And I switch "from" iFrame "rteComponentEditor" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Default Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "defaultRteText" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Update style to Unordered list
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Unordered List" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I click "rteEditorFullscreenIcon" on "aemTestComponentPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemTestComponentPage" screen
    And I enter "Text for Unordered RTE 1" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorListIcon" on "aemTestComponentPage" screen using JavaScript
    And I enter "keys:ENTER" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I enter "Text for Unordered RTE 2" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorExitFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Unordered list Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "unorderedListRteText1" element exists on "aemTestRtePublishedPage" screen
    And I verify "unorderedListRteText2" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Update style to ordered list
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Ordered List" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I click "rteEditorFullscreenIcon" on "aemTestComponentPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemTestComponentPage" screen
    And I enter "Text for Ordered RTE 1" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorOrderedListIcon" on "aemTestComponentPage" screen using JavaScript
    And I enter "keys:ENTER" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I enter "Text for Ordered RTE 2" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorExitFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Ordered list Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "orderedListRteText1" element exists on "aemTestRtePublishedPage" screen
    And I verify "orderedListRteText2" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Update style to Cross List
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Cross List" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I click "rteEditorFullscreenIcon" on "aemTestComponentPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemTestComponentPage" screen
    And I enter "Text for Cross List RTE 1" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorListIcon" on "aemTestComponentPage" screen using JavaScript
    And I enter "keys:ENTER" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I enter "Text for Cross List RTE 2" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorExitFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Cross list Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "crossListRteText1" element exists on "aemTestRtePublishedPage" screen
    And I verify "crossListRteText2" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Update style to Tick List
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Tick List" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I click "rteEditorFullscreenIcon" on "aemTestComponentPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemTestComponentPage" screen
    And I enter "Text for Tick List RTE 1" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorListIcon" on "aemTestComponentPage" screen using JavaScript
    And I enter "keys:ENTER" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I enter "Text for Tick List RTE 2" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorExitFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Cross list Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "tickListRteText1" element exists on "aemTestRtePublishedPage" screen
    And I verify "tickListRteText2" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Update style to Chevron List
    And I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-rte-component-1.html"
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "configureRteComponentIcon" on "aemTestComponentPage" screen
    And I click "stylesTab" on "aemRteComponentDialog" screen
    And I select "Chevron List" value for "listStylesDropdown" drop down in "aemRteComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemRteComponentDialog" screen
    #Add text now
    And I wait for "rteComponent" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "rteComponent" on "aemTestComponentPage" screen
    And I click "editRteComponentIcon" on "aemTestComponentPage" screen
    And I click "rteEditorFullscreenIcon" on "aemTestComponentPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemTestComponentPage" screen
    And I enter "Text for Chevron List RTE 1" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorListIcon" on "aemTestComponentPage" screen using JavaScript
    And I enter "keys:ENTER" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I enter "Text for Chevron List RTE 2" details in "rteEditorFullScreen" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "rteEditorExitFullScreen" on "aemTestComponentPage" screen
    And I click "rteEditorSaveIcon" on "aemTestComponentPage" screen
    And I take a screenshot
    #publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish validation - Cross list Style
    And I navigate to "URL/utility/test-automation-rte-component-1.html"
    And I dismiss GDPR notification if it exists
    And I verify "chevronListRteText1" element exists on "aemTestRtePublishedPage" screen
    And I verify "chevronListRteText2" element exists on "aemTestRtePublishedPage" screen
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestRteComponent1PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot