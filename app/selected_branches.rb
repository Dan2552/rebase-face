class SelectedBranches

  def self.toggle branch
    if selected? branch
      remove branch
    else
      selected_branches << branch
    end
  end

  def self.selected? branch
    selected_branches.select { |b| b.name == branch.name }.count > 0
  end

  def self.count
    selected_branches.count
  end

  def self.[] index
    selected_branches[index]
  end

  def self.all
    selected_branches
  end

  private

  def self.remove branch
    selected_branches
      .select { |b| b.name == branch.name }
      .each { |b| selected_branches.delete b }
  end

  def self.selected_branches
    @selected_branches ||= []
  end

end
