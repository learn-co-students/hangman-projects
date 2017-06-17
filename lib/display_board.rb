require 'pry-byebug'


## incorrect_guesses defined here for testing purposes
##"A", "B", "C", "D", "E", "F"
incorrect_guesses = ["A", "B", "C", "D"]

class DisplayBoard

  attr_accessor :guesses, :incorrect_guesses

  def initialize(incorrect_guesses)
    @incorrect_guesses = incorrect_guesses
  end

  def guesses
    guesses = @incorrect_guesses.length
  end

  def show
  end

  # The #gallows method works
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
  end

end

# Below is for testing purposes
board = DisplayBoard.new(incorrect_guesses)
Pry.start
