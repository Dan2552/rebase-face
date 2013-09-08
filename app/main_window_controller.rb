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

  def window_did_load

    @master = Git::Commit.from(:master)

    strong TableDelegateProxy.new(self, working_branches, :working_branches)
    strong TableDelegateProxy.new(self, graph, :graph)
    strong TableDelegateProxy.new(self, branch_search, :branch_search)
  end

  def graph_row_count
    @master.count
  end

  def graph_cell(row)
    cell = graph.make_view :graph_row

    vertical_node = reusable_vertical_node.reuse(
      commit: @master[row],
      popover: node_popover
    )

    horizontal_nodes = nil
    # if row == 0 || row == 3 || row == 4
    #   horizontal_nodes = @master[0..row*2].map do |commit|
    #     reusable_horizontal_node.reuse(
    #       commit: commit,
    #       popover: node_popover
    #     )
    #   end
    # end

    views = [vertical_node, horizontal_nodes].flatten.compact
    cell.set_subviews views

    width = cell.auto_arrange_subviews
    graph_column_size(width)

    cell
  end

  def graph_column_size(width)
    if width > graph_column.width
      graph_column.width = width
    end
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
    branch_search.reload_data
    working_branches.reload_data
  end

end
