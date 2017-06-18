
require_relative '../config/environment.rb'

## Read data on players
Player.read_existing_players

Hangman.welcome

game = Hangman.new

game.playgame

##Store data once game is over
Player.make_json
