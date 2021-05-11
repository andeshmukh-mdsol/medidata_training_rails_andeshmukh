class EnrollmentMailer < ApplicationMailer

    def success_enrollment
        @enrollment = params[:enrollment]
        @subject = Subject.find(@enrollment.subject_id)
        @study = Study.find(@enrollment.study_id)
        mail(to: "#{@subject.email}", subject: "Successfull enrollment to Study : #{@study.name}")
    end
end
