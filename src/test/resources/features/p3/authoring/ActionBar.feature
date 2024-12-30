#Author: Viengcumm Thongvilu
Feature: This feature tests the action bar in AEM authoring and storybook

  @TestAuthoringActionBarSingleCTA-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AnalyticsAttributesAuthoring-p3
  Scenario: Verify user is able to author action bar with single cta and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to experience fragment to create a new XF
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-action-bar-single-cta" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-single-cta/master.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Action bar authoring"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Text component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "action bar" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "actionBarResult" on "aemInsertNewComponent" screen
    And I wait for "actionBarResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Action Bar component
    When I wait for "actionBarInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "actionBarInTree" on "aemExperienceFragmentsActionBar" screen
    And I wait for "configureButton" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    And I take a screenshot
    Then I click "viewType" on "aemActionBarComponentDialog" screen
    And I select "Single CTA" value for "viewTypeList" drop down in "aemActionBarComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemActionBarComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemActionBarComponentDialog" screen or "5" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Button authoring"
    #Edit Button component
    When I wait for "buttonInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "buttonInTree" on "aemExperienceFragmentsActionBar" screen
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Publish the EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Create new page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-actionbar-single-cta-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-actionbar-single-cta-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-single-cta/master/jcr:content/root/container/actionbar" details in "actionBarEFPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring"
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    #paragraph format
    And I enter below details using Action class
      """
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.
      """
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish test automation page
    When I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Desktop checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-actionbar-single-cta-RANDOM[0-8]-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    #Mobile view verification
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #When I launch app page "URL/racv-home/utility/qa/test-automation-actionbar-single-cta-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

  @TestPublishActionBar-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Action bar post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-single-cta-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    #Mobile view verification
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #When I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-single-cta-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishActionBar-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Action bar post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-single-cta-p3.html" on "chrome" on "android-mobile"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I scroll the window to "100" percent
    And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringActionBarDualCTA-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author action bar with dual cta and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to experience fragment to create a new XF
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-action-bar-dual-cta" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-dual-cta/master.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring EF"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    #Search and add Text component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "action bar" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "actionBarResult" on "aemInsertNewComponent" screen
    And I wait for "actionBarResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Action Bar component
    When I wait for "actionBarInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "actionBarInTree" on "aemExperienceFragmentsActionBar" screen
    And I wait for "configureButton" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    And I take a screenshot
    Then I click "viewType" on "aemActionBarComponentDialog" screen
    And I select "Dual CTA" value for "viewTypeList" drop down in "aemActionBarComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I click "doneButton" on "aemActionBarComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemActionBarComponentDialog" screen or "5" seconds before proceeding
    #Edit Button 1 component
    When I wait for "buttonInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "buttonInTree" on "aemExperienceFragmentsActionBar" screen
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Edit Button 2 component
    When I wait for "buttonInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "buttonInTree" on "aemExperienceFragmentsActionBar" screen
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I enter "https://www.racv.com.au/insurance" details in "linkField" on "aemButtonComponentDialog" screen
    And I wait for "textField" on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    And I click "textField" on "aemButtonComponentDialog" screen
    And I enter "Receive a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "buttonStyleDropDown" on "aemButtonComponentDialog" screen
    And I select "Secondary" value for "buttonStyleResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I click "iconPositionDropDown" on "aemButtonComponentDialog" screen
    And I select "Before Text" value for "iconPositionResults" drop down in "aemButtonComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    When I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "2" seconds before proceeding
    Then I take a screenshot
    #Publish the EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring new page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-actionbar-dual-cta-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-actionbar-dual-cta-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-dual-cta/master/jcr:content/root/container/actionbar" details in "actionBarEFPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    #paragraph format
    And I enter below details using Action class
      """
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna
      """
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish test automation page
    When I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Desktop checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-actionbar-dual-cta-RANDOM[0-8]-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/test-automation-actionbar-dual-cta-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #Verify analytics attributes on actionBarButtonSecondary
    #And I verify "data-event" attribute is "site interaction" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "receive a quote" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

  @TestPublishActionBarDualCTA-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Action bar Dual CTA post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-dual-cta-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-dual-cta-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #Verify analytics attributes on actionBarButtonSecondary
    #And I verify "data-event" attribute is "site interaction" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "receive a quote" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishActionBarDualCTA-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Action bar Dual CTA post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-dual-cta-p3.html" on "chrome" on "android-mobile"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-location" attribute is "action bar" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #Verify analytics attributes on actionBarButtonSecondary
    And I verify "data-event" attribute is "site interaction" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    And I verify "data-type" attribute is "link" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    And I verify "data-location" attribute is "action bar" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    And I verify "data-description" attribute is "receive a quote" on "actionBarButtonSecondary" element on "aemTestActionBarPublished" screen
    And I scroll the window to "100" percent
    And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringActionBarTextCTA-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to author action bar with text and cta and verify published dispatcher component, accessibility and visually
    #launch AEM
    Given I launch app page "AEM"
    #Enter creds
    When I enter "" details in "userName" on "aemLoginPage" screen
    And I enter "" details in "password" on "aemLoginPage" screen
    And I take a screenshot
    And I click "signInButton" on "aemLoginPage" screen
    And I take a screenshot
    Then I capture the address navigated to
    And I check page address is "AEM/aem/start.html"
    #Navigate to experience fragment to create a new XF
    When I navigate to "AEM/aem/experience-fragments.html/content/experience-fragments/racv/qa"
    And I capture the address navigated to
    And I click "createButton" on "aemExperienceFragmentsPage" screen using JavaScript
    And I click "experienceFragment" on "aemExperienceFragmentsPage" screen
    #Select RACV Experience Fragment
    And I click "racvExperienceFragment" on "aemCreateExperienceFragment" screen
    And I click "nextButton" on "aemCreateExperienceFragment" screen
    #Enter title
    And I clear contents of "titleInputBox" element on "aemCreateExperienceFragment" screen
    And I enter "test-automation-RANDOM[0-8]-p3-action-bar-text-cta" details in "titleInputBox" on "aemCreateExperienceFragment" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I click "createEFButton" on "aemCreateExperienceFragment" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-text-cta/master.html"
    #Open side panel
    When I click "sidePanelButtonEF" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring ef components"
    #Search and add Text component
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "action bar" details in "searchInputFieldEF" on "aemInsertNewComponent" screen
    Then I click "actionBarResult" on "aemInsertNewComponent" screen
    And I wait for "actionBarResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Edit Action Bar component
    When I wait for "actionBarInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "actionBarInTree" on "aemExperienceFragmentsActionBar" screen
    And I wait for "configureButton" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    And I take a screenshot
    Then I click "viewType" on "aemActionBarComponentDialog" screen
    And I select "Text & CTA" value for "viewTypeList" drop down in "aemActionBarComponentDialog" screen using selection method "visibleText"
    And I take a screenshot
    And I wait for "description" on "aemActionBarComponentDialog" screen or "5" seconds before proceeding
    And I enter "Comprehensive cover - tailored to you" details in "description" on "aemActionBarComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemActionBarComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemActionBarComponentDialog" screen or "5" seconds before proceeding
    #Edit Button component
    When I wait for "buttonInTree" on "aemExperienceFragmentsActionBar" screen or "5" seconds before proceeding
    And I click "buttonInTree" on "aemExperienceFragmentsActionBar" screen
    And I click "configureButton" on "aemExperienceFragmentsActionBar" screen
    Then I click "propertiesTab" on "aemButtonComponentDialog" screen
    And I clear contents of "textField" element on "aemButtonComponentDialog" screen
    And I enter "Get a quote" details in "textField" on "aemButtonComponentDialog" screen
    And I enter "test-hash-tag" details in "hashTagField" on "aemButtonComponentDialog" screen
    And I enter "test-analytics-parameter" details in "analyticsURLfield" on "aemButtonComponentDialog" screen
    And I enter "/content/racv/en/home/royalauto" details in "linkField" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "quickExitCheckBox" on "aemButtonComponentDialog" screen
    And I enter "https://www.google.com" details in "quickExitLink" on "aemButtonComponentDialog" screen
    And I take a screenshot
    And I click "doneButton" on "aemButtonComponentDialog" screen
    And I wait for "doneButton" to disappear on "aemButtonComponentDialog" screen or "5" seconds before proceeding
    #Publish the EF
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "5" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Authoring page"
    #Navigate to racv-home/utility to create the test automation page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #Select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-actionbar-text-cta-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-actionbar-text-cta-RANDOM[0-8]-p3.html"
    #Go to page properties
    When I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I click "openPropertiesOption" on "aemEditorPage" screen
    And I take a screenshot
    Then I click "advancedTab" on "aemPageProperties" screen
    And I enter "/content/experience-fragments/racv/qa/test-automation-RANDOM[0-8]-p3-action-bar-text-cta/master/jcr:content/root/container/actionbar" details in "actionBarEFPath" on "aemPageProperties" screen
    And I take a screenshot
    And I click "saveClose" on "aemPageProperties" screen
    And I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    #Add Related Information component
    #Search and add container component
    When I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    Then I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "5" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    #paragraph format
    And I enter below details using Action class
      """
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.

      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna.
      """
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "5" seconds before proceeding
    And I take a screenshot
    #Publish test automation page
    When I wait for "saveClose" to disappear on "aemPageProperties" screen or "2" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I wait for "publishOptionSecondary" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    Then I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Post publish checks
    ###############
    ## NODE
    ###############
    And I create a new test log node "Desktop checks"
    When I navigate to "URL/racv-home/utility/qa/test-automation-actionbar-text-cta-RANDOM[0-8]-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    ###############
    ## NODE
    ###############
    #And I create a new test log node "Mobile checks"
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/test-automation-actionbar-text-cta-RANDOM[0-8]-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar | comprehensive cover - tailored to you" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

  @TestPublishActionBarTextCTA-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Action bar Text CTA post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-text-cta-p3.html"
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I scroll the window to "100" percent
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser
    ###############
    ## NODE
    ###############
    #Mobile view verification
    #When I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-text-cta-p3.html" on "chrome" on "android-mobile"
    #And I refresh the page
    #And I dismiss GDPR notification if it exists
    #Then I scroll the window to "50" percent
    #And I take a screenshot
    #And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    #And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    #And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-location" attribute is "action bar | comprehensive cover - tailored to you" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    #And I scroll the window to "100" percent
    #And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    #And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    #And I take a screenshot
    #And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestPublishActionBarTextCTA-p3.chrome.android-mobile
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.android-mobile
  Scenario Outline: Action bar Text CTA post publish checks on <theme> theme on android mobile
    #Mobile view verification
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-actionbar-text-cta-p3.html" on "chrome" on "android-mobile"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    Then I scroll the window to "50" percent
    And I take a screenshot
    And I wait for "actionBarButton" on "aemTestActionBarPublished" screen or "5" seconds before proceeding
    And I verify "actionBarButton" element is visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    #Verify analytics attributes on actionBarButton
    And I verify "data-event" attribute is "site interaction" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-type" attribute is "link" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-location" attribute is "action bar | comprehensive cover - tailored to you" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I verify "data-description" attribute is "get a quote" on "actionBarButton" element on "aemTestActionBarPublished" screen
    And I scroll the window to "100" percent
    And I wait for "actionBarButton" to disappear on "aemTestActionBarPublished" screen or "2" seconds before proceeding
    And I verify "actionBarButton" element is not visible on "aemTestActionBarPublished" screen
    And I take a screenshot
    And I take a lambda snapshot with "<theme>" appended named "scroll down" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I close the browser

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBActionBarTextCTA
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify action bar text+cta on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=description:Comprehensive%20cover%20-%20tailored%20to%20you&id=components-action-bar--action-bar-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBActionBarSingleCTA
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify action bar single cta on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showPrimaryButtonIcon:true;showSecondaryButtonIcon:true&id=components-action-bar--action-bar-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBActionBarDualCTA
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify dual cta on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:true;showSecondaryButtonIcon:true&id=components-action-bar--action-bar-story&viewMode=story"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBActionBarTextCTA
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify action bar (club theme) text+cta on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=description:Comprehensive%20cover%20-%20tailored%20to%20you&id=components-action-bar--action-bar-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBActionBarSingleCTA
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify action bar single cta (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showPrimaryButtonIcon:true;showSecondaryButtonIcon:true&id=components-action-bar--action-bar-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBActionBarDualCTA
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify dual cta (club theme) on storybook
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=showSecondaryButton:true;showSecondaryButtonIcon:true&id=components-action-bar--action-bar-story&viewMode=story&globals=theme:club"
    And I take a screenshot
    And I take a lambda snapshot "main snapshot" "hide-gdpr"