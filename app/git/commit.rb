module Git
  class Commit
    include MotionModel::Model
    include MotionModel::ArrayModelAdapter

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

    def self.range(start, finish)
      from("#{start}..#{finish}")
    end

    def self.from(reference=:master)
      reference = sanitize_name(reference)
      commits = []

      index = 0
      `cd #{Git::PROJECT_PATH} && git log #{reference} --oneline`.each_line do |line|
        split = line.strip.split(" ", 2)

        c = Git::Commit.new(
          sha: split[0],
          name: split[1],
          position: index + 1
        )

        commits << c

        index += 1
      end
      commits
    end

    private

    def self.sanitize_name name
      name.gsub(" ", "-")
    end

  end
end
