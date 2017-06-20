require 'pry'
require_relative './hangman.rb'
require_relative './phrase.rb'
require_relative './gallows.rb'
require_relative './user.rb'
require_relative './display.rb'

class GameRunner
  attr_reader :user, :game, :display

  def initialize
    @exit = false
  end

  def welcome_user
    Display.welcome_message
    Display.name_prompt
    @user = User.new(gets.chomp)
  end

  def start_new_game
    # TODO break this out
    @game = Hangman.new
    @game.session = self
    # TODO make game stuff in display pull from session var?
    @display = Display.new(@game)
    self.game.play_game
  end

  def play_game
    @game.play_game
  end

  def run_selected_option(user_input)
    case user_input.downcase
    when "p"
      start_new_game
    when "s"
      self.display.score
    when "q"
      puts "Goodbye!"
      @exit = true
    else
      puts "Invalid input!"
    end
  end

  def show_user_options
    until @exit == true
      self.display.user_options
      run_selected_option(gets.chomp)
    end
  end

  def run_game
    welcome_user
    start_new_game
    show_user_options
  end

end

# code that possibly gets moved to run?

session = GameRunner.new
session.run_game

# new_game = Hangman.new
# display = Display.new(new_game)
# display.display_word_and_gallows
#
#
# binding.pry

# def self.display_main_menu
#   Display.welcome_menu
# end
#
# def self.get_main_menu_input
#   gets.chomp
# end
#
# def self.main_menu_logic
#   display_main_menu
#   input = get_main_menu_input
#
#   case input.downcase
#   when "s"
#   Hangman.new
#   when
# end
