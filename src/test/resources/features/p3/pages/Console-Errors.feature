Feature: Tests various pages for console errors

  @TestPageConsoleError-p3
  @Sanity-p3.chrome.desktop
  @Regression-p3.chrome.desktop
  Scenario Outline: Load specified page for <area> and check for any console errors.
    Given I launch app page "URL/<url>"
    And I dismiss GDPR notification if it exists
    And I wait for "footerSVG" on "racv-home" screen or "10" seconds before proceeding
    And I take a screenshot
    When I scroll the window to "100" percent
    Then I check the console for errors

    Examples:
      | area | url |
      | Home Page | |
      | Old Template | /about-racv/corporate-governance.html |
      | Insurance | insurance.html |
      | Membership | membership/member-discounts.html |
      | Help and Support | help-and-support.html |
      | Motoring | cars-transport/drive-school/find-instructor.html |
      | Home Trades | home/repairs-maintenance.html |
      | Solar | home/solar.html |
      | N&L Category | royalauto.html |
      | N&L Article | royalauto/lifestyle-home/food-wine/ultimate-anzac-biscuit-recipe.html |
      | Resorts | travel-experiences/resorts.html |
      | T&E | travel-experiences.html |
      | T&E Resort | travel-experiences/resorts/cape-schanck.html |
      | Club | travel-leisure/racv-club.html |
      | Solar form| home/solar/get-a-quote.html |
      | Contact us | contact-us/enquire-online.html |
      | Filter map | contact-us/racv-retail-stores.html |
      | Car Match | car-match.html |
      | Car Match Search | car-match/search.html |
      | Car Match Car Details | car-match/car-details/kia/sportage/s-752601537a5e08b3fdf39f21e5ce73b1c8d97c8 |