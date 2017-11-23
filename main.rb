require_relative 'app/bitmap_editor'
require_relative 'app/bitmap_image'

bitmap_editor = BitmapEditor.new(BitmapImage.new)
commands = File.expand_path('app/commands.txt', __dir__)
File.open(commands) do |file|
  file.each_line do |command|
    bitmap_editor.run(command)
  end
end