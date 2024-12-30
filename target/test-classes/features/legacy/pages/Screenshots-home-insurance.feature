#Author: Jing Zuo
#Date Created : 29 May 2022
Feature: This feature is used to capture the full page screenshots for home insurance pages.

  @TestHomeInsuranceFullPageScreenshotsV1
  @HomeInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home insurance page version 1
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home"
    And I capture the address navigated to
    Then I click "aemHomeInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    #Navigate to parent tab and go to version 1
    #Click version 1
    And I take a screenshot
    And I click "version1" if found on "homeInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version1Number" on "homeInsuranceTimeline" screen
    And I capture the text of "version1Time" on "homeInsuranceTimeline" screen
    And I take a screenshot
    And I click "version1Preview" on "homeInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion1Compressed" on "homeInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Compressed" on "homeInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Compressed" on "homeInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Expanded" on "homeInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Expanded" on "homeInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestHomeInsuranceFullPageScreenshotsV2
  @HomeInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home insurance page version 2
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home"
    And I capture the address navigated to
    Then I click "aemHomeInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to Version 2
    #Click version 2
    And I click "version2" if found on "homeInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version2Number" on "homeInsuranceTimeline" screen
    And I capture the text of "version2Time" on "homeInsuranceTimeline" screen
    And I take a screenshot
    And I click "version2Preview" on "homeInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion1Compressed" on "homeInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Compressed" on "homeInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Compressed" on "homeInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Expanded" on "homeInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Expanded" on "homeInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestHomeInsuranceFullPageScreenshotsV3
  @HomeInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home insurance page version 3
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home"
    And I capture the address navigated to
    Then I click "aemHomeInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to Version 3
    #Click version 3
    And I click "version3" if found on "homeInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version3Number" on "homeInsuranceTimeline" screen
    And I capture the text of "version3Time" on "homeInsuranceTimeline" screen
    And I take a screenshot
    And I click "version3Preview" on "homeInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion1Compressed" on "homeInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Compressed" on "homeInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Compressed" on "homeInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Expanded" on "homeInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Expanded" on "homeInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    #Take a full-page screenshot for compressed accordions
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestHomeInsuranceFullPageScreenshotsV4
  @HomeInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home insurance page version 4
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home"
    And I capture the address navigated to
    Then I click "aemHomeInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to Version 4
    #Click version 4
    And I click "version4" if found on "homeInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version4Number" on "homeInsuranceTimeline" screen
    And I capture the text of "version4Time" on "homeInsuranceTimeline" screen
    And I take a screenshot
    And I click "version4Preview" on "homeInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion1Compressed" on "homeInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Compressed" on "homeInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Compressed" on "homeInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestHomeInsuranceFullPageScreenshotsV5
  @HomeInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home insurance page version 5
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home"
    And I capture the address navigated to
    Then I click "aemHomeInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to Version 5
    #Click version 5
    And I click "version5" if found on "homeInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version5Number" on "homeInsuranceTimeline" screen
    And I capture the text of "version5Time" on "homeInsuranceTimeline" screen
    And I take a screenshot
    And I click "version5Preview" on "homeInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion1Compressed" on "homeInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion2Compressed" on "homeInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeInsurancePage" screen
    And I click "accordion3Compressed" on "homeInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"