class Timeslot < ActiveRecord::Base
	belongs_to :event
  has_and_belongs_to_many :students, :dependent => :destroy
	#validates_uniqueness_of :section, :scope => :slot
	#validates :att_date, :section, :slot, :stunum, presence: true
	def self.decrease_1(argu1)
		
#		temp_id = nil
#		argu1.each do |item|
#			item[3] -= 1
		temp_student = Student.find(argu1)
		temp_student.timeslots.each do |ab|
                ab.stunum -= 1
		ab.save
			
		end
	end


	def self.increase_1(argu1)
		#temp_id = nil
		temp_student = Student.find(argu1)
		temp_student.timeslots.each do |ab|
                ab.stunum += 1
		ab.save
                end
		#argu1.each do |item|
                        
			#if item[1] == temp_student.send(argu3)
			#	item[3] +=1
			#	temp_id = item[0]
			#	sel_slot = Timeslot.find(temp_id)
			#	sel_slot.stunum +=1
			#	sel_slot.save
			#end
		#end
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
