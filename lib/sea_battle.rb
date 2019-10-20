require "./sea_battle/GameField.rb"
require "./sea_battle/Ship.rb"


def main
  f = GameField.new 10
  # p f.coordinates
  f.print_game_field
  # f.create_game_field
  # p f.coordinates
  # f.coordinates.each{|i| puts "#{i[0]} <==> #{i[0].next}"}
  s4_1 = Ship.new(4, true)
  s3_1 = Ship.new(3, false)
  s3_2 = Ship.new(3, false)
  s2_1 = Ship.new(2, true)
  s2_2 = Ship.new(4, false)
  s2_3 = Ship.new(2, false)
  s1_1 = Ship.new(1, true)
  s1_2 = Ship.new(1, true)
  s1_3 = Ship.new(1, false)
  s1_4 = Ship.new(1, false)
  
  # p f.coordinates

  # f.set_ship(s3_2, 5, 2)
  # f.set_ship(s3_1, 0, 0)
  # f.set_ship(s3_1, 2, 0)
  # f.set_ship(s3_1, 5, 1)
  # f.set_ship(s3_1, 3, 7)
  f.ship_set(s2_2, 5, 3)
  f.print_game_field
  p f.coordinates

  # f.coordinates.each{ |i, j, k| puts i,j,k}
end


if __FILE__ == $0
  main
end