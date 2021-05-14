class StudyMailer < ApplicationMailer

    def success_email(study)
        @study = study
        mail(to: 'andeshmukh@mdsol.com', subject: 'Study created successfully')
    end

end

