class Gallows

  def draw(bad_guesses)
    my_ascii_pic = File.read("app/hangman_picture_#{bad_guesses}.txt")
    system "clear"
    puts my_ascii_pic
  end
end
