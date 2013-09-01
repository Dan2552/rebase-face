class NSObject

  def strong a
    @strong_vars ||= []
    @strong_vars << a
    a
  end

  def self.method_missing(meth, *args)
    #puts "self.method missing #{meth}"
    if meth.start_with? "new_"
      meth = "init_" + meth.split("new_", 2)[1]
      return self.alloc.send(to_obj_c(meth), *args)
    else
      return run_method(meth, *args)
    end
  end

  def method_missing(meth, *args)
    #puts "method missing #{meth}"
    run_method meth, *args
  end

  def clear_puts msg
    puts ">>>>>>>>>>>>>>>>>>>>>>>>"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>"
    puts ">>>>>>>>>>>>>>>>>>>>>>>>"
    puts msg
    puts "<<<<<<<<<<<<<<<<<<<<<<<<"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<"
  end

  def try *args
    self.send(*args)
  rescue
    nil
  end

  private

  def run_method(meth, *args)
    obj_c_meth = to_obj_c(meth)
    if respond_to?(obj_c_meth)
      return send obj_c_meth, *args
    else
      raise NoMethodError.new("Missing method: (#{obj_c_meth} || #{meth}) for #{self.class}")
    end
  end

  def self.run_method(meth, *args)
    obj_c_meth = to_obj_c(meth)
    if respond_to?(obj_c_meth)
      return send obj_c_meth, *args
    else
      raise NoMethodError.new("Missing method: (#{obj_c_meth} || #{meth}) for #{self.class}")
    end
  end

  def to_obj_c(meth)
    self.class.to_obj_c meth
  end

  def self.to_obj_c(meth)
    a = meth.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
    #puts "converted to #{a}"
    a
  end
end

