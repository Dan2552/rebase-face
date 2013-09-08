module Git
  class Commit
    include MotionModel::Model
    include MotionModel::ArrayModelAdapter

    columns :email, :sha, :name, :position, :action

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
      commits = []

      index = 0
      Command.new.log(reference).each_line do |line|
        split = line.strip.split("//!//", 3)

        c = Git::Commit.new(
          email: split[0],
          sha: split[1],
          name: split[2],
          position: index + 1
        )

        commits << c

        index += 1
      end
      commits
    end

    def gravatar
      hash = email.downcase.MD5_digest
      "http://www.gravatar.com/avatar/#{hash}?d=mm"
    end

  end
end
