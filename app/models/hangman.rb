class Hangman

  @@player1_name = nil
  @@player2_name = nil


  def initialize()
    ###This is not a good practice...
    @player1 = player.new(@@player1_name)
    @player2 = player.new(@@player2_name)
  end

  def self.welcome
    puts "Welcome!! to hangman"
    puts "Please enter player1 name"
    @@player1_name = gets.chomp
    puts "Please enter player2 name"
    @@player2_name = gets.chomp
  end

  def playgame
    until self.game_over? do
      self.get_input
      self.check_input
    end

    puts "hit playgame"

    p @player1
    p @player2
  end


end
