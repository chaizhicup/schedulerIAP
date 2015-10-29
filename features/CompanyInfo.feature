Feature: Companies can enter their Infomation

Scenario: Enter the company information correctly
	Given I am on the new company page
	And I fill in "Enter your company name" with "Google"
	And I fill in "1.)" with "Gao Zhuoyang"
	And I fill in "Name" with "Gao Zhuoyang"
	And I fill in "Email" with "gaozhuoyang@gmail.com"
	And I select "Gold" from "Select your company's sponsor level"
	And I select "Any" from "Select if you hire US citizens only, or not"
	And I select "Internship" from "Select the job type you are offering"
	And I select "Any" from "Select the student level you are employing"
	And I press "Submit"
	Given I have entered the company's information
	Then I should be on the view company information page

Scenario: Retaining Company information on entering an incorrect data
  Given I am on the new company page
  And I fill in "Enter your company name" with "Facebook"
  And I fill in "1.)" with "Abhinandan"
  And I fill in "Name" with "Somnath"
	And I fill in "Email" with "trail@blazers."
	And I select "Platinum" from "Select your company's sponsor level"
	And I select "Any" from "Select if you hire US citizens only, or not"
	And I select "Internship" from "Select the job type you are offering"
	And I select "Any" from "Select the student level you are employing"

  When I press "Submit"

  Given I have entered the company's information
  Then I should be on the companies page
  And the "Enter your company name" field should contain "Facebook"
  And the "1.)" field should contain "Abhinandan"
  And the "Name" field should contain "Somnath"
  And the "Email" field should contain "trail@blazers."
  And the "Select your company's sponsor level" field should contain "Platinum"
  And the "Select the job type you are offering" field should contain "Internship"
  And the "Select the student level you are employing" field should contain "Any"
