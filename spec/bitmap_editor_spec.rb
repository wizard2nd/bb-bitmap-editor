require 'rspec'
require_relative '../app/bitmap_editor'

describe BitmapEditor do
  describe 'I 0 0' do
    it 'does nothing'
  end

  describe 'I 1 1' do
    it 'creates and 1 x 1 image' do
      image = double :image
      expect(image).to receive(:create).with(width: 1, height: 1)

      BitmapEditor.new(image).run('I 1 1')
    end
  end
end