Feature: Students can enter their Information

  As a student
  I want to retain the entered information
  So that I can edit them back easily

Background: events have been added to database
  
  Given the following events exist:
  |name   | max_students | for_student |event_date | start_time           |end_time            | timeslot_duration  |
  |Mock_1 | 10           | true        |2015-10-29 | 2015-10-29 03:24:00  |2015-10-29 05:24:00 | 20                 |
# |Mock_2 | 25           | false       |2015-10-30 | 2015-10-30 05:24:00  |2015-10-30 07:24:00 | 40                 |



# Scenario to check Successfull Registration
# When all fields are entered correctly
Scenario: Enter the student information
	Given I am on the new student page
	And I fill in "Name" with "John"
	And I fill in "UIN" with "123541459"
	And I fill in "Email" with "afdldw@alkdfjl.com"
	And I check "I am a US-Citizen"
	And I select "B.S." from "Student Level"
	And I select "Internship" from "Job Type"
	And I select "Not Attend" from "Mock_1"
# And I select "Not Attend" from "Mock_2"


	When I press "Register"
	
	Given I have entered my information
	Then I should be on the view student information page
	When I click on "Edit"
	Then I should be on the edit information page

	When I click on "Back"
	Then I should be on the home page

# Scenario to check retaining data
# When only some fields are entered (others blank)
Scenario: Enter correct student information partially
	Given I am on the new student page
	And I fill in "Email" with "trail@blazers.com"
  And I check "I am a US-Citizen"
  And I select "Not Attend" from "Mock_1"

  When I press "Register"

	Given I have entered my information
	Then I should be on the students page  
  And the "Name" field should have the error "can't be blank"

  And the "Email" field should contain "trail@blazers.com" 
  And the "Email" field should have no error
  
  And the "UIN" field should have the error "can't be blank"
  And the "UIN" field should have the error "is the wrong length (should be 9 characters)"
  
  And the "I am a US-Citizen" checkbox should be checked
  
# Scenario to check retaining data
# When one field is entered incorrectly (others correct)
Scenario: Enter incorrect student information
	Given I am on the new student page
	And I fill in "Name" with "Trail"
	And I fill in "Email" with "trail@.com"
	And I fill in "UIN" with "123456789"
	And I uncheck "I am a US-Citizen"
	And I select "M.S." from "Student Level"
	And I select "Internship" from "Job Type"
	And I select "Not Attend" from "Mock_1"

	When I press "Register"
	
	Given I have entered my information
	Then I should be on the students page

  And the "Name" field should contain "Trail" 
  And the "Name" field should have no error
  
  And the "Email" field should contain "trail@.com" 
  And the "Email" field should have the error "is invalid"
  
  And the "UIN" field should contain "123456789"
  And the "UIN" field should have no error
  
  And the "I am a US-Citizen" checkbox should not be checked
  
  And the "Student Level" field should contain "M.S" 
  And the "Student Level" field should have no error
  
  And the "Job Type" field should contain "Internship" 
  And the "Job Type" field should have no error
  
