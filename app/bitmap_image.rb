class BitmapImage

  attr_reader :width, :height

  def create(width:, height:)
    @width = width
    @height = height
    self
  end
end