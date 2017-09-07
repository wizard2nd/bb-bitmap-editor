class BitmapImage

  attr_reader :pixels

  WHITE_COLOR = 'O'.freeze

  def create(width:, height:)
    @pixels = Array.new(height) { Array.new(width, WHITE_COLOR) }
    self
  end

  def width
    @pixels.first.size
  end

  def height
    @pixels.size
  end
end