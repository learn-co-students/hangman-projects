require "require_all"

require_all 'lib'
# require_relative 'letter.rb'
require 'pry'
require 'unirest'

class Word
  attr_reader :answer, :letters, :synonyms
  attr_accessor :guesses

  @@library = ['bear', 'rabbit', 'rainbow', 'ambiguous', 'detailed', 'chances', 'complicated', 'alabaster', 'aardvark', 'simplification', 'disparate', 'unaltered', 'amazed', 'fragile', 'daytime', 'dynasty', 'basic', 'civilization', 'deadly']
  @@used_words = []

  def self.library
    @@library
  end

  def self.used_words
    @@used_words
  end

  def initialize
    self.get_answer
    self.set_letters
    self.get_synonyms
    self.guesses = []
    @@used_words << self.answer
    @@library.delete(self.answer)
    # binding.pry
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
      turn = {character: guess, valid: true}
      self.guesses << turn
      self.blanks
        # binding.pry
    else
      turn = {character: guess, valid: false}
      self.guesses << turn
      self.blanks
    end
  end

  def display_guesses
    self.guesses.select{|guess| guess[:valid] == false}.map{|guess| guess[:character]}.uniq.join(' ')
  end

  def display_board
    self.blanks.join(' ')
  end

  def get_synonyms
    word = self.answer
    response = Unirest.get "https://wordsapiv1.p.mashape.com/words/#{word}/synonyms",
    headers:{
      "X-Mashape-Key" => "zgo00BG7RRmshJnS6VwwquK8vmYip1hePaXjsnYkh6UE97WKnj",
      "Accept" => "application/json"
    }
    # binding.pry
    @synonyms = response.body["synonyms"]
  end

  def get_hint
    self.get_synonyms
    self.synonyms[0]
  end

end

# word = Word.new
# word.get_answer
# puts word.blanks
# guess = 'a'
# word.guess(guess)

# Pry.start
