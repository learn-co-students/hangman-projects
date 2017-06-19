class SecretWord

  attr_reader :answer, :revealed
  attr_accessor :correct_guesses

  def initialize
    @answer = RandomWord.nouns(not_longer_than: 8).next.upcase
    self.correct_guesses = []
    @revealed = false
    puts @answer
  end

  def update_blanks
    new_blanks = self.answer.chars.each_with_object("") do |each_letter, letters_to_display|
        if self.correct_guesses.include?(each_letter)
          letters_to_display << "#{each_letter} "
        else
          letters_to_display << "_ "
        end
      end
      if !new_blanks.include?("_")
        @revealed = true
      end
    puts new_blanks    
  end



end
