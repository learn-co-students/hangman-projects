require 'pry'

class Hangman

  #create new unique game ID for user
  attr_reader :game_id, :game_word
  attr_accessor :guessed_letters, :game_won, :display_word_with_blanks, :counter, :user_input

  def initialize(game_word = "Hello")
    @original_word = game_word
    @game_word = game_word.downcase.split("")
    @game_id = 1
    @guessed_letters = []
    @game_won = false
    @counter = 0
    @display_word_with_blanks = @game_word.map do |letter|
       "-"
    end
  end

  def disply_method
    #this will be the picture
    puts @counter
    puts "Guess Your Letter"
    puts @display_word_with_blanks.join(" ")
    puts @guessed_letters.join(", ")
  end

  def fill_in_blanks
    @display_word_with_blanks = @game_word.map.with_index do |letter, index|
      if letter == @user_input
        letter
      else
        display_word_with_blanks[index]
      end
    end
  end

  def check_word
    if @user_input == @game_word.join("")
      @game_won = true
    else
      @counter = 6
    end
  end

  def check_letter
    if @game_word.include?(@user_input)
      fill_in_blanks
      if @display_word_with_blanks == @game_word
        @game_won = true
      end 
    elsif @guessed_letters.include?(@user_input) || @display_word_with_blanks.include?(@user_input)
      puts "You've already guessed #{@user_input}. Guess again."
    else
      @counter += 1
      @guessed_letters << @user_input
      puts "You Guessed Wrong"
    end
  end

  def start_game
    puts "Welcome to Hangman"
    puts "Here is your word, GUESS AWAY!!!"
    puts ""
    puts @display_word_with_blanks.join(" ")

    until @counter == 6 || @game_won
      disply_method
      @user_input = gets.chomp.downcase
      if @user_input.size > 1
        check_word
      else
        check_letter
      end
    end

    puts @game_won ? "Congrats, you won!" : "Another one bites the dust... ;,,,("

  end

end

game = Hangman.new
game.start_game
