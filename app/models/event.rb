class Event < ActiveRecord::Base
  has_many :timeslots, :dependent => :destroy
  has_many :companyevents
  has_many :companies, :through => :companyevents
  validates_uniqueness_of :name
  validates :name, :max_students, :event_date, :start_time, :end_time, :timeslot_duration, presence: true
end
