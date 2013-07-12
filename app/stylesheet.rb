Teacup::Stylesheet.new :main_window do

  style :go_button,
    frame: NSMakeRect(0, 42, 82, 32),
    title: "Start",
    bezelStyle: NSRoundedBezelStyle,
    autoresizingMask: autoresize.fixed_top_right

  style :finish_button,
    frame: NSMakeRect(0, 0, 82, 32),
    title: "Finish",
    bezelStyle: NSRoundedBezelStyle,
    autoresizingMask: autoresize.fixed_top_right

end
