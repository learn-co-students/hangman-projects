require 'pry'
require_relative './phrase.rb'

class Hangman

  #create new unique game ID for user
  attr_reader :game_id, :game_phrase
  attr_accessor :guessed_letters, :display_word_with_blanks, :counter, :user_input, :game_phrase

  def initialize(game_word = "Hello")
    @game_id = 1
    @counter = 0
    @game_phrase = Phrase.new(game_word)
  end

  def display_method
    #this will be the picture
    puts @counter
    puts "Guess Your Letter"
    puts @game_phrase.get_display_phrase
    puts @game_phrase.guessed_letters.join(", ")
  end

  def fill_in_blanks
      @display_word
  end

  def check_word
    if @user_input == @game_phrase.true_string.join("").downcase
      @game_phrase.display_string = @game_phrase.true_string
      @game_won = true
    else
      @counter = 6
    end
  end

  def game_over?
    @counter == 6 || @game_phrase.display_string == @game_phrase.true_string
  end

  def game_won?
    if @game_phrase.display_string == @game_phrase.true_string
      return true
    elsif @counter == 6
      return false
    end
  end

  def check_letter
    matching_locations = @game_phrase.get_matching_locations(@user_input)
    # binding.pry
    if matching_locations == "already guessed"
      puts "You've already guessed #{@user_input}. Guess again."
    elsif !matching_locations.empty?
      @game_phrase.update_display_str(matching_locations)
    else
      # NOTE: put into phrase class, sanatize input
      @game_phrase.guessed_letters << @user_input
      @counter += 1
      puts "You Guessed Wrong"
    end
  end

  def start_game


    puts "Welcome to Hangman"
    puts "Here is your word, GUESS AWAY!!!"

    until self.game_over?
      self.display_method
      @user_input = gets.chomp.downcase
      if @user_input.size > 1
        self.check_word
      else
        self.check_letter
      end
    end

    puts self.game_won? ? "Congrats, you won!" : "Another one bites the dust... ;,,,("
    # puts "The correct word was #{@original_word}."

  end

end

game = Hangman.new
game.start_game
