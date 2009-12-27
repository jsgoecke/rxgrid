task "echo1" do 
  command "/bin/echo"
  arguments ["1"]
end

task "echo2" do 
  command "/bin/echo"
  arguments ["2"]
end

job "job0" do 
  id jobId("job1", "bc_map.csv") 
end

job "job1" do 
  tasks ["echo1"]
end

job "job2" do 
  tasks ["echo2"]
  dependsOnJobs ["job0", "job1"]
end
