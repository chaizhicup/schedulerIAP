class Appointment < ActiveRecord::Base
  validates :section, :time_slot, :company, :student, :UIN, presence: true
end
