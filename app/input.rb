class Input
  attr_reader :game
  attr_accessor :value

  def initialize(game_instance)
      @game = game_instance
  end

  def is_single_char
    self.value.size == 1
  end

  def is_two_chars
    self.value.size == 2
  end

  def is_word
    self.value.size > 2
  end

  def is_number
    self.value.match(/\d+?/)
  end

  def is_empty_string
    self.value == ""
  end

  def is_already_guessed_letter
    self.game.phrase.guessed_letters.include?(self.value)
  end

  def find_match_indexes
    self.game.phrase.true_vals.each_with_object([]).with_index {|(char, match_indexes), index|
        if char.downcase == self.value &&
          match_indexes << index
        end}
  end

  def matches_single_char?
      find_match_indexes.empty? ? false : true
  end

  def matches_phrase?
    self.value == self.game.phrase.true_vals.join("").downcase
  end


end
