Feature: Dashboard
As a user of Football predictions.
In order to maintain my account easily.
I want a dashboard to view all the information.

 Background: 
   Given I am on my dashboard

 Scenario: Adding a prediction
   When I click the "add prediction" button
   And Enter a score prediction and press submit
   Then my prediction should have been saved

 Scenario: Viewing everyone's predictions
   When I click on "other's predictions"
   Then I should see their predictions

 Scenario: Leaderboard
   Then I should see the current leaderboard