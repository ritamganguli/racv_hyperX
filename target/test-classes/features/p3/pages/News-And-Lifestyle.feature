Feature: This feature validates some the N&L template and pages

  @TestNewsLifestyleHome
 	@Regression-p3.chrome.desktop
  Scenario: Verify News and lifestyle home page
    #launch RACV home page
    Given I launch app page "URL/royalauto.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I verify "heading" element is visible on "royalAutoHome" screen
    And I verify "headingDescription" element is visible on "royalAutoHome" screen
    And I verify "newsHeading" element is visible on "royalAutoHome" screen
    And I verify "newsSectionFirstImage" element is visible on "royalAutoHome" screen
    And I take a screenshot
    When I click "newsSectionFirstImage" on "royalAutoHome" screen
    And I capture the address navigated to
    Then I check the page address contains "/royalauto/"
    And I check the page address contains ".html"

  @TestNewsLifestyleAllFoodAndWindArticles
 	@Regression-p3.chrome.desktop
  Scenario: Verify N&L food and articles content hub template
    #launch RACV home page
    Given I launch app page "URL/royalauto/lifestyle-home/food-wine.html"
    And I dismiss GDPR notification if it exists
    And I verify "breadcrumb" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "heading" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "articleCount" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "article1Image" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "article1Description" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I take a screenshot
    When I click "loadMoreButton" on "royalAutoAllFoodAndWineArticles" screen
    Then I verify "articleCountMore" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "article16Image" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I verify "article16Description" element is visible on "royalAutoAllFoodAndWineArticles" screen
    And I take a screenshot

  @TestNewsLifestyleMakePerfectlyFluffyRiceRecipeArticle
  @Regression-p3.chrome.desktop
  Scenario: Verify N&L Make Perfectly Fluffy Rice Recipe Article page is functioning as expected
    #launch RACV home page
    Given I launch app page "URL/royalauto/lifestyle-home/food-wine/make-perfectly-fluffy-rice-recipe.html"
    And I dismiss GDPR notification if it exists
    And I take a screenshot
    And I verify "breadcrumb" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    Then I verify "breadcrumbHidden" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I verify "heading" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I verify "articleCategory" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I verify "banner" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I take a screenshot
    And I verify "articleAuthor" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I scroll "articleAuthor" element on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen into view
    And I verify "articlePostedDate" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I verify "socialShareIcon1" element is visible on "royalAutoMakePerectlyFluffyRiceRecipeArticle" screen
    And I take a screenshot