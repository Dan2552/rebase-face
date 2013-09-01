class TableDelegateProxy

  def initialize real_delegate, table_view, prefix=:table
    @table_view = table_view
    @delegate = real_delegate
    @name = prefix.to_s

    connect_delegation
  end

  def tableView table_view, viewForTableColumn:table_column, row:row
    @delegate.send("#{@name}_cell".to_sym, row)
  end

  def numberOfRowsInTableView table_view
    @delegate.send("#{@name}_row_count".to_sym)
  end

  def connect_delegation
    raise "Unknown table '#{@name}'" unless @table_view.is_a? NSTableView
    @table_view.delegate = self
    @table_view.dataSource = self
  end

end
