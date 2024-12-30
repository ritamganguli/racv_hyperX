#Author: Viengcumm Thongvilu
Feature: This feature tests the Card in AEM authoring and storybook

  @TestAuthoringCard-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author card component and verify published dispatcher component, accessibility and visually
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
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-card-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
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
    And I create a new test log node "Tiles config"
    #Add Tiles component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Tiles" details in "searchInputField" on "aemInsertNewComponent" screen
    And I wait for "tilesResult" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I click "tilesResult" on "aemInsertNewComponent" screen
    And I wait for "tilesResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Tiles component
    #Configurations tab
    When I click "tilesInTree" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "layoutTab" on "aemTilesComponentDialog" screen
    And I enter "container_tiles_RANDOM[1-8]" details in "targetDivID" on "aemTilesComponentDialog" screen
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "layout" on "aemTilesComponentDialog" screen
    And I select "Card" value for "layoutList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I click "columns" on "aemTilesComponentDialog" screen
    And I select "Four Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I click "addTile" on "aemTilesComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 1"
    #Configure 1st Card component in Tiles - product action, primary button, image
    When I click "firstCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_1" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter " First Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 2nd Card component in Tiles - product action, primary and secondary buttons, image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 2"
    When I click "secondCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_2" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter " Second Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I click "showSecondaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure 3td Card component in Tiles - product action, primary button, no image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 3"
    When I click "thirdCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_3" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Tile Title Third Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure 4th Card component in Tiles - article, tag, image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 4"
    When I click "fourthCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Article Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_4" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Tile Title Fourth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I enter "Insurance" details in "tagLabel" on "aemCardComponentDialog" screen
    And I enter "/content/racv/en/home/insurance" details in "link" on "aemCardComponentDialog" screen
    And I enter "Find out more" details in "linkLabel" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 5th Card component in Tiles - article, no tag, image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 5"
    When I click "fifthCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Article Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_5" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Tile Title Fifth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/insurance" details in "link" on "aemCardComponentDialog" screen
    And I enter "Find out more" details in "linkLabel" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Configure 6th Card component in Tiles - article, tag, no image
    ###############
    ## NODE
    ###############
    And I create a new test log node "Card 6"
    When I click "sixthCard" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Article Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "container_tiles_card_6" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Tile Title Sixth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I enter "/content/racv/en/home/insurance" details in "link" on "aemCardComponentDialog" screen
    And I enter "Find out more" details in "linkLabel" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Text config"
    #Configure Text in 1st Card component
    When I click "textInFirstCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I enter "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old." details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 2nd Card component
    When I click "textInSecondCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I enter "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout." details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 3rd Card component
    When I click "textInThirdCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I enter "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable." details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 4th Card component
    When I click "textInFourthCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I enter "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet." details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 5th Card component
    When I click "textInFifthCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I enter "Titles are short succinct and focused on providing value" details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Text in 6th Card component
    When I click "textInSixthCard" on "aemTestCardPage" screen
    And I click "editButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I enter "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary." details using Action class
    And I click "textSaveIcon" on "aemTestCardPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestCardPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button config"
    #Configure Buttons in 1st Card component
    #configure button 1 - Primary no icon
    Then I click "unconfiguredButtonInFirstCard" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    #And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    #Configure Buttons in 2nd Card component
    #configure button 1 - Primary no icon
    Then I click "unconfiguredButtonInSecondCard" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    #And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    #configure button 2 - Secondary icon before text
    Then I click "unconfiguredButtonInSecondCard" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "linkAutoCompleteResult" on "aemButtonComponentDialog" screen
    And I enter "Button 2" details in "textField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Configure Buttons in 3rd Card component
    #configure button 1 - Primary no icon
    Then I click "unconfiguredButtonInThirdCard" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    #Properties tab
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Button 1" details in "textField" on "aemButtonComponentDialog" screen
    #And I enter "my-id" details in "idField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "20" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    And I verify "fourColumnGrid" element exists on "aemCardPagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish 4 columns" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    ###############
    ## NODE
    ###############
    And I create a new test log node "3 column variation"
    # Go back and edit to test the next variation 3 column
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Configurations tab
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "tilesInTree" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "Three Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "20" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I verify "threeColumnGrid" element exists on "aemCardPagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish 3 columns" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    ###############
    ## NODE
    ###############
    And I create a new test log node "2 column variation"
    # Go back and edit to test the next variation 2 column
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Configurations tab
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "tilesInTree" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "Two Columns" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "20" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I verify "twoColumnGrid" element exists on "aemCardPagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish 2 columns" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    # Go back and edit to test the next variation 1 column
    ###############
    ## NODE
    ###############
    And I create a new test log node "1 column variation"
    When I navigate to "AEM/editor.html/content/racv/en/home/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Configurations tab
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    When I click "tilesInTree" on "aemTestCardPage" screen
    And I click "configureButton" on "aemTestCardPage" screen
    And I take a screenshot
    And I click "layoutTab" on "aemTilesComponentDialog" screen
    And I enter "container_tiles_RANDOM[4-4]" details in "targetDivID" on "aemTilesComponentDialog" screen
    And I click "metadataTab" on "aemTilesComponentDialog" screen
    Then I click "columns" on "aemTilesComponentDialog" screen
    And I select "One Column" value for "columnsList" drop down in "aemTilesComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemTilesComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemTilesComponentDialog" screen or "5" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "20" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-card-RANDOM[0-8]-p3.html"
    #Post publish checks
    And I verify "oneColumnGrid" element exists on "aemCardPagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    #And I take a lambda snapshot "publish 1 column" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Verify analytics attributes on button1InFirstCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title first card component" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InFirstCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button1InSecondCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title second card component" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InSecondCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button2InSecondCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title second card component" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 2" on "button2InSecondCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button1InThirdCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title third card component" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InThirdCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on linkInFourthCard - article card
    And I verify "data-event" attribute is "site interaction" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title fourth card component" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "find out more" on "linkInFourthCard" element on "aemCardPagePublished" screen

  @TestPublishCard-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Card 1 column post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-card-p3.html"
    #Post publish checks
    And I verify "oneColumnGrid" element exists on "aemCardPagePublished" screen
    When I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish 1 column" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    #Verify analytics attributes on button1InFirstCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title first card component" on "button1InFirstCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InFirstCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button1InSecondCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title second card component" on "button1InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InSecondCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button2InSecondCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title second card component" on "button2InSecondCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 2" on "button2InSecondCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on button1InThirdCard - product action card
    And I verify "data-event" attribute is "site interaction" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title third card component" on "button1InThirdCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "button 1" on "button1InThirdCard" element on "aemCardPagePublished" screen
    #Verify analytics attributes on linkInFourthCard - article card
    And I verify "data-event" attribute is "site interaction" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-type" attribute is "link" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-location" attribute is "card | tile title fourth card component" on "linkInFourthCard" element on "aemCardPagePublished" screen
    And I verify "data-description" attribute is "find out more" on "linkInFourthCard" element on "aemCardPagePublished" screen

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBArticleCard
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Article Card on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-card--article-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBArticleCardHideTag
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Article Card hide tag on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showTag:false&id=components-card--article-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBArticleCardHideImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Article Card hide image on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-card--article-card-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCard
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Product Card on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-card--product-action-card&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCardSecondary
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Product Card with secondary button on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:true&id=components-card--product-action-card&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCardNoImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Product Card without image on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-card--product-action-card&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBArticleCard
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Article Card (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-card--article-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBArticleCardHideTag
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Article Card hide tag (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showTag:false&id=components-card--article-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBArticleCardHideImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Article Card hide image (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-card--article-card-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCard
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Product Card (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-card--product-action-card&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCardSecondary
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Product Card with secondary button (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:true&id=components-card--product-action-card&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBProductCardNoImage
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Product Card without image (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showImage:false&id=components-card--product-action-card&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"