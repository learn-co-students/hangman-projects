require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'move.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class Guess



  def initialize(user_input)
    @user_input = user_input
  end

  def valid_move?
    if Dictionary.alphabet.include?(self.user_input) || self.user_input == "EXIT" || self.user_input.length == @word.length || self.user_input == @word
      true
    elsif self.incorrect_guesses.include?(user_input) || ≈
      puts "You already guessed that, and it's wrong!"
      ## TURN
    elsif self.display_array.include?(user_input)
      puts "That's already on the board..."
      ## TURN
    end
  end


end
