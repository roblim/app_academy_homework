require 'colorize'
require 'byebug'

class Simon
  COLORS = {'r' => "(r)ed".colorize(:red),
            'b' => "(b)lue".colorize(:blue),
            'g' => "(g)reen".colorize(:green),
            'y' => "(y)ellow".colorize(:yellow)
            }

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @player = ''
    @scoreboard = File.readlines("scoreboard.txt").map(&:chomp)
  end

  def play
    system('clear')
    puts "\n\nWelcome to Simon. #{@scoreboard.first}"
    puts "\n"
    print "Enter your name to play: "
    @player = gets.chomp
    until @game_over
      take_turn
      system('clear')
    end
    game_over_message
    File.open("scoreboard.txt", "w") do |f|
      f.puts "HIGH SCORE: #{@player} || #{sequence_length - 1} Points"
    end
    reset_game
    play_again = gets.chomp
    return if play_again == 'q'
    play
  end

  def take_turn
    show_sequence
    sleep(1)
    system('clear')
    attempt = require_sequence
    @game_over = true unless @seq == attempt
    unless @game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |el|
      print "\n#{el} "
      sleep(1)
    end
  end

  def require_sequence
    puts "Please enter the CORRECT sequence of colors.\n\n"
    print "\nGo on, try: "
    guess = gets.chomp.split.map { |color_key| color_key = COLORS[color_key] }
  end

  def add_random_color
    @seq << COLORS.to_a.sample[1]
  end

  def round_success_message
    print "\nAwesome job!"
  end

  def game_over_message
    puts "\n\n"
    print "    ███▀▀▀██┼███▀▀▀███┼███▀█▄█▀███┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼
    ██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀
    ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼
    ███▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄
    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
    ███▀▀▀███┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼
    ██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼┼██┼
    ███▄▄▄███┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄
    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼████▄┼┼┼▄▄▄▄▄▄▄┼┼┼▄████┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼▀▀█▄█████████▄█▀▀┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼█████████████┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼██▀▀▀███▀▀▀██┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼██┼┼┼███┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼█████▀▄▀█████┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼┼███████████┼┼┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼▄▄▄██┼┼█▀█▀█┼┼██▄▄▄┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼▀▀██┼┼┼┼┼┼┼┼┼┼┼██▀▀┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼
    ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼"

    puts "\n\nUh oh! GAME OVER PAL! Your Score: #{@sequence_length - 1}"
    print "\n<Press enter to play again. Enter 'q' to quit.> "
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    @scoreboard = File.readlines("scoreboard.txt").map(&:chomp)
  end
end

if __FILE__ == $PROGRAM_NAME
  # debugger
  x = Simon.new
  x.play
end
