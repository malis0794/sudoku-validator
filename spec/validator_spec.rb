require_relative "../lib/validator"

describe Validator do
  
  describe '#is_complete?' do
    context 'when it is complete' do
      it 'returns true' do
        file = File.read("spec/fixtures/valid_complete.sudoku")
        validator = Validator.new(file)
        expect(validator.is_complete?).to eq true
      end
    end

    context 'when it is incomplete' do
      it 'returns false' do
        file = File.read("spec/fixtures/valid_incomplete.sudoku")
        validator = Validator.new(file)
        expect(validator.is_complete?).to eq false
      end
    end
  end

  describe '#is_valid?' do
    context 'when it is valid' do
      it 'returns true' do
        file = File.read("spec/fixtures/valid_complete.sudoku")
        validator = Validator.new(file)
        expect(validator.is_valid?).to eq true
      end
    end

    context 'when it is valid incomplete' do
      it 'returns true' do
        file = File.read("spec/fixtures/valid_incomplete.sudoku")
        validator = Validator.new(file)
        expect(validator.is_valid?).to eq true
      end
    end

    context 'when it contains a row duplicate' do
      it 'returns false' do
        file = File.read("spec/fixtures/invalid_due_to_row_dupe.sudoku")
        validator = Validator.new(file)
        expect(validator.is_valid?).to eq false
      end
    end
  end

  describe '#rows' do
    it 'returns array of rows' do
      file = File.read("spec/fixtures/valid_complete.sudoku")
      validator = Validator.new(file)
      expected_array = [
        [8, 5, 9, 6, 1, 2, 4, 3, 7],
        [7, 2, 3, 8, 5, 4, 1, 6, 9],
        [1, 6, 4, 3, 7, 9, 5, 2, 8],
        [9, 8, 6, 1, 4, 7, 3, 5, 2],
        [3, 7, 5, 2, 6, 8, 9, 1, 4],
        [2, 4, 1, 5, 9, 3, 7, 8, 6],
        [4, 3, 2, 9, 8, 1, 6, 7, 5],
        [6, 1, 7, 4, 2, 5, 8, 9, 3],
        [5, 9, 8, 7, 3, 6, 2, 4, 1]
      ]
      expect(validator.rows).to match_array(expected_array) # match our example array
    end
  end

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
