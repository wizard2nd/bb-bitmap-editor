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
    (y1..y2).each { |y| @pixels[y - 1][x - 1] = color }
  end

  def draw_horizontal_line(y:, x1:, x2:, color:)
    @pixels[y - 1][1] = 'G'
    @pixels[y - 1][2] = 'G'
    @pixels[y - 1][3] = 'G'
  end
end