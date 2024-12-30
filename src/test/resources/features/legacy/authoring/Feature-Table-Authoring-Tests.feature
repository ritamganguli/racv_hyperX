#Author: Jing Zuo
#Date created - 15 July 2022
Feature: This feature tests the Feature Table component and its variants from authoring regression perspective.

  #JZ 15 July 2022 DAC-10437
  @TestFeatureTableComponent
  @AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, drop and configure Feature Table and verify published changes
    #Launch AEM
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
    When I click "createButton" on "aemLandingPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-feature-table-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-feature-table-1.html"
    #Search and add Feature Table component
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    And I enter "Feature Table" details in "searchInputField" on "aemInsertCompDialog" screen
    Then I wait for "featureTableOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "featureTableOption" on "aemInsertCompDialog" screen
    And I wait for "featureTableOption" to disappear on "aemInsertCompDialog" screen or "10" seconds before proceeding
    #Configure Feature Table component
    And I click "sidePanelButton" on "aemFeatureTableCompPage" screen
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    And I click "FTComponent" on "aemFeatureTableCompPage" screen
    And I click "configureFTButton" on "aemFeatureTableCompPage" screen
    And I wait for "compConfigTab" on "aemFeatureTableCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Component Configuration Tab - unticked checkbox by default
    When I click "compConfigTab" on "aemFeatureTableCompDialog" screen
    And I clear contents of "heading" element on "aemFeatureTableCompDialog" screen
    And I enter "Feature Table Testing 1" details in "heading" on "aemFeatureTableCompDialog" screen
    And I verify "moreOrLessCheckbox" element exists on "aemFeatureTableCompDialog" screen
    And I verify "highlightCol" element exists on "aemFeatureTableCompDialog" screen
    Then I take a screenshot
    #Configure Component Properties Tab
    When I click "compPropTab" on "aemFeatureTableCompDialog" screen
    #Add 3 new rows
    Then I click "addRow" on "aemFeatureTableCompDialog" screen
    And I click "addRow" on "aemFeatureTableCompDialog" screen
    And I click "addRow" on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    #Verify Display Show More/less button after rows field
    When I enter "3" details in "displayMoreLess" on "aemFeatureTableCompDialog" screen
    Then I wait for "rowAlertIcon" on "aemFeatureTableCompDialog" screen or "5" seconds before proceeding
    And I hover on "rowAlertIcon" on "aemFeatureTableCompDialog" screen using Action class
    And I verify "rowErrorMessage" element exists on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    When I clear contents of "displayMoreLess" element on "aemFeatureTableCompDialog" screen
    And I enter "4" details in "displayMoreLess" on "aemFeatureTableCompDialog" screen
    Then I wait for "rowInfoIcon" on "aemFeatureTableCompDialog" screen or "5" seconds before proceeding
    And I hover on "rowInfoIcon" on "aemFeatureTableCompDialog" screen using Action class
    And I verify "rowInfoMessage" element exists on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    #Add more columns
    When I click "addColumn" on "aemFeatureTableCompDialog" screen
    And I click "addColumn" on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    #Verify the component is restricted to no more than 4 columns
    Then I verify "columnWarningMessage" element exists on "aemFeatureTableCompDialog" screen
    And I click "closeWarningButton" on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    #Configure Component Layout Tab
    When I click "compLayoutTab" on "aemFeatureTableCompDialog" screen
    Then I verify "targetDivId" field contains a value on "aemFeatureTableCompDialog" screen
    And I verify "renderAsContainerCheckBox" element exists on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    When I select "30px - Medium" value for "topSpacingDesktop" drop down in "aemFeatureTableCompDialog" screen using selection method "visibleText"
    And I verify "topSpacingMobile" element exists on "aemFeatureTableCompDialog" screen
    Then I take a screenshot
    When I select "30px - Medium" value for "bottomSpacingDesktop" drop down in "aemFeatureTableCompDialog" screen using selection method "visibleText"
    And I verify "bottomSpacingMobile" element exists on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    Then I click "doneButton" on "aemFeatureTableCompDialog" screen
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Configure Feature Table Headers
    #Header 1
    When I click "FTHeaderComponent1" on "aemFeatureTableCompPage" screen
    And I click "configureFTHeaderButton1" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    When I click "compConfigTab" on "aemFeatureTableHeaderCompDialog" screen
    And I clear contents of "heading" element on "aemFeatureTableHeaderCompDialog" screen
    And I enter "Feature Table Heading 1" details in "heading" on "aemFeatureTableHeaderCompDialog" screen
    Then I click "doneButton" on "aemFeatureTableHeaderCompDialog" screen
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Header 2
    When I click "FTHeaderComponent2" on "aemFeatureTableCompPage" screen
    And I click "configureFTHeaderButton2" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    When I click "compConfigTab" on "aemFeatureTableHeaderCompDialog" screen
    And I clear contents of "heading" element on "aemFeatureTableHeaderCompDialog" screen
    And I enter "Feature Table Heading 2" details in "heading" on "aemFeatureTableHeaderCompDialog" screen
    Then I click "doneButton" on "aemFeatureTableHeaderCompDialog" screen
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Header 3
    When I click "FTHeaderComponent3" on "aemFeatureTableCompPage" screen
    And I click "configureFTHeaderButton3" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    When I click "compConfigTab" on "aemFeatureTableHeaderCompDialog" screen
    And I clear contents of "heading" element on "aemFeatureTableHeaderCompDialog" screen
    And I enter "Feature Table Heading 3" details in "heading" on "aemFeatureTableHeaderCompDialog" screen
    Then I click "doneButton" on "aemFeatureTableHeaderCompDialog" screen
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Header 4
    When I click "FTHeaderComponent4" on "aemFeatureTableCompPage" screen
    And I click "configureFTHeaderButton4" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    When I click "compConfigTab" on "aemFeatureTableHeaderCompDialog" screen
    And I clear contents of "heading" element on "aemFeatureTableHeaderCompDialog" screen
    And I enter "Feature Table Heading 4" details in "heading" on "aemFeatureTableHeaderCompDialog" screen
    Then I click "doneButton" on "aemFeatureTableHeaderCompDialog" screen
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Configure Feature Table Rows
    #Row 1
    When I click "FTRowComponent1" on "aemFeatureTableCompPage" screen
    And I take a screenshot
    And I click "editComponent1" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 1" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Row 2
    When I click "FTRowComponent2" on "aemFeatureTableCompPage" screen
    And I take a screenshot
    And I click "editComponent2" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 2" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Row 3
    When I click "FTRowComponent3" on "aemFeatureTableCompPage" screen
    And I click "editComponent3" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 3" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Row 4
    When I click "FTRowComponent4" on "aemFeatureTableCompPage" screen
    And I click "editComponent4" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 4" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Row 5
    When I click "FTRowComponent5" on "aemFeatureTableCompPage" screen
    And I click "editComponent5" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 5" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    #Publish the page
    When I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-feature-table-1.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I refresh the page
    And I take a full-page screenshot for "page"
    #Post publish checks
    And I verify "tableTitle1" element exists on "aemFeatureTablePublished" screen
    And I verify "header1" element exists on "aemFeatureTablePublished" screen
    And I verify "header2" element exists on "aemFeatureTablePublished" screen
    And I verify "header3" element exists on "aemFeatureTablePublished" screen
    And I verify "header4" element exists on "aemFeatureTablePublished" screen
    And I verify "row1" element exists on "aemFeatureTablePublished" screen
    And I verify "row2" element exists on "aemFeatureTablePublished" screen
    And I verify "row3" element exists on "aemFeatureTablePublished" screen
    And I verify "row4" element exists on "aemFeatureTablePublished" screen
    And I verify "row5" element exists on "aemFeatureTablePublished" screen
    #Update FT - tick show more/less and highlight columns checkbox
    When I navigate to "AEM/editor.html/content/racv/en/home/utility/test-automation-feature-table-1.html"
    And I take a screenshot
    #And I click "sidePanelButton" on "aemFeatureTableCompPage" screen
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    And I click "FTComponent" on "aemFeatureTableCompPage" screen
    And I click "configureFTButton" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    #Configure Component Configuration Tab - tick checkbox
    When I click "compConfigTab" on "aemFeatureTableCompDialog" screen
    And I click "moreOrLessCheckbox" on "aemFeatureTableCompDialog" screen
    And I click "highlightCol" on "aemFeatureTableCompDialog" screen
    And I enter "4" details in "noHighlightCol" on "aemFeatureTableCompDialog" screen
    Then I take a screenshot
    #Configure Component Properties Tab
    When I click "compPropTab" on "aemFeatureTableCompDialog" screen
    #Add 1 new row
    Then I click "addRow" on "aemFeatureTableCompDialog" screen
    And I take a screenshot
    Then I click "doneButton" on "aemFeatureTableCompDialog" screen
    And I refresh the page
    And I click "contentTreeButton" on "aemFeatureTableCompPage" screen
    #Configure Feature Table Rows
    #Row 6
    When I click "FTRowComponent6" on "aemFeatureTableCompPage" screen
    And I take a screenshot
    And I click "editComponent6" on "aemFeatureTableCompPage" screen
    And I click "rowHeading" on "aemFeatureTableCompPage" screen
    And I click "rteEditorFullscreenIcon" on "aemFeatureTableCompPage" screen
    And I clear contents of "rteEditorFullScreen" element on "aemFeatureTableCompPage" screen
    And I enter "Table Row 6" details in "rteEditorFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorExitFullScreen" on "aemFeatureTableCompPage" screen
    And I click "rteEditorSaveIcon" on "aemFeatureTableCompPage" screen
    Then I take a screenshot
    And I refresh the page
    #Publish the page
    When I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I click "publishOptionSecondary" if found on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    Then I navigate to "URL/utility/test-automation-feature-table-1.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Post publish checks
    And I verify "tableTitle1" element exists on "aemFeatureTablePublished" screen
    And I verify "header1" element exists on "aemFeatureTablePublished" screen
    And I verify "header2" element exists on "aemFeatureTablePublished" screen
    And I verify "header3" element exists on "aemFeatureTablePublished" screen
    And I verify "header4highlighted" element exists on "aemFeatureTablePublished" screen
    And I take a screenshot
    And I verify "row1" element exists on "aemFeatureTablePublished" screen
    And I verify "row2" element exists on "aemFeatureTablePublished" screen
    And I verify "row3" element exists on "aemFeatureTablePublished" screen
    And I verify "row4" element exists on "aemFeatureTablePublished" screen
    And I verify "row5" element exists on "aemFeatureTablePublished" screen
    And I take a screenshot
    And I verify "showMore" element exists on "aemFeatureTablePublished" screen
    And I click "showMore" on "aemFeatureTablePublished" screen
    Then I verify "row6" element exists on "aemFeatureTablePublished" screen
    And I verify "showLess" element exists on "aemFeatureTablePublished" screen
    And I click "showLess" on "aemFeatureTablePublished" screen
    And I wait for "showLess" to disappear on "aemFeatureTablePublished" screen or "2" seconds before proceeding
    And I take a screenshot
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestFeatureTableComponentPageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot