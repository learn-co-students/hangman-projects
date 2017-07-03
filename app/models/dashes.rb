class Dashes

  def self.make_dashes(secret_word)
    #draws dashes
    #sets secret_word equal to @@dashes

    # NOTE theres a better iterator method here.
    dashes = ""
    secret_word.size.times do
    dashes += "_ "
    end
    # each with object?
    secret_word.chars.each_with_index do |character, idx|
      dashes[idx * 2] = " " if character == " "
    end
    dashes
  end



end
