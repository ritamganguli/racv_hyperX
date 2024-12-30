Feature: Misc storybook tests that dont belong anywhere else

  @TestSBHomePage
  #@TestSBHomePage.chrome.ios-mobile
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify RACV home page on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--home-page&viewMode=story" on "chrome" on "desktop"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Then I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--home-page&viewMode=story" on "safari" on "ios-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBHomePage
  #@TestSBHomePage.chrome.ios-mobile
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify RACV home page (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--home-page&viewMode=story&globals=theme:club" on "chrome" on "desktop"
    And I dismiss GDPR notification if it exists
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"
    And I close the browser
    #Then I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=templates--home-page&viewMode=story&globals=theme:club" on "safari" on "ios-mobile"
    #And I dismiss GDPR notification if it exists
    #When I take a screenshot
    #Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBIconography
  @Storybook-regression-p3.chrome.desktop
  Scenario: Verify Iconography in storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=iconography--page&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"