class Player

  attr_reader :name
  attr_accessor :games_won_lost, :game

  def initialize(name)
    self.games_won_lost = {games_won: 0, games_lost: 0}
  end

end
