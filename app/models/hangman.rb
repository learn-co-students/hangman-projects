require 'io/console'
require 'pry'
class Hangman

  @@player1_name = nil
  @@player2_name = nil

  @@number_of_limbs = 0
  @@guessed_letters = []
  @@HANGMAN_STRINGS = [
"    _________
   |
   |
   |
   |
   |
   |
",
"    _________
   |         |
   |         0
   |
   |
   |
   |
",
"    _________
   |         |
   |         0
   |         |
   |
   |
   |
",
"    _________
   |         |
   |         0
   |        /|
   |
   |
   |
",
"    _________
   |         |
   |         0
   |        /|\\
   |
   |
   |
",
"    _________
   |         |
   |         0
   |        /|\\
   |        /
   |
   |
",
"    _________
   |         |
   |         0
   |        /|\\
   |        / \\
   |
   |
",
  ]

  attr_accessor :players, :number_of_limbs, :dashes, :secret_word, :secret_char_array

  attr_reader :letter, :guessed_letters

  def initialize()
    ###This is not a good practice...
    #TODO: switch these method calls to find_by_name
    ###PLAYER NEEDS METHOD NEW OR FIND BY NAME!!!!!
    @number_of_limbs = 0
    @player1 = Player.new(@@player1_name)
    @player2 = Player.new(@@player2_name)
  end

  def self.welcome
    puts "Welcome to Hangman!!"
    puts "Please enter Player 1 name."
    @@player1_name = gets.chomp
    puts "Please enter Player 2 name."
    @@player2_name = gets.chomp
  end


  def playgame
    self.get_word #draws initial dashes
    #binding.pry
    self.draws_hangman_and_dashes #draws hangman and remaining dashes
    #binding.pry
    until self.game_over? do
      input = self.get_input
      self.check_input(input)
      self.draws_hangman_and_dashes
    end
    self.end_game
  end

  def get_word
    ##Gets secret_word from Player 1
    ##Sets secret_word equal to Player 1 input
    @number_of_limbs = 0
    puts "Player 1, please enter a word containing letters a-z. Player 2 don't look!"
    #doesn't show input
    #set secret_word to instance variable so can access in check_input
    @secret_word = STDIN.noecho(&:gets).chomp
    @secret_char_array = @secret_word.chars
    self.make_dashes(secret_word)
    #binding.pry
  end

  def make_dashes(secret_word)
    #draws dashes
    #sets secret_word equal to @@dashes
    @dashes = ""
    @secret_word.size.times do
    @dashes += "_ "
    end
    puts @dashes
  end

  def draws_hangman_and_dashes  ##draws hangman and dashes
    hangman = @@HANGMAN_STRINGS[@number_of_limbs]
    #binding.pry
    puts hangman

    puts @dashes

    #binding.pry
  end

  def get_input
    ##get input from player and return
    ##if we have time we'll validate the data so that it is only ever one char a-z (have input shovel to an array and shift first element off??)
    puts "Please enter a letter."
    letter = gets.chomp
    @input = letter
      if @input == "exit"
        abort("Bye, Felicia!")
      end
    #binding.pry
  end

  def check_input(input)
    ##check to see if the input is equal to a character in the secret_word
    @secret_char_array.include?(@input) ? self.correct_guess(@input) : self.incorrect_guess
  end

  def incorrect_guess
    #adds limb
    @number_of_limbs += 1
    self.display_guessed_letters
  end

  def correct_guess(input)#inserts letter into dash index(es)
    index = nil
    @secret_char_array.each_with_index do |value, idx|
      if value == input
        index = idx
        @secret_char_array[index] = " "
        break
      end
    end
    index *= 2
    @dashes[index]= input
    self.display_guessed_letters
  end

  def display_guessed_letters
    @guessed_letters
  end

  def game_over?
    ##Checks to see if the game has been won by player2
    ##compares dashes string to secret_word
    ##check to see how many limbs are hanging
    ## return true if game over

    dashes_without_spaces = @dashes.gsub(/\s+/, "")

    if dashes_without_spaces == @secret_word || @number_of_limbs > 5
      return true
    else
      return false
    end

  end

  def end_game
    #increment either players win count
    #how will we choose which player's win count to increment?
    #self.players[]
    dashes_without_spaces = @dashes.gsub(/\s+/, "")
    if dashes_without_spaces == @secret_word
      #Player 2 wins
      @player1.losses += 1
      @player2.wins += 1
    else
      #Player 1 wins
      @player2.losses += 1
      @player1.wins += 1
    end

    puts "#{@player1.name}'s record is #{@player1.wins} wins and #{@player1.losses} losses"
    puts "#{@player2.name}'s record is #{@player2.wins} wins and #{@player2.losses} losses"


    input = nil
    until input == "y" || input == "n" do
      puts "Would you like to play another round? (y/n)"

      input = gets.chomp.downcase

      if input == "y"
        self.playgame
      end

    end

    puts "Thank you for playing Hangman have a great day!"

  end

end
