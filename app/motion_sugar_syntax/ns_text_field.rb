class NSTextField

  def text
    stringValue
  end

  def text= text
    self.stringValue = text.to_s
  end

end
