Feature: Logging in with facebook
In order to submit predictions
As a member of the Football Predictions group on Facebook
I want to login to the website with my Facebook

Scenario: Homepage
  Given I am logged in with facebook.
  Then I can see "submit".

Scenario: User account
  Given I am a user on the homepage
  When I click the "My Account" button
  Then I should see "dashboard"