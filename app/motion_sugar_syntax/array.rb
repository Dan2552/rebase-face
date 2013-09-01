class Array

  def to_rect
    raise "Can't be rect, not 4 digits" if self.count != 4
    CGRectMake(self[0], self[1], self[2], self[3])
  end

end
