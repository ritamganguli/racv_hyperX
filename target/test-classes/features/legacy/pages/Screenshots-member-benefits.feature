#Author: Jing Zuo
#Date Created : 29 May 2022
Feature: This feature is used to capture the full page screenshots for member benefits pages.

  @TestMemberBenefitsFullPageScreenshotsV1
  @MemberBenefitsFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for member benefits page version 1
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/membership/member-benefits"
    And I capture the address navigated to
    Then I click "aemMemberBenefitsPageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to parent tab and navigate to version 1
    #Click version 1
    And I click "version1" if found on "memberBenefitsTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version1Number" on "memberBenefitsTimeline" screen
    And I capture the text of "version1Time" on "memberBenefitsTimeline" screen
    And I take a screenshot
    And I click "version1Preview" on "memberBenefitsTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/membership/member-benefits.html"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestMemberBenefitsFullPageScreenshotsV2
  @MemberBenefitsFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for member benefits page version 2
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/membership/member-benefits"
    And I capture the address navigated to
    Then I click "aemMemberBenefitsPageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to parent tab and navigate to version 2
    #Click version 2
    And I click "version2" if found on "memberBenefitsTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version2Number" on "memberBenefitsTimeline" screen
    And I capture the text of "version2Time" on "memberBenefitsTimeline" screen
    And I take a screenshot
    And I click "version2Preview" on "memberBenefitsTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/membership/member-benefits.html"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestMemberBenefitsFullPageScreenshotsV3
  @MemberBenefitsFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for member benefits page version 3
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/membership/member-benefits"
    And I capture the address navigated to
    Then I click "aemMemberBenefitsPageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to parent tab and navigate to version 3
    #Click version 3
    And I click "version3" if found on "memberBenefitsTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version3Number" on "memberBenefitsTimeline" screen
    And I capture the text of "version3Time" on "memberBenefitsTimeline" screen
    And I take a screenshot
    And I click "version3Preview" on "memberBenefitsTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/membership/member-benefits.html"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestMemberBenefitsFullPageScreenshotsV4
  @MemberBenefitsFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for member benefits page version 4
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/membership/member-benefits"
    And I capture the address navigated to
    Then I click "aemMemberBenefitsPageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to parent tab and navigate to version 4
    #Click version 4
    And I click "version4" if found on "memberBenefitsTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version4Number" on "memberBenefitsTimeline" screen
    And I capture the text of "version4Time" on "memberBenefitsTimeline" screen
    And I take a screenshot
    And I click "version4Preview" on "memberBenefitsTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/membership/member-benefits.html"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"

  @TestMemberBenefitsFullPageScreenshotsV5
  @MemberBenefitsFullPageScreenshots.chrome.desktop
  Scenario: Take full page screenshots for member benefits page version 5
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
    Then I navigate to "AEM/sites.html/content/racv/en/home/membership/member-benefits"
    And I capture the address navigated to
    Then I click "aemMemberBenefitsPageIcon" on "aemLandingPage" screen
    And I click "contentOnly" on "aemLandingPage" screen
    And I click "timeline" on "aemLandingPage" screen
    And I take a screenshot
    #Navigate to parent tab and navigate to version 5
    #Click version 5
    And I click "version5" if found on "memberBenefitsTimeline" screen
    #Capture the version number and timeline
    And I capture the text of "version5Number" on "memberBenefitsTimeline" screen
    And I capture the text of "version5Time" on "memberBenefitsTimeline" screen
    And I take a screenshot
    And I click "version5Preview" on "memberBenefitsTimeline" screen
    And I switch to "new" browser tab
    #Take the full page screenshot
    And I take a full-page screenshot for "page"
    And I capture the address navigated to
    And I check the page address contains "/racv/en/home/membership/member-benefits.html"
    #Navigate to view source page
    And I update the page address by prefixing "view-source:"
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Navigate to Property page
    And I open the AEM properties page
    And I take a full-page screenshot for "page properties"