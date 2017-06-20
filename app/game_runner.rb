class GameRunner
  attr_reader :user, :game, :display
  attr_accessor :user_input

  def initialize
    @exit = false
  end

  def welcome_user
    Display.welcome_message
    Display.name_prompt
    @user = User.new(gets.chomp)
  end

  def difficulty_level(user_input)
    case user_input.downcase
    when "m"
      :medium
    when "h"
      :hard
    else
      :easy
    end
  end

  def start_new_game
    Display.prompt_for_difficulty
    @game = Hangman.new(difficulty_level(gets.chomp))
    @game.session = self
    @display = Display.new(@game)
    @user_input = Input.new(@game)
    self.game.play_game
  end

  def play_game
    @game.play_game
  end

  def run_selected_option(user_input)
    case user_input.downcase
    when "p"
      start_new_game
    when "s"
      self.display.score
    when "q"
      puts "Goodbye!"
      @exit = true
    else
      puts "Invalid input!"
    end
  end

  def show_user_options
    until @exit == true
      self.display.user_options
      run_selected_option(gets.chomp)
    end
  end

  def run_game
    welcome_user
    start_new_game
    show_user_options
  end

end
