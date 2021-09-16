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
    rows_valid? && columns_valid? && subgroups_valid?
  end

  def rows
    rows = @puzzle_string.tr('+|-', '').split("\n")
    rows.reject! {|string| string.empty?}
    rows.map! {|row| row.split(" ")}
    rows.map! {|row| row.map {|sub| sub.to_i}}
  end

  def columns
    rows.transpose
  end

  def subgroups
    [
      [rows[0][0], rows[0][1], rows[0][2], rows[1][0], rows[1][1], rows[1][2], rows[2][0], rows[2][1], rows[2][2]],
      [rows[0][3], rows[0][4], rows[0][5], rows[1][3], rows[1][4], rows[1][5], rows[2][3], rows[2][4], rows[2][5]],
      [rows[0][6], rows[0][7], rows[0][8], rows[1][6], rows[1][7], rows[1][8], rows[2][6], rows[2][7], rows[2][8]],
      [rows[3][0], rows[3][1], rows[3][2], rows[4][0], rows[4][1], rows[4][2], rows[5][0], rows[5][1], rows[5][2]],
      [rows[3][3], rows[3][4], rows[3][5], rows[4][3], rows[4][4], rows[4][5], rows[5][3], rows[5][4], rows[5][5]],
      [rows[3][6], rows[3][7], rows[3][8], rows[4][6], rows[4][7], rows[4][8], rows[5][6], rows[5][7], rows[5][8]],
      [rows[6][0], rows[6][1], rows[6][2], rows[7][0], rows[7][1], rows[7][2], rows[8][0], rows[8][1], rows[8][2]],
      [rows[6][3], rows[6][4], rows[6][5], rows[7][3], rows[7][4], rows[7][5], rows[8][3], rows[8][4], rows[8][5]],
      [rows[6][6], rows[6][7], rows[6][8], rows[7][6], rows[7][7], rows[7][8], rows[8][6], rows[8][7], rows[8][8]]
    ]
  end

  private 

  def rows_valid?
    rows.none? {|row| contains_duplicates?(row) }
  end

  def columns_valid?
    columns.none? {|column| contains_duplicates?(column) } 
  end

  def subgroups_valid?
    subgroups.none? {|subgroup| contains_duplicates?(subgroup) } 
  end

  def contains_duplicates?(row)
    row_without_incomplete_squares = row.reject { |item| item == 0 }
    row_without_incomplete_squares.uniq.length != row_without_incomplete_squares.length
  end
end
