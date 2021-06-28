# task main: [:sub1, :sub2] do
#   puts 'main done'
#   @end = Time.now
#   puts @end-@time
# end
# task :sub1 do
#   @time = Time.now
#   puts 'Subtask 1'
# end
# task :sub2 do
#   puts 'Subtask 2'
# end
namespace :itsk do
  desc 'Task to invite subjects that have selected auto invitation as false'
  task threads: :environment do
    start = Time.now
      threads = 3.times.map do |i|
        Thread.new do
          begin
            a = Enrollment.create(study_id: 1, subject_id: 113, auto_invitation: 2)
            puts a.errors.full_messages
          rescue StandardError => e
            puts "Error: #{e.class} and #{e.message}"
          end
          puts "#{i} done"
        end
      end
    threads.each do |t|
      t.join
    end
  endd = Time.now
  puts "*** #{endd-start}  ***"
  end
end

# task :pool do
#   start = Time.now
#   pool = Rake::ThreadPool.new 4
#   3.times do |i|
#     pool.future do
#       sleep rand
#       1+1
#       puts "#{Time.now-start}"
#     end
#   end
#   at_exit { pool.join }
#   endd = Time.now
#   puts "*** #{endd-start}  ***"
# end