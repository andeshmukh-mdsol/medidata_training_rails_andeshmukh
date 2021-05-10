class AuditLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # enrollment = Enrollment.find args[0]
    enrollment = args[0]
    study_name, subject_name = enrollment.study.name, enrollment.subject.name
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'a') {|f| f.puts "A subject named #{subject_name}, enrolled to a study named #{study_name}"}
  end
end
