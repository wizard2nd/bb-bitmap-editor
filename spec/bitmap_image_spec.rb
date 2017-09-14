require 'rspec'
require_relative '../app/bitmap_image'

describe BitmapImage do

  describe '#create' do
    let(:image) { described_class.new }

    describe 'image 4 by 1' do

      it 'creates image of width 4' do
        expect(image.create(width: 4, height: 1).width).to eq 4
      end

      it 'creates image of height 1' do
        expect(image.create(width: 4, height: 1).height).to eq 1
      end

      it 'creates an image with white background' do
        pixels = image.create(width: 2, height: 2).pixels
        pixels.each do |row|
          row.each do |pixel|
            expect(pixel).to eq 'O'
          end
        end
      end
    end

    describe '#color_pixel' do

      before { image.create(width: 4, height: 3) }

      it 'paint pixel on (1,2) with color R' do
        image.color_pixel(x: 1, y: 2, color: 'R')
        expect(image.pixels[1][0]).to eq 'R'
      end

      it 'paint pixel on (1,2) with color G' do
        image.color_pixel(x: 1, y: 2, color: 'G')
        expect(image.pixels[1][0]).to eq 'G'
      end

      it 'paint pixel on (2,3) with color B' do
        image.color_pixel(x: 2, y: 3, color: 'B')
        expect(image.pixels[2][1]).to eq 'B'
      end
    end

    describe '#clear' do
      let(:width) { 2 }
      let(:height) { 2 }

      let(:clear_image) { [ %w(O O), %w(O O) ] }
      before do
        image.create(width: width, height: height)
        image.color_pixel(x: 1, y: 2, color: 'R')
      end

      it 'clears the image by setting white background' do
        image.clear
        expect(image.pixels).to eq clear_image
      end
    end
  end
end