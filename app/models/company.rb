class Company < ActiveRecord::Base
  has_many :companyevents, :dependent => :destroy
  has_many :events, :through => :companyevents
  
  accepts_nested_attributes_for :companyevents
  accepts_nested_attributes_for :events

  serialize :student_level,Array
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,:contact_person,:sponsor_level,:citizenship,:job_type,:rep_1, presence: true
  	validates :contact_email, presence: true, length: { maximum: 255 },
       		          format: { with: VALID_EMAIL_REGEX },
         	          uniqueness: { case_sensitive: false }
end
