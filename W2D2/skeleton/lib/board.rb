require_relative "player"
require "byebug"
class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1="Erica", name2="James")
    @cups = Array.new(14) { [] }
    @player1 = Player.new(name1, 2)
    @player2 = Player.new(name2, 2)
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless [6, 13].include?(i)
        cup.concat([:stone, :stone, :stone, :stone])
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].length.zero?
  end

  def make_move(start_pos, current_player_name)
    stones = []
    stones << @cups[start_pos].shift until @cups[start_pos].empty?

    index_increment = 1
    until stones.empty?
      new_idx = start_pos + index_increment
      new_idx = new_idx % 13  if new_idx > 13
      unless (current_player_name == @player1.name && new_idx == 13) || (current_player_name == @player2.name && new_idx == 0)
        @cups[new_idx] << stones.pop
      end
      index_increment += 1
    end
    render
    next_turn((start_pos + index_increment) % 13)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
