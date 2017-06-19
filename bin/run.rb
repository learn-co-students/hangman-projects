
require_relative '../config/environment.rb'

## Read data on players
JSON_Handler.read_existing_players



game = Game.new()

game.welcome

hangman = Hangman.new(game.player1, game.player2)

game.full_game(hangman)


##Store data once game is over
JSON_Handler.make_json
