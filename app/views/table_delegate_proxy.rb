class TableDelegateProxy

  attr_reader :top_inset

  def initialize real_delegate, table_view, prefix=:table, top_inset=0
    @table_view = table_view
    @delegate = real_delegate
    @name = prefix.to_s
    @top_inset = top_inset

    connect_delegation
  end

  def tableView table_view, viewForTableColumn:table_column, row:row
    if has_top_inset?
      if row == 0
        NSView.alloc.initWithFrame([[0, 0], [1, top_inset]])
      else
        @delegate.send("#{@name}_cell".to_sym, row - 1)
      end
    else
      @delegate.send("#{@name}_cell".to_sym, row)
    end
  end

  def tableView(table_view, heightOfRow:row)
    if has_top_inset? && row == 0
      top_inset
    else
      table_view.rowHeight
    end
  end

  def numberOfRowsInTableView table_view
    rows = @delegate.send("#{@name}_row_count".to_sym)
    rows = rows + 1 if has_top_inset?
    rows
  end

  def has_top_inset?
    top_inset.to_i > 0
  end

  def connect_delegation
    raise "Unknown table '#{@name}'" unless @table_view.is_a? NSTableView
    @table_view.delegate = self
    @table_view.dataSource = self
  end

  def tableViewSelectionDidChange(notification)
    @delegate.send("#{@name}_selected_row".to_sym, notification.object.selectedRow)
  end

end
