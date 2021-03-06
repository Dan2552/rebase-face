class MainWindowController < BaseWindowController
  extend IB

  xib :main_window

  #tables
  outlet :working_branches
  outlet :graph
  outlet :reusable_horizontal_node
  outlet :reusable_vertical_node
  outlet :graph_column
  outlet :branch_search

  #text fields
  outlet :branch_search_field

  #popovers
  outlet :node_popover
  outlet :choose_branch_popover

  attr_accessor :vertical_node_data

  def base_branch
    #TODO: change to attr
    Git::Branch.new(:master)
  end

  def window_did_load
    strong TableDelegateProxy.new(self, working_branches, :working_branches)
    strong TableDelegateProxy.new(self, graph, :graph, 25)
    strong TableDelegateProxy.new(self, branch_search, :branch_search)

    refresh_branches
  end

  def graph_row_count
    data = vertical_node_data || []
    data.count
  end

  def graph_cell(row)
    cell = graph.make_view :graph_row

    vertical_node = reusable_vertical_node.reuse(
      commit: vertical_node_data[row][:commit],
      popover: node_popover
    )

    horizontal_branches = vertical_node_data[row][:horizontal_branches]
    horizontal_nodes = []

    horizontal_branches.each_with_index do |horizontal_commits, index|
      horizontal_nodes = horizontal_nodes + horizontal_commits.map do |commit|
        reusable_horizontal_node.reuse(
          commit: commit,
          popover: node_popover,
          row: index #TODO
        )
      end
    end

    views = [vertical_node, horizontal_nodes].flatten.compact
    cell.set_subviews views

    cell.auto_arrange_subviews

    cell
  end

  def graph_selected_row(row)
  end

  def working_branches_row_count
    SelectedBranches.count
  end

  def working_branches_cell(row)
    cell = working_branches.make_view :working_branch

    textfield = cell.subviews.first.subviews.first
    textfield.text = SelectedBranches[row]
    cell
  end

  def branches
    Git::Branch.search(branch_search_field.text)
  end

  def branch_search_row_count
    branches.count
  end

  def branch_search_cell(row)
    branch = branches[row]

    cell = branch_search.make_view :branch_search_cell
    cell.find(:label).text = branch
    cell.find(:tick).visible = SelectedBranches.selected?(branch)
    cell
  end

  def show_branch_popover sender
    choose_branch_popover.show sender
  end

  def branch_text_change sender
    branch_search.reload_data
  end

  def branch_search_selected_row row
    SelectedBranches.toggle branches[row]
    refresh_branches
  end

  def refresh_branches
    branch_search.reload_data
    working_branches.reload_data

    reload_graph_data
    graph.reload_data
    #calculate_graph_width
  end

  def reload_graph_data
    merge_bases = {}
    SelectedBranches.all.each do |branch|
      merge_base_commit = branch.merge_base(base_branch)
      merge_bases[merge_base_commit.sha] ||= []
      merge_bases[merge_base_commit.sha] << Git::Commit.range(merge_base_commit, branch.head).reverse
    end

    self.vertical_node_data = base_branch.commits.map do |commit|
      horizontal_node_data = []
      if merge_bases.keys.include? commit.sha
        merge_bases[commit.sha].each {|branch_off| horizontal_node_data << branch_off }
      end
      {
        commit: commit,
        horizontal_branches: horizontal_node_data
      }
    end
  end

  def calculate_graph_width
    vert = reusable_vertical_node.frame.size.width
    hor = reusable_horizontal_node.frame.size.width * 35
    #TODO: find longest horizontal graph / longest branch since base
    graph_column.width = vert + hor
  end

end
