Feature: Administrator can add new Administrator Account



  Background: User is logged in
    Given I am on the home page
    And I enter correct user information
    And I fill in "Email" with "jay@aa.com"
    And I fill in "Password" with "123123"
    When I press "Log in"
    Then I should be on the sessions page

# Scenario to check Successfull Addition of Administrator
# When all fields are entered correctly
  Scenario: Enter the administrator information
    Given I am on the new useradd page
    And I fill in "Name" with "John"
    And I fill in "Email" with "afdldw@alkdfjl.com"
    And I fill in "Password" with "abcabc"
    And I fill in "Confirmation" with "abcabc"


    When I press "Create my account"

    Given I have entered new administrator's information
    Then I should be on the show useradd information page

# Scenario to check retaining data
# When some fields are entered (others blank)
  Scenario: Enter event information partially
    Given I am on the new useradd page
    And I fill in "Name" with "John"
    And I fill in "Email" with "afdldw@alkdfjl.com"
    And I fill in "Password" with "abc"
    And I fill in "Confirmation" with "abc"


    When I press "Create my account"

    Given I have entered new administrator's information
    Then I should be on the useradds page