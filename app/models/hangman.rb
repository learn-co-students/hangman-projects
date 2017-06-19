require 'io/console'
require 'pry'
class Hangman

  @@player1_name = "92$&?!"
  @@player2_name = "92$&?!"

  attr_accessor :players, :number_of_limbs, :dashes, :secret_word, :secret_char_array, :temp_player

  attr_reader :letter, :guessed_letters

  def initialize()
    ###This is not a good practice...
    @player1 = Player.new_or_find_by_name(@@player1_name)
    @player2 = Player.new_or_find_by_name(@@player2_name)
    @secret_word = "@#$#%"
    @guessed_letters = []
  end

  def self.welcome
    puts "Welcome to Hangman!!"
    until self.all_letters(@@player1_name) == true do
      puts "Please enter Player 1 name."
      @@player1_name = gets.chomp
    end
    until self.all_letters(@@player2_name) == true do
      puts "Please enter Player 2 name."
      @@player2_name = gets.chomp
    end
  end


  def self.all_letters(str)
    str[/[a-zA-Z]+/]  == str
  end

  def switch_players
    @temp_player = @player1
    @player1 = @player2
    @player2 = @temp_player
  end


  def playgame

    self.get_word #draws initial dashes

    self.draws_hangman_and_dashes #draws hangman and remaining dashes

    until self.game_over? do
      input = self.get_input
      self.check_input(input)
      self.draws_hangman_and_dashes
    end

    self.end_round
  end


    #######################DASHES######################################

  def get_word
    ##Gets secret_word from Player 1
    ##Sets secret_word equal to Player 1 input
    @number_of_limbs = 0
    until self.class.all_letters(@secret_word.gsub(/\s+/, ""))
      puts "#{@player1.name}, please enter a word containing letters a-z."
      #doesn't show input
      #set secret_word to instance variable so can access in check_input
      @secret_word = STDIN.noecho(&:gets).chomp
    end
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
    @secret_char_array.each_with_index do |character, idx|
      @dashes[idx * 2] = " " if character == " "
    end
    puts @dashes
  end


###################### /DASHES ####################################s#####

  def draws_hangman_and_dashes

    puts Hangman_Strings.get_strings_arr[@number_of_limbs]
    puts "Already guessed:"
    p @guessed_letters
    puts @dashes

  end

  def get_input
    ##if we have time we'll validate the data so that it is only ever one char a-z (have input shovel to an array and shift first element off??)
    puts "#{@player2.name} Please enter a letter."
    letter = gets.chomp
      if letter == "exit"
        abort("Bye, Felicia!")
        #love this!
      elsif letter == @secret_word
        @dashes = @secret_word
      elsif letter.chars.size > 1
        puts "Please only enter a single character or  for exit."
        self.get_input
      elsif @guessed_letters.include?(letter)
        puts "You already guessed that letter, try again."
        puts "Already guessed:"
        p @guessed_letters
      end
      binding.pry
  end

  def check_input(input)
    @secret_char_array.include?(input) ? self.correct_guess(input) : self.incorrect_guess
  end

  def incorrect_guess
    @number_of_limbs += 1
    self.display_guessed_letters
  end

  def correct_guess(input)
    index_arr = []
    #sets index equal to the index of the character in secret word
    @secret_char_array.each_with_index do |value, idx|
      if value == input
        @guessed_letters << input
        index_arr << idx
        @secret_char_array[idx] = "*"
      end
    end
    #multiply by two to account for spaces inbetween the dashes
    index_arr.each do |index|
      index *= 2
      @dashes[index]= input
    end
    self.display_guessed_letters
  end

  def display_guessed_letters
    @guessed_letters
  end

  def game_over?

    dashes_without_spaces = @dashes.gsub(/\s+/, "")

    if dashes_without_spaces == @secret_word.gsub(/\s+/, "") || @number_of_limbs > 5
      return true
    else
      return false
    end

  end

  def full_game
    self.playgame
    self.switch_players
    self.playgame
    self.end_game
  end

  def end_round
    dashes_without_spaces = @dashes.gsub(/\s+/, "")
    if dashes_without_spaces == @secret_word.gsub(/\s+/, "")
      #Player 2 wins
      puts "#{@player2.name} wins!!!"
      puts "Good guessing!"
      @player1.losses += 1
      @player2.wins += 1
    else
      #Player 1 wins
      puts "#{@player1.name} wins!!!"
      puts "The word was #{@secret_word}"
      @player2.losses += 1
      @player1.wins += 1
    end

    #reset secret word to untrip until statement in get word.
    @secret_word = "#$%@"
    puts "#{@player1.name}'s record is #{@player1.wins} wins and #{@player1.losses} losses"
    puts "#{@player2.name}'s record is #{@player2.wins} wins and #{@player2.losses} losses"

  end

  def end_game
    input = nil
    until input == "y" || input == "n" do
      puts "Would you like to play another round? (y/n)"
      input = gets.chomp.downcase
      if input == "y"
        self.full_game
      end
    end
  end

end
