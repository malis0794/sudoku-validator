class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    if is_valid?
      if is_complete?
        "This sudoku is valid."
      else
        "This sudoku is valid, but incomplete."
      end
    else
      "This sudoku is invalid."
    end
  end

  def is_complete?
    unless @puzzle_string.include? "0"
      true
    else
      false
    end
  end

  def is_valid?
    # all rows valid AND all columns valid AND all subgroups valid
    true
    # TODO: Work out how to split puzzle_string into rows and check for a row duplicate
    # @puzzle_string -> rows -> each row -> validate_row(row)
    # rows = ??
    #rows.each do |row|
    #  validate_row(row)
    # end
  end

  def self.validate_row(row)
    if row.uniq.length == row.length
      true
    else
      false
    end
  end

end
