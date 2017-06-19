class Player

  attr_reader :name
  attr_accessor :games_won, :games_lost, :game

  def initialize(name)
    @name = name
    @games_won = 0
    @games_lost = 0
  end

end
