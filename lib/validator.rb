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
    rows_valid? && columns_valid? 
  end

  def rows()
    rows = @puzzle_string.tr('+|-', '').split("\n")
    rows.reject! {|string| string.empty?}
    rows.map! {|row| row.split(" ")}
    rows.map! {|row| row.map {|sub| sub.to_i}}
  end

  def columns()
    rows.transpose
  end

  private 

  def rows_valid?
    rows.none? {|row| contains_duplicates?(row) }
  end

  def columns_valid?
    columns.none? {|column| contains_duplicates?(column) } 
  end

  def contains_duplicates?(row)
    row_without_incomplete_squares = row.reject { |item| item == 0 }
    row_without_incomplete_squares.uniq.length != row_without_incomplete_squares.length
  end
end
