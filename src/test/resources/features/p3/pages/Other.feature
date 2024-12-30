Feature: Other tests

  @TestTrackMyPatrolFeedbackFormSubmission
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the Track my patrol feedback form can be submitted successfully when all valid details are entered and reference number is returned
    Given I launch app page "URL/track-my-patrol.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I click "feedbackGreatButton" on "trackMyPatrolPage" screen
    And I take a screenshot
    And I click "submitButton" on "trackMyPatrolPage" screen
    And I wait for "submitButton" to disappear on "trackMyPatrolPage" screen or "2" seconds before proceeding
    Then I capture the address navigated to
    And I verify "thankyouBanner" element is visible on "trackMyPatrolPage" screen
    And I take a screenshot

  @TestTrackMyPatrolFeedbackNegativeFormSubmission
  @Regression-p3.chrome.desktop
  @Regression-p3.chrome.ios-mobile
  Scenario: Verify the Track my patrol feedback form can be submitted successfully when customer is not satisfied and enters comment details and reference number is returned
    Given I launch app page "URL/track-my-patrol.html?disableCaptcha=true"
    And I dismiss GDPR notification if it exists
    When I click "feedbackPoorButton" on "trackMyPatrolPage" screen
    And I enter "This is test submission. Please ignore" details in "comments" on "trackMyPatrolPage" screen
    And I take a screenshot
    And I click "submitButton" on "trackMyPatrolPage" screen
    And I wait for "submitButton" to disappear on "trackMyPatrolPage" screen or "2" seconds before proceeding
    Then I capture the address navigated to
    And I verify "thankyouBanner" element is visible on "trackMyPatrolPage" screen
    And I take a screenshot