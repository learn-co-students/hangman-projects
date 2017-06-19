require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class Turn

  attr_accessor :user_input, :status, :correct
  attr_reader :word, :display, :game

  def initialize(word, display, game)
    @game = game
    @display = display
    @word = word
    puts "Please enter a letter:"
    user_input = gets.upcase.chomp
    @user_input = user_input
    if self.user_input == "EXIT"
      self.game.exit_game = true
    elsif !self.user_input == self.word && self.user_input.length == self.word.length
      display.guesses << self.user_input
    elsif !valid_move?
      # (self.user_input)
      turn = Turn.new(self.word, self.display, self.game)
    elsif display.guesses.include?(self.user_input)
      puts "You already guessed that, and it's wrong!"
      turn = Turn.new(self.word, self.display, self.game)
    elsif display.display_array.include?(self.user_input)
      puts "That's already on the board..."
      turn = Turn.new(self.word, self.display, self.game)
    elsif self.user_input == self.word
      display.display_array = display.letter_array
    else
      self.correct?(self.user_input)
    end
  end


  def correct?(user_input)
    display.letter_array.each_with_object(display.display_array) do |letter, blank|
      if display.letter_array.include?(user_input)
        display.letter_array.each_with_index do |let, idx|
          if let == self.user_input
            display.display_array[idx] = let
          # elsif !let == user_input
          #   @incorrect_guesses << user_input
          end
        end
      end
    end
    if !display.letter_array.include?(self.user_input)
      display.guesses << self.user_input
    end
  end
  ## CORRECT

end



  def valid_move?
    if Dictionary.alphabet.include?(self.user_input) || self.user_input == "EXIT" || self.user_input.length == self.word.length || self.user_input == self.word
      true
    elsif display.guesses.include?(user_input)
      puts "You already guessed that, and it's wrong!"
      ## TURN
    elsif display.display_array.include?(user_input)
      puts "That's already on the board..."
      ## TURN
    end
  end


  # def turn
  #   puts "Please enter a letter:"
  #   user_input = gets.upcase.chomp
  #   if !user_input == @word && user_input.length == @word.length
  #     puts "TEST"
  #     @incorrect_guesses << user_input
  #   elsif !valid_move?(user_input)
  #     turn
  #   elsif self.incorrect_guesses.include?(user_input)
  #     puts "You already guessed that, and it's wrong!"
  #     turn
  #   elsif self.display_array.include?(user_input)
  #     puts "That's already on the board..."
  #     turn
  #   elsif user_input == "EXIT"
  #     self.exit_game = true
  #   elsif user_input == @word
  #     @display_array = @letter_array
  #   else
  #     self.correct?(user_input)
  #   end
  # end
