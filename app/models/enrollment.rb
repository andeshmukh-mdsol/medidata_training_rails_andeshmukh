class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit_log

  def audit_log
    Rails.logger.info "***** inside audit log ******"
    AuditLogJob.perform_later self
  end
end
