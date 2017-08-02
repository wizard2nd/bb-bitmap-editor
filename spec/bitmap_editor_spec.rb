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

  describe 'I 2 3' do
    it 'creates and 2 x 3 image' do
      image = double :image
      expect(image).to receive(:create).with(width: 2, height: 3)

      BitmapEditor.new(image).run('I 2 3')
    end
  end

  describe 'I 251 251' do
    it 'creates 250 x 250 image?'
  end
end