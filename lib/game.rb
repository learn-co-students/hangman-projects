require 'pry-byebug'

class Game

## WORDS should probably go in a separate dictionary.rb files

  def words
    words = [
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
  end

  def alphabet
    alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end

  # display_array defined for testing purposes
  # display_array = ["_", "_", "_", "_", "_" ]

  attr_accessor :display_array
  attr_reader :user_input, :incorrect_guesses, :word

  #Should this take user_input on initialize?
  def initialize
    # @user_input = user_input
    @word = words.sample
    @display_array = []
    @letter_array = @word.split("")
    @letter_array.length.times do
      @display_array << "_"
    end
    @incorrect_guesses = []
  end

  ## Shovel user_input into one of two arrays:
  #### [] << INCORRET user_input
  #### [] << CORRECT user_input (or is this necessary?)

  ## Use incorrect user_input array.size to determine number of lives used/body parts (CALLING THIS "@incorrect_guesses" and the derived guesses" in display_board.rb) placed on the gallows

  ## Use above array.length to determine number of

  # correct?
  def correct?(user_input)
    @letter_array.each_with_object(@display_array) do |letter, blank|
      if @letter_array.include?(user_input)
        @letter_array.each_with_index do |let, idx|
          if let == user_input
            @display_array[idx] = let
          # elsif !let == user_input
          #   @incorrect_guesses << user_input
          end
        end
      end
    end
    if !@letter_array.include?(user_input)
      @incorrect_guesses << user_input
    end
  end

  def guesses
    guesses = @incorrect_guesses.length
  end

  # The #gallows method works using "guesses" as
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
    gal_six_two = " /\\        |"
    # Start new logic
    puts gal_one
    puts gal_two
    # Line 3
    ##self.guesses > 0 ? puts gal_three_head : puts gal_three
    if self.guesses > 0
      puts gal_three_head
    else
      puts gal_three
    end
    # Line 4
    if self.guesses < 2
      puts gal_four
    elsif self.guesses == 2
      puts gal_four_one
    elsif self.guesses == 3
      puts gal_four_two
    elsif self.guesses >= 4
      puts gal_four_all
    end
    # Line 5
    ##self.guesses >= 5 ? puts gal_five_body : puts gal_five
    if self.guesses >= 5
      puts gal_five_body
    elsif self.guesses < 5
      puts gal_five
    end
    # Line 6
    if self.guesses <= 5
      puts gal_six
    elsif self.guesses == 6
      puts gal_six_one
    elsif self.guesses == 7
      puts gal_six_two
    end
    # Line 7 (bottom)
    puts gal_seven
    puts self.display_array.join(" ")
  end

  # compares user_input to alphabet
  def valid_move?(user_input)
    alphabet.include?(user_input)
  end

  def won?
    @display_array == @letter_array ? true : false
  end

  # game over?
  def hanged?
    guesses >= 7 ? true : false
  end

  # turn provides flow for a single turn
  def turn
    puts "Please enter a letter:"
    user_input = gets.upcase.chomp
    if !valid_move?(user_input)
      turn
    elsif self.incorrect_guesses.include?(user_input)
      puts "You already guessed that, and it's wrong!"
      turn
    elsif self.display_array.include?(user_input)
      puts "That's already on the board..."
      turn
    else
      self.correct?(user_input)
    end
  end

  # play provides flow for the whole game
  # until game.hanged? == true; break if game.won? == true
  def play
    until self.hanged? == true || self.won? == true
      self.gallows
      self.turn
    end
    if self.hanged? == true
      self.gallows
      puts "You've been HANGED!"
      puts "The word was #{self.word}. How did you not guess that?"
    elsif self.won? == true
      self.gallows
      puts "You slipped the noose just in the nick of time!"
    # if !self.hanged? == true
    #   self.gallows
    #   self.turn
    # elsif self.hanged? == true
    #   self.gallows
    #   puts "You've been HANGED!"
    # elsif self.won? == true
    #   self.gallows
    #   puts "You slipped the noose just in the nick of time!"
    end
  end

end
