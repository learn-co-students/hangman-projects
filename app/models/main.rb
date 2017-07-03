def load_good
puts "game loaded successfully!"
# pry.start
end

def greeting
  # Displays a greeting on the screen
  puts "Welcome! Let's get started: "
end


def display_commands
  # Displays all available options (start a new game, see stats, quit)
  puts "1. Play hangman ('play')"
  puts "2. Exit session ('exit')"
end

def get_user_input
  # Uses gets to wait for a command
  response = gets.downcase.chomp
  case response
  when "play" then start_game
  when "1" then start_game
  when "exit" then goodbye
  when "2" then goodbye
  else
    puts "Not a valid entry. Please enter one of the commands listed."
    # NOTE stay at the same level of abstraction
    display_commands
  end
end



def start_game
  # Create a player (get player's name)
  # Create an executioner
  # Create a game and start it
  print "Enter your name: "
  name = gets.chomp
  player_1 = Player.new(name)
  computer = Executioner.new
  current_game = Game.new(player_1, computer)
  current_game.start
end



def goodbye
  # Display a goodbye message
  puts "Bye!  Have a great day!"
end

def draw_hangman (num)
  # Draws the appropriate hangman picture using our game instance variable bad_guesses
  my_ascii_pic = File.read("app/hangman_picture_#{num}.txt")
  # NOTE this is cool
  system "clear"
  puts my_ascii_pic
end
