class NSView

  def find(identifier)
    subviews.each do |s|
      return s if s.identifier.to_s == identifier.to_s
      recursive_search = s.find(identifier)
      return recursive_search if recursive_search
    end
    nil
  end

end
