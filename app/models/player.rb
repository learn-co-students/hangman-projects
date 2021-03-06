require 'pry'
require 'json'
class Player
  attr_accessor :name, :wins, :losses

  @@all = []

  def initialize(name=nil, wins = 0, losses = 0)
    @name = name
    @wins = wins
    @losses = losses
    @@all << self
  end

  def self.new_or_find_by_name(name)
    # makes new player if they dont exist
    # returns that player if they do
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.find_by_name(name)
    @@all.find { |player| player.name == name }
  end

  def self.create_by_name(name)
    new_player = Player.new
    new_player.name=(name)
    new_player
  end

  def self.all
    @@all
  end
end
