#Author: Jing Zuo
Feature: This feature tests the Highlight Cards component in AEM authoring and storybook

  @TestAuthoringHighlightCards-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author highlight cards and its variants and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-highlight-cards-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #Enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-highlight-cards-RANDOM[0-8]-p3.html"
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Add Highlight Cards component into root container
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    Then I enter "Highlight Cards" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "highlightCardsResult" on "aemInsertNewComponent" screen
    And I wait for "highlightCardsResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    ###############
    ## NODE
    ###############
    And I create a new test log node "Highlight Cards - Product Action"
    #Configure Highlight Cards component, select Product action Theme
    When I click "highlightCardsInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I click "configurationTab" on "aemHighlightCardsComponentDialog" screen
    And I click "themeType" on "aemHighlightCardsComponentDialog" screen
    And I select "Product action" value for "themeTypeList" drop down in "aemHighlightCardsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "headingLevel" on "aemHighlightCardsComponentDialog" screen
    And I select "H2" value for "headingLevelList" drop down in "aemHighlightCardsComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "Highlight Cards - Product Action" details in "heading" on "aemHighlightCardsComponentDialog" screen
    And I enter "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. " details in "description" on "aemHighlightCardsComponentDialog" screen
    And I take a screenshot
    And I click "addCardButton" on "aemHighlightCardsComponentDialog" screen
    And I click "addCardButton" on "aemHighlightCardsComponentDialog" screen
    And I click "addCardButton" on "aemHighlightCardsComponentDialog" screen
    Then I click "doneButton" on "aemHighlightCardsComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemHighlightCardsComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Cards"
    #Configure Card components inside the Highlight Cards component
    #Configure Card 1 - product action, primary button, image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card1" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "First Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in Card 1
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 1
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Card 2 - product action, primary and secondary buttons, image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card2" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Second Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I click "showSecondaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure Text in Card 2
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 2
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    #configure Secondary button icon before text in Card 2
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "linkAutoCompleteResult" on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
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
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Card 3 - product action, primary button, no image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card3" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Third Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure Text in Card 3
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 3
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Card 4 - product action, primary button, image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card4" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Fourth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Text in Card 4
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 4
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Card 5 - product action, primary and secondary buttons, image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card5" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Fifth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-L-XL-16by9-1600x900.jpg" details in "desktopImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-M-21by9-1000x428.jpg" details in "tabletImage" on "aemCardComponentDialog" screen
    And I enter "/content/dam/racv-assets/images/images/test-images/Hero-Basic-S-4by3-720x540.jpg" details in "mobileImage" on "aemCardComponentDialog" screen
    And I enter "card image" details in "altTextImage" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I click "showSecondaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure Text in Card 5
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 5
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I click "openInDropDown" on "aemButtonComponentDialog" screen
    And I select "New Tab" value for "openInResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    #configure Secondary button icon before text in Card 5
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I click "linkAutoCompleteResult" on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
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
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure Card 6 - product action, primary button, no image
    When I click "cardInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    Then I click "cardLayout" on "aemCardComponentDialog" screen
    And I select "Product Action Card" value for "cardLayoutList" drop down in "aemCardComponentDialog" screen using selection method "visibleText"
    And I clear contents of "targetId" element on "aemCardComponentDialog" screen
    And I enter "highlight_cards_card6" details in "targetId" on "aemCardComponentDialog" screen
    And I click "heading" on "aemCardComponentDialog" screen
    And I enter "Sixth Card Component" details in "heading" on "aemCardComponentDialog" screen
    And I click "showPrimaryButton" on "aemCardComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemCardComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemCardComponentDialog" screen or "5" seconds before proceeding
    #Configure Text in Card 6
    When I click "textInTree" on "aemTestHiglightCardsPage" screen
    And I click "editButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    And I enter "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable." details using Action class
    And I click "textSaveIcon" on "aemTestHiglightCardsPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestHiglightCardsPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Configure Primary button in Card 6
    When I click "buttonInTree" on "aemTestHiglightCardsPage" screen
    And I click "configureButton" on "aemTestHiglightCardsPage" screen
    And I take a screenshot
    When I click "propertiesTab" on "aemButtonComponentDialog" screen
    Then I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    And I refresh the page
    And I click "contentTreeButton" on "aemEditorPage" screen
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
    And I navigate to "URL/racv-home/utility/qa/test-automation-highlight-cards-RANDOM[0-8]-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "heading" on "aemTestHighlightCardsPagePublished" screen or "5" seconds before proceeding
    And I verify "heading" element exists on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Element does not have inner text that is visible to screen readers - https://racvone.atlassian.net/browse/AP3-4586
    #And I verify page is accessibility compliant
    #Verify analytics attributes on primary button in the second card
    And I verify "data-event" attribute is "site interaction" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | second card component" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    #Verify analytics attributes on secondary button in the second card
    And I verify "data-event" attribute is "site interaction" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | second card component" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    #Verify analytics attributes on right button of the pagination
    And I verify "data-event" attribute is "site interaction" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "ghost button" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | highlight cards - product action" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "right" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    Then I click "rightButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    And I click "rightButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on left button of the pagination
    And I verify "data-event" attribute is "site interaction" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "ghost button" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | highlight cards - product action" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "left" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I click "leftButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot

  @TestPublishHighlightCards-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Highlight cards post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-highlight-cards-p3.html"
    #Post publish checks
    When I dismiss GDPR notification if it exists
    And I wait for "heading" on "aemTestHighlightCardsPagePublished" screen or "5" seconds before proceeding
    And I verify "heading" element exists on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Element does not have inner text that is visible to screen readers - https://racvone.atlassian.net/browse/AP3-4586
    #And I verify page is accessibility compliant
    #Verify analytics attributes on primary button in the second card
    And I verify "data-event" attribute is "site interaction" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | second card component" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "get a quote" on "primaryCta" element on "aemTestHighlightCardsPagePublished" screen
    #Verify analytics attributes on secondary button in the second card
    And I verify "data-event" attribute is "site interaction" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "link" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | second card component" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "receive a quote" on "secondaryCta" element on "aemTestHighlightCardsPagePublished" screen
    #Verify analytics attributes on right button of the pagination
    And I verify "data-event" attribute is "site interaction" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "ghost button" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | highlight cards - product action" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "right" on "rightButton" element on "aemTestHighlightCardsPagePublished" screen
    Then I click "rightButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    And I click "rightButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot
    #Verify analytics attributes on left button of the pagination
    And I verify "data-event" attribute is "site interaction" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-type" attribute is "ghost button" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-location" attribute is "card | highlight cards - product action" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I verify "data-description" attribute is "left" on "leftButton" element on "aemTestHighlightCardsPagePublished" screen
    And I click "leftButton" on "aemTestHighlightCardsPagePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBHighlightCards
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Highlight Cards on storybook - Product and brand theme, 4 cards, showing image
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:4&id=components-highlight-cards--highlight-cards-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBHighlightCardHideImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Highlight Cards on storybook - Product action theme, 10 cards, no image
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:product-action;numberOfCards:10;showImage:false&id=components-highlight-cards--highlight-cards-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBHighlightCards
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Highlight Cards (club theme) on storybook - Product and brand theme, 4 cards, showing image
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=numberOfCards:4&id=components-highlight-cards--highlight-cards-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBHighlightCardHideImage
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Highlight Cards (club theme) on storybook - Product action theme, 10 cards, no image
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=theme:product-action;numberOfCards:10;showImage:false&id=components-highlight-cards--highlight-cards-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"