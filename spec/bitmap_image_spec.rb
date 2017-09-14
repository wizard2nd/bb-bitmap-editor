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
    end
  end
end