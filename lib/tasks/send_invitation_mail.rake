namespace :invitation_mail do
    desc 'Task to invite subjects that have selected auto invitation as false'
    task send: :environment do
        enrollments = Enrollment.unsent_emails
        unsent_emails = enrollments.each do |e|
            EnrollmentMailer.delay.success_enrollment(e,1)
        end
        puts "Emails successfully sent to #{enrollments.count}"
    end
end