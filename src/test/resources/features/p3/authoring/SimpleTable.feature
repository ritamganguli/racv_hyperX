#Author: Jing Zuo
Feature: This feature tests the Simple Table in AEM authoring and storybook

  @TestAuthoringSimpleTableShowMore-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author simple table component with 3 columns, 7 rows, and show more button, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-simple-table-show-more-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-simple-table-show-more-RANDOM[0-8]-p3.html"
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
    ###############
    ## NODE
    ###############
    And I create a new test log node "Author simple table"
    #Add Simple Table component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Simple" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "simpleTableResult" on "aemInsertNewComponent" screen
    And I wait for "simpleTableResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Simple Table - 3 columns, 7 rows, with show more button
    When I click "simpleTableInTree" on "aemTestSimpleTablePage" screen
    And I click "configureButton" on "aemTestSimpleTablePage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemSimpleTableComponentDialog" screen
    Then I enter "Table Header" details in "tableHeading" on "aemSimpleTableComponentDialog" screen
    And I clear contents of "tableColumns" element on "aemSimpleTableComponentDialog" screen
    And I enter "3" details in "tableColumns" on "aemSimpleTableComponentDialog" screen
    And I clear contents of "tableRows" element on "aemSimpleTableComponentDialog" screen
    And I enter "7" details in "tableRows" on "aemSimpleTableComponentDialog" screen
    And I click "showMore" on "aemSimpleTableComponentDialog" screen
    And I verify "showMoreLabel" element exists on "aemSimpleTableComponentDialog" screen
    And I verify "showLessLabel" element exists on "aemSimpleTableComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSimpleTableComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSimpleTableComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 1"
    #Edit Row 1
    #Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 2"
    #Edit Row 2
    #Row 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 3"
    #Edit Row 3
    #Row 3
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 4"
    #Edit Row 4
    #Row 4
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 5"
    #Edit Row 5
    #Row 5
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 5" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 5 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 5 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 5 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 5 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 6"
    #Edit Row 6
    #Row 6
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 6" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 6 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 6 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 6 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 6 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Row 7"
    #Edit Row 7
    #Row 7
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 7" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 7 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 7 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 7 Column 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 7 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-simple-table-show-more-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is visible on "aemTestSimpleTablePublished" screen
    And I verify "column1" element exists on "aemTestSimpleTablePublished" screen
    And I verify "column2" element exists on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "row6" element is visible on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is not visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    Then I click "showMore" on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    And I click "showLess" on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is not visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot

  @TestPublishSimpleTableShowMore-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Simple table show more post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-simple-table-show-more-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is visible on "aemTestSimpleTablePublished" screen
    And I verify "column1" element exists on "aemTestSimpleTablePublished" screen
    And I verify "column2" element exists on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "row6" element is visible on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is not visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    Then I click "showMore" on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    And I click "showLess" on "aemTestSimpleTablePublished" screen
    And I verify "row7" element is not visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringSimpleTableNoHeading-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author simple table component with 2 columns, 6 rows, no table heading, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-simple-table-no-heading-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-simple-table-no-heading-RANDOM[0-8]-p3.html"
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
    #Add Simple Table component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Simple" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "simpleTableResult" on "aemInsertNewComponent" screen
    And I wait for "simpleTableResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Simple Table - 2 columns, 6 rows, with no heading
    When I click "simpleTableInTree" on "aemTestSimpleTablePage" screen
    And I click "configureButton" on "aemTestSimpleTablePage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemSimpleTableComponentDialog" screen
    Then I clear contents of "tableColumns" element on "aemSimpleTableComponentDialog" screen
    And I enter "2" details in "tableColumns" on "aemSimpleTableComponentDialog" screen
    And I clear contents of "tableRows" element on "aemSimpleTableComponentDialog" screen
    And I enter "6" details in "tableRows" on "aemSimpleTableComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSimpleTableComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSimpleTableComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Edit Row 1
    #Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 2
    #Row 2
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 3
    #Row 3
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 4
    #Row 4
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 5
    #Row 5
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 5" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 5 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 5 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 6
    #Row 6
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 6" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 6 Column 1
    When I click "textInTree" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 6 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-simple-table-no-heading-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is not visible on "aemTestSimpleTablePublished" screen
    And I verify "column1" element exists on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishSimpleTableNoHeading-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Accordion post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-simple-table-no-heading-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is not visible on "aemTestSimpleTablePublished" screen
    And I verify "column1" element exists on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringSimpleTableNoColumnHeadings-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author simple table component with 6 columns, 4 rows, and no column headings, and verify published dispatcher component, accessibility and visually
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-simple-table-no-column-heading-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-simple-table-no-column-heading-RANDOM[0-8]-p3.html"
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
    #Add Simple Table component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Simple" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "simpleTableResult" on "aemInsertNewComponent" screen
    And I wait for "simpleTableResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Simple Table - 6 columns, 4 rows, with no column headings
    When I click "simpleTableInTree" on "aemTestSimpleTablePage" screen
    And I click "configureButton" on "aemTestSimpleTablePage" screen
    And I take a screenshot
    And I click "configurationsTab" on "aemSimpleTableComponentDialog" screen
    Then I enter "Table Header" details in "tableHeading" on "aemSimpleTableComponentDialog" screen
    And I clear contents of "tableColumns" element on "aemSimpleTableComponentDialog" screen
    And I enter "6" details in "tableColumns" on "aemSimpleTableComponentDialog" screen
    And I clear contents of "tableRows" element on "aemSimpleTableComponentDialog" screen
    And I enter "4" details in "tableRows" on "aemSimpleTableComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemSimpleTableComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSimpleTableComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Edit Row 2
    #Row 2
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 1
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 2
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 3
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 4
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 2 Column 5
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 2 Column 5" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 3
    #Row 3
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 1
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 2
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 3
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 4
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 3 Column 5
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 3 Column 5" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Row 4
    #Row 4
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 1
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 1" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 2
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 2" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 3
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 3" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 4
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 4" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Row 4 Column 5
    When I click "textNoColumnHeading" on "aemTestSimpleTablePage" screen
    And I click "editButton" on "aemTestSimpleTablePage" screen
    And I enter "Row 4 Column 5" details using Action class
    And I click "textSaveIcon" on "aemTestSimpleTablePage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestSimpleTablePage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "15" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-simple-table-no-column-heading-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

  @TestPublishSimpleTableNoColumnHeadings-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Simple table no column headings post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-simple-table-no-column-heading-p3.html"
    #Post publish checks
    When I wait for "tableHeading" on "aemTestSimpleTablePublished" screen or "2" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "tableHeading" element is visible on "aemTestSimpleTablePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBSimpleTableShowMore
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Simple Table visually in story book - desktop, 8 rows, 4 columns, and with show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfRows:8;showButton:true&id=components-simple-table--simple-table-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    When I verify "row7" element is not visible on "storybookSimpleTable" screen
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "showMore" on "storybookSimpleTable" screen
    And I verify "row7" element is visible on "storybookSimpleTable" screen
    And I take a screenshot
    And I take a lambda snapshot "show more" "hide-gdpr"
    And I click "showLess" on "storybookSimpleTable" screen
    And I verify "row7" element is not visible on "storybookSimpleTable" screen
    And I take a screenshot

  @TestSBSimpleTableNoHeading
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Simple Table visually in story book - desktop, 8 rows, 2 columns, no table heading, and without show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;numberOfColumns:2;numberOfRows:8&id=components-simple-table--simple-table-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    When I verify "row7" element is visible on "storybookSimpleTable" screen
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSimpleTableNoColumnHeadings
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Simple Table visually in story book - desktop, 6 rows, 4 columns, no column headings, and wihout show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfColumns:6;columnHeadingLabel:;numberOfRows:4&id=components-simple-table--simple-table-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSimpleTableShowMore
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Simple Table visually (club theme) in story book - desktop, 8 rows, 4 columns, and with show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfRows:8;showButton:true&id=components-simple-table--simple-table-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    When I verify "row7" element is not visible on "storybookSimpleTable" screen
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "showMore" on "storybookSimpleTable" screen
    And I verify "row7" element is visible on "storybookSimpleTable" screen
    And I take a screenshot
    And I take a lambda snapshot "show more" "hide-gdpr"
    And I click "showLess" on "storybookSimpleTable" screen
    And I verify "row7" element is not visible on "storybookSimpleTable" screen
    And I take a screenshot

  @TestSBSimpleTableNoHeading
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Simple Table visually (club theme) in story book - desktop, 8 rows, 2 columns, no table heading, and without show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=heading:;numberOfColumns:2;numberOfRows:8&id=components-simple-table--simple-table-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    When I verify "row7" element is visible on "storybookSimpleTable" screen
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBSimpleTableNoColumnHeadings
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Simple Table visually (club theme) in story book - desktop, 6 rows, 4 columns, no column headings, and wihout show more button
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfColumns:6;columnHeadingLabel:;numberOfRows:4&id=components-simple-table--simple-table-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"