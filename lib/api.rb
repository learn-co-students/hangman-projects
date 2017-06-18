require 'require_all'
require 'pry'
require 'unirest'

require_all 'lib'


def get_synonyms(word)
  root_word = word.answer
  response = Unirest.get "https://wordsapiv1.p.mashape.com/words/#{root_word}/synonyms",
  headers:{
    "X-Mashape-Key" => "zgo00BG7RRmshJnS6VwwquK8vmYip1hePaXjsnYkh6UE97WKnj",
    "Accept" => "application/json"
  }
  # binding.pry
  synonyms = response.body["synonyms"]
  synonyms.join(', ')
end

# def get_hint()
# Pry.start
