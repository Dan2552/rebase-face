module Git
  #TODO: un-hardcode
  PROJECT_PATH = "/Users/dan2552/projects/dummy"

  class Rebase

    def reorder(commit, before:other_commit)
      start [commit, other_commit]
      move commit, before(other_commit)
      finish
    end

    def remove(commit)
      start [commit]
      equivalent_commit(commit).action = "#"
      finish
    end

    def self.abort
      `cd #{Git::PROJECT_PATH} && git rebase --abort`
      File.delete('/tmp/rebaseface.lock')
    end

    private

    def equivalent_commit(commit)
      @commits.select { |c| c.sha == commit.sha }.first
    end

    def move(commit, position)
      equivalent_commit(commit).position = position
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

    def start(commits)
      raise "Rebase already in progress" if rebase_in_progress?
      #TODO: not relying on direct paths, project directory, relative path

      distance = find_earliest_commit(commits).position

      task = NSTask.new
      task.setLaunchPath("/usr/local/bin/git")
      task.setArguments(["rebase", "--interactive", "HEAD~#{distance}"])
      task.setCurrentDirectoryPath(Git::PROJECT_PATH)
      task.environment = { "GIT_SEQUENCE_EDITOR" => "'/Users/dan2552/projects/rebase-face/face.ruby'" }
      task.launch

      wait_for_lock

      @path = `cat /tmp/rebaseface.lock`
      read_commits
    end

    def wait_for_lock
      until File.exist?("/tmp/rebaseface.lock")
      end
    end

    def finish
      write_commits
      puts `cat #{@path}`
      File.delete('/tmp/rebaseface.lock')
    end

    def read_commits
      order = 0
      File.read(@path).each_line("\n") do |l|
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

    def write_commits
      contents = sorted_commits.map { |commit|
        "#{commit.action} #{commit.sha} #{commit.name}"
      }.join("\n")

      File.open(@path, 'w') { |f| f.write(contents) }
    end

  end
end
