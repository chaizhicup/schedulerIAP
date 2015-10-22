class Companyevent < ActiveRecord::Base
    belongs_to :company
    belongs_to :event
end
