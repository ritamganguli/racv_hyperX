Feature: Other tests relating to backend or crx de

  @TestRepairerMapSync-p3
  @Regression-p3.chrome.desktop
  Scenario: Verify the repairer map last sync timestamp is less than 7 days
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
    #Navigate to CRX DE
    Then I navigate to "AEM/crx/de/index.jsp#/content/racv/data/repairerMap"
    And I capture the address navigated to
    And I take a screenshot
    And I evaluate "repairerMapJcrLastModified" as date in format "yyyy-MM-dd'T'HH:mm:ss.SSSXXX" is ">=" "-7" days from now on "crxdeLandingPage" screen

  @TestSiteMap
  @Regression-p3.chrome.desktop
  Scenario: Verify the privacy charter page is working
    Given I launch app page "URL/sitemap.xml"
    And I wait for "racvNodeLoc" on "sitemap" screen or "30" seconds before proceeding
    #And I scroll the window to "100" percent
    And I take a screenshot
    Then I verify "racvNodeLoc" xml node on "sitemap" screen
    And I verify "racvNodeLastMod" xml node on "sitemap" screen
    And I verify "racvNodeChangeFreq" xml node on "sitemap" screen
    And I verify "racvNodePriority" xml node on "sitemap" screen
    And I verify "sitemapNode" xml node on "sitemap" screen

  @TestImageSiteMap
  @Regression-p3.chrome.desktop
  Scenario: Verify the site map page is working
    Given I launch app page "URL/image-sitemap.xml"
    And I wait for "racvNodeLoc" on "imageSitemap" screen or "30" seconds before proceeding
    #And I scroll the window to "100" percent
    And I take a screenshot
    Then I verify "racvNodeLoc" xml node on "imageSitemap" screen
    And I verify "racvNodeImage" xml node on "imageSitemap" screen
    And I verify "racvNodeImageLoc" xml node on "imageSitemap" screen
    And I verify "sitemapNode" xml node on "imageSitemap" screen

  @TestImageSiteMapSync
  @Regression-p3.chrome.desktop
  Scenario: Verify the site map last sync timestamp is less than 7 days
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to CRX DE
    Then I navigate to "AEM/crx/de/index.jsp#/content/racv/en/image-sitemap.xml/jcr%3Acontent"
    And I wait for "imageSiteMapNode" on "crxdeLandingPage" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    And I click "imageSiteMapNode" on "crxdeLandingPage" screen
    And I click "imageSiteMapJcrNode" on "crxdeLandingPage" screen
    And I take a screenshot
    And I evaluate "imageSiteMapCqLastReplicated" as date in format "yyyy-MM-dd'T'HH:mm:ss.SSSXXX" is ">=" "-7" days from now on "crxdeLandingPage" screen

  @TestRobotsTxt
  @Regression-p3.chrome.desktop
	#@Regression.safari.desktop
  Scenario: Verify the robots text is working
    Given I launch app page "URL/robots.txt"
    And I take a screenshot
    Then I verify "robotsTxt" copy text on "robotsTxt" screen