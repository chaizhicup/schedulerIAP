class Event < ActiveRecord::Base
  has_many :companyevents
  has_many :companies, :through => :companyevents
end
