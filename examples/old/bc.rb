file "bc_exp1.txt" do |t|
  t.agentPathName = "bc_exp1.txt"
  t.localPathName = "bc_exp1.txt"
  t.isExecutable = false
end

task "bc" do |t|
  t.command = "/usr/bin/bc"
  t.arguments = ["-q", "bc_exp1.txt"]
  t.refersTo = ["bc_exp1.txt"]
end

job "job1" do |t|
  t.tasks = ["bc"]
end
