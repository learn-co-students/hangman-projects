require 'pry'

class User
  attr_accessor :name, :wins, :losses, :games

  @@all = []

  def initialize (name)
    @name = name
    @@all << self
    @wins = 0
    @losses = 0
  end


  def self.all
    @@all
  end

end

class Games
  attr_accessor :user
  @@all = []
  def initialize(name)
    @user = User.new(name)
    @@all << self
  end
  def self.all
    @@all
  end
end

def new_game
  Games.new(get_user)
end

def get_user
  name = gets.chomp
  # User.new(name)
end

def welcome
  puts "Welcome, please enter your name"
  new_game
  # binding.pry
end

def random_word
  # random = RandomWordGenerator.word
  "hamburger"
end

def word_to_display(random_word)
  random_word.split("")
end

def remaining_letters_missing(random_word)
  remaining = Array.new(random_word.length)
end

# def word_to_array(word)
#   word_array = word.split("")
# end
#
#
# def guess_array(word_array)
#   guess_array = Array.new(word_array.length)
# end

def take_a_guess
  puts "Guess a letter or word: "
  guess = gets.chomp.downcase
end

def checker(original_word, remaining_letters, user)
  penalty = 0
  miss = []
  while penalty < 7
    guess = take_a_guess
    if guess == original_word.join
      user.wins += 1
      p user.name
      puts ("Yay!")
      new_game_welcome(user)
      #checks to see if the game is won
      # TODO: another elsif to check if the letter has been guessed before
    elsif original_word.include?(guess)
      original_word.each_with_index do |letter, index|
        remaining_letters[index] = letter if letter == guess
        #changes letter if found
        #split into different method
      end
      displayer(remaining_letters)
      abort ("Yay!") if remaining_letters == original_word && new_game_welcome(user)
    else
      penalty += 1
      p "WRONG #{wrong_letters(miss, guess)}"
    end
  end
  user.losses += 1
  puts "You lose. :()"
  new_game_welcome(user)

end

def wrong_letters(miss, guess)
  miss << guess
  miss.join(", ")
end

def displayer(remaining_letters)
  remaining_letters.each do |letter|
    if letter == nil
      print "_ "
    else
      print letter + " "
    end
  end
end

def new_game_welcome(old_user)
  puts "Do you want to play again? Y or N?"
  answer = gets.chomp
  if answer.downcase == "y"
    blah = Games.new(old_user.name)
    binding.pry
    blah.user = old_user

    puts "welcome back #{user.name}"
    random = random_word
    a = word_to_display(random)
    b = remaining_letters_missing(random)
    checker(a, b, old_user)
    # checker(["a", "n", "d"], [nil,nil,nil], new_user)
    # play game
  else
    puts "New player enter your name OR type EXIT to leave"
    answer = gets.chomp
    if answer == "Exit"
      puts "Goodbye"
      # break
    else
      Games.new(answer)
    end
  end
end



def body_parts
  body = ["Here's your left leg", "And your right leg", "There's your body",
  "A left arm", "A right arm", "I see your neck... be careful", "Your head... your hanged"]

end

# # welcome
# a = word_to_array('hangman')
# b = guess_array(('hangman'))
# game = welcome
# random = random_word
# a = word_to_display(random)
# b = remaining_letters_missing(random)
# checker(a,b, game.user)
