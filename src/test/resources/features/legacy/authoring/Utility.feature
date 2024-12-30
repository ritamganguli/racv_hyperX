#Author: Sumanta Roy
#Date created - 25 Aug 21
Feature: This feature consists of the allied test utilities

  #SR 25 Aug 21, DAC-9263
  #Dry run completed on
  @TestDeleteOrphanPagesAuthoring
  @Authoring-cleanup.chrome.desktop
  Scenario: This script cleans the orphan pages left out post executing Authoring test automation
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I wait for "aemFifthColumn" on "aemLandingPage" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    And I delete all test pages starting with "test-automation-" under "utility" tree on "aemLandingPage" screen
    And I wait for "aemColumnLoadingAnimation" to disappear on "aemLandingPage" screen or "10" seconds before proceeding
    And I take a screenshot

  @TestDeleteOrphanPagesAuthoringClub
  @Authoring-cleanup.chrome.desktop
  Scenario: This script cleans the orphan pages left out post executing Club Authoring test automation
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/travel-leisure/racv-club/footer"
    And I wait for "aemSeventhColumn" on "aemLandingPage" screen or "10" seconds before proceeding
    And I capture the address navigated to
    And I take a screenshot
    And I delete all test pages starting with "test-automation-" under "clubFooter" tree on "aemLandingPage" screen
    And I wait for "aemColumnLoadingAnimation" to disappear on "aemLandingPage" screen or "10" seconds before proceeding
    And I take a screenshot

  #VT 16 DEC 21, DAC-9430
  #Dry run completed on
  @TestContentSyncActivitiesStep-3-GDPR
  #@ContentSync.chrome.desktop
  Scenario: This script performs the content sync activities (disable GDPR on home page)
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to page for edit
    Then I navigate to "AEM/editor.html/content/racv/en/home.html"
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I click "openPropertiesOption" on "aemLandingPage" screen
    And I click "gdprTab" on "aemHomePage" screen
    And I take a screenshot
    And I clear contents of "enableGDPRPopupCheckBox" element on "aemHomePage" screen
    And I take a screenshot
    And I click "saveAndClose" on "aemHomePage" screen
    And I wait for "saveAndClose" to disappear on "aemHomePage" screen or "10" seconds before proceeding
    And I take a screenshot
    #go back to aem landing page to publish the page
    And I navigate to "AEM/sites.html/content/racv/en"
    And I wait for "homePageThumbnail" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "homePageThumbnail" on "aemTestComponentPage" screen
    And I take a screenshot
    And I click "quickPublishButton" on "aemTestComponentPage" screen
    And I click "quickPublishConfirmButton" on "aemTestComponentPage" screen
    And I take a screenshot
    #refresh page after publising as sometimes it gets stuck
    And I navigate to "AEM/sites.html/content/racv/en"
    And I wait for "homePageThumbnail" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "homePageThumbnail" on "aemTestComponentPage" screen
    And I wait for "publishedSuccessMessage" on "aemTestComponentPage" screen or "30" seconds before proceeding
    And I navigate to "AEM/sites.html/content/racv/en"
    And I wait for "homePageThumbnail" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "homePageThumbnail" on "aemTestComponentPage" screen
    And I verify "publishedSuccessMessage" element exists on "aemTestComponentPage" screen
    And I take a screenshot

  #VT 16 DEC 21, DAC-9430
  #Dry run completed on
  @TestContentSyncActivitiesStep-3-MovieTickets
  #@ContentSync.chrome.desktop
  Scenario: This script performs the content sync activities (update movie tickets URL)
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to page for edit
    Then I navigate to "AEM/editor.html/content/racv/en/home/membership/member-benefits/member-discounts/hot-offers/movie-tickets.html"
    And I wait for "buyNowButton" on "aemMovieTickets" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "buyNowButton" on "aemMovieTickets" screen
    And I click "configureButton" on "aemMovieTickets" screen
    And I take a screenshot
    And I clear contents of "linkPath" element on "aemMovieTickets" screen
    And I enter "/content/racv/en/home/membership/member-benefits/member-discounts/Purchase-movie-tickets" details in "linkPath" on "aemMovieTickets" screen
    And I take a screenshot
    And I click "saveButton" on "aemMovieTickets" screen
    And I wait for "saveChangesButton" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "publishOption" to disappear on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "successfulPublish" on "aemMovieTickets" screen or "30" seconds before proceeding
    And I take a screenshot
    And I verify "successfulPublish" element exists on "aemMovieTickets" screen
    And I take a screenshot

  #VT 16 DEC 21, DAC-9430
  #Dry run completed on
  @TestContentSyncActivitiesStep-5-CCTV-Form
  #@ContentSync.chrome.desktop
  Scenario: This script performs the content sync activities (update cctv quote lead generation form)
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to page for edit
    Then I navigate to "AEM/editor.html/content/racv/en/home/in-your-home/home-security/cctv-quote.html"
    And I wait for "sidePanelButton" on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemHtmlEditorCompPage" screen
    And I click "contentTreeButton" on "aemHtmlEditorCompPage" screen
    And I click "htmlEditorComponent" on "aemHtmlEditorCompPage" screen
    And I click "configureButton" on "aemHtmlEditorCompPage" screen
    And I wait for "configureButton" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure tab
    #Switch iFrame
    And I switch "to" iFrame "contentFrame" on "aemHtmlEditorCompPage" screen
    And I click "configurationTab" on "aemHtmlEditorCompPage" screen
    #Click on Source edit button
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    And I wait for "textArea" on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Enter HTML source code
    #Replace PROD values with lower environment values
    And I replace "00D6F000001PLb1" details if found with "00D5P0000008h11" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "https://www.racv.com.au/in-your-home/home-security/quote-complete?prodName=cctv" details if found with "URL/in-your-home/home-security/quote-complete?prodName=cctv" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" details if found with "https://test.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" in "textArea" on "aemHtmlEditorCompPage" screen
    #Disable google captcha by removing/commenting lines
    And I replace "<script src=\"https://www.google.com/recaptcha/api.js?render=explicit&amp;onload=onScriptLoadNew\" async=\"\" defer=\"\"></script>" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "var ancestors = $(this).parentsUntil(\"form\");" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "ancestorForm = $(ancestors[ancestors.length - 1]).parent();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "e.preventDefault();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "grecaptcha.getResponse()" details if found with "\"\"" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "grecaptcha.reset();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "grecaptcha.execute();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "var htmlEl = document.querySelector(\".g-recaptcha\");" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "$(ancestorForm).submit();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "recaptchaId = window.grecaptcha.render(htmlEl, captchaOptions, false);" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "<div id=\"recaptcha\" class=\"g-recaptcha\"></div>" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I take a screenshot
    #Click on Source edit again to retain changes
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    And I wait for "textArea" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Switch out of iFrame
    And I switch "from" iFrame "hideOnMobileCheckbox" on "aemHtmlEditorCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemHtmlEditorCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "publishOption" to disappear on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "successfulPublish" on "aemHTMLForms" screen or "30" seconds before proceeding
    And I take a screenshot
    And I verify "successfulPublish" element exists on "aemHTMLForms" screen
    And I take a screenshot

  #VT 16 DEC 21, DAC-9430
  #Dry run completed on
  @TestContentSyncActivitiesStep-5-Alarm-Form
  #@ContentSync.chrome.desktop
  Scenario: This script performs the content sync activities (update alarm systems quote lead generation form)
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to page for edit
    Then I navigate to "AEM/editor.html/content/racv/en/home/in-your-home/home-security/alarm-systems-quote.html"
    And I wait for "sidePanelButton" on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open Content tree to configure the component
    And I click "sidePanelButton" on "aemHtmlEditorCompPage" screen
    And I click "contentTreeButton" on "aemHtmlEditorCompPage" screen
    And I click "htmlEditorComponent" on "aemHtmlEditorCompPage" screen
    And I click "configureButton" on "aemHtmlEditorCompPage" screen
    And I wait for "configureButton" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure tab
    #Switch iFrame
    And I switch "to" iFrame "contentFrame" on "aemHtmlEditorCompPage" screen
    And I click "configurationTab" on "aemHtmlEditorCompPage" screen
    #Click on Source edit button
    And I wait for "sourceEditButton" on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    And I wait for "textArea" on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Enter HTML source code
    #Replace PROD values with lower environment values
    And I replace "00D6F000001PLb1" details if found with "00D5P0000008h11" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "https://www.racv.com.au/in-your-home/home-security/quote-complete?prodName=alarm" details if found with "URL/in-your-home/home-security/quote-complete?prodName=alarm" in "textArea" on "aemHtmlEditorCompPage" screen
    And I replace "https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" details if found with "https://test.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" in "textArea" on "aemHtmlEditorCompPage" screen
    #Disable google captcha by removing/commenting lines
    #And I replace "<script src=\"https://www.google.com/recaptcha/api.js?render=explicit&amp;onload=onScriptLoadNew\" async=\"\" defer=\"\"></script>" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "var ancestors = $(this).parentsUntil(\"form\");" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "ancestorForm = $(ancestors[ancestors.length - 1]).parent();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "e.preventDefault();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "grecaptcha.getResponse()" details if found with "\"\"" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "grecaptcha.reset();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "grecaptcha.execute();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "var htmlEl = document.querySelector(\".g-recaptcha\");" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "$(ancestorForm).submit();" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "recaptchaId = window.grecaptcha.render(htmlEl, captchaOptions, false);" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    #And I replace "<div id=\"recaptcha\" class=\"g-recaptcha\"></div>" details if found with "" in "textArea" on "aemHtmlEditorCompPage" screen
    And I take a screenshot
    #Click on Source edit again to retain changes
    And I click "sourceEditButton" on "aemHtmlEditorCompPage" screen
    And I wait for "textArea" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Switch out of iFrame
    And I switch "from" iFrame "hideOnMobileCheckbox" on "aemHtmlEditorCompPage" screen
    #Click on Save changes
    And I click "saveChangesButton" on "aemHtmlEditorCompPage" screen
    And I wait for "saveChangesButton" to disappear on "aemHtmlEditorCompPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "publishOption" to disappear on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "successfulPublish" on "aemHTMLForms" screen or "30" seconds before proceeding
    And I take a screenshot
    And I verify "successfulPublish" element exists on "aemHTMLForms" screen
    And I take a screenshot

  #VT 10 JAN 22, DAC-9691
  #Dry run completed on 10 JAN 22
  @TestContentSyncActivitiesStep-7-LOI-Form
  @ContentSync.chrome.desktop
  Scenario: This script performs the content sync activities (disable captcha on LOI form)
    #launch AEM
    Given I launch app page "AEM"
    And I wait for "userName" on "aemLoginPage" screen or "10" seconds before proceeding
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I wait for "signInButton" to disappear on "aemLoginPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to page for edit
    Then I navigate to "AEM/editor.html/content/racv/en/home/travel-leisure/racv-club/membership/reciprocal-clubs/letter.html"
    And I wait for "LOIFormComponent" on "aemLOIForm" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "LOIFormComponent" on "aemLOIForm" screen
    And I click "configureButton" on "aemLOIForm" screen
    And I clear contents of "emailFrom" element on "aemLOIForm" screen
    And I enter "aem-staging@cms.racv.com.au" details in "emailFrom" on "aemLOIForm" screen
    And I take a screenshot
    And I click "advancedTab" on "aemLOIForm" screen
    And I take a screenshot
    And I click "includeCaptcha" on "aemLOIForm" screen
    And I clear contents of "includeCaptcha" element on "aemLOIForm" screen
    And I take a screenshot
    And I click "saveButton" on "aemMovieTickets" screen
    And I wait for "saveButton" to disappear on "aemMovieTickets" screen or "10" seconds before proceeding
    #publish the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "publishOption" to disappear on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I refresh the page
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "successfulPublish" on "aemLOIForm" screen or "30" seconds before proceeding
    And I take a screenshot
    And I verify "successfulPublish" element exists on "aemLOIForm" screen
    And I take a screenshot

  @TestRMM
  @Sanity.chrome.desktop
  @Sanity-bau.chrome.desktop
  @Regression.chrome.desktop
  Scenario: Verify redirects are working by adding a redirect to the RMM file, quick publishing and verifying redirect works afterwards
    #launch app form
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
    Then I navigate to "AEM/content/racv/en/redirect-maps/301_aboutracv_redirect.html#edit"
    And I click "editEntries" on "aemRedirectManager" screen
    And I enter "/about-racv/test-automation-RANDOM[0-32].html" details in "source" on "aemRedirectManager" screen
    And I enter "/contact-us.html" details in "target" on "aemRedirectManager" screen
    And I take a screenshot
    And I click "addEntry" on "aemRedirectManager" screen
    Then I navigate to "AEM/sites.html/content/racv/en/redirect-maps"
    And I click "301_aboutracv_redirectIcon" on "aemLandingPage" screen
    And I click "quickPublishButton" on "aemLandingPage" screen
    And I click "quickPublishConfirmButton" if found on "aemLandingPage" screen
    And I wait for "pagePublishedMessage" on "aemLandingPage" screen or "30" seconds before proceeding
    And I take a screenshot
    #Navigate to the page as navigate method has a 404 retry since it takes a few seconds for the redirect to publish
    Then I navigate to "URL/about-racv/test-automation-RANDOM[0-32].html"
    Then I verify "URL/about-racv/test-automation-RANDOM[0-32].html" redirects to "URL/contact-us.html"