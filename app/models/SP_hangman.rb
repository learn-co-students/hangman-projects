require 'JSON'
require_relative 'player.rb'
require_relative 'dashes.rb'
require_relative 'hangman_strings.rb'

class SP_Hangman
  attr_accessor :player, :words, :dashes, :secret_word, :guessed_letters, :number_of_limbs



  def initialize(player)
    words_raw_json = File.read('english_words.json')
    @words = JSON.parse(words_raw_json)
    @player = player
    @guessed_letters = []
  end


  def playgame
    @number_of_limbs = 0

    self.find_word

    self.draws_hangman_and_dashes

    until self.game_over? do
      input = self.get_input
      self.check_input(input)
      self.draws_hangman_and_dashes
    end

    self.end_round
  end

  def find_word
    #107567
    @secret_word = @words[rand(0..107566)]
    @dashes = Dashes.make_dashes(@secret_word)
    @secret_char_array = @secret_word.chars
  end

  def draws_hangman_and_dashes

    puts Hangman_Strings.get_strings_arr[@number_of_limbs]
    puts "Already guessed:"
    p @guessed_letters
    puts @dashes

  end

  def get_input
    ##if we have time we'll validate the data so that it is only ever one char a-z (have input shovel to an array and shift first element off??)
    puts "#{@player.name} Please enter a letter."
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
    letter
  end

  def check_input(input)
    @secret_char_array.include?(input) ? self.correct_guess(input) : self.incorrect_guess(input)
  end

  def incorrect_guess(input)
    @number_of_limbs += 1
    @guessed_letters << input
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


  def end_round
    dashes_without_spaces = @dashes.gsub(/\s+/, "")
    if dashes_without_spaces == @secret_word.gsub(/\s+/, "")
      #player wins
      puts "You win!!!"
      @player.wins += 1
      puts "#{@player.name}'s record is #{@player.wins} wins and #{@player.losses} losses"
    else
      #player loses
      puts "You lose!!!"
      puts "The word was #{@secret_word}"
      @player.losses += 1
      puts "#{@player.name}'s record is #{@player.wins} wins and #{@player.losses} losses"
    end
  end

end
