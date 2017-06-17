require 'io/console'
require 'pry'
class Hangman

  @@player1_name = nil
  @@player2_name = nil

  @@number_of_limbs = 0

  @@HANGMAN_STRINGS = [
"    _________
   |
   |
   |
   |
   |
",
"    _________
   |         0
   |
   |
   |
   |
",
"    _________
   |         0
   |         |
   |
   |
   |
",
"    _________
   |         0
   |        /|
   |
   |
   |
",
"    _________
   |         0
   |        /|\ \n
   |
   |
   |
",
"    _________
   |         0
   |        /|\ \n
   |        /
   |
   |
",
"    _________
   |         0
   |        /|\ \n
   |        / \
   |
   |
",
  ]
  attr_accessor :players, :number_oflimbs, :dashes, :secret_word
  attr_reader :letter

  def initialize()
    ###This is not a good practice...
    #TODO: switch these method calls to find_by_name
    ###PLAYER NEEDS METHOD NEW OR FIND BY NAME!!!!!
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
      binding.pry
      self.draws_hangman_and_dashes
    end
    self.end_game
  end

  def get_word
    ##Gets secret_word from Player 1
    ##Sets secret_word equal to Player 1 input
    puts "Player 1, please enter a word containing letters a-z. Player 2 don't look!"
    #doesn't show input
    #set secret_word to instance variable so can access in check_input
    @secret_word = STDIN.noecho(&:gets)
    self.make_dashes(secret_word)
  end

  def make_dashes(secret_word)
    #draws dashes
    #sets secret_word equal to @@dashes
    @@dashes = secret_word
    dashes = ""
    secret_word.size.times do
    dashes += "_ "
    end
    puts dashes
  end

  def draws_hangman_and_dashes  ##draws hangman and dashes
    stuff = @@HANGMAN_STRINGS[@@number_of_limbs]
    #binding.pry
    puts stuff #when do we set number_of_limbs
    self.make_dashes(@@dashes)
    #binding.pry
  end

  def get_input
    ##get input from player and return
    ##if we have time we'll validate the data so that it is only ever one char a-z (have input shovel to an array and shift first element off??)
    puts "Please enter a letter."
    letter = gets.chomp
    @input = letter
    binding.pry
  end

  def check_input(input)
    ##check to see if the input is equal to a character in the secret_word
    @secret_word.chars.include?(@input) ? true : false
    binding.pry
  end

  def incorrect_guess
    #subracts limb
    @number_of_limbs -= 1
  end

  def correct_guess
    #inserts letter into proper dash index(es)
  end


  def game_over?
    ##Checks to see if the game has been won by player2
    ##compares dashes string to secret_word
    ##check to see how many limbs are hanging
    ## return true if game over

  end

  def end_game
    #increment either players win count
    #how will we choose which player's win count to increment?
    #self.players[]

  end



  #some sort of method to end game at any time
end
