#Author: Sumanta Roy
#Date created - 21 Sep 2021
Feature: This feature tests the Popular Topics component and it's variants from authoring regression perspective.

  #SR 21 Sep 2021 - DAC-9306
  #Dry run completed in QA on 21 Sep 21
  @TestPopularTopicsComponent1
  #@AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, add Popular Topics component, configure and verify published changes
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
    #select Content hub category page template
    And I click "chCategoryTemplateIcon" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #enter page title
    And I enter "test-automation-popular-topics-component-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    #Verify check box for popular topics
    Then I verify "popularTopicsCheckbox" element exists on "aemLandingPage" screen
    And I enter "racv:" details in "contentHubPrimaryTag" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-popular-topics-component-1.html"
    #change to design mode and enable popular topics
    And I click "sidePanelButton" on "popularTopicsComponentAuthPage" screen
    And I click "contentTreeTab" on "popularTopicsComponentAuthPage" screen
    And I click "editChevron" on "popularTopicsComponentAuthPage" screen
    And I click "designMode" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    And I click "inheritenceTree" on "popularTopicsComponentAuthPage" screen
    And I click "configComponentButton" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    And I enter "popular" details in "searchField" on "popularTopicsComponentAuthPage" screen
    And I click "expandRACV" on "popularTopicsComponentAuthPage" screen
    And I click "popTopicListItem" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    And I click "doneButton" on "popularTopicsComponentAuthPage" screen
    And I click "editChevron" on "popularTopicsComponentAuthPage" screen
    And I click "editMode" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #Add component
    And I click "inheritenceParsys" on "popularTopicsComponentAuthPage" screen
    And I click "addComponentButton" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    And I click "popTopicListItem" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #Configure Component
    And I click "popTopicsComponent" on "popularTopicsComponentAuthPage" screen
    And I click "configComponentButton" on "popularTopicsComponentAuthPage" screen
    And I click "configurationTab" on "popularTopicsComponentAuthPage" screen
    And I enter "Topic Header" details in "heading" on "popularTopicsComponentAuthPage" screen
    And I enter "Topic Text" details in "topicText" on "popularTopicsComponentAuthPage" screen
    And I enter "Subscribe Text" details in "subscribeText" on "popularTopicsComponentAuthPage" screen
    And I enter "/content/racv/en/home" details in "subscribeCTA" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    And I verify "hideTabletCheckbox" element exists on "popularTopicsComponentAuthPage" screen
    And I verify "analyticsUrl" element exists on "popularTopicsComponentAuthPage" screen
    And I verify "openingMode" element exists on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #1st link
    And I click "addButton" on "popularTopicsComponentAuthPage" screen using JavaScript
    And I enter "/content/racv/en/home/royalauto/transport" details in "ctaLink1" on "popularTopicsComponentAuthPage" screen
    And I click "ctaLabel1" on "popularTopicsComponentAuthPage" screen
    And I enter "Link 1 Label" details in "ctaLabel1" on "popularTopicsComponentAuthPage" screen
    #2nd link
    And I click "addButton" on "popularTopicsComponentAuthPage" screen using JavaScript
    And I enter "/content/racv/en/home/royalauto/news" details in "ctaLink2" on "popularTopicsComponentAuthPage" screen
    And I click "ctaLabel2" on "popularTopicsComponentAuthPage" screen
    And I enter "Link 2 Label" details in "ctaLabel2" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #3rd link
    And I click "addButton" on "popularTopicsComponentAuthPage" screen using JavaScript
    And I enter "/content/racv/en/home/royalauto/property" details in "ctaLink3" on "popularTopicsComponentAuthPage" screen
    And I click "ctaLabel3" on "popularTopicsComponentAuthPage" screen
    And I enter "Link 3 Label" details in "ctaLabel3" on "popularTopicsComponentAuthPage" screen
    #4th link
    And I click "addButton" on "popularTopicsComponentAuthPage" screen using JavaScript
    And I enter "/content/racv/en/home/royalauto/property" details in "ctaLink4" on "popularTopicsComponentAuthPage" screen
    And I click "ctaLabel4" on "popularTopicsComponentAuthPage" screen
    And I enter "Link 4 Label" details in "ctaLabel4" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #5th link
    And I click "addButton" on "popularTopicsComponentAuthPage" screen using JavaScript
    And I enter "/content/racv/en/home/royalauto/sustainability" details in "ctaLink5" on "popularTopicsComponentAuthPage" screen
    And I click "ctaLabel5" on "popularTopicsComponentAuthPage" screen
    And I enter "Link 5 Label" details in "ctaLabel5" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #Layout tab
    And I click "layoutTab" on "popularTopicsComponentAuthPage" screen
    And I verify "targetDivId" field contains a value on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
    #save changes
    And I click "doneButton" on "popularTopicsComponentAuthPage" screen
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-popular-topics-component-1.html"
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a screenshot
    #verify post publishing
    #Topic header
    And I verify "topicHeader" element exists on "popularTopicsComponentPubPage" screen
    And I verify css attribute "color" is "rgba(21, 21, 21, 1)" for "topicHeader" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-weight" is "600" for "topicHeader" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "topicHeader" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-size" is "14px" for "topicHeader" on "popularTopicsComponentPubPage"
    #Subscribe button
    And I verify "subscribeButton" element exists on "popularTopicsComponentPubPage" screen
    And I click "subscribeButton" on "popularTopicsComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/"
    And I navigate to "URL/utility/test-automation-popular-topics-component-1.html"
    And I dismiss GDPR notification if it exists
    #topic text
    And I verify "topicText" element exists on "popularTopicsComponentPubPage" screen
    And I click "topicText" on "popularTopicsComponentPubPage" screen
    And I take a screenshot
    And I verify "topic1Label" element exists on "popularTopicsComponentPubPage" screen
    And I verify css attribute "color" is "rgba(67, 77, 92, 1)" for "topic1Label" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-weight" is "500" for "topic1Label" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-family" is "\"Suisse Intl\", sans-serif" for "topic1Label" on "popularTopicsComponentPubPage"
    And I verify css attribute "font-size" is "14px" for "topic1Label" on "popularTopicsComponentPubPage"
    And I click "topic1Label" without scrolling on "popularTopicsComponentPubPage" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "URL/royalauto/transport.html"
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemTestPopularTopicComponent1PageIcon" on "aemLandingPage" screen using JavaScript
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot
