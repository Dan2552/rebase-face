module Git
  class Commit
    include MotionModel::Model
    include MotionModel::ArrayModelAdapter # <== Here!

    columns :sha, :name, :position, :action

    def before? commit
      position > commit.position
    end

    def after? commit
      commit.before? self
    end

    def self.from_sha sha
      Git::Commit.find{ |c| c.sha == sha }.first
    end

    def self.read_commits
      index = 0
      `cd #{Git::PROJECT_PATH} && git log --oneline`.each_line do |line|
        split = line.strip.split(" ", 2)

        Git::Commit.create(
          sha: split[0],
          name: split[1],
          position: index + 1
        )

        index += 1
      end
      true
    end

  end
end
