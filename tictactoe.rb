=begin
1. Draw a board
2. Numbered each position on the board
3. Player pick position
4. Check winner
5. Check empty space
6. Computer pick position
7. Check winner
8. Loop until winner || no empty space left 
9. Computer thinks strategically about move.  
=end
require 'pry'

board = {   1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ",
      6 => " ", 7 => " ", 8 => " ", 9 => " "}
# --------------- METHODS --------------------
#draw_board
def draw_board(board)
  system 'clear'
puts " #{board[1]} | #{board[2]} | #{board[3]} "
puts "-----------"
puts " #{board[4]} | #{board[5]} | #{board[6]} "
puts "-----------"
puts " #{board[7]} | #{board[8]} | #{board[9]} "
end 

def available_positions(board)
  loop do
    board.select { |k, v| v == " "}.keys
    puts "Pick a position #{available_positions(board)} to place your move."
    position = gets.chomp.to_i
    available_positions(board).delete!(position)
  break if available_positions.empty?
end


def player_move(board)
  begin
   puts "Pick a position #{available_positions(board)} to place your move."
   position = gets.chomp.to_i
  end until available_positions(board).include?(position)
  board[position] = "X"
 #X doesn't show on board
end

available_positions(board)


# -------------- START PROGRAM ---------------

#WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

draw_board(board)
player_move(board)



