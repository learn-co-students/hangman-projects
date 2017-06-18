require 'require_all'
require 'pry'

require_all 'lib'

word = Word.new
puts "library: #{Word.library}"
puts "used words: #{Word.used_words}"
new_word = Word.new
puts "library: #{Word.library}"
puts "used words: #{Word.used_words}"
guess = 'a'
puts word.display_board
word.guess(guess)
puts word.display_board
