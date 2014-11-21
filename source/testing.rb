require_relative 'sudoku'

sudoku = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')

p sudoku.next_coord([0,0]) == [0,1]
p sudoku.next_coord([8,8]) == nil
p sudoku.next_coord([0,8]) == [1,0]

p sudoku.get_row_contents([0,6]) == "---26-7-1"
p sudoku.get_row_contents([5,0]) == "-5---3-28"

p sudoku.get_col_contents([5,0]) == "-618----7"
p sudoku.get_col_contents([5,6]) == "7-5-9----"
