class NSView

  def find(identifier)
    subviews.each do |s|
      return s if s.identifier.to_s == identifier.to_s
      recursive_search = s.find(identifier)
      return recursive_search if recursive_search
    end
    nil
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

  def width
    frame.size.width
  end

  def visible= visible
    self.hidden = !visible
  end

end
