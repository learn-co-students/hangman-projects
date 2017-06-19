require 'pry'

# assuming the word is 'hangman'

def word_to_array(word)
  word_array = word.split("")
end

def guess_array(word_array)
  guess_array = Array.new(word_array.length)
end

def take_a_guess
  puts "Guess a letter or word: "
  guess = gets.chomp.downcase
end

def checker(word_array, guess_array)
  penalty = 0
  miss = []
  p guess_array(word_to_array('hangman'))
  while penalty < 7
    guess = take_a_guess
    if guess == word_array.join
      abort("Yay!")
    elsif word_array.include?(guess)
      word_array.each_with_index do |letter, index|
        guess_array[index] = letter if letter == guess
      end
      p guess_array
      abort ("Yay!") if guess_array == word_array
    else
      penalty += 1
      p miss << guess
    end
  end
  puts "You lose. :()"
end

a = word_to_array('hangman')
b = guess_array(word_to_array('hangman'))
checker(a,b)
