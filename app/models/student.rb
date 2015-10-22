class Student < ActiveRecord::Base
  has_and_belongs_to_many :timeslots
	validates :name, :UIN, :degree, :position_type, :Mock_1, :Mock_2, :Resume_1, :Resume_2, :Resume_3, presence: true
	validates :UIN, length: {is: 9}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
       		          format: { with: VALID_EMAIL_REGEX },
         	          uniqueness: { case_sensitive: false }

	validates_uniqueness_of :email,:UIN
	validates :degree, presence: true
	validates :position_type, presence: true
end
