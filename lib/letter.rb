require 'pry'

class Letter
  attr_accessor :character, :visible

  def initialize(character)
    @character = character
    @visible = false
  end

end

# Pry.start
