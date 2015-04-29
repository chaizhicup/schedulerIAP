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
	And I fill in "Uin" with "12354145"
	And I fill in "Email" with "afdldw@alkdfjl.com"
	And I check "Us citizen"
	And I select "Undergraduate" from "Degree"
	And I select "Intern" from "Position type"
	When I press "Create Student"
	
	Given I have entered my information
	Then I should be on the view student information page
	When I click on "Edit"
	Then I should be on the edit information page

	When I click on "Back"
	Then I should be on the home page
