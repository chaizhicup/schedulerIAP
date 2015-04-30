class Company < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,:contact_person,:contact_email,:sponsor_level,:citizenship,:job_type,:student_level,:rep_1, presence: true
  	validates :contact_email, presence: true, length: { maximum: 255 },
       		          format: { with: VALID_EMAIL_REGEX },
         	          uniqueness: { case_sensitive: false }
end
