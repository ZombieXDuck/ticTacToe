class TicTacToe
  def initialize
    @board = ["1","2","3","4","5","6","7","8","9"]
    @gameover = FALSE
    @turn = 0
    @symbol = "O"
  end

  def move(symbol)
    puts "#{symbol}'s move, Enter your position: "
    input = gets.chomp()
    if input.to_i.between?(1,9) && @board[input.to_i-1] != "X" || "O"
      @board[input.to_i-1] = symbol
    else
      puts "Incorrect input, try again"
      move(symbol)
    end
  end

  def render
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def win?
    return TRUE if [@board[0], @board[1], @board[2]].uniq.length == 1
    return TRUE if [@board[3], @board[4], @board[5]].uniq.length == 1
    return TRUE if [@board[6], @board[7], @board[8]].uniq.length == 1
    return TRUE if [@board[0], @board[3], @board[6]].uniq.length == 1
    return TRUE if [@board[1], @board[4], @board[7]].uniq.length == 1
    return TRUE if [@board[2], @board[5], @board[8]].uniq.length == 1
    return TRUE if [@board[0], @board[4], @board[8]].uniq.length == 1
    return TRUE if [@board[2], @board[4], @board[6]].uniq.length == 1
  end

  def draw?
    return TRUE if @board.uniq.length == 2
  end

  def play
    render
    until @gameover == TRUE
      @turn += 1
      if @turn%2 == 0
        @symbol = "X"
      else
        @symbol = "O"
      end
      move(@symbol)
      render
      if win? == TRUE
        puts "The game is won by #{@symbol}"
        @gameover = TRUE
      end
      if draw? == TRUE && @gameover == FALSE
        puts "The game has ended in a draw!"
        @gameover = TRUE
      end
    end
  end


end

newGame = TicTacToe.new
newGame.play()
