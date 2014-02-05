module Git
  class Command

    def current_directory
      "cd #{Git::PROJECT_PATH} &&"
    end

    def log(ref)
      ref = sanitize_name(ref)
      command("git log #{ref} --pretty=format:\"%ae//!//%h//!//%s\"")
    end

    def branch_list
      command('git for-each-ref --sort=-committerdate refs/heads/')
    end

    def merge_base(x, y)
      command("git merge-base #{sanitize_name(x)} #{sanitize_name(y)}").lines.first.gsub("\n", "")
    end

    def command command
      `#{current_directory} #{command}`
    end

    private

    def sanitize_name name
      name.to_s.gsub(" ", "-").gsub("\n", "")
    end

  end
end
