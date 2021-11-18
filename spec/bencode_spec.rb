require 'spec_helper'

describe Bencode do
  describe 'parse' do
    it 'parses an integer' do
      expect(described_class.parse('i10e')).to eq(10)
    end

    it 'parses an array' do
      expect(described_class.parse('le')).to eq([])
    end

    it 'parses an array with stuff in it' do
      expect(described_class.parse('li10ee')).to eq([10])
    end

    it 'parses an array with more stuff in it' do
      expect(described_class.parse('li10ei15ee')).to eq([10, 15])
    end

    it 'parses an array with more stuff in it' do
      expect(described_class.parse('lleli8eee')).to eq([[], 8])
    end
  end

  describe 'get_end_index' do
    it 'works' do
      expect(described_class.get_end_index(1, [0, 2, 3], [4, 5, 6])).to eq(5)
    end
  end
end
