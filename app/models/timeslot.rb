class Timeslot < ActiveRecord::Base
	validates_uniqueness_of :section, :scope => :slot
	def self.decrease_1(argu1, argu2, argu3)
		temp_id = nil
		argu1.each do |item|
			if item[1] == argu2[argu3]
				temp_id = item[0]
				sel_slot = Timeslot.find(temp_id)
				sel_slot.stunum -=1
				sel_slot.save
			end
		end
	end


	def self.increase_1(argu1, argu2, argu3)
		temp_id = nil
		temp_student = Student.find(argu2)
		argu1.each do |item|
			if item[1] == temp_student.send(argu3)
				temp_id = item[0]
				sel_slot = Timeslot.find(temp_id)
				sel_slot.stunum +=1
				sel_slot.save
			end
		end
	end

	def self.decrease_1_id(argu1, argu2, argu3)
		temp_id = nil
		temp_student = Student.find(argu2)
		argu1.each do |item|
			if item[1] == temp_student.send(argu3)
				temp_id = item[0]
				sel_slot = Timeslot.find(temp_id)
				sel_slot.stunum -=1
				sel_slot.save
			end
		end
	end
end
