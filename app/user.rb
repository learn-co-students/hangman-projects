class User

  @@all = []

  attr_accessor :name, :win, :loss

  def initialize(name)
    @name = name
    @win = 0
    @loss = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def score_board

  end

end
