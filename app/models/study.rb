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
    has_one_attached :my_image
    after_save :success_study

    scope :usable_drugs, -> { where('phase>=4')}
    scope :under_trials, -> { where('phase<4')}

    def success_study
        StudyMailer.delay.success_email(self)
    end

    handle_asynchronously :success_study, priority:0

end
