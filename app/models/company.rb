class Company < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,:contact_person,:sponsor_level,:citizenship,:job_type,:student_level,:rep_1, :clinic_1_rep_no,:clinic_2_rep_no,:clinic_3_rep_no,:intvw_1_rep_no,:intvw_2_rep_no, presence: true
  	validates :contact_email, presence: true, length: { maximum: 255 },
       		          format: { with: VALID_EMAIL_REGEX },
         	          uniqueness: { case_sensitive: false }
end
