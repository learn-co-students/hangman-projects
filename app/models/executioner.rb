class Executioner

  attr_reader :secret_word
  attr_accessor :game, :games_won, :games_lost


  def initialize
    @games_won = 0
    @games_lost = 0
  end


  def generate_secret_word
  # Returns and sets the secret word
    @secret_word = SecretWord.new
  end

  def evaluate_guess(letter)
    if self.secret_word.answer.include?(letter)
      self.secret_word.correct_guesses << letter.upcase
      return true
    else
      return false
    end
  end

  def evaluate_word_guess(word)
    word.upcase == self.secret_word.answer
  end


end
