
class Sudoku

  # coord = [row,col]
  EMPTY = '-'

  def initialize(board_string)
    @board = board_string
  end


  def solve(row_being_checked=0,col_being_checked=0)

    # p coord_being_checked
    # return if is_solved?

    # clear_screen!
    # puts self
    # sleep(0.01)
    # puts "Working on: (#{row_being_checked},#{col_being_checked})"

    if get_coord_content(row_being_checked, col_being_checked) == EMPTY
      # puts "EMPTY! at (#{row_being_checked},#{col_being_checked})"

      (1..9).each do |insert_candidate|
        # puts "Does #{insert_candidate} work at (#{row_being_checked},#{col_being_checked})?"

        if is_valid_number_at_coord?(insert_candidate, row_being_checked, col_being_checked)

          change_coord(insert_candidate, row_being_checked, col_being_checked)
          # puts "#{insert_candidate} WORKS! at: (#{row_being_checked},#{col_being_checked}) and moving on"
          solve(next_row(row_being_checked,col_being_checked),next_col(row_being_checked,col_being_checked))
          return if is_solved?
        end

      end
      #
      # puts "No numbers valid at (#{row_being_checked},#{col_being_checked})"
      change_coord(EMPTY, row_being_checked, col_being_checked)
      # solve
    else
      # puts "SKIP!"
      return if is_solved?
      solve(next_row(row_being_checked,col_being_checked),next_col(row_being_checked,col_being_checked))
    end
  end

  def is_solved?

    (0..8).map do |time|
      contents_valid?(get_row_contents(time)) &&
      contents_valid?(get_col_contents(time)) &&
      contents_valid?(get_box_contents(time/3, time%3)) &&
      !get_row_contents(time).include?(EMPTY)
    end.all?

  end

  def is_valid_number_at_coord?(number, row, col)

    return  contents_valid?(get_row_contents(row) + number.to_s) &&
            contents_valid?(get_col_contents(col) + number.to_s) &&
            contents_valid?(get_box_contents(row,col) + number.to_s)
  end

  def change_coord(new_number, row, col)

    @board.slice!(9*row + col, 1)
    @board.insert(9*row + col, new_number.to_s)

  end

  def next_row(row,col)
    row += 1 if col == 8
    row %= 9
  end

  def next_col(row,col)
    col += 1
    col %= 9
  end

  def board
  end

  # returns true if nine items are valid
  # checks that there is one of each number
  def contents_valid?(contents)

    count = Hash.new(0)

    contents.split("").each do |i|
      count[i] +=1
    end

    count.delete(EMPTY)

    !count.each_value.any? {|value| value > 1}
  end

  def get_coord_content(row,col)
    @board.slice(9*row + col, 1)
  end

  # returns an array of nine items of the row contents
  def get_row_contents(row)
    @board.slice(row*9,9)
  end

  # returns an array of nine items of the col contents
  def get_col_contents(col)
    column_string = ""

    (0..8).each do |row|
      column_string << @board.slice(row * 9 + col,1)
    end

    column_string
  end

  # returns an array of nine items the box contents
  def get_box_contents(row,col)

    box_string = ""

    box_coord = [row / 3, col / 3]
    first_square_coord = [box_coord[0] * 3, box_coord[1] * 3]

    box_string += get_row_contents(first_square_coord[0]).slice(box_coord[1]*3,3)
    box_string += get_row_contents(first_square_coord[0] + 1).slice(box_coord[1]*3,3)
    box_string += get_row_contents(first_square_coord[0] + 2).slice(box_coord[1]*3,3)

    box_string
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    # @board.each_char.with_index do |char|
    #   p "#{char} "
    #   p "\n" if
    string = ""
    (0..8).each do |row|
      @board.slice(row*9,9).each_char {|char| string << "#{char} "}
      string << "\n"
    end

    return string

  end

  def clear_screen!
    print "\e[2J"
  end

end


