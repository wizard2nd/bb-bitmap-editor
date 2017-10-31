class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    args = command.upcase.split(' ')
    type_of_command = args[0]

    case type_of_command
    when 'I'
      @image.create(width: args[1].to_i, height: args[2].to_i)
    when 'C'
      @image.clear
    when 'L'
      point = { x: args[1].to_i.abs, y: args[2].to_i.abs }
      point = OpenStruct.new(point)
      @image.color_pixel(point: point, color: args[3])
    when 'V'
      @image.color_vertical_line(x: args[1].to_i, y1: args[2].to_i, y2: args[3].to_i, color: args[4])
    when 'H'
      @image.color_horizontal_line(y: args[1].to_i, x1: args[2].to_i, x2: args[3].to_i, color: args[4])
    when 'S'
      @image.show
    end
  end
end
