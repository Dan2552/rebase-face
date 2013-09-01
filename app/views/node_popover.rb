class NodePopover

  def initialize popover_instance
    @popover = popover_instance
  end

  def show sender
    @popover.show_by(sender)

    commit = sender.commit
    @popover.view(:sha).text = commit.sha
    @popover.view(:name).text = commit.name
  end

end
