class Subject < ApplicationRecord
    has_one :address, as: :addressable
    has_many :enrollments
    has_many :studies, through: :enrollments
    
end
