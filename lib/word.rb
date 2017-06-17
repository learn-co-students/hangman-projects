
require 'pry'

class Word
  attr_accessor :answer

  @@library = ['bear', 'rabbit', 'rainbow', 'sheep']

  def get_word
    max_range = @@library.length
    rand_num = rand(0..max_range)
    self.answer = @@library[rand_num]
    binding.pry
  end

end

# word = Word.new
# word.get_word
