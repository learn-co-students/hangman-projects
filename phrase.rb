require "pry"

class Phrase
# TODO - break parsing logic (stuff with blanks) back out into Hangman class
# TODO - add logic to this class to hold word list and pop words out of it

  attr_accessor :true_string, :display_string, :guessed_letters
  attr_reader :original_phrase

  def make_word_underscores(word)
    word.split("").map {|ch| "_"}
  end

  def initialize(phrase="why hello there")
    @original_phrase = phrase
    @true_string = phrase.split("")
    @display_string = phrase.split("").map { |ch| ch == ' '  ? ' ' : "_" }
    @guessed_letters = []
  end

  def update_display_str(idx_arr)
    idx_arr.each do |position|
      @display_string[position] = @true_string[position]
    end
  end

  def get_matching_locations(char)
    if @guessed_letters.include?(char)
      return "already guessed"
    end
    self.true_string.each_with_object([]).with_index do |(curr_ch, acc), idx|
      if curr_ch.downcase == char &&
        acc << idx
      end
    end
  end

  def get_display_phrase
    self.display_string.join(' ')
  end
  #
  # def fill_in_blanks_with(letter)
  #    = @letters.map_with_index do |char, index|
  #     if char == letter
  #       char
  #     else
  # end

end
