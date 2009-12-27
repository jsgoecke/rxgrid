filelist = Dir.glob("*.txt")

filelist.each do |f|
  file f.to_s do |t|
    t.agentPathName = f.to_s
    t.localPathName = f.to_s
    t.isExecutable = false
  end
end

taskNames = []
filelist.each do |f|
  taskName = "bc" + f.to_s
  taskNames = taskNames | [taskName]
  task taskName do |t|
    t.command = "/usr/bin/bc"
    t.arguments = ["-q", f.to_s]
    t.refersTo = [f.to_s]
  end
end
  
job "job1" do |t|
  t.tasks = taskNames
end
