require 'pry'
require_relative './phrase.rb'
require_relative './Hangman_display_class.rb'
require_relative './user.rb'

class Hangman

  #create new unique game ID for user
  attr_reader :game_id, :game_phrase
  attr_accessor :counter, :user_input, :game_phrase, :user

  def initialize(game_word = "Hello")
    @game_id = 1
    @counter = 0
    @game_phrase = Phrase.new
  end

  def display_method
    #this will be the picture
    Hangman_display.display_gallows(@counter)
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
    puts "What is your name"
    @user = User.new(gets.chomp)
    puts "Here is your word, GUESS AWAY!!!"

    until self.game_over?
      self.display_method
      @user_input = gets.chomp.downcase
      if @user_input.size == 1
        self.check_letter
      elsif @user_input.size == 2
        @second_chance = @user_input.split("")[0]
        puts "Did you mean #{@second_chance}? Yes/No"
        @check = gets.chomp.downcase
          if @check == "yes"
            @user_input = @second_chance
            self.check_letter
          end
      else
        self.check_word
        end
    end

    def update_user
      self.game_won? ? @user.win +=1 : @user.loss +=1
    end

    def post_game_options

      puts "You finished your game."
      puts "You can
        Play Again - Type 1
        See Your Score - Type 2
        Quit - Type 3"

    end

    def end_game_input
      input = gets.chomp
      case input
      when "1"
        new_game = Hangman.new
        new_game.user = @user
        new_game.start_game
      when "2"
        puts "You Have #{@user.win} Wins & #{@user.loss} Losses"
      when "3"
        puts "Goodbye"
      else
        puts "Goodbye"
      end
    end

    puts self.game_won? ? "Congrats, you won! The word was: #{@game_phrase.original_phrase}" : "#{Hangman_display.display6}Another one bites the dust. The word was: #{@game_phrase.original_phrase} ;,,,("
    # puts "The correct word was #{@original_word}."
    update_user

    post_game_options

    end_game_input


  end
end

game = Hangman.new
game.start_game
