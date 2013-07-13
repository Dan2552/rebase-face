class BaseWindowController < NSWindowController

  @@hash_settings = {}

  def self.xib symbol
    hash_settings["#{name}_xib"] = symbol.to_s.camelize
  end

  def self.open
    puts "loading xib #{fetch_xib}"
    controller = self.alloc.initWithWindowNibName fetch_xib
    controller.showWindow controller
    controller
  end

  def windowDidLoad
    register_buttons
    window_did_load
  end

  def window_did_load

  end

  def self.click n, action_sym
    hash_settings["#{name}_click_#{n}"] = action_sym
  end

  def tableView table_view, viewForTableColumn:tableColumn, row:row
    table_cell(tableColumn, row)
  end

  def table_cell(column, row)

  end

  def tableViewSelectionDidChange aNotification
    puts "hello?"
  end

  private

  def self.hash_settings
    hash_settings = @@hash_settings
  end

  def self.fetch_xib
    hash_settings["#{name}_xib"]
  end

  def register_buttons
    cls = self.class
    cls.hash_settings.each do |key, value|
      button_id = key.split("#{cls.name}_click_").last.to_i
      if button_id > 0
        view = window.contentView.viewWithTag button_id
        if view.class <= NSControl
          puts "registering #{button_id} for action: #{value.to_s}"
          view.setAction(value.to_s)
          view.setTarget(self)
        else
          puts "invalid view: #{view}"
        end
      end
    end
  end

end
