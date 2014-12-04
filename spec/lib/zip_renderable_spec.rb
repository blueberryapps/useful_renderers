require './spec/spec_helper'

describe UsefulRenderers::ZipRenderable do
  let(:zip_renderable_array) { array.extend UsefulRenderers::ZipRenderable }

  context 'object is an array' do
    context 'array is empty' do
      let(:array) { Array.new }

      it 'returns an empty string' do
        expect(zip_renderable_array.to_zip).to eql('')
      end
    end

    context 'array contains object without filename method' do
      let(:file)  { double(read: '') }
      let(:array) { [file] }

      it 'returns an empty string' do
        expect(zip_renderable_array.to_zip).to eql('')
      end
    end

    context 'array contains object without read method' do
      let(:file)  { double(filename: '') }
      let(:array) { [file] }

      it 'returns an empty string' do
        expect(zip_renderable_array.to_zip).to eql('')
      end
    end
  end

  context 'object is an File object' do
    let(:filename) { File.join(File.dirname(__FILE__),'..', 'fixtures','test.txt') }
    let(:file)  { File.open(filename, 'r:utf-8') }
    let(:array) { [file] }

    it 'returns zip with file' do
      expect(zip_renderable_array.to_zip).to include('test.txt')
    end

    it 'does not return zip with other file' do
      expect(zip_renderable_array.to_zip).not_to include('other.txt')
    end
  end
end
