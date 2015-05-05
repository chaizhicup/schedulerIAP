Feature: Students can enter their Infomation

  In order to enter my information
  As a student
  I want to enter my information into the system

# Scenario: Go to new student page
# 	Given I am on the home page
# 	When I click on "New Student"
# 	Then I should be on the new student page

Scenario: Enter the student infromation
	Given I am on the new student page
	And I fill in "Name" with "John"
	And I fill in "UIN" with "123541459"
	And I fill in "Email" with "afdldw@alkdfjl.com"
	And I check "I am a US-Citizen"
	And I select "B.S." from "Student level recruiting"
	And I select "Internship" from "Job position recruiting"
	And I select "Not Attend" from "Mock Interviews 1. Monday 1:00 - 3:00 p.m."
	And I select "Not Attend" from "Resume Clinic 1. Monday 9:30 - 11:30 a.m."
	And I select "Not Attend" from "Resume Clinic 2. Monday 3:00 - 5:00 p.m."
	And I select "Not Attend" from "Mock Interviews 2. Tuesday 1:00 - 3:00 p.m."
	And I select "Not Attend" from "Resume Clinic 3. Tuesday 9:30 - 11:30 a.m."
	And I select "Not Attend" from "Please select:"

	When I press "Register"
	
	Given I have entered my information
	Then I should be on the view student information page
	When I click on "Edit"
	Then I should be on the edit information page

	When I click on "Back"
	Then I should be on the home page
