require 'pry-byebug'
require_relative 'dictionary.rb'
require_relative 'display.rb'
require_relative 'user.rb'
require_relative 'turn.rb'

class User

  attr_accessor :name, :id, :games

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @id = @@all.length
    @games = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|user| user.name == user}
  end

  def self.find_by_id(id)
    self.all[id - 1]
  end

  def self.win_ratio
      total_arr = User.all.each do |user|
        user.games.each_with_object([]){|game, arr| arr << game}
      end
      win_arr = User.all.each do |user|
        user.games.each_with_object([]){|game, arr| arr << game if game.status == "won"}
      end
      if !total_arr.length == 0
        win_ratio = win_arr.length / total_arr.length
      else
        win_ratio = 0
      end
  end


end
