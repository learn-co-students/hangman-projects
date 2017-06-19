require 'pry'
class Game

attr_reader :whose_turn, :player, :executioner, :blanks
attr_accessor :bad_guesses



  def initialize (player, executioner)
    # Have the Executioner generate the secret word
    @player = player
    @executioner = executioner
    self.bad_guesses = 0
    # Display the hangman and blanks
    # Blanks is a hash of the positions of each letter and what letters have been revealed
    # Get the player's first guess

  end

  def start
    self.executioner.generate_secret_word
    blanks_display = ((" _ ") * self.executioner.secret_word.size).split
    puts "Here is your word, #{self.player.name}: #{blanks_display.join(" ")}"
    get_player_guess
  end

  def display_hangman_and_blanks
    # Draws hangman picture
    # Displays the blanks and letters that have been revealed
    # Calls check_game_status
    draw_hangman
    blanks_display = ((" _ ") * self.executioner.secret_word.size).split
    puts "Here is your word, #{self.player.name}: #{blanks_display.join(" ")}"
  end

  def draw_hangman
    # Draws the appropriate hangman picture using our game instance variable bad_guesses
    my_ascii_pic = File.read("app/hangman_picture_#{self.bad_guesses}.txt")
    system "clear"
    puts my_ascii_pic
  end

  def check_game_status
    # Checks to see if all blanks are revealed: If so, the player wins;  Call end_game
    # Checks to see if the man is hung: If so, the Executioner wins;  Call end_game
  end

  def get_player_guess
    # get player input of a letter (or Quit command) (or a word guess)
    # If player guesses a letter, send the guess to Executioner (evaluate_guess)
    # Update the board with any revealed letters (update_blanks)
    # If player guesses the word, send the guess to Executioner (evaluate_word_guess)
    puts "Enter your guess (letter or word), or 'quit' to quit: "
    guess = gets.chomp.upcase
    case guess.length
    when 0 then get_player_guess
    when 1 then letter = guess
    else
      word_guess = guess.downcase
    end

    if word_guess == "quit"
      end_game(computer)
    end



    if word_guess != nil
      if computer.evaluate_word_guess(word_guess) == true
      end_game(player_1)
      else
        puts "Incorrect."
        bad_guesses += 1
      end
    end



  end

  def update_blanks(letter, guess_results)
    # Takes an argument of the letter guessed by the player, and the results of the guess returned by the executioner.
    # Update blanks by putting the correctly guessed letter in the specified places
    # Then, call display_hangman_and_blanks again

  end


  def end_game(winner)
    # Display a message about the winner of the game
    # Update player's and executioner's games_won_lost
    # Ask the user if they want to play another game.  If so, create a new game and start it.
    # If not, Return to the main screen
  end






end
