require 'pry-byebug'

class Game

user_input = "T"

## WORDS should probably go in a separate dictionary.rb files
  WORDS = [
    "SURPRISE",
    "BLANK",
    "GEMSTONE",
    "BASS",
    "CHICKEN",
    "COMPUTER",
    "RUBY",
    "PYTHON",
    "SPHYNX"
  ]

  # display_array defined for testing purposes
  display_array = ["_", "_", "_", "_", "_" ]

  attr_reader :user_input

  #Should this take user_input on initialize?
  def initialize
    # @user_input = user_input
    @word = WORDS.sample
    @display_array = []
    @letter_array = @word.split("")
    @letter_array.length.times do
      @display_array << "_"
    end
  end

  # def user_input=
  #   @user_input = gets.chomp
  # end

  ## Shovel user_input into one of two arrays:
  #### [] << INCORRET user_input
  #### [] << CORRECT user_input (or is this necessary?)

  ## Use incorrect user_input array.size to determine number of lives used/body parts (CALLING THIS "@incorrect_guesses" and the derived guesses" in display_board.rb) placed on the gallows

  ## Use above array.length to determine number of

  def correct?(user_input)
    @letter_array.each_with_object(@display_array) do |letter, blank|
      if @letter_array.include?(@user_input)
        @letter_array.each_with_index do |let, idx|
          if let == @user_input
            @display_array[idx] = @user_input
          end
        end
      end
    end
  end

end

Game.new
Pry.start
