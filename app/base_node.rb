class BaseNode

  attr_accessor :commit, :popover

  def self.vert_reuse= vert_reuse
    @vert_reuse = vert_reuse
  end

  def self.horiz_reuse= horiz_reuse
    @horiz_reuse = horiz_reuse
  end

  def self.vert_reuse
    @vert_reuse
  end

  def self.horiz_reuse
    @horiz_reuse
  end

  def horizontal_rows
    @horizontal_rows ||= []
  end

  def add_branch_off branch_commits
    unless branch_commits.is_a? Array
      raise "Array of commits expected"
    end

    self.horizontal_rows << branch_commits
  end

  def to_view_hierarchy
    NSView.alloc.initWithFrame([[0, 0], [500, 500]]).tap do |view|
      vert = vertical_view
      self.vert_width = vert.width

      view.add_subview_and_resize vert
      view.add_subview_and_resize horizontal_rows_view
    end
  end

  def vertical_view
    self.class.vert_reuse.reuse(
      commit: commit,
      popover: popover,
      bottom: 0
    )
  end

  def horizontal_rows_view
    NSView.alloc.initWithFrame([[0, 0], [0, 0]]).tap do |view|
      horizontal_rows.each_with_index do |row, row_n|
        row.each_with_index do |commit, index_n|
          view.add_subview(horizontal_view(commit, row_n, index_n))
        end
      end

      # view.resize_to_subviews
    end
  end

  def horizontal_view(commit, row_n, index_n)
    reusable = self.class.horiz_reuse

    w = reusable.width
    h = reusable.height

    reusable.reuse(
      commit: commit,
      popover: popover,
      bottom: 0 - h * row_n,
      left: vert_width + w * index_n
    )
  end

  private

  attr_accessor :vert_width

end
