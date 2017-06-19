require 'require_all'
require_all 'lib'

run_game = true
while run_game do
  #puts game_start screen
  title
  option = prompt_menu
  case option
  when "s"
    player_name = get_player
    start_game(player_name) if player_name != 'ff'
  when "r"
    display_rankings
  when "q"
    #puts game_end screen
    puts thank_you
    run_game = false
  else
    puts "That was an invalid MENU option, please try again."
  end
end
