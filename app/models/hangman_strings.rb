class Hangman_Strings
  attr_reader :hangman_strings

  def self.get_strings_arr
    @@HANGMAN_STRINGS = [
  "    _________
     |
     |
     |
     |
     |
     |
  ",
  "    _________
     |         |
     |         0
     |
     |
     |
     |
  ",
  "    _________
     |         |
     |         0
     |         |
     |
     |
     |
  ",
  "    _________
     |         |
     |         0
     |        /|
     |
     |
     |
  ",
  "    _________
     |         |
     |         0
     |        /|\\
     |
     |
     |
  ",
  "    _________
     |         |
     |         0
     |        /|\\
     |        /
     |
     |
  ",
  "    _________
     |         |
     |         0
     |        /|\\
     |        / \\
     |
     |
  ",
    ]

  end
end
