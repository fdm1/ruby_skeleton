require 'spec_helper'

describe RomanTranslator do
  describe 'int_to_roman' do
    subject { described_class.int_to_roman(number) }

    let(:number) { 1234 }
    let(:expected_value) { 'MCCXXXIV' }

    it 'works' do
      expect(subject).to eq(expected_value)
    end
  end

  describe 'convert_num_place' do
    subject { described_class.convert_num_place(number, place) }

    describe 'less than 4' do
      let(:number) { 3 }
      let(:place) { described_class::ONE }
      let(:expected_answer) { 'III' }

      it 'converts correctly' do
        expect(subject).to eq(expected_answer)
      end
    end

    describe '4' do
      let(:number) { 4 }
      let(:place) { described_class::ONE }
      let(:expected_answer) { 'IV' }

      it 'converts correctly' do
        expect(subject).to eq(expected_answer)
      end
    end

    describe '5' do
      let(:number) { 5 }
      let(:place) { described_class::ONE }
      let(:expected_answer) { described_class::FIVE }

      it 'converts correctly' do
        expect(subject).to eq(expected_answer)
      end
    end

    describe '8' do
      let(:number) { 8 }
      let(:place) { described_class::ONE }
      let(:expected_answer) { 'VIII' }

      it 'converts correctly' do
        expect(subject).to eq(expected_answer)
      end
    end

    describe '9' do
      let(:number) { 9 }
      let(:place) { described_class::ONE }
      let(:expected_answer) { 'IX' }

      it 'converts correctly' do
        expect(subject).to eq(expected_answer)
      end
    end
  end
end
