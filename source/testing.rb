require_relative 'sudoku'

sudoku = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')
solved = Sudoku.new('435269781682571493197834562826195347374682915951743628519326874248957136763418259')

p sudoku.next_row(3,8) == 4
p sudoku.next_col(3,8) == 0
p sudoku.next_row(1,2) == 1
p sudoku.next_col(1,2) == 3

p sudoku.get_row_contents(0) == "---26-7-1"
p sudoku.get_row_contents(5) == "-5---3-28"

p sudoku.get_col_contents(0) == "-618----7"
p sudoku.get_col_contents(6) == "7-5-9----"

p sudoku.get_box_contents(5,6) == "-4-9---28"
p sudoku.contents_valid?("-4-9---28")
p sudoku.contents_valid?("-4-94--28") == false
p sudoku.contents_valid?("84-9-8-28") == false

sudoku.change_coord("9", 1, 7)
p sudoku.get_row_contents(1) == "68--7--9-"

p sudoku.is_valid_number_at_coord?(1, 0,0) == false
p sudoku.is_valid_number_at_coord?(2, 0,0) == false
p sudoku.is_valid_number_at_coord?(6, 0,0) == false
p sudoku.is_valid_number_at_coord?(7, 0,0) == false
p sudoku.is_valid_number_at_coord?(8, 0,0) == false
p sudoku.is_valid_number_at_coord?(9, 0,0) == false
p sudoku.is_valid_number_at_coord?(3, 0,0)
p sudoku.is_valid_number_at_coord?(4, 0,0)
p sudoku.is_valid_number_at_coord?(5, 0,0)

p solved.is_solved?
p sudoku.is_solved? == false
# p solved.get_row_contents(8)
# p solved.contents_valid?(solved.get_row_contents(8))

# sudoku.solve
puts solved
