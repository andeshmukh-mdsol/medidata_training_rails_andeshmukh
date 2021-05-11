class StudyMailer < ApplicationMailer

    def success_email
        @study = params[:study]
        mail(to: 'andeshmukh@mdsol.com', subject: 'Study created successfully')
    end

end

