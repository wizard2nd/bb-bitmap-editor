class BitmapEditor
  def initialize(image, display = nil)
    @image = image
    @display = display
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
      point = OpenStruct.new({ x: args[1].to_i.abs, y: args[2].to_i.abs })
      @image.color_pixel(point: point, color: args[3])
    when 'V'
      v_line = (args[2]..args[3]).each_with_object([]) do |y, line|
        line << OpenStruct.new(x: args[1].to_i, y: y.to_i)
      end
      @image.draw_line(line: v_line, color: args[4])
    when 'H'
      h_line = (args[2]..args[3]).each_with_object([]) do |x, line|
        line << OpenStruct.new(x: x.to_i, y: args[1].to_i)
      end
      @image.draw_line(line: h_line, color: args[4])
    when 'S'
      @display.show(@image)
    end
  end
end
