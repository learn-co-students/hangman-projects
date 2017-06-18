def load_good
puts "game loaded successfully!"
pry.start
end

def greeting
  # Displays a greeting on the screen
end


def display_commands
  # Displays all available options (start a new game, see stats, quit)

end

def get_user_input
  # Uses gets to wait for a command
end



def start_game
  # Create a player
  # Create an executioner
  # Create a game and start it
end

def goodbye
  # Display a goodbye message
end

def draw_hangman (num)
  # Draws the appropriate hangman picture using our game instance variable bad_guesses
  my_ascii_pic = File.read("app/hangman_picture_#{num}.txt")
  system "clear"
  puts my_ascii_pic
end
