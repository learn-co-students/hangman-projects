class Game
  attr_accessor :player1, :player2

  def single_or_multi
    puts "Welcome to hangman!"
    puts "Would you like to play single-player or multi-player?"
    input = nil
    until input == "s" || input == "m"
      puts "Type 's' for single-player and multi or 'm' for multi-player"
      input = gets.chomp
      if input == "s"
        self.play_single
      elsif input == "m"
        self.play_multi
      end
    end
    self.end_game
  end

  def play_multi
    self.welcome_multi

    hangman = Hangman.new(self.player1, self.player2)

    self.full_game_multi(hangman)
  end

  def play_single
    self.welcome_single
    single_player_hangman = SP_Hangman.new(self.player1)
    single_player_hangman.playgame
  end

  def welcome_single
    puts "Welcome to Hangman single-player"
    puts "Please enter your name."
    @player1 = get_player_from_name
  end

  def welcome_multi
    puts "Welcome to Hangman Multiplayer!!!"
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

  def full_game_multi(hangman)
    hangman.playgame
    hangman.switch_players
    hangman.playgame
  end

  def end_game
    input = nil
    until input == "y" || input == "n" do
      puts "Would you like to play another game? (y/n)"
      input = gets.chomp.downcase
      if input == "y"
        self.single_or_multi
      end
      if input == "n"
        abort
      end
    end
  end
end
