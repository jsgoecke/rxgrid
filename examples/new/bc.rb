file "bc_exp1.txt" do
  agentPathName "bc_exp1.txt"
  localPathName "bc_exp1.txt"
  isExecutable false
end

task "bc" do
  command "/usr/bin/bc"
  arguments ["-q", "bc_exp1.txt"]
  refersTo ["bc_exp1.txt"]
end

job "job1" do 
  tasks ["bc"]
end
