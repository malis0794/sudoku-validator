require_relative "../lib/validator"

describe Validator do
  describe '#validate_row' do
    context 'when it is valid' do
      it 'returns true' do
        row = [8, 5, 9, 6, 1, 2, 4, 3, 7]
        expect(Validator.validate_row(row)).to eq true
      end
    end

    context 'when it is valid but incomplete' do
      it 'returns true' do
        row = [0, 5, 9, 6, 1, 2, 4, 3, 7]
        expect(Validator.validate_row(row)).to eq true
      end
    end

    context 'when it contains duplicates' do
      it 'returns false' do
        row = [8, 8, 0, 0, 0, 2, 4, 0, 0]
        expect(Validator.validate_row(row)).to eq false
      end
    end
  end
  
end
