require 'ostruct'

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

  def color_pixel(color:, point:)
    pixels[point.y - 1][point.x - 1] = color
  end

  def clear
    create(width: width, height: height)
  end

  def draw_vertical_line(x:, y1:, y2:, color:)
    (y1..y2).each do |y|
      point = OpenStruct.new(x: x, y: y)
      color_pixel point: point, color: color
    end
  end

  def draw_horizontal_line(y:, x1:, x2:, color:)
    (x1..x2).each do |x|
      point = OpenStruct.new(x: x, y: y)
      color_pixel color: color, point: point
    end
  end
end