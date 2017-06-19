class Player
  attr_accessor :wins, :losses
  attr_reader :name
  @@all = []
  def initialize (name)
    @name = name
    self.wins = 0
    self.losses = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def won
    self.wins += 1
    self.wins == 999 if self.wins > 999
  end

  def lost
    self.losses += 1
    self.losses == 999 if self.losses > 999
  end

  def self.find_or_create(name)
    find_player = self.all.detect { |player| player.name.downcase == name.downcase }
    if !find_player
      got_player = self.new(name)
    else
      got_player = find_player
    end
    got_player
  end

  #sorts the players based on their wins and losses
  def self.player_rankings
    sort_losses = self.all.sort_by { |player| player.losses }
    sort_wins = sort_losses.sort_by { |player| player.wins }.reverse
    sort_wins[0..9]
  end

  def self.delete_all
    @@all.clear
  end

end
