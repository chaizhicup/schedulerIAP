class Timeslot < ActiveRecord::Base
	belongs_to :event
  has_and_belongs_to_many :students, :dependent => :destroy
	#validates_uniqueness_of :section, :scope => :slot
<<<<<<< HEAD
	#validates :att_date, :section, :slot, :stunum, presence: true
	def self.decrease_1(argu1)
=======
	validates :start_time, :end_time, :stunum, presence: true
	def self.decrease_1(argu1, argu2, argu3)
>>>>>>> 12fa973d7698e7d1dcbfb6ee6fecc7f28dbd3685
		temp_id = nil
		argu1.each do |item|
			item[3] -= 1
			
		end
	end


	def self.increase_1(argu1, argu2, argu3)
		temp_id = nil
		#temp_student = Student.find(argu2)
		argu1.each do |item|
                        item[3] +=1
			#if item[1] == temp_student.send(argu3)
			#	temp_id = item[0]
			#	sel_slot = Timeslot.find(temp_id)
			#	sel_slot.stunum +=1
			#	sel_slot.save
			#end
		end
	end

	def self.decrease_1_id(argu1, argu2, argu3)
		temp_id = nil
		#temp_student = Student.find(argu2)
		argu1.each do |item|
			item[3] +=1
		#	if item[1] == temp_student.send(argu3)
		#		temp_id = item[0]
		#		sel_slot = Timeslot.find(temp_id)
		#		sel_slot.stunum -=1
		#		sel_slot.save
		#	end
		end
	end
end
