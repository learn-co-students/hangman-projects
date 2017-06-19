require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class Display

  attr_accessor :guesses, :display_array
  attr_reader :word, :letter_array

  def initialize(word)
    @word = word
    @display_array = []
    @letter_array = @word.split("")
    @letter_array.length.times do
      @display_array << "_"
    end
    @guesses = []
  end

  def gallows
    gal_one = " __________"
    gal_two = " |         |"
    gal_three = "           |"
    gal_four = "           |"
    gal_five = "           |"
    gal_six = "           |"
    gal_seven = "____________"
    gal_three_head = " O         |"
    gal_four_one = " |         |"
    gal_four_two = "\\|         |"
    gal_four_all = "\\|/        |"
    gal_five_body = " |         |"
    gal_six_one = "  \\        |"
    gal_six_two = "/ \\        |"
    puts gal_one
    puts gal_two
    # Line 3
    ##self.guesses > 0 ? puts gal_three_head : puts gal_three
    if self.guesses.length > 0
      puts gal_three_head
    else
      puts gal_three
    end
    # Line 4
    if self.guesses.length < 2
      puts gal_four
    elsif self.guesses.length == 2
      puts gal_four_one
    elsif self.guesses.length == 3
      puts gal_four_two
    elsif self.guesses.length >= 4
      puts gal_four_all
    end
    # Line 5
    ##self.guesses >= 5 ? puts gal_five_body : puts gal_five
    if self.guesses.length >= 5
      puts gal_five_body
    elsif self.guesses.length < 5
      puts gal_five
    end
    # Line 6
    if self.guesses.length <= 5
      puts gal_six
    elsif self.guesses.length == 6
      puts gal_six_one
    elsif self.guesses.length == 7
      puts gal_six_two
    end
    # Line 7 (bottom)
    puts gal_seven
    puts self.display_array.join(" ")
  end

end
#
# Display.new("SPHYNX")
# Pry.start
