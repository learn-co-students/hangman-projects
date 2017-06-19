require_relative "../lib/game_logic.rb"


# Game start
# welcome message
# user input for new user
# word generated
# game logic
# user.stats updated
# continue as new user, old user, or exit


game = welcome
random = random_word
a = word_to_display(random)
b = remaining_letters_missing(random)
checker(a,b, game.user)
