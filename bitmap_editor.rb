#!/usr/bin/env ruby

require_relative 'app/bitmap_editor'
require_relative 'app/bitmap_image'
require 'thor'

class DrawCli < Thor

  desc 'I M N', 'create image'
  def create_image(command)
    bitmap_editor = BitmapEditor.new(BitmapImage.new)
    bitmap_editor.run(command)
  end

  desc 'S', 'Print Image'
  def print_image(command)
    bitmap_editor = BitmapEditor.new(BitmapImage.new)
    bitmap_editor.run(command)
  end
end

DrawCli.start(ARGV)

# bitmap_editor = BitmapEditor.new(BitmapImage.new)
# commands = File.expand_path('app/commands.txt', __dir__)
# File.open(commands) do |file|
#   file.each_line do |command|
#     bitmap_editor.run(command)
#   end
# end