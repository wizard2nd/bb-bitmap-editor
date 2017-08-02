class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    args = command.split(' ')
    type_of_command = args[0]

    case type_of_command
    when 'I'
      @image.create(width: args[1].to_i, height: args[2].to_i)
    when 'C'
      @image.clear
    end
  end
end
