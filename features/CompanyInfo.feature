Feature: Companies can enter their Infomation

Scenario: Enter the company information
	Given I am on the new company page
	And I fill in "Enter your company name" with "Google"
	And I fill in "1.)" with "Gao Zhuoyang"
	And I fill in "Name" with "Gao Zhuoyang"
	And I fill in "Email" with "gaozhuoyang@gmail.com"
	And I select "Gold" from "Select your company's sponsor level"
	And I select "Any" from "Select if you hire US citizens only, or not"
	And I select "Internship" from "Select the job type you are offering"
	And I select "Any" from "Select the student level you are employing"
	And I select "1" from "Resume Clinic 1. Monday 9:30 - 11:30 a.m. Number of representatives attending"
	And I select "1" from "Mock Interviews 1. Monday 1:00 - 3:00 a.m. Number of representatives attending"
	And I select "0" from "Resume Clinic 2. Monday 3:00 - 5:00 p.m. Number of representatives attending"
	And I select "0" from "Resume Clinic 3. Tuesday 9:30 - 11:30 a.m. Number of representatives attending"
	And I select "0" from "Mock Interviews 2. Tuesday 1:00 - 3:00 p.m. Number of representatives attending"
	And I select "1" from "Monday"
	And I press "Submit"
	Given I have entered the company's information
	Then I should be on the view company information page

