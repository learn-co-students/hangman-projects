class Executioner

attr_reader :secret_word
attr_accessor :game, :games_won_lost


  def initialize ()
    self.games_won_lost = {games_won: 0, games_lost: 0}
  end


  def generate_secret_word
  # Returns and sets the secret word
  end

  def evaluate_guess(letter)
    # If the secret word contains the letter, return the positions of that letter in an array with 0 being the first letter
    # If the guess is incorrect, return an empty array

  end

  def evaluate_word_guess(word)
    # Returns true or false
  end


end
