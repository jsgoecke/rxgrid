task "echo1" do |t|
  t.command = "/bin/echo"
  t.arguments = ["1"]
end

task "echo2" do |t|
  t.command = "/bin/echo"
  t.arguments = ["2"]
end

job "job0" do |t|
  t.id = jobId("job1", "bc_map.csv") 
end

job "job1" do |t|
  t.tasks = ["echo1"]
end

job "job2" do |t|
  t.tasks = ["echo2"]
  t.dependsOnJobs = ["job0", "job1"]
end
