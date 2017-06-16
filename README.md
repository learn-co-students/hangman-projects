##Flow of the app

Two player game

Puts Welcome to hangman!


Puts player 1 please enter a word (player 2 dont look)

word = gets chomp

dashes = ""
word.size.times do
dashes += "_ "
end

puts dashes


Puts player 2 please guess a letter

guess = gets.chomp

word.split("").each do
if word.chars.include?(char)
  #get index of char
  set dashes @ that index to char
  check if the word has been guesed
  (if dashes == the_word?)
  promt user to guess again
else
  draw limb
  check to see how many limbs are left
  end game if dead.
end

lasdjhgfsakdf.size > 1

#clases

##hangman
  

  @number_ofLimbs

  Most methods


##player

  @name
  @wins

##variabless



##potential flow

welcome

until game_over?

  get_input
  check_input

end

end_game

###how to persist data without SQL??????????????

###methods & flow


Welcome
  |
  V
get input <----------            
  |                 |
  V                 |
check input         |
  |                 |
  V                 |
game_over? - - - - |
                   |
end game  -----------





end
