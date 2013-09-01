class NodePopover < NSPopover

  def show sender
    super

    commit = sender.commit
    view(:sha).text = commit.sha
    view(:name).text = commit.name
  end

end
