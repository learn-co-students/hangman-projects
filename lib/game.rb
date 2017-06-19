require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class Game

  @@all = []

  attr_accessor :display_array, :exit_game, :status, :user, :outcome
  attr_reader :user_input, :incorrect_guesses, :word, :letter_array, :display

  def initialize
    @word = Dictionary.words.sample
    @display = Display.new(@word)
    # @incorrect_guesses = []
    @status = "playing game"
    @exit_game = false
    @users = nil
  end

  # def guesses
  #   guesses = display.guesses.length
  # end

  def won?
    display.display_array == display.letter_array ? true : false
  end

  def hanged?
    display.guesses.length >= 7 ? true : false
  end

  # play provides flow for the whole game
  # until game.hanged? == true; break if game.won? == true
  def play
    puts "Can you save yourself from the gallows pole?"
    puts "Please enter your user name, or type 'GAMES' to access your history:"
    user_name = gets.upcase.chomp
    if user_name == "GAMES"
      User.all.each do |user|
        user.games.each do |game|
          puts "#{user.name} -- #{game.status}"
        end
      end
    else
    User.find_by_name(user_name) ? user = User.find_by_name(user_name) : user = User.new(user_name)
    user.games << self
    self.user = user
    end
    until self.hanged? == true || self.won? == true || self.exit_game == true
      display.gallows
      turn = Turn.new(self.word, display, self)
    end
    if self.hanged? == true
      display.gallows
      puts "You've been HANGED!"
      puts "The word was #{self.word}. How did you not guess that?"
      self.end_game("lost")
    elsif self.won? == true
      display.gallows
      puts "You slipped the noose just in the nick of time!"
      self.end_game("won")
    elsif self.exit_game == true
      puts "Don't be a quitter. Try again!"
      self.end_game("exited")
    end
  end

  def end_game(status)
    self.status = status
    self.save
    if status == "lost" || status == "won"
      self.play_again?
    end
  end

  def save
    @@all << self
  end

  def play_again?
    puts "Would you like to play again? (Y / N):"
    user_input = gets.chomp().upcase
    if user_input == "Y"
      new_game = Game.new
      new_game.play
    else
      puts "Game over."
    end
  end

end
