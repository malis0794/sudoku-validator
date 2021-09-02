require "pry"

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
    rows_valid?
  end

  def rows()
    rows = @puzzle_string.tr('+|-', '').split("\n")
    rows.reject! {|string| string.empty?}
    rows.map! {|row| row.split(" ")}
    rows.map! {|row| row.map {|sub| sub.to_i}}
  end

  private 

  def rows_valid?
    rows.none? {|row| contains_duplicates?(row) }
  end

  def contains_duplicates?(row)
    row.uniq.length != row.length
  end
end
