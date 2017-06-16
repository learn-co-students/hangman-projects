class Hangman

  @@player1_name = nil
  @@player2_name = nil

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
  attr_accessor :number_oflimbs, :dashes, :word_to_guess

  def initialize()
    ###This is not a good practice...
    #TODO: switch these method calls to find_by_name
    ###PLAYER NEEDS METHOD NEW OR FIND BY NAME!!!!!
    @player1 = Player.new(@@player1_name)
    @player2 = Player.new(@@player2_name)
  end

  def self.welcome
    puts "Welcome!! to hangman"
    puts "Please enter player1 name"
    @@player1_name = gets.chomp
    puts "Please enter player2 name"
    @@player2_name = gets.chomp
  end

  def playgame



    self.get_word
    self.draws_hangman_and_dashes

    until self.game_over? do
      input = self.get_input
      self.check_input(input)
      self.draws_hangman_and_dashes
    end

    self.end_game

  end

  def get_word
    ##Gets word_to_guess from player 1
    ##Sets word_to_guess = that word

  end

  def make_dashes(word_to_guess)
    ##makes a string like "_ _ _ _ _ _ _ _"
    ## from the word_to_guess and sets it to @@dashes
  end


  def get_input
    ##get input from player and return
    ##if we have time we'll validate the data so that it is only ever one char a-z

  end

  def draws_hangman_and_dashes(word_to_guess)
    ##draws_hangman on screen as well as puts out dashes

    puts @@HANGMAN_STRINGS[@number_oflimbs]

  end


  def self.check_input(input)
    ##check to see if the input is equal to a character in the word_to_guess


  end

  def game_over?
    ##Checks to see if the game has been won by either player2]
    ##compares dashes string to word_to_guess
    ##check to see how many limbs are hanging
    ## return true if game over

  end

  def end_game
    #increment either players win count


  end



end
