
class Sudoku

  # coord = [row,col]
  EMPTY = '-'

  def initialize(board_string)
    @board = board_string
  end


  def solve(coord_being_checked = [0,0])
    # check first square (0,0)

    # if get
    if get_coord_content(coord_being_checked) == EMPTY

    else
      solve(next_coord(coord_being_checked))
    end
  end

  def next_coord(coord)

    coord[1] += 1

    if coord[1] > 8
      coord[0] += 1
      coord[1] = 0
    end

    coord[0] > 8 ? nil : coord
  end

  def board




  end

  # returns true if nine items are valid
  # checks that there is one of each number
  def contents_valid?(coord)

  end

  def get_coord_content(coord)

  end

  # returns an array of nine items of the row contents
  def get_row_contents(coord)
    @board.slice(coord[0]*9,9)
  end

  # returns an array of nine items of the col contents
  def get_col_contents(coord)
    column_string = ""

    (0..8).each do|row|
      column_string << @board.slice(row * 9 + coord[1],1)
    end

    column_string
  end

  # returns an array of nine items the box contents
  def get_box_contents(coord)

  end
  # Returns a nicely formatted string representing the current state of the board
  def to_s

  end
end


