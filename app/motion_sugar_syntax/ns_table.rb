class NSTableView

  def make_view(id, owner)
    cell = makeViewWithIdentifier(id.to_s, owner:owner)
    raise "Can't find view with id: '#{id}' for table cell. Make sure it's the NSTableCellView instance with the identifier in xcode." unless cell
    cell
  end

end
