require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'
require 'colorize'

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
    gal_one = " __________".colorize(:green)
    gal_two = " |".colorize(:red) + "         |".colorize(:green)
    gal_three = "           |".colorize(:green)
    gal_four = "           |".colorize(:green)
    gal_five = "           |".colorize(:green)
    gal_six = "           |".colorize(:green)
    gal_seven = "____________".colorize(:green)
    gal_three_head = " O" + "         |".colorize(:green)
    gal_three_head_final = " X" + "         |".colorize(:green)
    gal_four_one = " |" + "         |".colorize(:green)
    gal_four_two = "\\|" + "         |".colorize(:green)
    gal_four_all = "\\|/" + "        |".colorize(:green)
    gal_four_final = "/\|\\" + "        |".colorize(:green)
    gal_five_body = " |" + "         |".colorize(:green)
    gal_six_one = "  \\"+ "        |".colorize(:green)
    gal_six_two = "/ \\"+ "        |".colorize(:green)
    gal_six_final = "| \|"+ "        |".colorize(:green)

    case self.guesses.length
    when 0
      puts gal_one
      puts gal_two
      puts gal_three
      puts gal_four
      puts gal_five
      puts gal_six
    when 1
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four
      puts gal_five
      puts gal_six
    when 2
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four_one
      puts gal_five
      puts gal_six
    when 3
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four_two
      puts gal_five
      puts gal_six
    when 4
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four_all
      puts gal_five
      puts gal_six
    when 5
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four_all
      puts gal_five_body
      puts gal_six
    when 6
      puts gal_one
      puts gal_two
      puts gal_three_head
      puts gal_four_all
      puts gal_five_body
      puts gal_six_one
    when 7
      puts gal_one
      puts gal_two
      puts gal_three_head_final
      puts gal_four_final
      puts gal_five_body
      puts gal_six_final
    end
    puts gal_seven
    puts self.display_array.join(" ")
  end

end
#
# Display.new("SPHYNX")
# Pry.start
