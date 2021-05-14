# hello rake task
namespace :hello do
    desc 'Just a task to greet'
    task process: :environment do
        puts "hello, my first rake task"
    end
end
# create a rake task to enroll given number of subjects to a study
# add 100 participants to a given study
# rake --tasks to check all rake tasks available

namespace :add_subjects do
    desc 'Add given number of subjects to a study (enroll)'
    task :process, [:study_name, :subject_count] => :environment do |t,args|
        study = Study.find_by_name(args[:study_name])
        abort('Study not found') unless study
        puts "Adding #{args[:subject_count].to_i} subjects to study #{args[:study_name]}"
        args[:subject_count].to_i.times do |i|
            subject = Subject.new(name: Faker::Name.name, age: rand(10..100))
            puts "adding subject with name #{subject.name} to study #{study.name}"
            subject.save
            Enrollment.create!(study: study, subject: subject)
        end

        puts "Added #{args[:subject_count]} subjects to study with name #{study.name}}"
    end
end