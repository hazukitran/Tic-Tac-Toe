board = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ",
          6 => " ", 7 => " ", 8 => " ", 9 => " "}

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

# --------------- METHODS --------------------
def render_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end 

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
end

def check_winner(board)
  WINNING_LINES.each do |pattern|
    return "Player" if board.values_at(*pattern).count("X") == 3
    return "Computer" if board.values_at(*pattern).count("O") == 3
  end
  nil
end

#----------- COMPUTER SMART MOVE --------------

def winning_moves(board, symbol)
  WINNING_LINES.each do |pattern|
    if board.values_at(*pattern).count(symbol) == 2 && board.values_at(*pattern).count(" ") == 1
      pattern.each do |position|
        if board[position] == " "
          return board[position] = "O"
        end
      end
    end 
  end
  false
end

def computer_move(board)
  unless winning_moves(board, "O") || winning_moves(board, "X")
  else
    position = available_positions(board).sample
    board[position] = "O"
  end
end

# -------------- START PROGRAM ---------------

render_board(board)

loop do

  player_move(board)
  computer_move(board) unless check_winner(board)
  render_board(board)
  break if check_winner(board) || board_full?(board)

end

winner = check_winner(board)

if winner
  puts "The winner is #{winner}."
else
  puts "It's a draw."
end





