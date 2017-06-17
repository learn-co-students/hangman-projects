class Player
  attr_accessor :name, :wins

  @@all = []

  def initialize(name="player")
    @name = name
    @wins = 0
    @@all << self
  end

  #TODO:
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

end
