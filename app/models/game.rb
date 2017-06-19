require 'pry'
class Game

attr_reader :player, :executioner
attr_accessor :bad_guesses, :gallows, :status



  def initialize (player, executioner)
    # Have the Executioner generate the secret word
    @player = player
    @executioner = executioner
    @status = "new"
    self.bad_guesses = 0
    # Display the hangman and blanks
    # Blanks is a hash of the positions of each letter and what letters have been revealed
    # Get the player's first guess

  end

  def start
    self.status = "playing"
    self.gallows = Gallows.new
    self.executioner.generate_secret_word
    blanks_display = ((" _ ") * self.executioner.secret_word.answer.size).split
    puts "Here is your word, #{self.player.name}: #{blanks_display.join(" ")}"
    get_player_guess
  end

  def display_hangman_and_blanks
    # Draws hangman picture
    # Displays the blanks and letters that have been revealed
    # Calls check_game_status
    self.gallows.draw(self.bad_guesses)
    self.executioner.secret_word.update_blanks
    self.check_game_status


  end


  def check_game_status
    # Checks to see if all blanks are revealed: If so, the player wins;  Call end_game
    # Checks to see if the man is hung: If so, the Executioner wins;  Call end_game
    self.end_game(self.player) if self.executioner.secret_word.revealed
    self.end_game(self.executioner) if self.bad_guesses == 9
    self.get_player_guess if self.status != "ended"

  end

  def get_player_guess
    # get player input of a letter (or Quit command) (or a word guess)
    # If player guesses a letter, send the guess to Executioner (evaluate_guess)
    # Update the board with any revealed letters (update_blanks)
    # If player guesses the word, send the guess to Executioner (evaluate_word_guess)
    puts "#{self.bad_guesses} bad guesses so far."
    puts "Enter your guess (letter or word), or 'quit' to quit: "
    guess = gets.chomp.upcase

    if guess.length == 1 && ('A'..'Z').to_a.include?(guess)
      letter = guess
    elsif guess.length > 1
      word_guess = guess
    else
      puts "Please enter a valid character."
      get_player_guess
    end

    if word_guess == "quit"
      end_game(self.executioner)
    end



    if word_guess != nil
      if self.executioner.evaluate_word_guess(word_guess) == true
      end_game(self.player)
      else
        puts "Incorrect."
        sleep(1)
        self.bad_guesses += 1
        display_hangman_and_blanks
      end
      return
    end

    if self.executioner.evaluate_guess(letter) == true
      puts "Correct!"
      sleep(1)
      display_hangman_and_blanks
    else
      puts "Incorrect."
      sleep(1)
      self.bad_guesses += 1
      display_hangman_and_blanks
    end

  end


  def end_game(winner)
    self.status = "ended"
    if winner == self.player
      puts "Congratulations #{self.player.name}, you won!"
      self.player.games_won += 1
      self.executioner.games_lost += 1
    end
    if winner == self.executioner
      puts "YOU LOSE! Better luck next time."
      self.executioner.games_won += 1
      self.player.games_lost += 1
    end
    puts "Your wins: #{self.player.games_won}"
    puts "Do you want to play again ('y'/'n')"
    response = gets.chomp.downcase
    if response == 'y'
      new_game = Game.new(self.player, self.executioner)
      new_game.start
    else
      puts "Bye!  Have a great day!"
    end
    # Display a message about the winner of the game
    # Update player's and executioner's games_won_lost
    # Ask the user if they want to play another game.  If so, create a new game and start it.
    # If not, Return to the main screen
  end






end
