#Author: Jing Zuo
#Date Created : 29 May 2022
Feature: This feature is used to capture the full page screenshots for home contents insurance pages.

  @TestHomeContentsInsuranceFullPageScreenshotsV1
  @HomeContentsInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home contents insurance page version 1
    #launch AEM
    Given I launch app page "AEM"
    And I take a screenshot
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to in your home
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-contents-insurance"
    And I capture the address navigated to
    Then I click "aemHomeContentsInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 1
    #Click version 1
    And I click "version1" if found on "homeContentsInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version1Number" on "homeContentsInsuranceTimeline" screen
    And I capture the text of "version1Time" on "homeContentsInsuranceTimeline" screen
    And I take a screenshot
    And I click "version1Preview" on "homeContentsInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion1Compressed" on "contentsInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Compressed" on "contentsInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Compressed" on "contentsInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Compressed" on "contentsInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Compressed" on "contentsInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Compressed" on "contentsInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Compressed" on "contentsInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Compressed" on "contentsInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Compressed" on "contentsInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Compressed" on "contentsInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 11
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Compressed" on "contentsInsurancePage" screen
    And I verify "accordion11Expanded" element exists on "contentsInsurancePage" screen
    #Click accordion 12
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Compressed" on "contentsInsurancePage" screen
    And I verify "accordion12Expanded" element exists on "contentsInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "contentsInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Expanded" on "contentsInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Expanded" on "contentsInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Expanded" on "contentsInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Expanded" on "contentsInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Expanded" on "contentsInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Expanded" on "contentsInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Expanded" on "contentsInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Expanded" on "contentsInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Expanded" on "contentsInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Expanded" on "contentsInsurancePage" screen
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Expanded" on "contentsInsurancePage" screen
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I capture the address navigated to
    And I take a full-page screenshot for "page properties"

  @TestHomeContentsInsuranceFullPageScreenshotsV2
  @HomeContentsInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home contents insurance page version 2
    #launch AEM
    Given I launch app page "AEM"
    And I take a screenshot
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to in your home
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-contents-insurance"
    And I capture the address navigated to
    Then I click "aemHomeContentsInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 2
    #Click version 2
    And I click "version2" if found on "homeContentsInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version2Number" on "homeContentsInsuranceTimeline" screen
    And I capture the text of "version2Time" on "homeContentsInsuranceTimeline" screen
    And I take a screenshot
    And I click "version2Preview" on "homeContentsInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion1Compressed" on "contentsInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Compressed" on "contentsInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Compressed" on "contentsInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Compressed" on "contentsInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Compressed" on "contentsInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Compressed" on "contentsInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Compressed" on "contentsInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Compressed" on "contentsInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Compressed" on "contentsInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Compressed" on "contentsInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 11
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Compressed" on "contentsInsurancePage" screen
    And I verify "accordion11Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 12
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Compressed" on "contentsInsurancePage" screen
    And I verify "accordion12Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I capture the address navigated to
    And I take a full-page screenshot for "page properties"

  @TestHomeContentsInsuranceFullPageScreenshotsV3
  @HomeContentsInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home contents insurance page version 3
    #launch AEM
    Given I launch app page "AEM"
    And I take a screenshot
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to in your home
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-contents-insurance"
    And I capture the address navigated to
    Then I click "aemHomeContentsInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 3
    #Click version 3
    And I click "version3" if found on "homeContentsInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version3Number" on "homeContentsInsuranceTimeline" screen
    And I capture the text of "version3Time" on "homeContentsInsuranceTimeline" screen
    And I take a screenshot
    And I click "version3Preview" on "homeContentsInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion1Compressed" on "contentsInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Compressed" on "contentsInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Compressed" on "contentsInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Compressed" on "contentsInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Compressed" on "contentsInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Compressed" on "contentsInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Compressed" on "contentsInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Compressed" on "contentsInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Compressed" on "contentsInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Compressed" on "contentsInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 11
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Compressed" on "contentsInsurancePage" screen
    And I verify "accordion11Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 12
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Compressed" on "contentsInsurancePage" screen
    And I verify "accordion12Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I capture the address navigated to
    And I take a full-page screenshot for "page properties"

  @TestHomeContentsInsuranceFullPageScreenshotsV4
  @HomeContentsInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home contents insurance page version 4
    #launch AEM
    Given I launch app page "AEM"
    And I take a screenshot
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to in your home
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-contents-insurance"
    And I capture the address navigated to
    Then I click "aemHomeContentsInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 4
    #Click version 4
    And I click "version4" if found on "homeContentsInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version4Number" on "homeContentsInsuranceTimeline" screen
    And I capture the text of "version4Time" on "homeContentsInsuranceTimeline" screen
    And I take a screenshot
    And I click "version4Preview" on "homeContentsInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion1Compressed" on "contentsInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Compressed" on "contentsInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Compressed" on "contentsInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Compressed" on "contentsInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Compressed" on "contentsInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Compressed" on "contentsInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Compressed" on "contentsInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Compressed" on "contentsInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Compressed" on "contentsInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Compressed" on "contentsInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 11
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Compressed" on "contentsInsurancePage" screen
    And I verify "accordion11Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 12
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Compressed" on "contentsInsurancePage" screen
    And I verify "accordion12Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I capture the address navigated to
    And I take a full-page screenshot for "page properties"

  @TestHomeContentsInsuranceFullPageScreenshotsV5
  @HomeContentsInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home contents insurance page version 5
    #launch AEM
    Given I launch app page "AEM"
    And I take a screenshot
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to in your home
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-contents-insurance"
    And I capture the address navigated to
    Then I click "aemHomeContentsInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 5
    #Click version 5
    And I click "version5" if found on "homeContentsInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version5Number" on "homeContentsInsuranceTimeline" screen
    And I capture the text of "version5Time" on "homeContentsInsuranceTimeline" screen
    And I take a screenshot
    And I click "version5Preview" on "homeContentsInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeContentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion1Compressed" on "contentsInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion2Compressed" on "contentsInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion3Compressed" on "contentsInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion4Compressed" on "contentsInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion5Compressed" on "contentsInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion6Compressed" on "contentsInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion7Compressed" on "contentsInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion8Compressed" on "contentsInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion9Compressed" on "contentsInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion10Compressed" on "contentsInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 11
    And I verify "accordion11Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion11Compressed" on "contentsInsurancePage" screen
    And I verify "accordion11Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 12
    And I verify "accordion12Compressed" element exists on "contentsInsurancePage" screen
    And I click "accordion12Compressed" on "contentsInsurancePage" screen
    And I verify "accordion12Expanded" element exists on "contentsInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I capture the address navigated to
    And I take a full-page screenshot for "page properties"