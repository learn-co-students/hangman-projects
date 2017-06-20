## HANGMAN ##

HANGMAN -- A NEW SPIN ON AN OLD CLASSIC

## Instructions

Open bin/run to start the game. You will be prompted to enter your name, which will allow you to keep track of your wins and losses. You can also just press enter to continue to the game.

Enter a letter to make a guess. If you think you know the whole word, you can enter the word as your guess. If your guess is within 3 characters in length of the hidden word, and you are wrong, HANGMAN will register that as an incorrect guess, so type carefully. However, this allows for some leeway with respect to typos, except with small words.

## Classes

# Game
The Game class is called by bin/run and controls the flow of the whole game. It draws on the Dictionary class to generate a word for the game, calls on Turn to instantiate each turn, and associates game data with an instance of the User class.

# Display
The Display class is responsible for keeping track of a user's incorrect guesses, as well as for generating the HANGMAN's advanced CLI graphics.

# Turn
The Turn class is responsible for taking the user's input, ensuring that the input is valid, and checking whether the user's input is correct.

# Dictionary
The Dictionary class is solely responsible for generating the hidden word. It draws from one of two dictionaries based on the users' win ratio at the point in time at which it is called. The first game will draw from a simple dictionary. Subsequent games will draw from either the simple dictionary or a random word provided by the RandomWord gem as follows below. The words provided by the RandomWord gem are typically much more difficult than the words in the simple dictionary.

###  USER WIN RATIO //// CHANCE OF RandomWord WORD
###    Under 33%    ////          1/3
###    33% - 66%    ////          1/2
###    Over 66%     ////          2/3

# User
The User class maintains a record of the users' names, as well as their wins and losses. It also generates the user's win ratio.
