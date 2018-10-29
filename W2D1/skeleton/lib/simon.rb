class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize()
    @game_over = false
    @seq = []
    @sequence_length = 1

  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1

    unless game_over
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      p color
      sleep(1)
      system("clear")
    end

  end

  def require_sequence
    guess = []
    @sequence_length.times do |i|
      puts "Type a color \n=>"
      guess << gets.chomp
    end
    @game_over = true unless guess == @seq

  end

  def add_random_color
    seq << COLORS.sample


  end

  def round_success_message
    puts "Success"

  end

  def game_over_message
    puts "You blew it"

  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end

# if __FILE__ == $PROGRAM_NAME
#   game = Simon.new
#   game.play
# end
