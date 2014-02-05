module Git
  class Branch

    attr_reader :name

    def self.all
      all = []
      Command.new.branch_list.each_line do |l|
        all << new(l.match("^[0-z]*\scommit\trefs\/heads\/(.*)$")[1])
      end
      all
    end

    def self.search(terms)
      all.map{|b| b if b.search_match? terms }.compact
    end

    def initialize name
      @name = name
    end

    def to_s
      @name
    end

    def search_match? terms
      terms = terms.to_s
      terms = terms.gsub(" ", "-")
      name.start_with?(terms)
    end

    def head
      commits.first
    end

    def commits
      Commit.from(self.name)
    end

    def merge_base(branch)
      Commit.from(Command.new.merge_base(self, branch)).first
    end

  end
end
