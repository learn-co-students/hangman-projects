class Dashes

  def initialize(secret_word)
    @secret_word = secret_word
    @secret_char_array = secret_word.chars
  end

  def self.make_dashes(secret_word)
    #draws dashes
    #sets secret_word equal to @@dashes
    @dashes = ""
    @secret_word.size.times do
    @dashes += "_ "
    end
    @secret_char_array.each_with_index do |character, idx|
      @dashes[idx * 2] = " " if character == " "
    end
    puts @dashes
  end

end
