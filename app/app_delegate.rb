class AppDelegate
  def applicationDidFinishLaunching(notification)
    Git::Commit.read_commits
    buildMenu
    buildWindow
  end

  def buildWindow
    @controller = MainWindowController.open
  end
end
