class Companyevent < ActiveRecord::Base
    belongs_to :company
    belongs_to :event

    accepts_nested_attributes_for :company
    accepts_nested_attributes_for :event

    validates :representatives, presence: true
end
