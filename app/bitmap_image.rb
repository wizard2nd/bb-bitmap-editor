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

  def color_pixel(x:, y:, color:)
    pixels[y - 1][x - 1] = color
  end

  def clear
    create(width: width, height: height)
  end

  def draw_vertical_line(x:, y1:, y2:, color:)
    @pixels[1][1] = color
    @pixels[2][1] = color
    @pixels[3][1] = color
  end
end