require 'random-word'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class Dictionary

  def self.words
    dict = [
      "SURPRISE",
      "BLANK",
      "GEMSTONE",
      "BASS",
      "CHICKEN",
      "COMPUTER",
      "RUBY",
      "PYTHON",
      "SPHYNX",
      "SLOOP",
      "BARQUENTINE",
      "BRIGANTINE",
      "BARCELONA",
      "MOUSE",
      "DOG",
      "CAT",
      "FRIGATE",
      "NEWYORK",
      "CANYON",
      "NARWHAL",
      "FISH",
      "SANDWICH",
      "PORTAL",
      "ROCKET",
      "LEAGUE",
      "POST",
      "CAPTAIN",
      "CHEESE",
      "SALAD",
      "HANDLE",
      "ASHTRAY",
      "TELEVISION",
      "AWARDS",
      "POLACRE"
    ]
    r = rand(1..100)
    if !User.all
      words = dict.sample
    elsif User.win_ratio < 0.33
      if r < 33
        words = RandomWord.nouns.next
      else
        words = dict.sample
      end
    elsif 0.33 <= User.win_ratio && User.all.win_ratio < 0.67
      if r < 50
        words = RandomWord.nouns.next
      else
        words = dict.sample
      end
    elsif User.win_ratio >= 0.67
      if r < 67
        words = RandomWord.nouns.next
      else
        words = dict.sample
      end
    end
    if words.include?("_")
      loop do
        words = RandomWord.nouns.next
        break if !words.include?("_")
      end
    end
    words = words.to_s
  end

  def self.alphabet
    alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end

end
