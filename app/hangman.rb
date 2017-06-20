require 'pry'
require_relative './phrase.rb'
require_relative './gallows.rb'
require_relative './user.rb'
require_relative './display.rb'

# TODO menu method or class -- main menu
#      partial exit so user can Play
#      store scores to file
#      word array
#      to-do's from partners
#      fix file structure

class Hangman
  attr_reader :phrase, :counter
  attr_accessor :user_input, :session

  def initialize
    @counter = 0
    @phrase = Phrase.new
  end

  def user
    self.session.user
  end

  def display
    self.session.display
  end

  def check_word
    if @user_input == self.phrase.true_vals.join("").downcase
      self.phrase.display_vals = self.phrase.true_vals
      @game_won = true
    else
      @counter = 6
    end
  end

  def game_over?
    @counter == 6 || @phrase.display_vals == @phrase.true_vals
  end

  def game_won?
    if @phrase.display_vals == @phrase.true_vals
      return true
    elsif @counter == 6
      return false
    end
  end

  def get_matching_locations(char)
    return "already guessed" if self.phrase.guessed_letters.include?(char)
    self.phrase.true_vals.each_with_object([]).with_index do |(curr_ch, acc), idx|
      if curr_ch.downcase == char &&
        acc << idx
      end
    end
  end

  def check_letter
    matching_locations = get_matching_locations(@user_input)
    # binding.pry
    if matching_locations == "already guessed"
      puts "You've already guessed #{@user_input}. Guess again."
    elsif !matching_locations.empty?
      @phrase.update_display_vals(matching_locations)
    else
      # NOTE: put into phrase class, sanatize input
      @phrase.guessed_letters << @user_input
      @counter += 1
      puts "You Guessed Wrong"
    end
  end

  def play_game

    display.game_instructions

    until self.game_over?
      display.word_and_gallows
      display.prompt_for_guess
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

    end_of_game

  end

  def update_user
    self.game_won? ? user.win +=1 : user.loss +=1
  end

  def end_of_game
    if game_won?
      display.win_message
    else
      Gallows.display6
      display.lose_message
    end
    update_user
  end

end
