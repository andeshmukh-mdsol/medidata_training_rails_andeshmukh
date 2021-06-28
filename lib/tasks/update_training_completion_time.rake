namespace :training_mode do
    desc 'To update training mode completion time for a particular subject having training mode completion issue'
    task :update, [:subject_enrollment_uuid] => [:environment] do |t, args|
        # 70731c77-d995-4b53-8feb-af370c82b9d8
        # update subject_enrollments set training_completed_at = (select updated_at where uuid = "70731c77-d995-4b53-8feb-af370c82b9d8") where uuid = "70731c77-d995-4b53-8feb-af370c82b9d8";
        (subject_enrollment_uuid = args[:subject_enrollment_uuid]) || raise('No SubjectEnrollment uuid provided')
        Thread.current[:current_user_uri] = Mdsol::URI.generate(APP_UUID, resource: :apps).to_s

        subject_enrollment = SubjectEnrollment.find_by(uuid: subject_enrollment_uuid)

        begin
            ActiveRecord::Base.transaction do
                time_stamp = subject_enrollment.updated_at
                subject_enrollment.update!(training_completed_at: time_stamp)
                puts "Training mode successfully completed by Subject Enrollment #{subject_enrollment.uuid} at #{time_stamp}"
            end
        rescue Exception => e
            puts e.message
        end
        puts 'Script execution complete.'
    end
end