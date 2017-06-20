class Display

  def initialize(hangman_instance)
    @game = hangman_instance
  end

  def self.welcome_message
    puts "Welcome to Hangman!!"
    puts ""
  end

  def self.name_prompt
    puts "Please enter your name."
  end

  def user
    @game.session.user
  end

  def score
    puts "You have #{self.user.win} wins & #{self.user.loss} losses"
    puts ""
  end

  def self.prompt_for_difficulty
    puts "Pick Your Game Difficulty:
          E - Easy
          M - Medium
          H - Hard"
  end

  def game_instructions
    puts "Guess away! You can guess a single letter or the whole word."
    puts "Be careful, though, if you guess the word wrong, you lose!"
    puts ""
  end

  def word_and_gallows
    Gallows.display_gallows(@game.counter)
    puts @game.phrase.get_display_phrase
    puts @game.phrase.guessed_letters.join(", ")
  end

  def prompt_for_guess
    puts "Enter your guess."
    puts ""
  end

  def invalid_input_message
    puts "Invalid input!"
    puts ""
  end

  def already_guessed_message(value)
    puts "You've already guessed #{value}. Guess again."
    puts ""
  end

  def second_chance_prompt(value)
    puts "Did you mean #{value}? (Enter Y or N.)"
  end

  def wrong_guess_message
    puts "You Guessed Wrong"
    puts ""
  end

  def win_message
    puts "Congrats, you won!!!"
    puts ""
  end

  def lose_message
    puts "Another one bites the dust!"
    puts ""
    puts "The word was: #{@game.phrase.original_phrase} ;,,,("
    puts ""
  end

    def end_of_game_message
    self.game_won? ? win_message : lose_message
  end

  def user_options
    puts "Please select an option:
      P - Play Again
      S - See Your Score
      Q - Quit"
      puts ""
  end

end
