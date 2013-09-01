class NSControl

  def register_click_action target, action
    action = action.to_s
    setAction(action + (":" * target.method(action).arity))
    setTarget(target)
  end

end
