class BitmapImage

  WHITE_COLOR = 'O'.freeze

  def create(width:, height:)
    @image = Array.new(height) { Array.new(width, WHITE_COLOR) }
    self
  end

  def width
    @image.first.size
  end

  def height
    @image.size
  end
end