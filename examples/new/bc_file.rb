filelist = Dir.glob("*.txt")

filelist.each do |f|
  file f.to_s do
    agentPathName f.to_s
    localPathName f.to_s
    isExecutable false
  end
end

taskNames = []
filelist.each do |f|
  taskName = "bc" + f.to_s
  taskNames = taskNames | [taskName]
  task taskName do
    command "/usr/bin/bc"
    arguments ["-q", f.to_s]
    refersTo [f.to_s]
  end
end
  
job "job1" do
  tasks taskNames
end
