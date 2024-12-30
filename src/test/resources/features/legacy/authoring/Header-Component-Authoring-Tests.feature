#Author: Sumanta Roy
#Date created - 23 Mar 2021
#NOTE - Only authoring fields have been validated here as changes to these components will impact other tests
Feature: This feature tests the Header and Navigation component and it's fields from an authoring perspective.

  #SR 23 Mar 2021 DAC-6867
  #NOTE - The multifields in the component do not have value attribute set hence verifying the defaults set is not possible. This OOTB.
  @TestHeaderComponentAuthoring
  #@AuthoringSanity.chrome.desktop
  #@AuthoringRegression3.chrome.desktop
  Scenario: Verify author is able to edit and verify the fields in the Header component on the Home page
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
    #Open the home page
    Then I navigate to "AEM/editor.html/content/racv/en/home.html"
    And I capture the address navigated to
    #Open content tree and edit Header
    And I click "sidePanelButton" on "aemHeaderCompPage" screen
    And I click "contentTreeButton" on "aemHeaderCompPage" screen
    And I click "headerComponent" on "aemHeaderCompPage" screen
    And I click "configureHeaderButton" on "aemHeaderCompPage" screen
    And I take a screenshot
    #Desktop Tab
    And I click "desktopTabLink" on "aemHeaderCompPage" screen
    And I verify "pagePathField1" element exists on "aemHeaderCompPage" screen
    And I verify "titleField1" element exists on "aemHeaderCompPage" screen
    And I verify "openInField1" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField1" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathField2" element exists on "aemHeaderCompPage" screen
    And I verify "titleField2" element exists on "aemHeaderCompPage" screen
    And I verify "openInField2" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField2" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathField3" element exists on "aemHeaderCompPage" screen
    And I verify "titleField3" element exists on "aemHeaderCompPage" screen
    And I verify "openInField3" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField3" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathField4" element exists on "aemHeaderCompPage" screen
    And I verify "titleField4" element exists on "aemHeaderCompPage" screen
    And I verify "openInField4" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField4" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathField5" element exists on "aemHeaderCompPage" screen
    And I verify "titleField5" element exists on "aemHeaderCompPage" screen
    And I verify "openInField5" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField5" element exists on "aemHeaderCompPage" screen
    And I take a screenshot
    #Add a field and check new fields are added
    And I click "addFieldButton" on "aemHeaderCompPage" screen
    And I take a screenshot
    And I verify "pagePathField6" element exists on "aemHeaderCompPage" screen
    And I verify "titleField6" element exists on "aemHeaderCompPage" screen
    And I verify "openInField6" element exists on "aemHeaderCompPage" screen
    And I verify "altTextField6" element exists on "aemHeaderCompPage" screen
    #Delete the newly added fields
    And I click "deleteField6" on "aemHeaderCompPage" screen
    And I take a screenshot
    #Mobile tab
    And I click "mobileTabLink" on "aemHeaderCompPage" screen
    And I take a screenshot
    And I verify "pagePathMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "titleMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "openInMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "altTextMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "callLabelMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "callNumberMobileField1" element exists on "aemHeaderCompPage" screen
    And I verify "searchResultCountField1" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "titleMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "openInMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "altTextMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "callLabelMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "callNumberMobileField2" element exists on "aemHeaderCompPage" screen
    And I verify "searchResultCountField2" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "titleMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "openInMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "altTextMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "callLabelMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "callNumberMobileField3" element exists on "aemHeaderCompPage" screen
    And I verify "searchResultCountField3" element exists on "aemHeaderCompPage" screen
    And I verify "pagePathMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "titleMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "openInMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "altTextMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "callLabelMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "callNumberMobileField4" element exists on "aemHeaderCompPage" screen
    And I verify "searchResultCountField4" element exists on "aemHeaderCompPage" screen
    #Add a field and check new fields are added
    And I click "addFieldButtonMobile" on "aemHeaderCompPage" screen
    And I take a screenshot
    And I verify "pagePathMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "titleMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "openInMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "altTextMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "callLabelMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "callNumberMobileField5" element exists on "aemHeaderCompPage" screen
    And I verify "searchResultCountField5" element exists on "aemHeaderCompPage" screen
    #Delete the newly added fields
    And I click "deleteButtonMobileNewField" on "aemHeaderCompPage" screen
    And I take a screenshot
    And I verify "mobileButtonTitle1" element exists on "aemHeaderCompPage" screen
    And I verify "mobileButtonPath1" element exists on "aemHeaderCompPage" screen
    And I take a screenshot
    #check value
    And I verify "mobileButtonPath1" field contains a value on "aemHeaderCompPage" screen
    And I verify "mobileButtonAltText1" element exists on "aemHeaderCompPage" screen
    And I verify "mobileButtonOpenMode1" element exists on "aemHeaderCompPage" screen
    And I verify "mobileButtonTitle2" element exists on "aemHeaderCompPage" screen
    And I verify "mobileButtonPath2" element exists on "aemHeaderCompPage" screen
    #check value
    And I verify "mobileButtonPath2" field contains a value on "aemHeaderCompPage" screen
    And I verify "mobileButtonAltText2" element exists on "aemHeaderCompPage" screen
    And I verify "mobileButtonOpenMode2" element exists on "aemHeaderCompPage" screen
    And I take a screenshot
    #Logo Tab
    And I click "logoTabLink" on "aemHeaderCompPage" screen
    And I verify "desktopLogoSVG" element exists on "aemHeaderCompPage" screen
    And I verify "mobileLogoSVG" element exists on "aemHeaderCompPage" screen
    And I verify "logoSecTitle" element exists on "aemHeaderCompPage" screen
    And I take a screenshot
    #Close dialog
    And I click "cancelDialogButton" on "aemHeaderCompPage" screen
    And I take a screenshot

  #SR 24 Mar 2021 DAC-6867
  #NOTE - The saved values in the fields have been verified as a part of the locators used to validate the fields.
  @TestNavigationComponentAuthoring
  #@AuthoringRegression3.chrome.desktop
  Scenario: Verify author is able to edit and verify the fields in the Navigation component on the Home page
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
    #Open the home page
    Then I navigate to "AEM/editor.html/content/racv/en/home.html"
    And I capture the address navigated to
    #Open content tree and edit Navigation - reusing some common objects from aemHeaderCompPage
    And I click "sidePanelButton" on "aemHeaderCompPage" screen
    And I click "contentTreeButton" on "aemHeaderCompPage" screen
    And I click "navigationComponent" on "aemNavigationCompPage" screen
    And I click "configureNavigationButton" on "aemNavigationCompPage" screen
    And I take a screenshot
    #Buttons Tab
    And I click "buttonsTabLink" on "aemNavigationCompPage" screen
    And I take a screenshot
    And I verify "viewTypeField" element exists on "aemNavigationCompPage" screen
    And I verify "viewTypeField" field contains a value on "aemNavigationCompPage" screen
    And I verify "titleButton1" element exists on "aemNavigationCompPage" screen
    And I verify "urlButton1" element exists on "aemNavigationCompPage" screen
    And I verify "altTextButton1" element exists on "aemNavigationCompPage" screen
    And I verify "openInButton1" element exists on "aemNavigationCompPage" screen
    And I verify "titleButton2" element exists on "aemNavigationCompPage" screen
    And I verify "urlButton2" element exists on "aemNavigationCompPage" screen
    And I verify "altTextButton2" element exists on "aemNavigationCompPage" screen
    And I verify "openInButton2" element exists on "aemNavigationCompPage" screen
    And I click "openInButton2" on "aemNavigationCompPage" screen
    And I take a screenshot
    #Search Configration Tab
    And I click "searchConfigTabLink" on "aemNavigationCompPage" screen
    And I take a screenshot
    And I verify "quickLinkLabel" element exists on "aemNavigationCompPage" screen
    And I verify "suggestedSearchLabel" element exists on "aemNavigationCompPage" screen
    And I verify "searchResultCount" element exists on "aemNavigationCompPage" screen
    And I verify "searchResultCount" field contains a value on "aemNavigationCompPage" screen
    # Check increment/ decrement
    And I click "searchResultCountIncrementBtn" on "aemNavigationCompPage" screen
    And I take a screenshot
    And I verify "searchResultCountUpdatedValue" field contains a value on "aemNavigationCompPage" screen
    And I click "searchResultCountDecrementBtn" on "aemNavigationCompPage" screen
    And I take a screenshot
    And I verify "searchButtonLabel" element exists on "aemNavigationCompPage" screen
    And I verify "searchKeywordHelp" element exists on "aemNavigationCompPage" screen
    And I verify "closeLabel" element exists on "aemNavigationCompPage" screen
    And I verify "hideSearchCheckbox" element exists on "aemNavigationCompPage" screen
    And I click "closeLabel" on "aemNavigationCompPage" screen
    And I take a screenshot
    #Close dialog
    And I click "cancelDialogButton" on "aemHeaderCompPage" screen
    And I take a screenshot