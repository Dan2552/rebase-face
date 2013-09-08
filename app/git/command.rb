module Git
  class Command

    def current_directory
      "cd #{Git::PROJECT_PATH} &&"
    end

    def log(ref)
      ref = sanitize_name(ref)
      `#{current_directory} git log #{ref} --pretty=format:"%ae//!//%h//!//%s"`
    end

    def branch_list
      `#{current_directory} git for-each-ref --sort=-committerdate refs/heads/`
    end

    private

    def sanitize_name name
      name.gsub(" ", "-")
    end

  end
end
