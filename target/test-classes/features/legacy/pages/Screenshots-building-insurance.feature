#Author: Jing Zuo
#Date Created : 29 May 2022

Feature: This feature is used to capture the full page screenshots for home building insurance pages.

  @TestHomeBuildingInsuranceFullPageScreenshotsV1
  @HomeBuildingInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home building insurance page version 1
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-building-insurance"
    And I capture the address navigated to
    Then I click "aemHomeBuildingInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 1
    #Click version 1
    And I click "version1" if found on "homeBuildingInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version1Number" on "homeBuildingInsuranceTimeline" screen
    And I capture the text of "version1Time" on "homeBuildingInsuranceTimeline" screen
    And I take a screenshot
    And I click "version1Preview" on "homeBuildingInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-building-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion1Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion5Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "homeBuildingInsurancePage" screen
   	#Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
   	And I click "accordion5Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion9Expanded" on "homeBuildingInsurancePage" screen
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

  @TestHomeBuildingInsuranceFullPageScreenshotsV2
  @HomeBuildingInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home building insurance page version 2
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-building-insurance"
    And I capture the address navigated to
    Then I click "aemHomeBuildingInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 2
    #Click version 2
    And I click "version2" if found on "homeBuildingInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version2Number" on "homeBuildingInsuranceTimeline" screen
    And I capture the text of "version2Time" on "homeBuildingInsuranceTimeline" screen
    And I take a screenshot
    And I click "version2Preview" on "homeBuildingInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-building-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion1Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion5Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "homeBuildingInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
   	And I click "accordion5Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
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

  @TestHomeBuildingInsuranceFullPageScreenshotsV3
  @HomeBuildingInsuranceFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for home building insurance page version 3
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/in-your-home/insurance/home-building-insurance"
    And I capture the address navigated to
    Then I click "aemHomeBuildingInsurancePageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to version 3
    #Click version 3
    And I click "version3" if found on "homeBuildingInsuranceTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version3Number" on "homeBuildingInsuranceTimeline" screen
    And I capture the text of "version3Time" on "homeBuildingInsuranceTimeline" screen
    And I take a screenshot
    And I click "version3Preview" on "homeBuildingInsuranceTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/in-your-home/insurance/home-building-insurance.html"
    And I update the page address by suffixing "?wcmmode=disabled"
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Exclusions
    And I click "exclusions" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
    #Take the full page screenshot for Optional Extras
    And I click "optionalExtras" on "homeBuildingInsurancePage" screen
    And I take a full-page screenshot for "page"
   	#Click accordion 1
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion1Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 2
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 3
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 4
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 5
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion5Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 6
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 7
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Expanded" element exists on "homeBuildingInsurancePage" screen
    #Click accordion 8
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Compressed" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Expanded" element exists on "homeBuildingInsurancePage" screen
    #Take a full-page screenshot for expanded accordions
    And I take a full-page screenshot for "page"
    #Click accordions to compress
    And I click "accordion1Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion1Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion2Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion2Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion3Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion3Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion4Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion4Compressed" element exists on "homeBuildingInsurancePage" screen
   	And I click "accordion5Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion5Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion6Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion6Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion7Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion7Compressed" element exists on "homeBuildingInsurancePage" screen
    And I click "accordion8Expanded" on "homeBuildingInsurancePage" screen
    And I verify "accordion8Compressed" element exists on "homeBuildingInsurancePage" screen
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