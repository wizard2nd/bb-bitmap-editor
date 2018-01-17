require 'rspec'
require_relative '../app/bitmap_image'
require 'byebug'

describe BitmapImage do
  let(:image) { described_class.new }

  describe '#create' do

    describe 'image 4 by 1' do

      it 'creates image of width 4' do
        expect(image.create(width: 4, height: 1).width).to eq 4
      end

      it 'creates image of height 1' do
        expect(image.create(width: 4, height: 1).height).to eq 1
      end

      it 'creates an image with white background' do
        image.create(width: 2, height: 2)

        expect(image.to_s).to eq "OO\nOO"
      end
    end
  end

  describe '#color_pixel' do

    before { image.create(width: 4, height: 3) }

    it 'paint pixel on (1,2) with color R' do
      point = OpenStruct.new(x: 1, y: 2)
      image.color_pixel(color: 'R', point: point)

      expect(image.to_s).to eq "OOOO\nROOO\nOOOO"
    end

    it 'paint pixel on (1,2) with color G' do
      point = OpenStruct.new(x: 1, y: 2)
      image.color_pixel(color: 'G', point: point)

      expect(image.to_s).to eq "OOOO\nGOOO\nOOOO"
    end

    it 'paint pixel on (2,3) with color B' do
      point = OpenStruct.new(x: 2, y: 3)
      image.color_pixel(color: 'B', point: point)

      expect(image.to_s).to eq "OOOO\nOOOO\nOBOO"
    end
  end

  describe '#clear' do
    let(:width) { 2 }
    let(:height) { 2 }

    let(:clear_image) { [ %w(O O), %w(O O) ] }
    before do
      image.create(width: width, height: height)
      point = OpenStruct.new(x: 1, y: 2)
      image.color_pixel(color: 'R', point: point)
    end

    it 'clears the image by setting white background' do
      expect { image.clear }.to(
        change { image.to_s }.from("OO\nRO").to "OO\nOO"
      )
    end
  end

  describe '#draw_line' do
    before do
      image.create(width: 4, height: 5)
    end

    it 'draws vertical line in x = 2 column trough rows 2 to 4 with colour R' do
      v_line = [
        OpenStruct.new(x: 2, y: 2),
        OpenStruct.new(x: 2, y: 3),
        OpenStruct.new(x: 2, y: 4)
      ]

      image.draw_line(color: 'R', line: v_line)

      expect(image.to_s).to eq <<~IMAGE
        OOOO
        OROO
        OROO
        OROO
        OOOO
      IMAGE
        .strip
    end

    it 'draws vertical line in 2 column trough rows 2 to 4 with colour B' do
      v_line = [
        OpenStruct.new(x: 2, y: 2),
        OpenStruct.new(x: 2, y: 3),
        OpenStruct.new(x: 2, y: 4)
      ]

      image.draw_line(color: 'B', line: v_line)

      expect(image.to_s).to eq <<~IMAGE
        OOOO
        OBOO
        OBOO
        OBOO
        OOOO
      IMAGE
        .strip
    end

    it 'draws vertical line in x = 3 column trough rows 2 to 4 with colour B' do
      v_line = [
        OpenStruct.new(x: 3, y: 2),
        OpenStruct.new(x: 3, y: 3),
        OpenStruct.new(x: 3, y: 4)
      ]

      image.draw_line(color: 'B', line: v_line)
      expect(image.pixels[1][2]).to eq 'B'
      expect(image.pixels[2][2]).to eq 'B'
      expect(image.pixels[3][2]).to eq 'B'
    end

    it 'draws vertical line in x = 3 column trough rows 1 to 3 with colour B' do
      v_line = [
        OpenStruct.new(x: 3, y: 1),
        OpenStruct.new(x: 3, y: 2),
        OpenStruct.new(x: 3, y: 3)
      ]

      image.draw_line(color: 'B', line: v_line)
      expect(image.pixels[0][2]).to eq 'B'
      expect(image.pixels[1][2]).to eq 'B'
      expect(image.pixels[2][2]).to eq 'B'
    end

    it 'draws horizontal line on y = 2 row trough 2 to 4 y columns with color G' do
      h_line = [
          OpenStruct.new(x: 2, y: 2),
          OpenStruct.new(x: 3, y: 2),
          OpenStruct.new(x: 4, y: 2),
      ]

      image.draw_line(color: 'G', line: h_line)
      expect(image.pixels[1][1]).to eq 'G'
      expect(image.pixels[1][2]).to eq 'G'
      expect(image.pixels[1][3]).to eq 'G'
    end

    it 'draws horizontal line on y = 3 row trough 2 to 4 y columns with color G' do
      h_line = [
          OpenStruct.new(x: 2, y: 3),
          OpenStruct.new(x: 3, y: 3),
          OpenStruct.new(x: 4, y: 3)
      ]

      image.draw_line(color: 'G', line: h_line)
      expect(image.pixels[2][1]).to eq 'G'
      expect(image.pixels[2][2]).to eq 'G'
      expect(image.pixels[2][3]).to eq 'G'
    end

    it 'draws horizontal line on y = 3 row trough 1 to 4 y columns with color B' do
      h_line = [
          OpenStruct.new(x: 1, y: 3),
          OpenStruct.new(x: 2, y: 3),
          OpenStruct.new(x: 3, y: 3),
          OpenStruct.new(x: 4, y: 3)
      ]

      image.draw_line(color: 'B', line: h_line)
      expect(image.pixels[0][0..-1]).to all eq 'O'
      expect(image.pixels[1][0..-1]).to all eq 'O'
      expect(image.pixels[2][0..-1]).to all eq 'B'
      expect(image.pixels[3][0..-1]).to all eq 'O'
    end
  end

  describe '#to_s' do
    before { image.create(width: 2, height: 2) }

    let(:expected_string) { "OO\nOO" }

    it 'converts image to string' do
      expect(image.to_s).to eq expected_string
    end
  end
end