class NSPopover

  def view identifier
    content_view_controller.view.find identifier
  end

  def show view
    showRelativeToRect(view.bounds, ofView:view, preferredEdge:1)
  end

end
