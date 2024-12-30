#Author: Jing Zuo
#Date Created : 29 May 2022
Feature: This feature is used to capture the full page screenshots for combined insurance pages.

  @TestCombinedInsuranceFullPageScreenshotsV1
  @CombinedInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for combined home building and contents insurance page version 1
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance"
    And I capture the address navigated to
    Then I click "aemCombinedInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 1
    #Click version 1
    And I click "version1" if found on "combinedInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version1Number" on "combinedInsuranceTimeline" screen
    And I capture the text of "version1Time" on "combinedInsuranceTimeline" screen
    And I take a screenshot
    And I click "version1Preview" on "combinedInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion1Compressed" on "combinedInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Compressed" on "combinedInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Compressed" on "combinedInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Compressed" on "combinedInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Compressed" on "combinedInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Compressed" on "combinedInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Compressed" on "combinedInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Compressed" on "combinedInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Compressed" on "combinedInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Compressed" on "combinedInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "combinedInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Expanded" on "combinedInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Expanded" on "combinedInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Expanded" on "combinedInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Expanded" on "combinedInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Expanded" on "combinedInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Expanded" on "combinedInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Expanded" on "combinedInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Expanded" on "combinedInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Expanded" on "combinedInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestCombinedInsuranceFullPageScreenshotsV2
  @CombinedInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for combined home building and contents insurance page version 2
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance"
    And I capture the address navigated to
    Then I click "aemCombinedInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 2
    #Click version 2
    And I click "version2" if found on "combinedInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version2Number" on "combinedInsuranceTimeline" screen
    And I capture the text of "version2Time" on "combinedInsuranceTimeline" screen
    And I take a screenshot
    And I click "version2Preview" on "combinedInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion1Compressed" on "combinedInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Compressed" on "combinedInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Compressed" on "combinedInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Compressed" on "combinedInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Compressed" on "combinedInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Compressed" on "combinedInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Compressed" on "combinedInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Compressed" on "combinedInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Compressed" on "combinedInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Compressed" on "combinedInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "combinedInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Expanded" on "combinedInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Expanded" on "combinedInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Expanded" on "combinedInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Expanded" on "combinedInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Expanded" on "combinedInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Expanded" on "combinedInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Expanded" on "combinedInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "homecombinedInsurancePageInsurancePage" screen
    And I click "accordion9Expanded" on "combinedInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Expanded" on "combinedInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestCombinedInsuranceFullPageScreenshotsV3
  @CombinedInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for combined home building and contents insurance page version 3
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance"
    And I capture the address navigated to
    Then I click "aemCombinedInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 3
    #Click version 3
    And I click "version3" if found on "combinedInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version3Number" on "combinedInsuranceTimeline" screen
    And I capture the text of "version3Time" on "combinedInsuranceTimeline" screen
    And I take a screenshot
    And I click "version3Preview" on "combinedInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion1Compressed" on "combinedInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Compressed" on "combinedInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Compressed" on "combinedInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Compressed" on "combinedInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Compressed" on "combinedInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Compressed" on "combinedInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Compressed" on "combinedInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Compressed" on "combinedInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Compressed" on "combinedInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Compressed" on "combinedInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "combinedInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Expanded" on "combinedInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Expanded" on "combinedInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Expanded" on "combinedInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Expanded" on "combinedInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Expanded" on "combinedInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Expanded" on "combinedInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Expanded" on "combinedInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Expanded" on "combinedInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Expanded" on "combinedInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestCombinedInsuranceFullPageScreenshotsV4
  @CombinedInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for combined home building and contents insurance page version 4
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance"
    And I capture the address navigated to
    Then I click "aemCombinedInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 4
    #Click version 4
    And I click "version4" if found on "combinedInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version4Number" on "combinedInsuranceTimeline" screen
    And I capture the text of "version4Time" on "combinedInsuranceTimeline" screen
    And I take a screenshot
    And I click "version4Preview" on "combinedInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion1Compressed" on "combinedInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Compressed" on "combinedInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Compressed" on "combinedInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Compressed" on "combinedInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Compressed" on "combinedInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Compressed" on "combinedInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Compressed" on "combinedInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Compressed" on "combinedInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Compressed" on "combinedInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Compressed" on "combinedInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "combinedInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Expanded" on "combinedInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Expanded" on "combinedInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Expanded" on "combinedInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Expanded" on "combinedInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Expanded" on "combinedInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Expanded" on "combinedInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Expanded" on "combinedInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Expanded" on "combinedInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Expanded" on "combinedInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestCombinedInsuranceFullPageScreenshotsV5
  @CombinedInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for combined home building and contents insurance page version 5
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance"
    And I capture the address navigated to
    Then I click "aemCombinedInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 5
    #Click version 5
    And I click "version5" if found on "combinedInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version5Number" on "combinedInsuranceTimeline" screen
    And I capture the text of "version5Time" on "combinedInsuranceTimeline" screen
    And I take a screenshot
    And I click "version5Preview" on "combinedInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/combined-home-building-and-contents-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "combinedInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion1Compressed" on "combinedInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Compressed" on "combinedInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Compressed" on "combinedInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Compressed" on "combinedInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Compressed" on "combinedInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Compressed" on "combinedInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Compressed" on "combinedInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Compressed" on "combinedInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 9
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Compressed" on "combinedInsurancePage" screen
    And I verify "accordion9Expanded" element exists on "combinedInsurancePage" screen
    #Click accordion 10
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Compressed" on "combinedInsurancePage" screen
    And I verify "accordion10Expanded" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "combinedInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion2Expanded" on "combinedInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion3Expanded" on "combinedInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion4Expanded" on "combinedInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion5Expanded" on "combinedInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion6Expanded" on "combinedInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion7Expanded" on "combinedInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion8Expanded" on "combinedInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion9Expanded" on "combinedInsurancePage" screen
    And I verify "accordion9Compressed" element exists on "combinedInsurancePage" screen
    And I click "accordion10Expanded" on "combinedInsurancePage" screen
    And I verify "accordion10Compressed" element exists on "combinedInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"