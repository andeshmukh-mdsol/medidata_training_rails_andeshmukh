class EnrollmentMailer < ApplicationMailer
    def success_enrollment(enrollment, mail_override = 0)
        @enrollment = enrollment
        # binding.pry
        #auto_invitation 
        # 0 - no auto invite
        # 1 - auto invite
        # 2 - invite sent successfully
        if @enrollment.auto_invitation == 1 || mail_override == 1
            @subject = @enrollment.subject
            @study = @enrollment.study
            mail(to: "#{@subject.email}", subject: "Successfull enrollment to Study : #{@study.name}")
            @enrollment.update_column(:auto_invitation,2)
            @enrollment.touch
        end
    end
end
