class Timeslot < ActiveRecord::Base
	belongs_to :event
	has_and_belongs_to_many :students, :dependent => :destroy
	
	# Decrement the number of available slots
	def self.decrease_1(argu1)
		temp_student = Student.find(argu1)
		temp_student.timeslots.each do |ab|
			ab.stunum -= 1
			ab.save
		end
	end

	# Increment the number of available slots
	def self.increase_1(argu1)
		temp_student = Student.find(argu1)
		temp_student.timeslots.each do |ab|
			ab.stunum += 1
			ab.save
		end

	end

	# Decrement the number of available slots
	def self.decrease_1_id(argu1, argu2, argu3)
		temp_id = nil
		argu1.each do |item|
			item[3] +=1
		end
	end
end
