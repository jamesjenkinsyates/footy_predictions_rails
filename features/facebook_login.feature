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
  When I click the enter my predictions
  And click the "Submit Predictions" button
  Then I should see my predictions

  Table: Predictions 
  SAT 23 NOV 2013 
| Everton   | Liverpool      | 12:45
| Arsenal   | Southampton    | 15:00
| Fulham    | Swansea        | 15:00
| Hull      | Crystal Palace | 15:00
| Newcastle | Norwich        | 15:00
| Stoke     | Sunderland     | 15:00
| West Ham  | Chelsea        | 17:30

SUN 24 NOV 2013
| Man City  | Tottenham      | 13:30
| Cardiff   | Man Utd        | 16:00

MON 25 NOV 2013
| West Brom | Aston Villa    | 20:00