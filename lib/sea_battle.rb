require "./sea_battle/GameField.rb"
require "./sea_battle/Ship.rb"


def main
  f = GameField.new 10
  # p f.coordinates
  f.print_game_field
  # f.create_game_field
  # p f.coordinates
  # f.coordinates.each{|i| puts "#{i[0]} <==> #{i[0].next}"}


  s4_0 = Ship.new(4, false)
  s3_1_0 = Ship.new(3, false)
  s3_2_1 = Ship.new(3, true)
  s2_1_0 = Ship.new(2, false)
  s2_2_1 = Ship.new(2, true)
  s2_3_1 = Ship.new(2, true)
  s1_1_0 = Ship.new(1, false)
  s1_2_0 = Ship.new(1, false)
  s1_3_1 = Ship.new(1, true)
  s1_4_1 = Ship.new(1, true)


  f.ship_set(s4_0, 1, 10)
  f.ship_set(s3_1_0, 2, 8)
  f.ship_set(s3_2_1, 1, 4)
  f.ship_set(s2_1_0, 9, 1)
  f.ship_set(s2_2_1, 10, 9)
  f.ship_set(s2_3_1, 1, 1)
  f.ship_set(s1_1_0, 6, 8)
  f.ship_set(s1_2_0, 5, 4)
  f.ship_set(s1_3_1, 6, 6)
  f.ship_set(s1_4_1, 7, 1)
  
  f.print_game_field
  p f.coordinates

  # f.coordinates.each{ |i, j, k| puts i,j,k}
end


if __FILE__ == $0
  main
end
