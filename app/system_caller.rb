class SystemCaller

  def self.git_task
    task = NSTask.new
    task.setLaunchPath("/usr/local/bin/git")
    task.setArguments(["rebase", "--interactive", "HEAD~2"])

    #TODO: project directory
    task.setCurrentDirectoryPath("/Users/dan2552/projects/timereporter")

    #TODO: relative path
    task.environment = { "GIT_SEQUENCE_EDITOR" => "'/Users/dan2552/projects/rebase-face/face.ruby'" }
    task.launch
  end

end
