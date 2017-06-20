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

<<<<<<< HEAD
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
=======
def valid_move?
  if Dictionary.alphabet.include?(self.user_input) || self.user_input == "EXIT" || self.user_input.length == self.word.length || self.user_input == self.word
    true
  elsif display.guesses.include?(user_input)
    puts "You already guessed that, and it's wrong!"
  elsif display.display_array.include?(user_input)
    puts "That's already on the board..."
  end
end
>>>>>>> alex
