class Phrase
  attr_accessor :true_vals, :display_vals, :guessed_letters
  attr_reader :original_phrase

  @@all = {
    easy: ["almond","charger","eagle","netflix","light", "cookie", "bracelet"],
    medium: ["super glue", "donkey kong", "screen protector", "hash me ousside", "codelicious"],
    hard: ["and then there was one", "if you see something say something", "introspective", "good morning america", "guess again"]
  }

  def self.all
    @@all
  end

  def initialize(difficulty=:easy)
    @original_phrase = self.class.all[difficulty].sample
    @true_vals = @original_phrase.split("")
    @display_vals = @true_vals.map {|char| char == ' '  ? ' ' : "_" }
    @guessed_letters = []
  end

  def update_display_vals(positions)
    positions.each {|position| self.display_vals[position] = self.true_vals[position]}
  end

  def get_display_phrase
    self.display_vals.join(' ')
  end

end
