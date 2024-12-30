#Author: Jing Zuo
Feature: This feature tests the Member Validation in AEM authoring and storybook

  @TestAuthoringMemberValidation-Redirect-Normal-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Member Validation with Redirect path and Normal membership validation and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-member-validation-redirect-normal-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-member-validation-redirect-normal-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure Member Validation"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    #Go to Advanced tab
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    #Go to Membership tab and enable member validation
    When I click "membershipTab" on "aemPageProperties" screen
    And I click "enableMemberValidation" on "aemPageProperties" screen
    And I take a screenshot
    #Select Redirect path for Member Choice, and Normal Membership Validation for Membership Validation Choice
    And I click "memberChoice" on "aemPageProperties" screen
    And I select "Redirect path" value for "memberChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I click "validationChoice" on "aemPageProperties" screen
    And I select "Normal Membership Validation" value for "validationChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "redirect-path-normal-validation" details in "formName" on "aemPageProperties" screen
    And I enter "https://uat-stores.neatideas.com.au/racv/handoversso/racv/?membernumber={memberid}&surname={lastname}" details in "pagePath" on "aemPageProperties" screen
    And I enter "Please enter valid details" details in "invalidDetails" on "aemPageProperties" screen
    And I enter "Member validation is currently unavailable. Please check back again later." details in "serviceDownMsg" on "aemPageProperties" screen
    And I enter "Please enter your membership details in the form below:" details in "formIntroTitle" on "aemPageProperties" screen
    And I enter "Please enter your membership number and family name in the form below (ensure there are no spaces at the beginning or end of your name)" details in "formTextDescription" on "aemPageProperties" screen
    And I take a screenshot
    And I clear contents of "forgotNumberLabel" element on "aemPageProperties" screen
    And I enter "Forgot your number?" details in "forgotNumberLabel" on "aemPageProperties" screen
    And I enter "https://my.racv.com.au/s/find-member-number" details in "forgotNumberLink" on "aemPageProperties" screen
    And I take a screenshot
    Then I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-member-validation-redirect-normal-RANDOM[0-8]-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Click forgot your number link
    When I click "forgotNumber" on "aemTestMemberValidationPagePublished" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "https://my.racv.com.au/s/find-member-number"
    And I navigate to "URL/racv-home/utility/qa/test-automation-member-validation-redirect-normal-RANDOM[0-8]-p3.html"
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "123456789" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "Test" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    And I take a screenshot
    #And I take a lambda snapshot "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://uat-stores.neatideas.com.au"
    And I take a screenshot

  @TestPublishMemberValidationRedirectNormal-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Member Validation Redirect Normal post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-member-validation-redirect-normal-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Click forgot your number link
    When I click "forgotNumber" on "aemTestMemberValidationPagePublished" screen
    And I capture the address navigated to
    And I take a screenshot
    And I check page address is "https://my.racv.com.au/s/find-member-number"
    And I navigate to "URL/racv-home/utility/qa/all-components/<theme>/test-automation-member-validation-redirect-normal-p3.html"
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "123456789" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "Test" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://uat-stores.neatideas.com.au"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringMemberValidation-Redirect-Club-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Member Validation with Redirect path and Club membership validation and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-member-validation-redirect-club-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-member-validation-redirect-club-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure Member Validation"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    #Go to Advanced tab
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    #Go to Membership tab and enable member validation
    When I click "membershipTab" on "aemPageProperties" screen
    And I click "enableMemberValidation" on "aemPageProperties" screen
    And I take a screenshot
    #Select Redirect path for Member Choice, and Club Membership Validation for Membership Validation Choice
    And I click "memberChoice" on "aemPageProperties" screen
    And I select "Redirect path" value for "memberChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I click "validationChoice" on "aemPageProperties" screen
    And I select "Club Membership Validation" value for "validationChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "redirect-path-club-validation" details in "formName" on "aemPageProperties" screen
    And I enter "https://uat-stores.neatideas.com.au/racv/handoversso/racv/?membernumber={memberid}&surname={lastname}" details in "pagePath" on "aemPageProperties" screen
    And I enter "Please enter valid details" details in "invalidDetails" on "aemPageProperties" screen
    And I enter "Member validation is currently unavailable. Please check back again later." details in "serviceDownMsg" on "aemPageProperties" screen
    And I enter "Please enter your membership details in the form below:" details in "formIntroTitle" on "aemPageProperties" screen
    And I enter "Please enter your membership number and family name in the form below (ensure there are no spaces at the beginning or end of your name)" details in "formTextDescription" on "aemPageProperties" screen
    And I take a screenshot
    And I clear contents of "forgotNumberLabel" element on "aemPageProperties" screen
    And I enter "Forgot your number?" details in "forgotNumberLabel" on "aemPageProperties" screen
    And I enter "https://my.racv.com.au/s/find-member-number" details in "forgotNumberLink" on "aemPageProperties" screen
    And I take a screenshot
    Then I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-member-validation-redirect-club-RANDOM[0-8]-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://uat-stores.neatideas.com.au"
    And I take a screenshot

  @TestPublishMemberValidationRedirectClub-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Member Validation Redirect Club post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-member-validation-redirect-club-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[clubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://uat-stores.neatideas.com.au"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringMemberValidation-Woolworth-Normal-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Member Validation with Woolworth integration and Normal membership validation and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-member-validation-woolworths-normal-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-member-validation-woolworths-normal-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure Member Validation"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    #Go to Advanced tab
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    #Go to Membership tab and enable member validation
    When I click "membershipTab" on "aemPageProperties" screen
    And I click "enableMemberValidation" on "aemPageProperties" screen
    And I take a screenshot
    #Select Woolworth Integration for Member Choice, and Normal Membership Validation for Membership Validation Choice
    And I click "memberChoice" on "aemPageProperties" screen
    And I select "Woolworth Integration" value for "memberChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I click "validationChoice" on "aemPageProperties" screen
    And I select "Normal Membership Validation" value for "validationChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "woolworths-integration-normal-validation" details in "formName" on "aemPageProperties" screen
    And I enter "Please enter valid details" details in "invalidDetails" on "aemPageProperties" screen
    And I enter "Member validation is currently unavailable. Please check back again later." details in "serviceDownMsg" on "aemPageProperties" screen
    And I enter "Please enter your membership details in the form below:" details in "formIntroTitle" on "aemPageProperties" screen
    And I enter "Please enter your membership number and family name in the form below (ensure there are no spaces at the beginning or end of your name)" details in "formTextDescription" on "aemPageProperties" screen
    And I take a screenshot
    And I clear contents of "forgotNumberLabel" element on "aemPageProperties" screen
    And I enter "Forgot your number?" details in "forgotNumberLabel" on "aemPageProperties" screen
    And I enter "https://my.racv.com.au/s/find-member-number" details in "forgotNumberLink" on "aemPageProperties" screen
    And I take a screenshot
    Then I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-member-validation-woolworths-normal-RANDOM[0-8]-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "firstName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "email" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "firstNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid first name
    When I enter "Test@123" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid first name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid email
    When I enter "Test@123" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    Then I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid email" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "123456789" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "Mr" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I enter "Test" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I enter "Smith" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://giftcards.woolworths.com.au"
    And I take a screenshot

  @TestPublishWoolworthsNormal-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Woolworths normal post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-member-validation-woolworths-normal-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "firstName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "email" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "firstNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid first name
    When I enter "Test@123" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid first name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid email
    When I enter "Test@123" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    Then I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid email" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid details
    When I enter "123456789" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "Mr" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I enter "Test" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "invalidDetailsMsg" on "aemTestMemberValidationPagePublished" screen or "30" seconds before proceeding
    Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid details" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter valid details
    When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I enter "Smith" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    And I wait for "submitButton" to disappear on "aemTestMemberValidationPagePublished" screen or "20" seconds before proceeding
    And I capture the address navigated to
    And I check the page address contains "https://giftcards.woolworths.com.au"
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringMemberValidation-Woolworth-Club-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author Member Validation with Woolworth integration and Club membership validation and verify published dispatcher component, accessibility and visually
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
    And I enter "test-automation-member-validation-woolworths-club-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-member-validation-woolworths-club-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure Member Validation"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    #Go to Advanced tab
    Then I click "advancedTab" on "aemPageProperties" screen
    And I click "addClientLib" on "aemPageProperties" screen
    And I click "clientLibrary" on "aemPageProperties" screen
    And I select "Forms" value for "clientLibraryList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    #Go to Membership tab and enable member validation
    When I click "membershipTab" on "aemPageProperties" screen
    And I click "enableMemberValidation" on "aemPageProperties" screen
    And I take a screenshot
    #Select Woolworth Integration for Member Choice, and Normal Membership Validation for Membership Validation Choice
    And I click "memberChoice" on "aemPageProperties" screen
    And I select "Woolworth Integration" value for "memberChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I click "validationChoice" on "aemPageProperties" screen
    And I select "Club Membership Validation" value for "validationChoiceList" drop down in "aemPageProperties" screen using selection method "visibleText"
    And I take a screenshot
    And I enter "woolworths-integration-club-validation" details in "formName" on "aemPageProperties" screen
    And I enter "Please enter valid details" details in "invalidDetails" on "aemPageProperties" screen
    And I enter "Member validation is currently unavailable. Please check back again later." details in "serviceDownMsg" on "aemPageProperties" screen
    And I enter "Please enter your membership details in the form below:" details in "formIntroTitle" on "aemPageProperties" screen
    And I enter "Please enter your membership number and family name in the form below (ensure there are no spaces at the beginning or end of your name)" details in "formTextDescription" on "aemPageProperties" screen
    And I take a screenshot
    And I clear contents of "forgotNumberLabel" element on "aemPageProperties" screen
    And I enter "Forgot your number?" details in "forgotNumberLabel" on "aemPageProperties" screen
    And I enter "https://my.racv.com.au/s/find-member-number" details in "forgotNumberLink" on "aemPageProperties" screen
    And I take a screenshot
    Then I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "10" seconds before proceeding
    #Publish the page
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish checks"
    And I navigate to "URL/racv-home/utility/qa/test-automation-member-validation-woolworths-club-RANDOM[0-8]-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "firstName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "email" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "firstNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid first name
    When I enter "Test@123" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid first name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid email
    When I enter "Test@123" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    Then I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    #And I take a lambda snapshot "invalid email" "hide-emergency-banner, hide-gdpr"
    #Can't submit the form due to https://racvone.atlassian.net/browse/AP3-3433
    #Enter invalid details
    #When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #And I enter "Mr" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    #And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    #Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    #And I take a screenshot
    ##And I take a lambda snapshot "invalid details" "hide-emergency-banner, hide-gdpr"
    #And I refresh the page
    #Enter valid details
    #When I enter "DATAMAP[clubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "Smith" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    #And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    #Then I verify "invalidDetailsMsg" element is not visible on "aemTestMemberValidationPagePublished" screen
    #And I capture the address navigated to
    #And I check the page address contains "https://giftcards.woolworths.com.au"
    #And I take a screenshot

  @TestPublishWoolworthsClub-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Woolworths club post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-member-validation-woolworths-club-p3.html"
    When I wait for "title" on "aemTestMemberValidationPagePublished" screen or "5" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "membershipNo" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "familyName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "firstName" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "email" element exists on "aemTestMemberValidationPagePublished" screen
    And I verify "forgotNumber" element exists on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr"
    #Click submit button without entering any details
    When I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    Then I verify "memberNoErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "familyNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "firstNameErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "empty fields" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid membership number
    When I enter "123456789a" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    And I click "familyName" on "aemTestMemberValidationPagePublished" screen
    Then I verify "invalidMemberNoMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid membership number" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid first name
    When I enter "Test@123" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid first name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid family name
    When I enter "Test@123" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #https://racvone.atlassian.net/browse/DAC-13514 - need to update error message
    Then I verify "invalidNameMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid family name" "hide-emergency-banner, hide-gdpr"
    And I refresh the page
    #Enter invalid email
    When I enter "Test@123" details in "email" on "aemTestMemberValidationPagePublished" screen
    And I click "membershipNo" on "aemTestMemberValidationPagePublished" screen
    Then I verify "emailErrorMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "invalid email" "hide-emergency-banner, hide-gdpr"
    #Can't submit the form due to https://racvone.atlassian.net/browse/AP3-3433
    #Enter invalid details
    #When I enter "DATAMAP[nonClubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #And I enter "Mr" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "DATAMAP[nonClubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    #And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    #Then I verify "invalidDetailsMsg" element is visible on "aemTestMemberValidationPagePublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "invalid details" "hide-emergency-banner, hide-gdpr"
    #And I refresh the page
    #Enter valid details
    #When I enter "DATAMAP[clubMemberNumber]" details in "membershipNo" on "aemTestMemberValidationPagePublished" screen
    #And I enter "DATAMAP[clubMemberSurname]" details in "familyName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "Smith" details in "firstName" on "aemTestMemberValidationPagePublished" screen
    #And I enter "digitalqa@racv.com.au" details in "email" on "aemTestMemberValidationPagePublished" screen
    #And I click "submitButton" on "aemTestMemberValidationPagePublished" screen
    #Then I verify "invalidDetailsMsg" element is not visible on "aemTestMemberValidationPagePublished" screen
    #And I capture the address navigated to
    #And I check the page address contains "https://giftcards.woolworths.com.au"
    #And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBMemberValidationRedirect
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation redirect path on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationRedirectSubmissionError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation redirect path and submission error on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showFormError:true&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "submissionError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationRedirectInputfieldError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation redirect path and input field error on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showInputFieldError:true&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "memberNoInputError" element is visible on "storybookMemberValidation" screen
    And I verify "familyNameInputError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworths
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworthsSubmissionError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration and submission error on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true;showFormError:true&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I verify "submissionError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworthsInputfieldError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration and input field error on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true;showInputFieldError:true&id=components-member-validation--member-validation-story&viewMode=story"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I verify "memberNoInputError" element is visible on "storybookMemberValidation" screen
    And I verify "firstNameInputError" element is visible on "storybookMemberValidation" screen
    And I verify "familyNameInputError" element is visible on "storybookMemberValidation" screen
    And I verify "emailInputError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationRedirect
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation redirect path (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationRedirectSubmissionError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation redirect path and submission error (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showFormError:true&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "submissionError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationRedirectInputfieldError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation redirect path and input field error (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showInputFieldError:true&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "memberNoInputError" element is visible on "storybookMemberValidation" screen
    And I verify "familyNameInputError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworths
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworthsSubmissionError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration and submission error (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true;showFormError:true&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I verify "submissionError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBMemberValidationWoolworthsInputfieldError
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify Member Validation Woolworths integration and input field error (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showWoolworthsFields:true;showInputFieldError:true&id=components-member-validation--member-validation-story&viewMode=story&globals=theme:club"
    And I verify "memberNo" element is visible on "storybookMemberValidation" screen
    And I verify "firstName" element is visible on "storybookMemberValidation" screen
    And I verify "familyName" element is visible on "storybookMemberValidation" screen
    And I verify "email" element is visible on "storybookMemberValidation" screen
    And I verify "memberNoInputError" element is visible on "storybookMemberValidation" screen
    And I verify "firstNameInputError" element is visible on "storybookMemberValidation" screen
    And I verify "familyNameInputError" element is visible on "storybookMemberValidation" screen
    And I verify "emailInputError" element is visible on "storybookMemberValidation" screen
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"