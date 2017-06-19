require 'JSON'
require_relative 'player.rb'
class SP_Hangman
  attr_accessor :player, :words


  def initialize(player)
    words_raw_json = File.read('english_words.json')
    @words = JSON.parse(words_raw_json)
    @player = player
  end



end


  player = Player.new("trey")

  single_hangman = SP_Hangman.new(player)


  puts single_hangman.words.size
