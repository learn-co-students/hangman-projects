require 'require_all'
require_all 'lib'

def get_player
  player = ""
  loop do
    puts "Enter Player Name (max of 32 characters): "
    player = gets.chomp
    #check if user entered a name > 32 characters
    if player.length > 32
      puts "Player name was too long, please try again"
      #check if user entered nothing
    elsif player.length == 0
      puts "No player name was entered... "
      puts "Do you wish to continue as GUEST (y)?"
      puts "Enter 'FF' to go back to the MAIN MENU"
      guest_ans = gets.chomp.downcase
      #give user option to play as GUEST
      if guest_ans == "y"
        player = "GUEST"
        break
        #give user option to quit to MAIN MENU
      elsif guest_ans == "ff"
        player = "ff"
        break
      end #if GUEST or FF
      #format name
    else
      player = player.split(" ").map(&:capitalize).join(" ")
      break
    end #if
  end #loop
  player
end #get_player

#prompt the main menu and grab user answer
def prompt_menu
  puts "------------------------------------------------------------"
  puts "|                    MAIN MENU                             |"
  puts "|  OPTIONS:                                                |"
  puts "|     S  -  START GAME                                     |"
  puts "|     R  -  SHOW RANKINGS                                  |"
  puts "|     Q  -  QUIT GAME                                      |"
  puts "------------------------------------------------------------"
  gets.chomp.downcase
end

#grab user's guessed letter
def get_letter
  letter = ""
  loop do
    puts "Guess a letter or enter 'FF' to forfeit: "
    puts "Enter 'HINT' if you want a hint"
    letter = gets.chomp.downcase
    #check if user wants to forfeit
    if letter == "ff" || letter == "hint"
      break
    #checks if user entered an actual letter [a-z]
    elsif letter[/[a-z]+/] == nil || letter[/[a-z]+/].size != letter.size || letter.size != 1
      puts "Invalid input... Please enter a single valid letter of the alphabet"
    #valid letter
    else
      break
    end#if
  end#loop check if invalid letter
  letter
end #get_letter

#start game
def start_game(player_name)

  player = Player.find_or_create(player_name)
  word = Word.new
  check_letters = false
  hang_man = 0
  forfeit = false
  hint = ""
  while hang_man < 6 && !forfeit
    # !!!print out hang man and blanks
    puts hangman_img[hang_man]
    puts word.display_board
    puts "Wrong Guesses: #{word.display_guesses}"
    puts hint
    #prompts user to input letter
    letter = get_letter
    #checks if user wants to forfeit
    if letter == "ff"
      forfeit = true
      player.lost
      puts "It's okay to quit :("
    elsif letter == "hint"
      hint = "HINT: #{word.get_hint}"
    else
      # !!! pass guess to word instance
      word.guess(letter)
      # !!! if bad guess then hang_man += 1
      hang_man += 1 if word.guesses.last[:valid] == false
      # !!! if all letters are guess && hang_man < 6 then game is won
      check_letters = word.letters.all? {|letter| letter.visible == true}
      if hang_man < 6 && check_letters
        puts hangman_img[7]
        puts word.display_board
        puts "YOU WIN!"
        player.won
        break
        # !!! if hang_man >= 6 && all letters are not guess then game is lost
      elsif hang_man >= 6 && !check_letters
        puts hangman_img[6]
        puts "YOU LOST!"
        puts "GAME OVER! Better Luck next time!"
        player.lost
      end #if win or lose
    end #valid letter?
  end #while hang_man < 6 || !forfeit
  puts "Thanks for playing! ... Press <Enter> to return to the MAIN MENU"
  gets
end #start_game

#determines the amount of digits a fixnum has
def  num_digits(num)
  if num > 0
    digits = Math.log10(num).to_i + 1
  elsif num == 0
    digits = 1
  else
    digits = 0
  end
  digits
end

#display the current rankings
def display_rankings
  puts "------------------------------------------------------------"
  puts "|             TOP 10 PLAYER RANKINGS:                      |"
  puts "|  RANK:  PLAYER:                            WINS: LOSSES: |"
  puts "|  -----  ---------------------------------  ----- ------- |"
  Player.player_rankings.each_with_index do |player, index|
    display_rank = "#{" "*(4-num_digits(index+1))}#{index + 1}."
    display_name = "#{player.name}#{" "*(33-player.name.length)}"
    display_wins = "#{" "*(5-num_digits(player.wins))}#{player.wins}"
    display_losses = "#{" "*(7-num_digits(player.losses))}#{player.losses}"
    puts "| #{display_rank}   #{display_name} #{display_wins} #{display_losses}  |"
  end
  puts "------------------------------------------------------------"
  puts "Press <ENTER> to return to the MAIN MENU"
  gets
end
