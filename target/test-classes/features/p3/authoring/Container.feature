#Author: Jing Zuo
#Date Created : 08 Sep 22
Feature: This feature tests the Fixed with and Full Width containers in AEM authoring and storybook

  @TestAuthoringContainerFullCurve-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add a full-width curved container, and another fixed-width container inside with text component, publish and view the page in AEM then delete and page
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/mnt/overlay/wcm/core/content/sites/createpagewizard.html/content/racv/en/home/racv-home/utility/qa"
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-container-full-curve-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-container-full-curve-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure container"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container 1 component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container 1 to full-width curved
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Full Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I click "enabelCurve" on "aemContainerDialog" screen
    And I enter "full-curved-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "full-curved-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Inner Container 1b into above container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Inner Container 1b to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-inner-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "full-inner-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Inner Container 1b
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-container-full-curve-RANDOM[0-8]-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "curveSvg" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "curveSvg" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishContainerFullCurve-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Container Full Curve post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-container-full-curve-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "curveSvg" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "curveSvg" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringContainerFull-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add full-width with journey line, and another 2 containers with text above and below, publish and view the page in AEM then delete and page
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-container-full-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-container-full-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure container 1"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container 1 component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container 1 to fixed-width
    And I click "containerNonRoot1InTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id-1" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure container 2"
    #Add Container 2 into root container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Container 2 to full-width
    And I click "containerNonRoot2InTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Full Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "full-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "full-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Separator component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Separator" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "separatorResult" on "aemInsertNewComponent" screen
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "separatorInTree" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    #Configure separator to journey line
    And I enter "my-journeyline-id-1" details in "idField" on "aemSeparatorDialog" screen
    And I click "typeDropDown" on "aemSeparatorDialog" screen
    And I click "typeJourneyLine" on "aemSeparatorDialog" screen
    And I take a screenshot
    And I click "saveButton" on "aemSeparatorDialog" screen
    #Add Container 3 into root container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Container 3 fixed width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id-2" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Container
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-container-full-RANDOM[0-8]-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine1" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I verify "text2" element exists on "aemTestContainerPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishContainerFull-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Container Full post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-container-full-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine1" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I verify "text2" element exists on "aemTestContainerPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringContainerFixed-p3
  @AuthoringRegression1-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add fixed-width container with text, publish and view the page in AEM then delete and page
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-container-fixed-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-container-fixed-RANDOM[0-8]-p3.html"
    ###############
    ## NODE
    ###############
    And I create a new test log node "Configure container 1"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container 1 component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container 1 to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Container 1
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    ###############
    ## NODE
    ###############
    And I create a new test log node "Publish and check"
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-container-fixed-RANDOM[0-8]-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "text1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishContainerFixed-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Container Fixed post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-container-fixed-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "text1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestAuthoringContainerSpacing-p3
  @AuthoringRegression1-p3.chrome.desktop
  @AuthoringSanity-p3.chrome.desktop
  Scenario: Verify user is able to create new page, add full-width with journey line, and another 2 containers with text above and below, with varying container top/bottom spacings, publish and view the page in AEM then delete and page
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
    #Navigate to racv-home/utility to create the page here
    When I navigate to "AEM/sites.html/content/racv/en/home/racv-home/utility/qa"
    Then I capture the address navigated to
    #Create a page
    When I click "createButton" on "aemSitesPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemSitesPage" screen
    #select standard page template
    And I click "standardPageTemplateP3" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "nextButton" on "aemCreatePageWizard" screen
    #Enter page title
    And I enter "test-automation-container-spacing-RANDOM[0-8]-p3" details in "pageTitleInputBox" on "aemCreatePageWizard" screen
    #enter testautomation tag
    And I enter "testautomation" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I enter "keys:ENTER" details in "tagsInputBox" on "aemCreatePageWizard" screen
    And I take a screenshot
    And I click "createPageButton" on "aemCreatePageWizard" screen
    And I click "openButton" on "aemCreatePageWizard" screen
    Then I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/racv-home/utility/qa/test-automation-container-spacing-RANDOM[0-8]-p3.html"
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    #Search and add container 1 component
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Open side panel
    And I click "sidePanelButton" on "aemEditorPage" screen
    And I click "contentTreeButton" on "aemEditorPage" screen
    #Configure newly added container 1 to fixed-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "Small" value for "containerStylesTopSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "Base" value for "containerStylesBottomSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id-1" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label-1" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Container 1
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Add Container 2 into root container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Container 2 to full-width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Full Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "Large" value for "containerStylesTopSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "X Large" value for "containerStylesBottomSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "full-container-id" details in "containerId" on "aemContainerDialog" screen
    And I enter "full-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "separator" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Separator component into Container 2
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Separator" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "separatorResult" on "aemInsertNewComponent" screen
    And I wait for "separatorResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    And I click "separatorInTree" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    #Configure separator to journey line
    And I enter "my-journeyline-id-1" details in "idField" on "aemSeparatorDialog" screen
    And I click "typeDropDown" on "aemSeparatorDialog" screen
    And I click "typeJourneyLine" on "aemSeparatorDialog" screen
    And I take a screenshot
    And I click "saveButton" on "aemSeparatorDialog" screen
    #Add Container 3 into root container
    And I click "addComponentsRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Container" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "containerResult" on "aemInsertNewComponent" screen
    And I wait for "containerResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #Configure Container 3 fixed width
    And I click "lastContainerInTree" on "aemTestContainerPage" screen
    And I click "stylesButton" on "aemTestContainerPage" screen
    And I select "Fixed Width" value for "containerStylesWidthList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "XX Large" value for "containerStylesTopSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I select "Medium" value for "containerStylesBottomSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    #Select medium to unselect for none
    And I select "Medium" value for "containerStylesBottomSpacingList" drop down in "aemTestContainerPage" screen using selection method "visibleText"
    And I take a screenshot
    And I click "applyStyle" on "aemTestContainerPage" screen
    And I click "configureButton" on "aemTestContainerPage" screen
    And I enter "fixed-container-id-2" details in "containerId" on "aemContainerDialog" screen
    And I enter "fixed-container-label" details in "containerLabel" on "aemContainerDialog" screen
    And I enter "region" details in "containerRole" on "aemContainerDialog" screen
    And I click "saveButton" on "aemContainerDialog" screen
    #Add Text component into Container 3
    And I wait for "addComponentsLastNonRootParsys" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "addComponentsLastNonRootParsys" on "aemEditorPage" screen
    And I click "addComponentsPlusIcon" on "aemEditorPage" screen
    And I enter "Text" details in "searchInputField" on "aemInsertNewComponent" screen
    And I click "textResult" on "aemInsertNewComponent" screen
    And I wait for "textResult" to disappear on "aemInsertNewComponent" screen or "10" seconds before proceeding
    And I take a screenshot
    #And I click "textInTree" without scrolling on "aemTestContainerPage" screen
    #And I click "layoutButton" without scrolling on "aemTestContainerPage" screen
    #Resize Text component
    #And I drag "textRightEdge" element "-400","0" on "aemTestContainerPage" screen
    #And I take a screenshot
    #And I click "closeLayoutButton" on "aemTestContainerPage" screen
    #Edit Text component
    When I click "textInTree" on "aemTestContainerPage" screen
    And I click "editButton" on "aemTestContainerPage" screen
    And I take a screenshot
    And I enter "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium." details using Action class
    And I click "textSaveIcon" on "aemTestContainerPage" screen
    And I wait for "textSaveIcon" to disappear on "aemTestContainerPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Publish the page
    And I wait for "pageInfoButton" on "aemEditorPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemEditorPage" screen
    And I wait for "publishOption" on "aemEditorPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemEditorPage" screen
    And I click "publishOptionSecondary" if found on "aemEditorPage" screen
    When I wait for "pageHasBeenPublished" on "aemEditorPage" screen or "10" seconds before proceeding
    And I take a screenshot
    And I navigate to "URL/racv-home/utility/qa/test-automation-container-spacing-RANDOM[0-8]-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine1" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I verify "text2" element exists on "aemTestContainerPublished" screen
    #And I take a lambda snapshot "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

  @TestPublishConatinerSpacing-p3
  #@Regression-p3.chrome.desktop
  @PublishRegression-p3.chrome.desktop
  Scenario Outline: Container Spacing post publish checks on <theme> theme
    Given I launch app page "URL/racv-home/utility/qa/all-components/<theme>/test-automation-container-spacing-p3.html"
    #Post publish checks
    #Verify SVG and configured ID (checks included in xpath)
    And I wait for "journeyLine1" on "aemTestContainerPublished" screen or "10" seconds before proceeding
    And I dismiss GDPR notification if it exists
    Then I verify "journeyLine1" element exists on "aemTestContainerPublished" screen
    And I verify "text1" element exists on "aemTestContainerPublished" screen
    And I verify "text2" element exists on "aemTestContainerPublished" screen
    And I take a lambda snapshot with "<theme>" appended named "publish snapshot" "hide-emergency-banner, hide-gdpr, normalize-template-hero-banner-h1"
    And I verify page is accessibility compliant
    And I take a screenshot

    Examples:
      | theme |
      | base  |
      | club  |

  @TestSBLayoutCurve-p3
  @Storybook-regression-p3.chrome.desktop
  @Storybook-regression-p3-base.chrome.desktop
  Scenario: Verify layout curve visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-layout-curve--default&viewMode=story"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"

  @TestSBLayoutCurve-p3
  @Storybook-regression-p3-club.chrome.desktop
  Scenario: Verify layout curve (club theme) visually in story book
    Given I launch app page "https://design-system-dev.racv.com.au/iframe.html?args=&id=atom-layout-curve--default&viewMode=story&globals=theme:club"
    When I take a screenshot
    Then I take a lambda snapshot "main snapshot" "hide-gdpr"