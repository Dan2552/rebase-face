module Git
  #TODO: un-hardcode
  PROJECT_PATH = "/Users/dan2552/projects/dummy/"

  class Rebase

    def reorder(commit, before:other_commit)
      start [commit, other_commit]
      move commit, before(other_commit)
      finish
    end

    def reorder(commit, after:other_commit)
      start [commit, other_commit]
      move commit, after(other_commit)
      finish
    end

    def remove(commit)
      start [commit]
      set_action(commit, "#")
      finish
    end

    def pick(commit, before:other_commit)
      start [other_commit]
      add(commit, before(other_commit))
      finish
    end

    def pick(commit)
      start
      add(commit, after(last_commit))
      finish
    end

    def reword(commit, new_message)
      start [commit]
      set_action(commit, "r")
      finish
      wait_for_lock
      write_to_rebase_file new_message
    end

    def self.abort
      `cd #{Git::PROJECT_PATH} && git rebase --abort`
      File.delete('/tmp/rebaseface.lock')
    end

    def fixup(commit, target:other_commit)
      start [commit, other_commit]
      move commit, after(other_commit)
      set_action(commit, "f")
      finish
    end

    private

    def set_action(commit, action)
      equivalent_commit(commit).action = action
    end

    def write_to_rebase_file contents
      puts "writing to #{path}"
      File.open(path, 'w') { |f| f.write(contents) }
      File.delete('/tmp/rebaseface.lock')
    end

    def last_commit
      sorted_commits.last
    end

    def add(commit, order)
      commits << Git::Commit.new(
        action: "pick",
        sha: commit.sha,
        name: commit.name,
        position: order
      )
    end

    def equivalent_commit(commit)
      @commits.select { |c| c.sha == commit.sha }.first
    end

    def move(commit, position)
      equivalent_commit(commit).position = position
    end

    def after(commit)
      equivalent_commit(commit).position.to_i + 0.5
    end

    def before(commit)
      equivalent_commit(commit).position.to_i - 0.5
    end

    def rebase_in_progress?
      File.exist?("/tmp/rebaseface.lock")
    end

    def find_earliest_commit(commits = [])
      earliest_commit = nil
      commits.each_with_index do |commit, index|
        if index == 0
          earliest_commit = commit
        else
          earliest_commit = commit if commit.before? earliest_commit
        end
      end
      earliest_commit
    end

    def start(commits=nil)
      raise "Rebase already in progress" if rebase_in_progress?
      #TODO: not relying on direct paths, project directory, relative path


      distance = commits ? find_earliest_commit(commits).position : 1

      task = NSTask.new
      task.setLaunchPath("/usr/local/bin/git")
      task.setArguments(["rebase", "--interactive", "HEAD~#{distance}"])
      task.setCurrentDirectoryPath(Git::PROJECT_PATH)
      task.environment = { "GIT_SEQUENCE_EDITOR" => "'/Users/dan2552/projects/rebase-face/face.ruby'", "EDITOR" => "'/Users/dan2552/projects/rebase-face/face.ruby'" }
      task.launch

      wait_for_lock

      read_commits
    end

    def wait_for_lock
      until File.exist?("/tmp/rebaseface.lock")
      end
    end

    def read_commits
      order = 0
      File.read(path).each_line("\n") do |l|
        order += 1
        if l.strip.start_with? "pick"
          split = l.split(" ", 3)
          commits << Git::Commit.new(
            action: split[0],
            sha: split[1],
            name: split[2],
            position: order
          )
        end
      end
    end

    def commits
      @commits ||= []
    end

    def sorted_commits
      commits.sort { |a,b| a.position.to_f <=> b.position.to_f }
    end

    def finish
      puts "writing commits"
      contents = sorted_commits.map { |commit|
        "#{commit.action} #{commit.sha} #{commit.name}"
      }.join("\n")
      write_to_rebase_file contents
    end

    def path
      path = `cat /tmp/rebaseface.lock`
      path = "#{PROJECT_PATH}#{path}" unless path.start_with?(PROJECT_PATH)
      path
    end

  end
end
