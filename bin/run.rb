require_relative '../config/environment.rb'

## Read data on players
JSON_Handler.read_existing_players

game = Game.new()

game.single_or_multi

##Store data once game is over
JSON_Handler.make_json
