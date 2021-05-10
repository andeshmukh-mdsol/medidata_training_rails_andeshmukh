class Study < ApplicationRecord

    validates :name, presence:true
    validates :drug, presence:true
    validates_numericality_of :age_limit, greater_than:7
    validates_numericality_of :phase, less_than:6

    belongs_to :study_group
    has_many :sites
    has_many :enrollments
    has_many :subjects, through: :enrollments
    has_one :side_effect

end
