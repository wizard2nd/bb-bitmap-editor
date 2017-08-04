require 'rspec'
require_relative '../app/bitmap_editor'

describe BitmapEditor do
  let(:image) { double :image }
  let(:bitmap_editor) { described_class.new(image) }
  let(:command) { '' }

  subject(:run_command) { bitmap_editor.run(command) }

  describe 'I 0 0' do
    it 'does nothing'
  end

  describe 'I 1 1' do
    let(:command) { 'I 1 1' }

    it 'creates and 1 x 1 image' do
      expect(image).to receive(:create).with(width: 1, height: 1)

      run_command
    end
  end

  describe 'I 2 3' do
    let(:command) { 'I 2 3' }
    it 'creates and 2 x 3 image' do
      expect(image).to receive(:create).with(width: 2, height: 3)

      run_command
    end
  end

  describe 'I 251 251' do
    it 'creates 250 x 250 image?'
  end

  describe 'I -1 -1' do
    it 'creates nothing?'
  end

  describe 'C' do
    let(:command) { 'C' }

    it 'clears image' do
      expect(image).to receive(:clear)

      run_command
    end
  end

  describe 'L 0 0 B' do
    it 'does nothing'
  end

  describe 'L 1 1 B' do
    let(:command) { 'L 1 1 B' }

    it 'Colours fist pixel in row and first pixel in column to black' do
      expect(image).to receive(:color_pixel).with(x: 1, y: 1, color: 'B')

      run_command
    end
  end

  describe 'L 5 9 B' do
    let(:command) { 'L 5 9 B' }

    it 'Colours fist pixel in row and first pixel in column to black' do
      expect(image).to receive(:color_pixel).with(x: 5, y: 9, color: 'B')

      run_command
    end
  end
end