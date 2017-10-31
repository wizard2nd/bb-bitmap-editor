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

  def draw_vertical_line(line:, color:)
    line.each do |point|
      color_pixel point: point, color: color
    end
  end

  def draw_horizontal_line(line:, color:)
    line.each do |point|
      color_pixel color: color, point: point
    end
  end
end