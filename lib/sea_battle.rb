# frozen_string_literal: true

require './sea_battle/game_field.rb'
require './sea_battle/ship.rb'

def main
  manual_test
end

def test
  f = GameField.new 10
  f.print_game_field
  s40 = Ship.new(4, false)
  s310 = Ship.new(3, false)
  s321 = Ship.new(3, true)
  f.ship_set(s40, 1, 10)
  f.ship_set(s310, 2, 8)
  f.ship_set(s321, 1, 4)
  f.print_game_field
  f.auto_field_filling
end

def auto_field_filling
  f = GameField.new 10
  f.print_game_field
  f.auto_field_filling
  f.print_game_field
  # f.print_game_field(true)
  f.shoot(2, 4)
  f.shoot(4, 3)
  f.shoot(7, 8)
  f.shoot(1, 3)
  f.shoot(3, 5)
  f.print_game_field(true)
end

def manual_test
  f = GameField.new 10
  f.auto_field_filling
  f.print_game_field(true)
  20.times do
    puts 'Input X then Y'
    x = gets.to_i
    y = gets.to_i
    f.shoot(x, y)
    f.print_game_field(true)
  end
end

main if $PROGRAM_NAME == __FILE__
