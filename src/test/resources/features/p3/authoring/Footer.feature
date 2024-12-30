#Author: Viengcumm Thongvilu
Feature: This feature tests the Footer in AEM authoring and storybook

  #Author: Jing Zuo
  #Date Created: 11 Nov 22
  @TestAuthoringFooter-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to configure Footer component, create new page, verify published dispatcher component, accessibility and visual testing, delete the component and page
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
    #Navigate to experience fragment to create a footer XF here
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa/footer"
    And I capture the address navigated to
    #Create a header experience fragment
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "variation" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I enter "test-automation-RANDOM[0-8]-p3-footer" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createVariationButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/footer/test-automation-RANDOM[0-8]-p3-footer.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring EF"
    #Search and add Footer component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "footer" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    And I wait for "footerResultEF" on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I verify "footerResultEF" element exists on "aemInsertNewComponent" screen
    Then I click "footerResultEF" on "aemInsertNewComponent" screen
    And I wait for "footerResultEF" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Click configuration of Footer component
    When I click "footerInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    Then I click "footerIcon" on "aemFooterComponentDialog" screen
    And I select "RACV Footer Logo" value for "footerIconList" drop down in "aemFooterComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "/content/racv/en/home/racv-home" details in "footerIconPath" on "aemFooterComponentDialog" screen
    And I enter "RACV logo" details in "logoAccessiblityLabel" on "aemFooterComponentDialog" screen
    And I take a screenshot
    And I verify "disclaimerText" field contains a value on "aemFooterComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemFooterComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemFooterComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 1st Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/insurance" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Insurance" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add link to insurance claims
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/insurance/claims" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Insurance claims test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    #Add link to home insurance claims
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/insurance/claims/home-insurance" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Home insurance test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 2nd Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/royalauto/transport" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Cars and Transport" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/transport/cars" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Cars test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto/transport/electric-vehicles" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Electric vehicle test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 3rd Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/on-the-road" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "On the road" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road/roadside-assistance" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Road assistance test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/on-the-road/driving-maintenance" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Driving maintenance test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 4th Link List component
    And I refresh the page
    When I click "contentTreeButton" on "aemEditorPage" screen
    And I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/business-solutions" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Business solutions" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/business-solutions/vehicles" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Vehicles" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/business-solutions/insurance" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Business insurance" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 5th Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/travel-leisure" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Travel and Experiences" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "RACV resorts test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/holidays" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Holidays test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 6th Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/membership" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "Membership" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/membership/member-benefits" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Member benefits test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/membership/become-a-member" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "Become a member test" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 7th Link List component
    When I click "linkListInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I wait for "linkHeading" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "linkHeading" on "aemLinkListComponentDialog" screen
    Then I enter "/content/racv/en/home/about-racv" details in "linkHeading" on "aemLinkListComponentDialog" screen
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I click "listHeading" on "aemLinkListComponentDialog" screen
    And I enter "About RACV" details in "listHeading" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    And I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv/careers" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "Careers test" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of 8th Link List component
    When I click "linkListLastInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    And I click "listSettingsTab" on "aemLinkListComponentDialog" screen
    And I wait for "buildList" on "aemLinkListComponentDialog" screen or "5" seconds before proceeding
    Then I click "buildList" on "aemLinkListComponentDialog" screen
    And I select "Fixed list" value for "usingList" drop down in "aemLinkListComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/travel-leisure/racv-club" details in "linkUrl1" on "aemLinkListComponentDialog" screen
    And I enter "RACV Club" details in "linkTitle1" on "aemLinkListComponentDialog" screen
    Then I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/travel-experiences/resorts" details in "linkUrl2" on "aemLinkListComponentDialog" screen
    And I enter "RACV Resorts" details in "linkTitle2" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "addButton" on "aemLinkListComponentDialog" screen
    And I enter "/content/racv/en/home/about-racv" details in "linkUrl3" on "aemLinkListComponentDialog" screen
    And I enter "About RACV" details in "linkTitle3" on "aemLinkListComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemLinkListComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemLinkListComponentDialog" screen or "2" seconds before proceeding
    #Click configuration of Social Share
    When I click "socialShareInTree" on "aemExperienceFragmentsFooter" screen
    And I click "configureButton" on "aemExperienceFragmentsFooter" screen
    And I take a screenshot
    #Add 1st social media
    Then I click "addSocialLinks" on "aemSocialShareComponentDialog" screen
    And I enter "Facebook" details in "altText1" on "aemSocialShareComponentDialog" screen
    And I enter "https://www.facebook.com/racv" details in "pagePath1" on "aemSocialShareComponentDialog" screen
    And I click "service1" on "aemSocialShareComponentDialog" screen
    And I select "Facebook" value for "service1List" drop down in "aemSocialShareComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add 2nd social media
    Then I click "addSocialLinks" on "aemSocialShareComponentDialog" screen
    And I enter "Instagram" details in "altText2" on "aemSocialShareComponentDialog" screen
    And I enter "https://www.instagram.com/racvofficial/" details in "pagePath2" on "aemSocialShareComponentDialog" screen
    And I click "service2" on "aemSocialShareComponentDialog" screen
    And I select "Instagram" value for "service2List" drop down in "aemSocialShareComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add 3rd social media
    Then I click "addSocialLinks" on "aemSocialShareComponentDialog" screen
    And I enter "Linkedin" details in "altText3" on "aemSocialShareComponentDialog" screen
    And I enter "https://www.linkedin.com/company/racv" details in "pagePath3" on "aemSocialShareComponentDialog" screen
    And I click "service3" on "aemSocialShareComponentDialog" screen
    And I select "Linked In" value for "service3List" drop down in "aemSocialShareComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add 4th social media
    Then I click "addSocialLinks" on "aemSocialShareComponentDialog" screen
    And I enter "Twitter" details in "altText4" on "aemSocialShareComponentDialog" screen
    And I enter "https://twitter.com/RACV_Official" details in "pagePath4" on "aemSocialShareComponentDialog" screen
    And I click "service4" on "aemSocialShareComponentDialog" screen
    And I select "Twitter" value for "service4List" drop down in "aemSocialShareComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    #Add 5th social media
    Then I click "addSocialLinks" on "aemSocialShareComponentDialog" screen
    And I enter "YouTube" details in "altText5" on "aemSocialShareComponentDialog" screen
    And I enter "https://www.youtube.com/racvofficial" details in "pagePath5" on "aemSocialShareComponentDialog" screen
    And I click "service5" on "aemSocialShareComponentDialog" screen
    And I select "You Tube" value for "service5List" drop down in "aemSocialShareComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemSocialShareComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemSocialShareComponentDialog" screen or "2" seconds before proceeding
    #Publish the footer EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring Page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-footer-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/footer/test-automation-RANDOM[0-8]-p3-footer/jcr:content/root/container/footer" details in "footerEFPath" on "aemPageProperties" screen
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish test automation page
    When I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Post publish checks - accessibility and visual testing
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I capture the address navigated to
    And I wait for "racvLogo" on "aemFooterPagePublished" screen or "5" seconds before proceeding
    And I verify "racvLogo" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on racvLogo
    And I verify "data-event" attribute is "site interaction" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "logo image" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "racv" on "racvLogo" element on "aemFooterPagePublished" screen
    And I take a screenshot
    And I dismiss GDPR notification if it exists
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    Then I take a screenshot
    And I click "racvLogo" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"
    #Post publish validation - Level 1 heading text
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "insurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insurance
    And I verify "data-event" attribute is "site interaction" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance" on "insurance" element on "aemFooterPagePublished" screen
    And I click "insurance" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance.html"
    #Post publish validation - Level 2 text links
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "insuranceClaims" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insuranceClaims
    And I verify "data-event" attribute is "site interaction" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance claims test" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I click "insuranceClaims" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance/claims.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "homeInsurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on homeInsurance
    And I verify "data-event" attribute is "site interaction" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "home insurance test" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I click "homeInsurance" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance/claims/home-insurance.html"
    #Post publish validation - Links
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "club" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on club
    And I verify "data-event" attribute is "site interaction" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "racv club" on "club" element on "aemFooterPagePublished" screen
    And I click "club" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-leisure/racv-club.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "resorts" element exists on "aemFooterPagePublished" screen
    And I click "resorts" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-experiences/resorts.html"
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "about" element exists on "aemFooterPagePublished" screen
    And I click "about" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    And I take a screenshot
    #Post publish validation - Copyright
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "disclaimerText" element exists on "aemFooterPagePublished" screen
    #Post publish validation - Social Share
    When I navigate to "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html"
    And I take a screenshot
    Then I verify "facebook" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on facebook
    And I verify "data-event" attribute is "site interaction" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "social icon" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "facebook" on "facebook" element on "aemFooterPagePublished" screen
    And I click "facebook" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    #need to check twice as the link could be https://www.facebook.com/login/?next=https%3A%2F%2Fwww.facebook.com%2Fracv or https://www.facebook.com/racv
    And I check the page address contains "facebook.com/"
    And I check the page address contains "racv"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "instagram" element exists on "aemFooterPagePublished" screen
    And I click "instagram" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "instagram.com/"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "linkedIn" element exists on "aemFooterPagePublished" screen
    And I click "linkedIn" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "linkedin.com"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "twitter" element exists on "aemFooterPagePublished" screen
    And I click "twitter" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "https://x.com/"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "youtube" element exists on "aemFooterPagePublished" screen
    And I click "youtube" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "youtube.com/racvofficial"
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/test-automation-footer-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "insurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insurance
    #And I verify "data-event" attribute is "site interaction" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "insurance" on "insurance" element on "aemFooterPagePublished" screen
    #When I click "insurance" on "aemFooterPagePublished" screen
    #Then I verify "insuranceClaims" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insuranceClaims
    #And I verify "data-event" attribute is "site interaction" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "insurance claims test" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "homeInsurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on homeInsurance
    #And I verify "data-event" attribute is "site interaction" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "home insurance test" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click insurance" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Then I verify "club" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on club
    #And I verify "data-event" attribute is "site interaction" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "racv club" on "club" element on "aemFooterPagePublished" screen
    #And I verify "facebook" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on facebook
    #And I verify "data-event" attribute is "site interaction" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "social icon" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "facebook" on "facebook" element on "aemFooterPagePublished" screen
    #And I close the browser

  @TestPublishFooter-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Footer post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I capture the address navigated to
    And I wait for "racvLogo" on "aemFooterPagePublished" screen or "5" seconds before proceeding
    And I verify "racvLogo" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on racvLogo
    And I verify "data-event" attribute is "site interaction" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "logo image" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "racvLogo" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "racv" on "racvLogo" element on "aemFooterPagePublished" screen
    And I take a screenshot
    And I dismiss GDPR notification if it exists
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    Then I take a screenshot
    And I click "racvLogo" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/racv-home.html"
    #Post publish validation - Level 1 heading text
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "insurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insurance
    And I verify "data-event" attribute is "site interaction" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance" on "insurance" element on "aemFooterPagePublished" screen
    And I click "insurance" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance.html"
    #Post publish validation - Level 2 text links
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "insuranceClaims" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insuranceClaims
    And I verify "data-event" attribute is "site interaction" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance claims test" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I click "insuranceClaims" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance/claims.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "homeInsurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on homeInsurance
    And I verify "data-event" attribute is "site interaction" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "home insurance test" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I click "homeInsurance" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/insurance/claims/home-insurance.html"
    #Post publish validation - Links
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "club" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on club
    And I verify "data-event" attribute is "site interaction" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "racv club" on "club" element on "aemFooterPagePublished" screen
    And I click "club" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-leisure/racv-club.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "resorts" element exists on "aemFooterPagePublished" screen
    And I click "resorts" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/travel-experiences/resorts.html"
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "about" element exists on "aemFooterPagePublished" screen
    And I click "about" on "aemFooterPagePublished" screen
    And I capture the address navigated to
    And I check the page address contains "/about-racv.html"
    #Post publish validation - Copyright
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "disclaimerText" element exists on "aemFooterPagePublished" screen
    #Post publish validation - Social Share
    When I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html"
    And I take a screenshot
    Then I verify "facebook" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on facebook
    And I verify "data-event" attribute is "site interaction" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "social icon" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "facebook" on "facebook" element on "aemFooterPagePublished" screen
    And I click "facebook" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    #need to check twice as the link could be https://www.facebook.com/login/?next=https%3A%2F%2Fwww.facebook.com%2Fracv or https://www.facebook.com/racv
    And I check the page address contains "facebook.com/"
    And I check the page address contains "racv"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "instagram" element exists on "aemFooterPagePublished" screen
    And I click "instagram" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "instagram.com/"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "linkedIn" element exists on "aemFooterPagePublished" screen
    And I click "linkedIn" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "linkedin.com"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "twitter" element exists on "aemFooterPagePublished" screen
    And I click "twitter" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "https://x.com/"
    When I switch to "parent" browser tab
    And I take a screenshot
    Then I verify "youtube" element exists on "aemFooterPagePublished" screen
    And I click "youtube" on "aemFooterPagePublished" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I check the page address contains "youtube.com/racvofficial"
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I close the browser
    #Then I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I verify "insurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insurance
    #And I verify "data-event" attribute is "site interaction" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "accordion" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "insurance" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "insurance" on "insurance" element on "aemFooterPagePublished" screen
    #When I click "insurance" on "aemFooterPagePublished" screen
    #Then I verify "insuranceClaims" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insuranceClaims
    #And I verify "data-event" attribute is "site interaction" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "insurance claims test" on "insuranceClaims" element on "aemFooterPagePublished" screen
    #And I verify "homeInsurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on homeInsurance
    #And I verify "data-event" attribute is "site interaction" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "home insurance test" on "homeInsurance" element on "aemFooterPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "click insurance" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Then I verify "club" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on club
    #And I verify "data-event" attribute is "site interaction" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "links" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "club" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "racv club" on "club" element on "aemFooterPagePublished" screen
    #And I verify "facebook" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on facebook
    #And I verify "data-event" attribute is "site interaction" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-type" attribute is "social icon" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-location" attribute is "footer" on "facebook" element on "aemFooterPagePublished" screen
    #And I verify "data-description" attribute is "facebook" on "facebook" element on "aemFooterPagePublished" screen
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishFooter-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Footer post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-footer-p3.html" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify "insurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insurance
    And I verify "data-event" attribute is "site interaction" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "accordion" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance" on "insurance" element on "aemFooterPagePublished" screen
    When I click "insurance" on "aemFooterPagePublished" screen
    Then I verify "insuranceClaims" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on insuranceClaims
    And I verify "data-event" attribute is "site interaction" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "insurance claims test" on "insuranceClaims" element on "aemFooterPagePublished" screen
    And I verify "homeInsurance" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on homeInsurance
    And I verify "data-event" attribute is "site interaction" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "home insurance test" on "homeInsurance" element on "aemFooterPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "click insurance" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    Then I verify "club" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on club
    And I verify "data-event" attribute is "site interaction" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "links" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "club" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "racv club" on "club" element on "aemFooterPagePublished" screen
    And I verify "facebook" element exists on "aemFooterPagePublished" screen
    #Verify analytics attributes on facebook
    And I verify "data-event" attribute is "site interaction" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-type" attribute is "social icon" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-location" attribute is "footer" on "facebook" element on "aemFooterPagePublished" screen
    And I verify "data-description" attribute is "facebook" on "facebook" element on "aemFooterPagePublished" screen
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBFooter
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify footer on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I close the browser
    #Then I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "insuranceAccordion" on "storybookFooter" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click insurance" "hide-gdpr"

  @TestSBFooter.chrome.android-mobile
  #@Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.android-mobile
  Scenario: Verify footer on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "insuranceAccordion" on "storybookFooter" screen
    And I take a screenshot
    And I take a lambda snapshot "click insurance" "hide-gdpr"

  @TestSBFooter
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify footer (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story&globals=theme:club"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I close the browser
    #Then I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    #And I click "insuranceAccordion" on "storybookFooter" screen
    #And I take a screenshot
    #And I take a lambda snapshot "click insurance" "hide-gdpr"

  @TestSBFooter.chrome.android-mobile
  @Storybook-regression-p3-club.chrome.android-mobile
  Scenario: Verify footer (club theme) on storybook on android mobile
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-footer--footer-story&viewMode=story&globals=theme:club" on "chrome" on "android-mobile"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I click "insuranceAccordion" on "storybookFooter" screen
    And I take a screenshot
    And I take a lambda snapshot "click insurance" "hide-gdpr"