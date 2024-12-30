#Author: Viengcumm Thongvilu
#Date Created : 09 Aug 2021
Feature: This feature tests the legal and privacy pages

  #Dry run completed 09 Aug 2021
  @TestRACVPrivacyCharter
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the privacy charter page is working
    Given I launch app page "URL/about-racv/corporate-governance/legal/privacy-charter.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    When I click "collectionAccordion" on "racvPrivacyCharter" screen
    Then I verify "collectionText" element is visible on "racvPrivacyCharter" screen
    And I take a screenshot

  #Dry run completed 09 Aug 2021
  #DAC-9308 - SR 8 Sep 21 - Updated destination link as per latest content sync
  @TestRACVCompetitionsTermsAndConditions
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the RACV terms and conditions page is working
    Given I launch app page "URL/about-racv/corporate-governance/legal/competitions-terms-conditions.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    #When I click "viewCurrentCompetitionsButton" on "racvCompetitionsPage" screen
    #And I check the page address contains "/royalauto/news.html"
    #And I capture the address navigated to
    #And I take a screenshot
    #Then I navigate to "URL/about-racv/our-business/legal/competitions-terms-conditions.html"
    And I verify "linkList" element exists on "racvCompetitionsPage" screen
    And I take a screenshot

  #Dry run completed 09 Aug 2021
  @TestRACVLegal
  @Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the RACV legal page is working
    Given I launch app page "URL/about-racv/corporate-governance/legal.html"
    And I dismiss GDPR notification if it exists
    When I click "privacyCharterLink" on "racvLegal" screen
    Then I check the page address contains "/about-racv/corporate-governance/legal.html#privacy"
    And I capture the address navigated to
    And I take a screenshot
    And I verify "privacyCharterText" element exists on "racvLegal" screen
    And I click "tacAccordion" on "racvLegal" screen
    And I verify "tacText" element exists on "racvLegal" screen
    And I take a screenshot
    And I click "serviceAgreementAccordion" on "racvLegal" screen
    And I verify "serviceAgreementText" element exists on "racvLegal" screen
    And I take a screenshot