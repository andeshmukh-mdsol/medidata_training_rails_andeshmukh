threads = 3.times.map do |i|
  Thread.new do
    1+1 # Just some random calculation
    puts "Thread #{i} done"
  end
end
threads.each do |t|
  t.join
end