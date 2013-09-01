class MainWindowController < BaseWindowController
  extend IB

  xib :main_window

  outlet :working_branches
  outlet :graph
  outlet :popover_view
  outlet :reusable_horizontal_node
  outlet :reusable_vertical_node
  outlet :graph_column

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
    cell = graph.make_view :graph_row

    vertical_node = reusable_vertical_node.reuse(
      commit: @master[row],
      popover: node_popover
    )

    if row == 0 || row == 3 || row == 4
      horizontal_nodes = @master[0..row*2].map do |commit|
        reusable_horizontal_node.reuse(
          commit: commit,
          popover: node_popover
        )
      end
    end

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
    5
  end

  def working_branches_cell(row)
    cell = working_branches.make_view :working_branch

    textfield = cell.subviews.first.subviews.first
    textfield.text = "test"
    cell
  end

end
