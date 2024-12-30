#Author: Sumanta Roy
#Date Created : 11 Dec 19
Feature: This feature contains sanity tests for the RACV microsites - BSG, Arevo, racv.me

  #Dry run completed on 11 Dec 19
  #NOTE - This test can only run on stage as there is no QA environment for BSG
  #SR 4 Dec 2020 - Updated test as per DAC-6854
  @TestBSGHomePageLoad
 	@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the Bourke Street Green microsite page loads as expected and validate menu links, subcribe and contact us fields
    #launch app form
    Given I launch app page "PURL1/content/racv/microsites/bourke-street-green.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I verify "bsgPageHeader" copy text on "bsgHomePage" screen
    #Check if menu links are there
    Then I verify "bsgMenuLink" element exists on "bsgHomePage" screen
    #Check Subscribe form fields are present
    And I verify "bsgFirstName" element exists on "bsgHomePage" screen
    And I verify "bsglastName" element exists on "bsgHomePage" screen
    And I verify "bsgEmail" element exists on "bsgHomePage" screen
    And I verify "bsgPhone" element exists on "bsgHomePage" screen
    And I verify "offersCheckBox" element exists on "bsgHomePage" screen
    And I click "offersCheckBox" on "bsgHomePage" screen
    And I verify "privacyText" element exists on "bsgHomePage" screen
    And I verify "subscribeButton" element exists on "bsgHomePage" screen
    And I take a screenshot
    #Check Enquiry form fields are present
    And I verify "bsgContactFirstName" element exists on "bsgHomePage" screen
    And I verify "bsgContactLastName" element exists on "bsgHomePage" screen
    And I verify "bsgContactEmail" element exists on "bsgHomePage" screen
    And I verify "bsgContactPhone" element exists on "bsgHomePage" screen
    And I verify "bsgContactEnquiryType" element exists on "bsgHomePage" screen
    And I verify "bsgContactEnquiryComments" element exists on "bsgHomePage" screen
    And I click "bsgContactEnquiryComments" on "bsgHomePage" screen
    And I verify "bsgContactPrivacyText" element exists on "bsgHomePage" screen
    And I verify "bsgContactUsSubmitButton" element exists on "bsgHomePage" screen
    And I take a screenshot

  #Dry run completed on 18 Dec 19
  #QA environment has been configured as this can't be parameterized
  @TestRacvMeWebPageLoad
  Scenario: Verify the Racv Me web-page loads as expected and validate logo, message bar, footer section
    #launch app form
    Given I launch app page "http://13.210.61.138:4503/content/racv/microsites/racv-me.html"
    And I dismiss GDPR notification if it exists
    When I verify "logoImage" element exists on "racvMeWebPage" screen
    And I take a screenshot
    Then I click "messageBar" on "racvMeWebPage" screen
    And I verify "messageBar" element exists on "racvMeWebPage" screen
    And I verify "footerSection" element exists on "racvMeWebPage" screen
    And I take a screenshot

  #Dry run completed on 18 Dec 19
  #SR 16 Nov 2020 - Updated environment.
  @TestSmartPlaceWebPageLoad
 	@Regression.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the Smartplace web-page loads as expected and validate logo, top links, Archive link, footer section
    #launch app form
    Given I launch app page "PURL1/content/racv/microsites/smartplace.html"
    And I dismiss GDPR notification if it exists
    #Check Logo
    When I verify "logoImage" element exists on "smartplaceHomePage" screen
    And I take a screenshot
    #Working Together link
    Then I click "workingTogetherLink" on "smartplaceHomePage" screen
    And I check the page address contains "/working-together.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "PURL1/content/racv/microsites/smartplace.html"
    #Working digitally link
    And I click "workingDigitallyLink" on "smartplaceHomePage" screen
    And I check the page address contains "/working-digitally.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "PURL1/content/racv/microsites/smartplace.html"
    #485+473 Bourke Link
    And I click "473485BourkeLink" on "smartplaceHomePage" screen
    And I check the page address contains "/485-and-473-bourke.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "PURL1/content/racv/microsites/smartplace.html"
    #Charli button
    And I verify "charliButton" element exists on "smartplaceHomePage" screen
    #Archive section
    And I click "archiveTitleText" on "smartplaceHomePage" screen
    And I take a screenshot
    #Discover more button
    And I click "discoverMoreButton" on "smartplaceHomePage" screen
    And I check the page address contains "/news.html"
    And I take a screenshot
    And I capture the address navigated to
    And I navigate to "PURL1/content/racv/microsites/smartplace.html"
    #Footer links container
    And I click "footerBar" on "smartplaceHomePage" screen
    And I verify "footerLinkContainer" element exists on "smartplaceHomePage" screen
    And I take a screenshot