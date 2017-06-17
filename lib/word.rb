require "require_all"

require_all 'lib'
# require_relative 'letter.rb'
require 'pry'

class Word
  attr_reader :answer, :letters

  @@library = ['bear', 'rabbit', 'rainbow', 'ambiguous', 'detailed', 'chances', 'complicated']

  def initialize
    self.get_answer
    self.set_letters
  end

  def get_answer
    # retrieve a random word from the @@library and set it equal to @answer
    max_range = @@library.length - 1
    rand_num = rand(0..max_range)
    @answer = @@library[rand_num]
  end

  def set_letters
    # transform the @answer string into an array of <letters> with
    # corresponding characters and defaulted to not visible
    characters = self.answer.split('')
    # -> ['t', 'h', 'i', 'n', 'g']
    @letters = characters.each_with_object([]) { |character, array|
      letter = Letter.new(character)
      array << letter
    }
    # -> [<Letter, @character = 't', @visibile = false], ..]
  end

  def blanks
    self.letters.map { |letter|
      letter.visible == false ? "_" : letter.character
    }
  end

  def guess(guess)
    # receive a guessed letter from user
    # if the guessed letter appears in the @letters array
    # find all the indexes that the letter appears in the array
    # use the indexes to change the @blank_letters array
    # at each index, change "_" to the guessed letter
    if self.answer.include?(guess)
      self.letters.each {|letter|
        if letter.character == guess
          letter.visible = true
        end
      }
      self.blanks
        # binding.pry
    else
      self.blanks
    end
  end

end

# word = Word.new
# word.get_answer
# puts word.blanks
# guess = 'a'
# word.guess(guess)

# Pry.start
