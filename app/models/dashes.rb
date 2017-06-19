class Dashes

  def self.make_dashes(secret_word)
    #draws dashes
    #sets secret_word equal to @@dashes
    dashes = ""
    secret_word.size.times do
    dashes += "_ "
    end

    secret_word.chars.each_with_index do |character, idx|
      dashes[idx * 2] = " " if character == " "
    end
    dashes
  end



end
