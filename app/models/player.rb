class Player
  attr_accessor :name, :wins

  @@all = []


  def initialize(name="player")
    @name = name
    @wins = 0

    @@all << self
  end

  #TODO:
  def new_or_find_by_name(name)
    # makes new player if they dont exist
    #returns that player if they do
  end


end
