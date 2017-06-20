class Hangman
  attr_reader :phrase
  attr_accessor :session, :counter

  def initialize(difficulty=:easy)
    @counter = 0
    @phrase = Phrase.new(difficulty)
  end

  def user
    self.session.user
  end

  def display
    self.session.display
  end

  def user_input
    self.session.user_input
  end

  def get_user_input
    self.user_input.value = gets.chomp.downcase
  end

  def check_letter
    if self.user_input.matches_single_char?
      self.phrase.update_display_vals(self.user_input.find_match_indexes)
    else
      self.phrase.guessed_letters << self.user_input.value
      self.counter += 1
      self.display.wrong_guess_message
    end
  end

  def second_chance
    new_value = self.user_input.value.split("")[0]
    display.second_chance_prompt(new_value)
    if gets.chomp.downcase == "y"
      self.user_input.value = new_value
        self.check_letter
        display.word_and_gallows
    else
      check_word
    end
  end

  def check_word
    self.phrase.display_vals = self.phrase.true_vals if self.user_input.matches_phrase?
    self.counter = 6
  end

  def game_over?
    self.counter == 6 || game_won?
  end

  def game_won?
    self.phrase.display_vals == self.phrase.true_vals
  end

  def play_game
    display.game_instructions
    display.word_and_gallows

    until self.game_over?
      display.prompt_for_guess
      get_user_input
      if self.user_input.is_already_guessed_letter
        self.display.already_guessed_message(self.user_input.value)
      elsif self.user_input.is_number || self.user_input.is_empty_string
        self.display.invalid_input_message
      elsif self.user_input.is_single_char
        check_letter
        self.display.word_and_gallows
      elsif self.user_input.is_two_chars
        second_chance
      else
        check_word
        self.display.word_and_gallows
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
