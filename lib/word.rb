require "require_all"

require_all 'lib'
# require_relative 'letter.rb'
require 'pry'
require 'unirest'
require 'random-word'

class Word
  attr_reader :answer, :letters, :synonyms, :definitions
  attr_accessor :guesses, :hints

  # @@library = ['bear', 'rabbit', 'rainbow', 'ambiguous', 'detailed', 'chances', 'complicated', 'alabaster', 'aardvark', 'simplification', 'disparate', 'unaltered', 'amazed', 'fragile', 'daytime', 'dynasty', 'basic', 'civilization', 'deadly']
  @@used_words = []
  #
  # def self.library
  #   @@library
  # end
# NOTE: maybe could be calculated from previous games, etc.
  def self.used_words
    @@used_words
  end

  def initialize
    self.get_answer
    self.set_letters
    self.get_synonyms
    self.get_definitions
    self.hints = self.synonyms + self.definitions
    # nice.
    self.guesses = []
    # maybe guesses should be it's own object.
    @@used_words << self.answer
    RandomWord.exclude_list << self.answer
    # @@library.delete(self.answer)
    # binding.pry
  end

  def get_answer
    # retrieve a random word from the @@library and set it equal to @answer
    # max_range = @@library.length - 1
    # rand_num = rand(0..max_range)
    # @answer = @@library[rand_num]
    RandomWord.exclude_list << /_/
    num = rand(0..1)
    if num == 0
      @answer = RandomWord.nouns(not_longer_than: 15).next
    elsif num == 1
      @answer = RandomWord.adjs(not_long_than: 15).next
    end
  end

  def set_letters
    # transform the @answer string into an array of <letters> with
    # corresponding characters and defaulted to not visible
    characters = self.answer.split('')
    # -> ['t', 'h', 'i', 'n', 'g']
    # NOTE: just use map here, instead of each with object.
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
    # NOTE: Probably does not belong in the word class
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
    # NOTE: Probably does not belong in the word class
    self.guesses.select{|guess| guess[:valid] == false}.map{|guess| guess[:character]}.uniq.join(' ')
  end

  def display_board
    # NOTE: Probably does not belong in the word class
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

  def get_definitions
    word = self.answer
    response = Unirest.get "https://wordsapiv1.p.mashape.com/words/#{word}/definitions",
    headers:{
      "X-Mashape-Key" => "zgo00BG7RRmshJnS6VwwquK8vmYip1hePaXjsnYkh6UE97WKnj",
      "Accept" => "application/json"
    }
    # binding.pry
    @definitions = response.body["definitions"].map{|definition| definition["definition"] }
  end

  def get_hint
    max = self.hints.size
    num = rand(0..(max-1))
    # binding.pry
    if self.hints.size >= 1
    hint = self.hints[num]
      self.hints.delete(hint)
    elsif self.hints == []
      "No more hints!"
    end
  end

end

# word = Word.new
# word.get_answer
# puts word.blanks
# guess = 'a'
# word.guess(guess)

# Pry.start
