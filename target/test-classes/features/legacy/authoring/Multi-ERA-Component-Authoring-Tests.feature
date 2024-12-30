#Author: Viengcumm Thongvilu
#Date created 03 May 2022
Feature: This feature tests the Multi-ERA component from authoring perspective.

  #VT 03 May 22 - DAC-9743
  @TestMultiERAComponent
  #@AuthoringRegression4.chrome.desktop
  Scenario: Verify user is able to create new page, drop and configure Multi-ERA component and verify published changes
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
    #Navigate to utility to create the page here
    Then I navigate to "AEM/sites.html/content/racv/en/home/utility"
    And I capture the address navigated to
    #Create
    And I click "createButton" on "aemLandingPage" screen using JavaScript
    #Select page
    And I click "createPageOption" on "aemLandingPage" screen
    #Select standard page template
    And I click "standardPageTemplateOption" on "aemLandingPage" screen
    And I take a screenshot
    And I click "nextButton" on "aemLandingPage" screen
    #Enter page title
    And I enter "test-automation-multi-era-1" details in "pageTitleInputBox" on "aemLandingPage" screen
    And I take a screenshot
    And I click "createPageButton" on "aemLandingPage" screen
    And I click "openButton" on "aemLandingPage" screen
    And I switch to "new" browser tab
    And I capture the address navigated to
    And I take a screenshot
    And I check the page address contains "/content/racv/en/home/utility/test-automation-multi-era-1.html"
    #Add component to page
    And I click "addComponentsParsys" on "aemLandingPage" screen
    And I click "addComponentsPlusIcon" on "aemLandingPage" screen
    #Search and add Multi-ERA component
    And I enter "Multi ERA" details in "searchInputField" on "aemInsertCompDialog" screen
    And I wait for "multiERAOption" on "aemInsertCompDialog" screen or "5" seconds before proceeding
    And I click "multiERAOption" on "aemInsertCompDialog" screen using Action class
    #Configure Multi-ERA component
    And I click "sidePanelButton" on "aemMultiERACompPage" screen
    And I click "contentTreeButton" on "aemMultiERACompPage" screen
    And I click "multiERAComponent" on "aemMultiERACompPage" screen
    And I click "configureMultiERAButton" on "aemMultiERACompPage" screen
    #Configure Calculator Tab
    And I click "calculatorTab" on "aemMultiERACompPage" screen
    And I enter "1" details in "titleCalculator" on "aemMultiERACompPage" screen
    And I enter "2" details in "descriptionCalculator" on "aemMultiERACompPage" screen
    And I enter "3" details in "membershipCardLabelCalculator" on "aemMultiERACompPage" screen
    And I enter "4" details in "standardPlateVehicleLabelCalculator" on "aemMultiERACompPage" screen
    And I enter "5" details in "clubPlateVehicleLabelCalculator" on "aemMultiERACompPage" screen
    And I enter "club plate tooltip" details in "clubVehicleTooltipCalculator" on "aemMultiERACompPage" screen
    And I take a screenshot
    And I click "vehicleSizeTooltip" on "aemMultiERACompPage" screen
    And I enter "6" details in "vehicleSizeLabel" on "aemMultiERACompPage" screen
    And I enter "vehicle size tooltip" details in "vehicleSizeTooltip" on "aemMultiERACompPage" screen
    And I enter "7" details in "drivingRegionLabel" on "aemMultiERACompPage" screen
    And I enter "driving region tooltip" details in "drivingRegionTooltip" on "aemMultiERACompPage" screen
    And I enter "8" details in "distanceCoveredLabel" on "aemMultiERACompPage" screen
    And I take a screenshot
    And I enter "9" details in "towingLabel" on "aemMultiERACompPage" screen
    And I enter "10" details in "disclaimerLabelCalculator" on "aemMultiERACompPage" screen
    And I click "disclaimerLabelCalculator" on "aemMultiERACompPage" screen
    And I enter "11" details in "howDidWeWorkThisOutLabel" on "aemMultiERACompPage" screen
    #Temporary XF until page and XF is created by content team
    And I enter "/content/experience-fragments/campaign-banners/general/covid-19/covid-19-club-reopening" details in "howDidWeWorkThisOutExperienceFragment" on "aemMultiERACompPage" screen
    And I take a screenshot
    And I enter "12" details in "buyNowLabel" on "aemMultiERACompPage" screen
    And I click "howDidWeWorkThisOutExperienceFragment" on "aemMultiERACompPage" screen
    And I clear contents of "buyNowLink" element on "aemMultiERACompPage" screen
    And I enter "https://multiqa-racv.cs116.force.com/s/emergency-roadside-assistance" details in "buyNowLink" on "aemMultiERACompPage" screen
    And I enter "13" details in "viewDetailsLabel" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Configure Comparator Tab
    And I click "comparatorTab" on "aemMultiERACompPage" screen
    And I enter "1" details in "titleComparator" on "aemMultiERACompPage" screen
    And I enter "2" details in "descriptionComparator" on "aemMultiERACompPage" screen
    And I enter "3" details in "memberCardLabelComparator" on "aemMultiERACompPage" screen
    And I enter "4" details in "standardVehicleLabelComparator" on "aemMultiERACompPage" screen
    And I enter "5" details in "clubVehicleLabelComparator" on "aemMultiERACompPage" screen
    And I enter "club vehicle toolip" details in "clubVehicleTooltipComparator" on "aemMultiERACompPage" screen
    And I take a screenshot
    And I enter "6" details in "disclaimerComparator" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Configure Recommendation Tiles Tab
    And I click "recommendationTilesTab" on "aemMultiERACompPage" screen
    And I wait for "uploadJson" on "aemMultiERACompPage" screen or "10" seconds before proceeding
    And I upload an attachment for "uploadJson2" on "aemMultiERACompPage" from "multi-era.json"
    And I enter "1" details in "whyIsThisNotSuitableLabel" on "aemMultiERACompPage" screen
    #Temporary XF until page and XF is created by content team
    And I enter "/content/experience-fragments/campaign-banners/general/covid-19/covid-19-generic" details in "whyIsThisNotSuitableLabelXF" on "aemMultiERACompPage" screen
    And I enter "2" details in "whyIsThisUnavailable" on "aemMultiERACompPage" screen
    #Temporary XF until page and XF is created by content team
    And I enter "/content/experience-fragments/campaign-banners/general/covid-19/covid-19-resorts-reopening" details in "whyIsThisUnavailableXF" on "aemMultiERACompPage" screen
    And I take a screenshot
    #RC
    And I enter "3" details in "descriptionRoadside" on "aemMultiERACompPage" screen
    And I click "rcBenefitsAdd" on "aemMultiERACompPage" screen
    And I click "rcBenefitsAdd" on "aemMultiERACompPage" screen
    And I enter "Coverage Per Vehicle" details in "rcBenefits1description" on "aemMultiERACompPage" screen
    And I enter "20km Metro Towing" details in "rcBenefits2description" on "aemMultiERACompPage" screen
    And I select "Car" value for "rcBenefits1select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I select "Car And Caravan" value for "rcBenefits2select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I enter "4" details in "selectLabelRoadside" on "aemMultiERACompPage" screen
    And I enter "https://multiqa-racv.cs116.force.com/s/emergency-roadside-assistance?p=RC" details in "roadsideCareUrl" on "aemMultiERACompPage" screen
    And I take a screenshot
    #EC
    And I enter "5" details in "descriptionExtra" on "aemMultiERACompPage" screen
    And I click "ecBenefitsAdd" on "aemMultiERACompPage" screen
    And I click "ecBenefitsAdd" on "aemMultiERACompPage" screen
    And I enter "Coverage Per Vehicle" details in "ecBenefits1description" on "aemMultiERACompPage" screen
    And I enter "60km Metro Towing" details in "ecBenefits2description" on "aemMultiERACompPage" screen
    And I select "Car" value for "ecBenefits1select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I select "Car And Caravan" value for "ecBenefits2select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I enter "6" details in "selectLabelExtra" on "aemMultiERACompPage" screen
    And I enter "https://multiqa-racv.cs116.force.com/s/emergency-roadside-assistance?p=EC" details in "extraCareUrl" on "aemMultiERACompPage" screen
    And I take a screenshot
    #TC
    And I enter "7" details in "descriptionTotal" on "aemMultiERACompPage" screen
    And I click "tcBenefitsAdd" on "aemMultiERACompPage" screen
    And I click "tcBenefitsAdd" on "aemMultiERACompPage" screen
    And I enter "Coverage for any eligible vehicle you're driving**" details in "tcBenefits1description" on "aemMultiERACompPage" screen
    And I enter "100km Metro Towing" details in "tcBenefits2description" on "aemMultiERACompPage" screen
    And I select "Car" value for "tcBenefits1select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I select "Car And Caravan" value for "tcBenefits2select" drop down in "aemMultiERACompPage" screen using selection method "visibleText"
    And I enter "8" details in "selectLabelTotal" on "aemMultiERACompPage" screen
    And I enter "https://multiqa-racv.cs116.force.com/s/emergency-roadside-assistance?p=TC" details in "totalCareUrl" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Configure Inclusions Tab
    And I click "inclusionsTab" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefitsAdd" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefitsAdd" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefitsAdd" on "aemMultiERACompPage" screen
    #Inclusion 1 RC,EC,TC
    And I enter "RACV Membership" details in "inclusionsBenefits1description" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits1checkbox1" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits1checkbox2" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits1checkbox3" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Inclusion 2 TC only
    And I enter "Bike Assist" details in "inclusionsBenefits2description" on "aemMultiERACompPage" screen
    #And I click "inclusionsBenefits2checkbox1" on "aemMultiERACompPage" screen
    #And I click "inclusionsBenefits2checkbox2" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits2checkbox3" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Inclusion 3 - EC,TC
    And I enter "Caravan and Trailer Assistance" details in "inclusionsBenefits3description" on "aemMultiERACompPage" screen
    #And I click "inclusionsBenefits3checkbox1" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits3checkbox2" on "aemMultiERACompPage" screen
    And I click "inclusionsBenefits3checkbox3" on "aemMultiERACompPage" screen
    And I take a screenshot
    #Configure Layout Tab
    And I click "layoutTab" on "aemMultiERACompPage" screen
    And I verify "targetID" field contains a value on "aemMultiERACompPage" screen
    And I take a screenshot
    #save changes
    And I click "saveChangesButton" on "aemCardCompDialog" screen
    And I wait for "saveChangesButton" to disappear on "aemCardCompDialog" screen or "5" seconds before proceeding
    And I take a screenshot
		#publish the page
    And I wait for "pageInfoButton" on "aemTestComponentPage" screen or "5" seconds before proceeding
    And I click "pageInfoButton" on "aemTestComponentPage" screen
    And I wait for "publishOption" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I click "publishOption" on "aemTestComponentPage" screen
    And I wait for "pageHasBeenPublished" on "aemTestComponentPage" screen or "10" seconds before proceeding
    And I take a screenshot
    #Verify published component in dispatcher
    And I navigate to "URL/utility/test-automation-multi-era-1.html"
    And I refresh the page
    And I dismiss GDPR notification if it exists
    And I capture the address navigated to
    And I take a full-page screenshot for "page"
    #Select options to present comparer cards
    And I click "fiveCarsButton" on "multiERAComponentPublished" screen
    And I click "yes4wdButton" on "multiERAComponentPublished" screen
    And I click "regionalButton" on "multiERAComponentPublished" screen
    And I click "over60KmsButton" on "multiERAComponentPublished" screen
    And I click "trailerYesButton" on "multiERAComponentPublished" screen
    And I take a full-page screenshot for "page"
    #Verify selector section
    And I verify "selectTitle" element exists on "multiERAComponentPublished" screen
    And I verify "selectDescription" element exists on "multiERAComponentPublished" screen
    And I verify "selectMembershipLabel" element exists on "multiERAComponentPublished" screen
    And I verify "selectStandardPlateVehicleLabel" element exists on "multiERAComponentPublished" screen
    And I verify "selectClubPlateVehicleLabel" element exists on "multiERAComponentPublished" screen
    And I hover on "clubTooltip" on "multiERAComponentPublished" screen using Action class
    And I verify "clubToolTipShow" element exists on "multiERAComponentPublished" screen
    And I take a screenshot
    And I verify "4wdLabel" element exists on "multiERAComponentPublished" screen
    And I hover on "4wdToolTip" on "multiERAComponentPublished" screen using Action class
    And I verify "4wdToolTipShow" element exists on "multiERAComponentPublished" screen
    And I take a screenshot
    And I verify "drivingRegionLabel" element exists on "multiERAComponentPublished" screen
    And I hover on "drivingRegionToolTip" on "multiERAComponentPublished" screen using Action class
    And I verify "drivingRegionToolTipShow" element exists on "multiERAComponentPublished" screen
    And I take a screenshot
    And I verify "howFarLabel" element exists on "multiERAComponentPublished" screen
    And I verify "trailerLabel" element exists on "multiERAComponentPublished" screen
    And I verify "selectDisclaimerLabel" element exists on "multiERAComponentPublished" screen
    #Verify recommended card
    And I verify "viewDetailsButton" element exists on "multiERAComponentPublished" screen
    And I click "howDidWeWorkThisOutLabel" on "multiERAComponentPublished" screen
    And I take a screenshot
    And I click "howDidItWorkXFClose" on "multiERAComponentPublished" screen
    And I click "buyNowButton" on "multiERAComponentPublished" screen
    And I switch to "new" browser tab
    And I check the page address contains "https://racv--multiqa.sandbox.my.site.com/s/emergency-roadside-assistance?p=TC"
    And I take a screenshot
    And I switch to "parent" browser tab
    #Verify not suitable XF
    And I click "notSuitableLabel" on "multiERAComponentPublished" screen
    And I take a screenshot
    And I click "notSuitableXFClose" on "multiERAComponentPublished" screen
    #Re-configure selector to show unavailable text
    And I select "1" value for "clubCarsSelector" drop down in "multiERAComponentPublished" screen using selection method "visibleText"
    And I take a full-page screenshot for "page"
    And I click "notAvailableLabel" on "multiERAComponentPublished" screen
    And I take a screenshot
    And I click "notAvailableXFClose" on "multiERAComponentPublished" screen
    #Re-configure selector options to view all cards
    And I click "oneCarsButton" on "multiERAComponentPublished" screen
    And I select "0" value for "clubCarsSelector" drop down in "multiERAComponentPublished" screen using selection method "visibleText"
    And I take a full-page screenshot for "page"
    #Verify comparer
    And I verify "compareTitle" element exists on "multiERAComponentPublished" screen
    And I verify "compareDescription" element exists on "multiERAComponentPublished" screen
    And I verify "compareMembershipLabel" element exists on "multiERAComponentPublished" screen
    And I verify "compareStndardPlatesLabel" element exists on "multiERAComponentPublished" screen
    And I verify "compareClubPlatesLabel" element exists on "multiERAComponentPublished" screen
    #Verify RC card
    And I verify "rcPrice" element exists on "multiERAComponentPublished" screen
    And I verify "rcDescription" element exists on "multiERAComponentPublished" screen
    And I verify "rcBenefit1" element exists on "multiERAComponentPublished" screen
    And I verify "rcBenefit2" element exists on "multiERAComponentPublished" screen
    And I verify "rcInclusion1" element exists on "multiERAComponentPublished" screen
    And I verify "rcInclusion2" element exists on "multiERAComponentPublished" screen
    And I verify "rcInclusion3" element exists on "multiERAComponentPublished" screen
    And I click "rcButtonLabel" on "multiERAComponentPublished" screen
    And I switch to "new" browser tab
    And I check the page address contains "https://racv--multiqa.sandbox.my.site.com/s/emergency-roadside-assistance?p=RC"
    And I take a screenshot
    And I switch to "parent" browser tab
    #Verify EC card
    And I verify "ecPrice" element exists on "multiERAComponentPublished" screen
    And I verify "ecDescription" element exists on "multiERAComponentPublished" screen
    And I verify "ecBenefit1" element exists on "multiERAComponentPublished" screen
    And I verify "ecBenefit2" element exists on "multiERAComponentPublished" screen
    And I verify "ecInclusion1" element exists on "multiERAComponentPublished" screen
    And I verify "ecInclusion2" element exists on "multiERAComponentPublished" screen
    And I verify "ecInclusion3" element exists on "multiERAComponentPublished" screen
    And I click "ecButtonLabel" on "multiERAComponentPublished" screen
    And I switch to "new" browser tab
    And I check the page address contains "https://racv--multiqa.sandbox.my.site.com/s/emergency-roadside-assistance?p=EC"
    And I take a screenshot
    And I switch to "parent" browser tab
    #Verify TC Card
    And I verify "tcPrice" element exists on "multiERAComponentPublished" screen
    And I verify "tcDescription" element exists on "multiERAComponentPublished" screen
    And I verify "tcBenefit1" element exists on "multiERAComponentPublished" screen
    And I verify "tcBenefit2" element exists on "multiERAComponentPublished" screen
    And I verify "tcInclusion1" element exists on "multiERAComponentPublished" screen
    And I verify "tcInclusion2" element exists on "multiERAComponentPublished" screen
    And I verify "tcInclusion3" element exists on "multiERAComponentPublished" screen
    And I click "tcButtonLabel" on "multiERAComponentPublished" screen
    And I switch to "new" browser tab
    And I check the page address contains "https://racv--multiqa.sandbox.my.site.com/s/emergency-roadside-assistance?p=TC"
    And I take a screenshot
    And I switch to "parent" browser tab
    And I verify "compareDisclaimerLabel" element exists on "multiERAComponentPublished" screen
    #Delete page
    And I switch to "parent" browser tab
    And I scroll "aemFifthColumn" element by "100" percent on "aemLandingPage" screen
    And I click "aemMultiERA1PageIcon" on "aemLandingPage" screen
    And I click "deleteButton" on "aemLandingPage" screen
    And I take a screenshot
    And I click "confirmDeleteButton" on "aemLandingPage" screen
    And I wait for "confirmDeleteButton" to disappear on "aemLandingPage" screen or "5" seconds before proceeding
    And I take a screenshot