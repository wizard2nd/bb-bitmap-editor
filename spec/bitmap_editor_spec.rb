require 'rspec'
require_relative '../app/bitmap_editor'

describe BitmapEditor do
  let(:image) { double :image }
  describe 'I 0 0' do
    it 'does nothing'
  end

  describe 'I 1 1' do
    it 'creates and 1 x 1 image' do
      expect(image).to receive(:create).with(width: 1, height: 1)

      BitmapEditor.new(image).run('I 1 1')
    end
  end

  describe 'I 2 3' do
    it 'creates and 2 x 3 image' do
      expect(image).to receive(:create).with(width: 2, height: 3)

      BitmapEditor.new(image).run('I 2 3')
    end
  end

  describe 'I 251 251' do
    it 'creates 250 x 250 image?'
  end

  describe 'I -1 -1' do
    it 'creates nothing?'
  end

  describe 'C' do
    it 'clears image' do
      expect(image).to receive(:clear)

      BitmapEditor.new(image).run('C')
    end
  end

  describe 'L 0 0 B' do
    it 'does nothing'
  end

  describe 'L 1 1 B' do
    it 'Colours fist pixel in row and first pixel in column to black' do
      expect(image).to receive(:color_pixel).with(x: 1, y: 1, color: 'B')

      BitmapEditor.new(image).run('L 1 1 B')
    end
  end
end