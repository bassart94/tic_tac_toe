class Game 
  def start
    puts "\n"
    puts "What is your name Player One?"
    player_one_name = gets.chomp
    @player_one = Player.new(player_one_name, "X")
    puts "What is your name Player Two?"
    player_two_name = gets.chomp
    puts "\n"
    @player_two = Player.new(player_two_name, "O")
    @board = Board.new
    @board.display
  end
  
  def end_game
    case @board.winner
    when "X"
      puts "#{@player_one.name} won!"
    when "O"
      puts "#{@player_two.name} won!"
    else
      puts "It's a draw..."
    end
    puts "Play again?  (Y/N)"
    valid_yes_responses = ["y", "yes", "yup", "yeah"]
    valid_no_responses = ["n", "no", "nope", "nah"]
    response = gets.chomp.downcase
    until valid_yes_responses.any? { |option| option == response } || valid_no_responses.any? { |option| option == response }
      puts "Play again?  (Y/N)"
      response = gets.chomp.downcase
      puts "\n"
    end
    Game.new.play if valid_yes_responses.any? { |option| option == response }
  end

  def turn(player)
    puts "Where would you like to place your mark #{player.name}?"
    choice = gets.chomp
    cell = choice.to_i-1
    if choice.length != 1 || !choice[/[1-9]/]
      puts "Only choices between 1 and 9 are valid. Please choose Again. \n \n"
      self.turn(player)
    elsif @board.cells[cell] == "X"  || @board.cells[cell] == "O"
      puts "That cell is already occupied. Please choose again. \n \n"
      self.turn(player)
    else
      @board.cells[cell] = player.mark
      @board.display
    end
  end

  def play
    self.start
    until @board.full? || @board.winner
      self.turn(@player_one)
      break if @board.full? || @board.winner
      self.turn(@player_two)
    end
    self.end_game
  end
end