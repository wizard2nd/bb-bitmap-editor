class BitmapEditor
  def initialize(image)
    @image = image
  end

  def run(command)
    args = command.split(' ')
    @image.create(width: args[1].to_i, height: args[2].to_i)
  end
end
