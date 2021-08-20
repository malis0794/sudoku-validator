class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    if is_complete?
      "This sudoku is valid."
    else
      "This sudoku is valid, but incomplete."
    end
  end

  def is_complete?
    unless @puzzle_string.include? "0"
      true
    else
      false
    end
  end

  def self.validate_row(row)
    if row.uniq.length == row.length
      true
    else
      false
    end
  end

end
