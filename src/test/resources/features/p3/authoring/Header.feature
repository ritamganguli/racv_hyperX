#Author: Jing Zuo
#Date Created : 18 Aug 22
Feature: This feature tests the Header Component Authoring in P3

  @TestAuthoringHeader-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to configure Header component, create new page, verify published dispatcher component, accessibility and visual testing, delete the component and page
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to experience fragment to create a header here
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa/header"
    And I capture the address navigated to
    #Create a header experience fragment
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "variation" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I enter "test-automation-RANDOM[0-8]-p3-header" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createVariationButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/header/test-automation-RANDOM[0-8]-p3-header.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring EF"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Header component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "header" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "headerResultEF" on "aemInsertNewComponent" screen
    And I wait for "headerResultEF" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Click configuration of Header component
    And I click "headerComponent" on "aemExperienceFragmentsHeader" screen
    And I click "configureHeaderButton" on "aemExperienceFragmentsHeader" screen
    And I take a screenshot
    #Desktop Tab
    When I click "desktopTab" on "aemHeaderComponentDialog" screen
    And I click "addDesktopNavLinks" on "aemHeaderComponentDialog" screen
    #Add desktop nav link - About RACV
    And I enter "About RACV" details in "title1" on "aemHeaderComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv" details in "pagePath1" on "aemHeaderComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeaderComponentDialog" screen
    And I click "openInField1" on "aemHeaderComponentDialog" screen
    And I click "openInField1FirstOption" on "aemHeaderComponentDialog" screen
    Then I take a screenshot
    #Add desktop nav link - Help & Support
    When I click "addDesktopNavLinks" on "aemHeaderComponentDialog" screen
    And I enter "Help & Support" details in "title2" on "aemHeaderComponentDialog" screen
    And I enter "/content/racv/en/home/help-and-support/account-membership" details in "pagePath2" on "aemHeaderComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeaderComponentDialog" screen
    And I click "openInField2" on "aemHeaderComponentDialog" screen
    And I click "openInField2FirstOption" on "aemHeaderComponentDialog" screen
    Then I take a screenshot
    #Add desktop nav link - Contact
    When I click "addDesktopNavLinks" on "aemHeaderComponentDialog" screen
    And I enter "Contact" details in "title3" on "aemHeaderComponentDialog" screen
    And I enter "/content/racv/en/home/utility/contact-us" details in "pagePath3" on "aemHeaderComponentDialog" screen
    And I click "dropDownFirstResult" on "aemHeaderComponentDialog" screen
    And I click "openInField3" on "aemHeaderComponentDialog" screen
    And I click "openInField3FirstOption" on "aemHeaderComponentDialog" screen
    Then I take a screenshot
    #Mobile Tab / call icon page path
    When I click "mobileTab" on "aemHeaderComponentDialog" screen
    And I enter "/content/racv/en/home/contact-us" details in "callIconPath" on "aemHeaderComponentDialog" screen
    Then I take a screenshot
    #Logo Tab
    When I click "logoTab" on "aemHeaderComponentDialog" screen
    And I click "logoSvg" on "aemHeaderComponentDialog" screen
    And I select "RACV Header Logo" value for "logoSvgList" drop down in "aemHeaderComponentDialog" screen using selection method "visibleText"
    And I enter "/content/racv/en/home/racv-home" details in "logoUrl" on "aemHeaderComponentDialog" screen
    Then I take a screenshot
    #Search Tab
    When I click "searchTab" on "aemHeaderComponentDialog" screen
    And I verify "searchCount" field contains a value on "aemHeaderComponentDialog" screen
    And I verify "searchButtonLabel" field contains a value on "aemHeaderComponentDialog" screen
    And I verify "searchLinksLabel" field contains a value on "aemHeaderComponentDialog" screen
    And I verify "searchSuggestedLabel" field contains a value on "aemHeaderComponentDialog" screen
    And I verify "searchKeywords" field contains a value on "aemHeaderComponentDialog" screen
    #Login Tab
    When I click "loginTab" on "aemHeaderComponentDialog" screen
    And I enter "Login" details in "loginButtonTitle" on "aemHeaderComponentDialog" screen
    And I enter "https://my.racv.com.au/s/login/" details in "loginPagePath" on "aemHeaderComponentDialog" screen
    And I enter "login" details in "loginAltText" on "aemHeaderComponentDialog" screen
    #Save the component
    Then I take a screenshot
    And I click "saveButton" on "aemHeaderComponentDialog" screen
    And I wait for "saveButton" to disappear on "aemHeaderComponentDialog" screen or "10" seconds before proceeding
    #Click configuration of Header component
    When I click "contentTreeButton" on "aemEditorPage" screen
    And I click "navigationComponent" on "aemExperienceFragmentsHeader" screen
    And I click "configureNavigationButton" on "aemExperienceFragmentsHeader" screen
    And I take a screenshot
    #Properties Tab
    When I click "propertiesTab" on "aemNavigationComponentDialog" screen
    And I enter "/content/racv/en/home" details in "navRoot" on "aemNavigationComponentDialog" screen
    And I wait for "navRootOption" on "aemNavigationComponentDialog" screen or "2" seconds before proceeding
    And I click "navRootOption" on "aemNavigationComponentDialog" screen
    And I click "collectAllChildPages" on "aemNavigationComponentDialog" screen
    And I clear contents of "navStructureDepth" element on "aemNavigationComponentDialog" screen
    And I enter "4" details in "navStructureDepth" on "aemNavigationComponentDialog" screen
    And I enter "navigation_id" details in "navId" on "aemNavigationComponentDialog" screen
    Then I take a screenshot
    #Accessibility Tab
    When I click "accessibilityTab" on "aemNavigationComponentDialog" screen
    And I enter "navigation-label-test" details in "navLabel" on "aemNavigationComponentDialog" screen
    Then I take a screenshot
    #Save component
    And I click "saveButton" on "aemNavigationComponentDialog" screen
    #Publish /experience-fragments/racv/qa/header experience fragment
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring the page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-header-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/header/test-automation-RANDOM[0-8]-p3-header/jcr:content/root/container/header" details in "headerEFPath" on "aemPageProperties" screen
    And I click "saveClose" on "aemPageProperties" screen
    #Publish test automation page
    When I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Post publish validation - nav links
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "aboutRacv" element exists on "aemHeaderPagePublished" screen
    And I click "aboutRacv" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    Then I verify "helpSupport" element exists on "aemHeaderPagePublished" screen
    And I click "helpSupport" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/help-and-support/account-membership.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    Then I verify "contact" element exists on "aemHeaderPagePublished" screen
    And I click "contact" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/contact-us.html"
    #Post publish validation - logo
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    And I verify "logo" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on logo
    And I verify "data-event" attribute is "site interaction" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "logo image" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "racv" on "logo" element on "aemHeaderPagePublished" screen
    And I click "logo" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"
    Then I take a screenshot
    #Post publish validation - menus
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    And I take a screenshot
    And I verify "newsLifestyle" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on newsLifestyle
    And I verify "data-event" attribute is "site interaction" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "news & lifestyle" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    ##Click RoyalAuto
    And I click "newsLifestyle" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Hover RoyalAuto-News
    And I hover on "newsLifestyle" on "aemHeaderPagePublished" screen using Action class
    And I verify "newsInNewsAndLifestyle" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on newsInNewsAndLifestyle
    And I verify "data-event" attribute is "site interaction" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "news" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    ##Click RoyalAuto-News
    And I click "newsInNewsAndLifestyle" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/news.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Hover RoyalAuto-News-Community
    And I hover on "newsLifestyle" on "aemHeaderPagePublished" screen using Action class
    And I verify "communityInRoyalAutoNews" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on communityInRoyalAutoNews
    And I verify "data-event" attribute is "site interaction" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "community" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    ##Click RoyalAuto-News-Community
    And I click "communityInRoyalAutoNews" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/news/community.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Click Membership
    And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I click "membershipL1" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Click Cars & Transport
    And I click "carsTransport" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Click Travel & Experience
    And I click "travelExperience" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-experiences.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    ##Click In-your-home
    And I click "home" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/home.html"
    And I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    #Post publish validation - search
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    And I verify "searchButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on searchButton
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "search" on "searchButton" element on "aemHeaderPagePublished" screen
    ##Click search button
    And I click "searchButton" on "aemHeaderPagePublished" screen
    Then I verify "searchInput" element exists on "aemHeaderPagePublished" screen
    And I enter "racv" details in "searchInput" on "aemHeaderPagePublished" screen
    And I wait for "quickLinks" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I verify "quickLinks" element exists on "aemHeaderPagePublished" screen
    And I verify "searchSuggested" element exists on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I verify "searchSubmit" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on searchSubmit
    And I verify "data-event" attribute is "site interaction" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "search racv" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I click "searchClose" on "aemHeaderPagePublished" screen
    #Post publish validation - login
    And I verify "loginButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on loginButton
    And I verify "data-event" attribute is "site interaction" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "login" on "loginButton" element on "aemHeaderPagePublished" screen
    ##Click login button
    And I click "loginButton" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://my.racv.com.au/s/login/"
    #Post publish checks - accessibility and visual testing
    When I navigate to "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html"
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    Then I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile check"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/test-automation-header-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "menuButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on menuButton
    #And I verify "data-event" attribute is "site interaction" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "menu bar - mobile" on "menuButton" element on "aemHeaderPagePublished" screen
    #Then I click "menuButton" on "aemHeaderPagePublished" screen
    #And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership L1
    #And I verify "data-event" attribute is "site interaction" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "membership" on "membershipL1" element on "aemHeaderPagePublished" screen
    #When I click "membershipL1" on "aemHeaderPagePublished" screen
    #And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership1 L2
    #And I verify "data-event" attribute is "site interaction" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "manage your account" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    #And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on becomeMember
    #And I verify "data-event" attribute is "site interaction" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "link" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "log in" on "loginL3" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on callButton
    #And I verify "data-event" attribute is "site interaction" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "phone icon - mobile" on "callButton" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on loginButton
    #And I verify "data-event" attribute is "site interaction" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "login" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I take a screenshot

  @TestPublishHeader-p3
  #@Regression-p3.chrome.desktop
  #@PublishRegression-p3.chrome.desktop
  Scenario Outline: Header post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    And I take a screenshot
    Then I verify "aboutRacv" element exists on "aemHeaderPagePublished" screen
    And I click "aboutRacv" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    Then I verify "helpSupport" element exists on "aemHeaderPagePublished" screen
    And I click "helpSupport" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/help-and-support.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    Then I verify "contact" element exists on "aemHeaderPagePublished" screen
    And I click "contact" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "URL/contact-us.html"
    #Post publish validation - logo
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    And I verify "logo" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on logo
    And I verify "data-event" attribute is "site interaction" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "logo image" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "logo" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "racv" on "logo" element on "aemHeaderPagePublished" screen
    And I click "logo" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"
    Then I take a screenshot
    #Post publish validation - menus
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    And I take a screenshot
    And I verify "newsLifestyle" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on newsLifestyle
    And I verify "data-event" attribute is "site interaction" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "news & lifestyle" on "newsLifestyle" element on "aemHeaderPagePublished" screen
    ##Hover RoyalAuto
    And I hover on "newsLifestyle" on "aemHeaderPagePublished" screen using Action class
    And I take a screenshot
    ##Click RoyalAuto
    And I click "newsLifestyle" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Hover RoyalAuto-News
    And I hover on "newsLifestyle" on "aemHeaderPagePublished" screen using Action class
    And I verify "newsInNewsAndLifestyle" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on newsInNewsAndLifestyle
    And I verify "data-event" attribute is "site interaction" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "news" on "newsInNewsAndLifestyle" element on "aemHeaderPagePublished" screen
    ##Click RoyalAuto-News
    And I click "newsInNewsAndLifestyle" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/news.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Hover RoyalAuto-News-Community
    And I hover on "newsLifestyle" on "aemHeaderPagePublished" screen using Action class
    And I verify "communityInRoyalAutoNews" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on communityInRoyalAutoNews
    And I verify "data-event" attribute is "site interaction" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "community" on "communityInRoyalAutoNews" element on "aemHeaderPagePublished" screen
    ##Click RoyalAuto-News-Community
    And I click "communityInRoyalAutoNews" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/royalauto/news/community.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Click Membership
    And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I click "membershipL1" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/membership.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Click Cars & Transport
    And I click "carsTransport" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/cars-transport.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Click Travel & Experience
    And I click "travelExperience" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-experiences.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    ##Click In-your-home
    And I click "home" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/home.html"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    #Post publish validation - search
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    And I verify "searchButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on searchButton
    And I verify "data-event" attribute is "site interaction" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "searchButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "search" on "searchButton" element on "aemHeaderPagePublished" screen
    ##Click search button
    And I click "searchButton" on "aemHeaderPagePublished" screen
    Then I verify "searchInput" element exists on "aemHeaderPagePublished" screen
    And I enter "racv" details in "searchInput" on "aemHeaderPagePublished" screen
    And I wait for "quickLinks" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I verify "quickLinks" element exists on "aemHeaderPagePublished" screen
    And I verify "searchSuggested" element exists on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I verify "searchSubmit" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on searchSubmit
    And I verify "data-event" attribute is "site interaction" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "search racv" on "searchSubmit" element on "aemHeaderPagePublished" screen
    And I click "searchClose" on "aemHeaderPagePublished" screen
    #Post publish validation - login
    And I verify "loginButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on loginButton
    And I verify "data-event" attribute is "site interaction" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "login" on "loginButton" element on "aemHeaderPagePublished" screen
    ##Click login button
    And I click "loginButton" on "aemHeaderPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "https://my.racv.com.au/s/login/"
    #Post publish checks - accessibility and visual testing
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html"
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    Then I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile check"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "menuButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on menuButton
    #And I verify "data-event" attribute is "site interaction" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "menuButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "menu bar - mobile" on "menuButton" element on "aemHeaderPagePublished" screen
    #Then I click "menuButton" on "aemHeaderPagePublished" screen
    #And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership L1
    #And I verify "data-event" attribute is "site interaction" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "membershipL1" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "membership" on "membershipL1" element on "aemHeaderPagePublished" screen
    #When I click "membershipL1" on "aemHeaderPagePublished" screen
    #And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership1 L2
    #And I verify "data-event" attribute is "site interaction" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "manage your account" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    #When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    #And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on becomeMember
    #And I verify "data-event" attribute is "site interaction" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "link" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "loginL3" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "log in" on "loginL3" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on callButton
    #And I verify "data-event" attribute is "site interaction" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "callButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "phone icon - mobile" on "callButton" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on loginButton
    #And I verify "data-event" attribute is "site interaction" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-type" attribute is "button" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-location" attribute is "header" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I verify "data-description" attribute is "login" on "loginButton" element on "aemHeaderPagePublished" screen
    #And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishHeader-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  #@PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Header post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-header-p3.html" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "menuButton" element exists on "aemHeaderPagePublished" screen
    #Verify analytics attributes on menuButton
    And I verify "data-event" attribute is "site interaction" on "menuButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "menuButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "menuButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "menu bar - mobile" on "menuButton" element on "aemHeaderPagePublished" screen
    Then I click "menuButton" on "aemHeaderPagePublished" screen
    And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership L1
    And I verify "data-event" attribute is "site interaction" on "membershipL1" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "membershipL1" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "membershipL1" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "membership" on "membershipL1" element on "aemHeaderPagePublished" screen
    When I click "membershipL1" on "aemHeaderPagePublished" screen
    And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on membership1 L2
    And I verify "data-event" attribute is "site interaction" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "manage your account" on "manageYourAccountL2" element on "aemHeaderPagePublished" screen
    When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #Verify analytics attributes on becomeMember
    And I verify "data-event" attribute is "site interaction" on "loginL3" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "link" on "loginL3" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "loginL3" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "log in" on "loginL3" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on callButton
    And I verify "data-event" attribute is "site interaction" on "callButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "callButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "callButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "phone icon - mobile" on "callButton" element on "aemHeaderPagePublished" screen
    #Verify analytics attributes on loginButton
    And I verify "data-event" attribute is "site interaction" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-type" attribute is "button" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-location" attribute is "header" on "loginButton" element on "aemHeaderPagePublished" screen
    And I verify "data-description" attribute is "login" on "loginButton" element on "aemHeaderPagePublished" screen
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringHeaderStandard-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page using RACV Standard template, verify published dispatcher header component, accessibility and visual testing, delete the component and page
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to Utility to create the page here
    And I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #Select RACV standard page template
    And I click "standardPageTemplateRACV" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-header-standard-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-header-standard-RANDOM[0-8]-p3.html"
    #Publish test automation page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Desktop checks"
    #Post publish validation - mega menus L1/L2/L3
    When I navigate to "URL/utility/test-automation-header-standard-RANDOM[0-8]-p3.html"
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Membership L1
    And I click "membershipL1" on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I check the page address contains "/membership.html"
    And I navigate to "URL/utility/test-automation-header-standard-RANDOM[0-8]-p3.html"
    #Manage your account L2
    Then I hover on "membershipL1" on "aemHeaderPagePublished" screen using Action class
    And I take a screenshot
    And I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    And I check the page address contains "/membership/account.html"
    And I take a screenshot
    When I navigate to "URL/utility/test-automation-header-standard-RANDOM[0-8]-p3.html"
    #Login L3
    And I hover on "membershipL1" on "aemHeaderPagePublished" screen using Action class
    Then I click "loginL3" on "aemHeaderPagePublished" screen
    And I check the page address contains "my.racv.com.au/s/login/"
    And I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/utility/test-automation-header-standard-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Then I click "menuButton" on "aemHeaderPagePublished" screen
    #And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #When I click "membershipL1" on "aemHeaderPagePublished" screen
    #And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    #And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #And I close the browser

  @TestPublishHeaderStandardTemplate-p3
  #@Regression-p3.chrome.desktop
  #@PublishRegression-p3.chrome.desktop
  Scenario Outline: Header standard template post publish checks on <theme> theme
    Given I launch app page "URL/utility/test-automation-header-standard-p3.html"
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Membership L1
    And I click "membershipL1" on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I check the page address contains "/membership.html"
    And I navigate to "URL/utility/test-automation-header-standard-p3.html"
    #Manage your account L2
    Then I hover on "membershipL1" on "aemHeaderPagePublished" screen using Action class
    And I take a screenshot
    And I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    And I check the page address contains "/membership/account.html"
    And I take a screenshot
    When I navigate to "URL/utility/test-automation-header-standard-p3.html"
    #Login L3
    And I hover on "membershipL1" on "aemHeaderPagePublished" screen using Action class
    Then I click "loginL3" on "aemHeaderPagePublished" screen
    And I check the page address contains "my.racv.com.au/s/login/"
    And I take a screenshot
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/utility/test-automation-header-standard-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Then I click "menuButton" on "aemHeaderPagePublished" screen
    #And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #When I click "membershipL1" on "aemHeaderPagePublished" screen
    #And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    #And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    #Then I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishHeaderStandardTemplate-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  #@PublishRegression-p3.chrome.desktop
  Scenario Outline: Header standard template post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/utility/test-automation-header-standard-p3.html" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I click "menuButton" on "aemHeaderPagePublished" screen
    And I wait for "membershipL1" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    And I verify "membershipL1" element exists on "aemHeaderPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "click menu button" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    When I click "membershipL1" on "aemHeaderPagePublished" screen
    And I wait for "manageYourAccountL2" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "expand membership" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    When I click "manageYourAccountL2" on "aemHeaderPagePublished" screen
    And I wait for "loginL3" on "aemHeaderPagePublished" screen or "5" seconds before proceeding
    Then I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I take a lambda snapshot with "<theme>" appended named "become a member" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1" "enable-js"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBHeader
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify header visually in story book - desktop
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I hover on "insurance" on "storybookHeader" screen using Action class
    And I take a screenshot
    And I take a lambda snapshot "hover insurance/desktop" "hide-gdpr"
    And I hover on "homeInsurance" on "storybookHeader" screen using Action class
    And I take a screenshot
    And I take a lambda snapshot "hover home insurance/desktop" "hide-gdpr"
    And I click "searchButton" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "search" "hide-gdpr"
    And I click "searchInput" on "storybookHeader" screen
    And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "search results" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story" on "chrome" on "android-mobile"
    #When I take a screenshot
    #And I dismiss GDPR notification if it exists
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "menuButton" on "storybookHeader" screen
    #And I wait for "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot "menu/mobile" "hide-gdpr"
    #And I click "insuranceAccordion" on "storybookHeader" screen
    #And I take a screenshot
    #And I take a lambda snapshot "insurance/mobile" "hide-gdpr"
    #And I click "homeInsurance" on "storybookHeader" screen
    #And I take a screenshot
    #And I take a lambda snapshot "home insurance/mobile" "hide-gdpr"
    #And I click "searchInput" on "storybookHeader" screen
    #And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    #And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot "search results" "hide-gdpr"

  @TestSBHeader.chrome.android-mobile
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify header visually in story book - android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story" on "chrome" on "android-mobile"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "menuButton" on "storybookHeader" screen
    And I wait for "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "menu/mobile" "hide-gdpr"
    And I click "insuranceAccordion" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "insurance/mobile" "hide-gdpr"
    And I click "homeInsurance" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "home insurance/mobile" "hide-gdpr"
    And I click "searchInput" on "storybookHeader" screen
    And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "search results" "hide-gdpr"

  @TestSBHeader
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify header (club theme) visually in story book - desktop
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story&globals=theme:club"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I hover on "insurance" on "storybookHeader" screen using Action class
    And I take a screenshot
    And I take a lambda snapshot "hover insurance/desktop" "hide-gdpr"
    And I hover on "homeInsurance" on "storybookHeader" screen using Action class
    And I take a screenshot
    And I take a lambda snapshot "hover home insurance/desktop" "hide-gdpr"
    And I click "searchButton" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "search" "hide-gdpr"
    And I click "searchInput" on "storybookHeader" screen
    And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "search results" "hide-gdpr"
    And I close the browser
    #Mobile view verification
    #When I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #When I take a screenshot
    #And I dismiss GDPR notification if it exists
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "menuButton" on "storybookHeader" screen
    #And I wait for "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot "menu/mobile" "hide-gdpr"
    #And I click "insuranceAccordion" on "storybookHeader" screen
    #And I take a screenshot
    #And I take a lambda snapshot "insurance/mobile" "hide-gdpr"
    #And I click "homeInsurance" on "storybookHeader" screen
    #And I take a screenshot
    #And I take a lambda snapshot "home insurance/mobile" "hide-gdpr"
    #And I click "searchInput" on "storybookHeader" screen
    #And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    #And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    #And I take a screenshot
    #And I take a lambda snapshot "search results" "hide-gdpr"

  @TestSBHeader.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify header (club theme) visually in story book - android mobile
    #Mobile view verification
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-header--header-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    When I take a screenshot
    And I dismiss GDPR notification if it exists
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "menuButton" on "storybookHeader" screen
    And I wait for "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "menu/mobile" "hide-gdpr"
    And I click "insuranceAccordion" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "insurance/mobile" "hide-gdpr"
    And I click "homeInsurance" on "storybookHeader" screen
    And I take a screenshot
    And I take a lambda snapshot "home insurance/mobile" "hide-gdpr"
    And I click "searchInput" on "storybookHeader" screen
    And I enter "FAQs" details in "searchInput" on "storybookHeader" screen
    And I wait for "quickLinks" on "storybookHeader" screen or "5" seconds before proceeding
    And I take a screenshot
    And I take a lambda snapshot "search results" "hide-gdpr"