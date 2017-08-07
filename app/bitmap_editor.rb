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
      @image.color_pixel(x: args[1].to_i.abs, y: args[2].to_i.abs, color: args[3])
    when 'V'
      @image.color_vertical_line(x: args[1].to_i, y1: args[2].to_i, y2: args[3].to_i, color: args[4] )
    end
  end
end
