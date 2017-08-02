class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    args = command.split(' ')
    case args[0]
    when 'I'
      @image.create(width: args[1].to_i, height: args[2].to_i)
    when 'C'
      @image.clear
    end
  end
end
