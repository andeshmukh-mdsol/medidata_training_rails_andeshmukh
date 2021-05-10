class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject
  # sidekiq
  after_save :audit_log

  def audit_log
    Rails.logger.info "***** inside audit log ******"
    # AuditLogJob.perform_later self #sidekiq

    study_name, subject_name = study.name, subject.name
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'a') {|f| f.puts "A subject named #{subject_name}, enrolled to a study named #{study_name}"}
  end

  handle_asynchronously :audit_log
end
