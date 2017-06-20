require 'pry'
require_relative './phrase.rb'
require_relative './gallows.rb'
require_relative './user.rb'

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

  def prompt_for_difficulty
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

  # def self.welcome_menu
  #   puts "Welcome to Hangman!!
  #
  #         ~~~~~~~~~~~~~~~~
  #         ||  MAIN MENU ||
  #         ~~~~~~~~~~~~~~~~
  #
  #         What would you like to do?
  #         S - Start Game
  #         C - Check Score
  #         Q - Quit
  #   "
  #   # option: start game, check score, print instructions, or quit
  #   # will also call back to proper method in hangman class
  # end
  #
  # def self.main_menu_input
  #   user_input = gets.chomp
  # end


end
