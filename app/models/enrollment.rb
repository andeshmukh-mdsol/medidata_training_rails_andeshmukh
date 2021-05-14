class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject
  # sidekiq
  after_save :audit_log, :enrollment_mail #, :audit_new

  scope :unsent_emails, -> {where('auto_invitation=0')}

  def audit_log
    Rails.logger.info "***** inside audit log ******"
    # AuditLogJob.perform_later self #sidekiq

    study_name, subject_name = study.name, subject.name
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'a') {|f| f.puts "A subject named #{subject_name}, enrolled to a study named #{study_name}"}
  end

  def audit_new
    Rails.logger.info "***** inside audit log ******"
    # AuditLogJob.perform_later self #sidekiq

    study_name, subject_name = study.name, subject.name
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'a') {|f| f.puts "A subject named AUDIT_NEW"}
    # Rake::task[task].execute or .invoke
  end

  def enrollment_mail
    EnrollmentMailer.delay.success_enrollment(self)
  end

  handle_asynchronously :audit_log, priority:0
  # handle_asynchronously :audit_new, priority:-5
  
end

