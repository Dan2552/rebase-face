class NSView

  def find(identifier)
    subviews.each do |s|
      return s if s.identifier.to_s == identifier.to_s
      recursive_search = s.find(identifier)
      return recursive_search if recursive_search
    end
    nil
  end

  def add_subview_and_resize(subview)
    addSubview(subview)
    resize_to_subview(subview)
  end

  def resize_to_subviews
    subviews.each { |subview| resize_to_subview(subview) }
  end

  def resize_to_subview(subview)
    self.height = subview.bottom if subview.bottom < 0
    self.width = subview.right if subview.right > width
  end

  def auto_arrange_subviews
    width = 0
    subviews.each_with_index do |v, i|
      unless i == 0
        v.left = subviews[i-1].try(:right)
        width = v.right
      end
    end
    width
  end

  def left= x
    new_frame = self.frame
    new_frame.origin.x = x
    self.frame = new_frame
  end

  def left
    frame.origin.x
  end

  def right
    left + width
  end

  def width= w
    new_frame = self.frame
    new_frame.size.width = w
    self.frame = new_frame
  end

  # def top= y
  #   #don't forget, origin is bottom-left in OSX
  #   new_frame = self.frame
  #   new_frame.origin.y = y + self.height
  #   self.frame = new_frame
  # end

  def top
    #don't forget, origin is bottom-left in OSX
    frame.origin.y - height
  end

  def bottom= y
    new_frame = self.frame
    new_frame.origin.y = y
    self.frame = new_frame
  end

  def bottom
    self.frame.origin.y
  end

  def right
    left + width
  end

  def width
    frame.size.width
  end

  def height
    frame.size.height
  end

  def height= new_height
    new_frame = self.frame
    new_frame.size.height = new_height
    self.frame = new_frame
  end

  def visible= visible
    self.hidden = !visible
  end

end
