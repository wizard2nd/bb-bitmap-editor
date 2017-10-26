require 'rspec'
require 'ostruct'
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
      point = OpenStruct.new(x: 1, y: 1)
      expect(image).to receive(:color_pixel).with(point: point, color: 'B')

      run_command
    end
  end

  describe 'L 5 9 B' do
    let(:command) { 'L 5 9 B' }

    it 'Colours 5th pixel in row and 9th pixel in column to black' do
      point = OpenStruct.new(x: 5, y: 9)
      expect(image).to receive(:color_pixel).with(point: point, color: 'B')

      run_command
    end
  end

  describe 'L -1 -3 B' do
    let(:command) { 'L -1 -3 B' }

    it 'Colors fist pixel in row and third pixel in column to black' do
      point = OpenStruct.new(x: 1, y: 3)
      expect(image).to receive(:color_pixel).with(point: point, color: 'B')

      run_command
    end
  end

  describe 'l 1 3 b' do
    let(:command) { 'l 1 3 b' }
    it 'Colors fist pixel in row and third pixel in column to black' do
      point = OpenStruct.new(x: 1, y: 3)
      expect(image).to receive(:color_pixel).with(point: point, color: 'B')

      run_command
    end
  end

  describe 'V 3 5 8 Y' do
    let(:command) { 'V 3 5 8 Y' }

    it 'Colors pixels in vertical line in third column between 5th and 8th row' do
      expect(image).to receive(:color_vertical_line).with(x: 3, y1: 5, y2: 8, color: 'Y')

      run_command
    end
  end

  describe 'V -1 3 5 G' do
    it 'Colors vertical line on first column with green color?'
  end

  describe 'V 1 -3 -8 B' do
    it 'Colors vertical line on first column between third and 8th pixel with black color?'
  end

  describe 'V 0 4 8 R' do
    it 'Colors vertical line on first column between 4th and 8th pixel with red color?'
  end

  describe 'V 0 0 0' do
    it 'Colors what?'
  end

  describe 'V 251 2 6 B' do
    it 'Colors vertical line on last column between pixels 2 and 6 with black color?'
  end

  describe 'V -2 -3 -10 B' do
    it 'Colors vertical line on column 2 between pixels 3 and 10 with black color?'
  end

  describe 'H 3 5 8 Y' do
    let(:command) { 'H 3 5 8 Y' }

    it 'Colors pixels in horizontal line in third row between 5th and 8th pixel in row' do
      expect(image).to receive(:color_horizontal_line).with(y: 3, x1: 5, x2: 8, color: 'Y')

      run_command
    end
  end

  describe 'H 0 4 8 R' do
    it 'Colors first horizontal line between 4th and 8th pixel with red color'
  end

  describe 'S' do
    let(:command) { 'S' }

    it 'Prints out content of image' do
      expect(image).to receive(:show)

      run_command
    end
  end
end