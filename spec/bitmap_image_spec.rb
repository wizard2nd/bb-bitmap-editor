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
    end
  end
end