class MainController < TeacupWindowController
  stylesheet :main_window

  layout do
    subview NSButton, :go_button, action: 'go:', target: self
    subview NSButton, :finish_button, action: 'finish:', target: self
  end

  def go(sender)
    SystemCaller.git_task
  end

  def finish(sender)
    File.delete('/tmp/rebaseface.lock')
  end

end
