class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless [6, 13].include?(idx)
    end
  end

  def valid_move?(start_pos)
    raise ArgumentError.new("Invalid starting cup") unless (0..12).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    curr_cup = start_pos
    until @cups[start_pos].empty?
      curr_cup = (curr_cup + 1) % 14
      case current_player_name
      when @player1 then next if curr_cup == 13
      else next if curr_cup == 6
      end
      @cups[curr_cup] << @cups[start_pos].pop
      # system('clear')
      # render
      # sleep(1)
    end
    render
    next_turn(curr_cup)
  end

  def next_turn(curr_cup)
    return :prompt if [6, 13].include?(curr_cup)
    return curr_cup if @cups[curr_cup].length > 1
    return :switch if @cups[curr_cup].length == 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? }
    return true if @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    player1_score = @cups[0..6].reduce(0) { |score, cup| score + cup.length }
    player2_score = @cups[7..13].reduce(0) { |score, cup| score + cup.length }
    case player1_score <=> player2_score
      when -1 then return @player2
      when 0 then return :draw
      when 1 then return @player1
    end
  end
end
