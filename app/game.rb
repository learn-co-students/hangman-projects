class Game
  attr_accessor :player1, :player2

  def welcome
    puts "Welcome to Hangman!!"
    puts "Please enter Player 1 name."
    @player1 = get_player_from_name

    puts "Please enter Player 2 name."
    @player2 = get_player_from_name
  end

  def get_player_from_name
    player = "&#%$&"
    until Hangman.all_letters(player) == true do
      player = gets.chomp
    end
    Player.new_or_find_by_name(player)
  end

  def full_game(hangman)
    hangman.playgame
    hangman.switch_players
    hangman.playgame
    hangman.end_game
  end

  def end_game
    input = nil
    until input == "y" || input == "n" do
      puts "Would you like to play another round? (y/n)"
      input = gets.chomp.downcase
      if input == "y"
        self.full_game
      end
    end
  end
end
