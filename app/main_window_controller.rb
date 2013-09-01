class MainWindowController < BaseWindowController
  extend IB

  xib :main_window

  outlet :working_branches
  outlet :graph
  outlet :popover_view
  outlet :reusable_horizontal_node
  outlet :reusable_vertical_node

  attr_accessor :node_popover

  def window_did_load
    self.node_popover = NodePopover.new(popover_view)

    @master = Git::Commit.from(:master)

    strong TableDelegateProxy.new(self, working_branches, :working_branches)
    strong TableDelegateProxy.new(self, graph, :graph)
  end

  def graph_row_count
    @master.count
  end

  def graph_cell(row)
    reusable_vertical_node.reuse(
      commit: @master[row],
      popover: node_popover
    )
  end

  def working_branches_row_count
    5
  end

  def working_branches_cell(row)
    cell = working_branches.make_view(:working_branch, self)

    textfield = cell.subviews.first.subviews.first
    textfield.text = "test"
    cell
  end

end
