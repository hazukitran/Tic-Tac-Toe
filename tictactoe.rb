require 'pry'

board = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ",
          6 => " ", 7 => " ", 8 => " ", 9 => " "}

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

# --------------- METHODS --------------------
#draw_board
def render_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end 

#return an array of keys for all empty spaces.
def available_positions(board)
  board.select { |k, v| v == " "}.keys
end

def board_full?(board)
  available_positions(board) == []
end

def player_move(board)
  begin
    puts "Pick a position: #{available_positions(board)}"
    position = gets.chomp.to_i
  end until available_positions(board).include?(position)
  board[position] = "X"
 #X doesn't show on board
end

def check_winner(board)
  WINNING_LINES.each do |pattern|
    return "Player" if board.values_at(*pattern).count("X") == 3
    return "Computer" if board.values_at(*pattern).count("O") == 3
  end
end

#----------- COMPUTER SMART MOVE --------------

def winning_moves(board, symbol)
  WINNING_LINES.each do |pattern|
    if board.values_at(*pattern).count(symbol) == 2 && board.values_at(*pattern).count(" ") == 1
      pattern.each do |position|
        if board[position] == " "
          return board[position] == "0"
        end
      end
    end
  false 
end

def computer_move(board)
  if winning_moves(board, "O") || winning_moves(board, "X")
  else
    position = available_positions(board).sample
    board[position] = "O"
  end
end

# -------------- START PROGRAM ---------------

draw_board(board)

begin
  player_move(board)
  draw_board(board)
  computer_move(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || board_full?(board)
  
if winner
  puts "The winner is #{winner}."
else
  puts "It's a draw."
end





