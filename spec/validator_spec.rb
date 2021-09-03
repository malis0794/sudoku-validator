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

    context 'when it contains a column duplicate' do
      it 'returns false' do
        file = File.read("spec/fixtures/invalid_due_to_column_dupe.sudoku")
        validator = Validator.new(file)
        expect(validator.is_valid?).to eq false
      end
    end

    context 'when it contains a subgroup duplicate' do
      it 'returns false' do
        file = File.read("spec/fixtures/invalid_due_to_subgroup_dupe.sudoku")
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

  describe '#columns' do
    it 'returns array of columns' do
      file = File.read("spec/fixtures/valid_complete.sudoku")
      validator = Validator.new(file)
      expected_array = [
        [8, 7, 1, 9, 3, 2, 4, 6, 5],
        [5, 2, 6, 8, 7, 4, 3, 1, 9],
        [9, 3, 4, 6, 5, 1, 2, 7, 8],
        [6, 8, 3, 1, 2, 5, 9, 4, 7],
        [1, 5, 7, 4, 6, 9, 8, 2, 3],
        [2, 4, 9, 7, 8, 3, 1, 5, 6],
        [4, 1, 5, 3, 9, 7, 6, 8, 2],
        [3, 6, 2, 5, 1, 8, 7, 9, 4],
        [7, 9, 8, 2, 4, 6, 5, 3, 1]
      ]
      expect(validator.columns).to match_array(expected_array)
    end
  end

  describe '#subgroups' do
    it 'returns array of subgroups' do
      file = File.read("spec/fixtures/valid_incomplete.sudoku")
      validator = Validator.new(file)
      expected_array = [
        [8, 5, 0, 7, 2, 0, 0, 0, 4],
        [0, 0, 2, 0, 0, 0, 0, 0, 0],
        [4, 0, 0, 0, 0, 9, 0, 0, 0],
        [0, 0, 0, 3, 0, 5, 0, 4, 0],
        [1, 0, 7, 0, 0, 0, 0, 0, 0],
        [0, 0, 2, 9, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 1, 7, 0, 0, 0],
        [0, 8, 0, 0, 0, 0, 0, 3, 6],
        [0, 7, 0, 0, 0, 0, 0, 4, 0]
      ]
      expect(validator.subgroups).to eq(expected_array)
    end
  end
  
end
