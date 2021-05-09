class StudyGroup < ApplicationRecord
    has_many :studies
    has_many :sites, through: :studies

    validates_presence_of :name
end
