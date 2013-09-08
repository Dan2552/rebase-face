class CommitNode < NSView

  def reuse(options={})
    archivedView = NSKeyedArchiver.archivedDataWithRootObject(self)
    copy = NSKeyedUnarchiver.unarchiveObjectWithData(archivedView)
    options.each {|k, v| copy.send("#{k}=", v) }
    copy
  end

  def commit= commit
    find(:node_text).text = commit.name
    find(:avatar).setImageWithURL(commit.gravatar, customCacheKey:commit.email)
    find(:node_view).commit = commit
  end

  def popover= popover
    find(:node_view).register_click_action(popover, :show)
  end

  def node_view
    find(:node_view)
  end

end
