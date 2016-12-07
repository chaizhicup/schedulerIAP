# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EmailMessage.create(email: 'Delete Company', title: 'Registration Canceled', header: "Your registration has been cancelled. Please contact the coordinator if you did not place this request.", footer: "Thank you for participating and have a great day!")
EmailMessage.create(email: 'Delete Student', title: 'Registration Canceled', header: "Your registration has been cancelled. Please contact the coordinator if you did not place this request.", footer: "Thank you for participating and have a great day!")
EmailMessage.create(email: 'Register Company', title: 'Confirmation for Registration', header: "You have been successfully registered", footer: "Thank you for participating and have a great day!")
EmailMessage.create(email: 'Register Student', title: 'Confirmation for Registration', header: "You have been successfully registered", footer: "Thank you for participating and have a great day!")
EmailMessage.create(email: 'Student Reminder', title: 'Reminder:', header: "You have an appoingment scheduled for:", footer: "If you need to cancel or add an event, please contact the coordinator. Thank you for participating and have a great day!")
