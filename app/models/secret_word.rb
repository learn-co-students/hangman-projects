class SecretWord

  attr_reader :answer

  def initialize
    @answer = RandomWord.nouns(not_longer_than: 8).next.upcase
  end



end
