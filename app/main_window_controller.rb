class MainWindowController < BaseWindowController
  extend IB
  # stylesheet :main_window

  # layout do
  #   subview NSButton, :go_button, action: 'go:', target: self
  #   subview NSButton, :finish_button, action: 'finish:', target: self
  #   @table = subview NSTableView, :table_view, delegate: self, dataSource: self
  # end

  xib :main_window
  click 1, :go
  click 2, :finish
  outlet :table_view

  def window_did_load
    table_view.delegate = self
    table_view.dataSource = self
  end

  def go
    Git::RebaseIO.start_rebase
  end

  def finish
    Git::RebaseIO.end_rebase
  end

  def numberOfRowsInTableView table_view
    Git::Commit.all.count
  end

  def table_cell(column, row)
    cell = table_view.make_view("CellView", self)
    textfield = cell.subviews.first
    commit = Git::Commit.all[row]
    textfield.stringValue = "#{commit.sha} - #{commit.name}"
    cell
  end

end
