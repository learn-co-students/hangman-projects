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

end
