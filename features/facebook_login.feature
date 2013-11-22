Feature: Logging in with facebook
In order to submit predictions
As a member of the Football Predictions group on Facebook
I want to login to the website with my Facebook

# Scenario: Homepage
#   Given I am on the homepage.
#   When I click "Log in with Facebook"
#   Then I should 

Scenario: Predictions
  Given I have logged in with Facebook
  And I click the link "Make Predictions"
  Then I should see "Enter Predictions"

Scenario: Making Predictions
  Given I am on the "make predictions" page
  When I click the following predictions:
    | Everton   | 1 | Liverpool      | 2 | 23rd October 12:45 |
    | Arsenal   | 1 | Southampton    | 1 | 23rd October 15:00 |
    | Fulham    | 1 | Swansea        | 1 | 23rd October 15:00 |
    | Hull      | 1 | Crystal Palace | 1 | 23rd October 15:00 |
    | Newcastle | 1 | Norwich        | 1 | 23rd October 15:00 |
    | Stoke     | 1 | Sunderland     | 1 | 23rd October 15:00 |
    | West Ham  | 1 | Chelsea        | 1 | 23rd October 17:30 |
    | Man City  | 1 | Tottenham      | 1 | 24th October 13:30 |
    | Cardiff   | 1 | Man Utd        | 1 | 24th October 16:00 |
    | West Brom | 1 | Aston Villa    | 1 | 25th October 20:00 |
  And click the "Submit Predictions" button
  Then I should see my predictions