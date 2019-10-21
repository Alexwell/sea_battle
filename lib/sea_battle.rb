require "./sea_battle/GameField.rb"
require "./sea_battle/Ship.rb"


def main
  manual_test2

end

def test
  f = GameField.new 10

  f.print_game_field

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

  
  p rand(4)

  f.auto_field_filling
  p [true, false].sample
end

def auto_field_filling
  f = GameField.new 10
  f.print_game_field
  f.auto_field_filling
  f.print_game_field
  # f.print_game_field(true)
  f.shoot(2,4)
  f.shoot(4,3)
  f.shoot(7,8)
  f.shoot(1,3)
  f.shoot(3,5)
  f.print_game_field(true)

end

def manual_test
  f = GameField.new 10
  # p f.coordinates
  f.print_game_field()
  f.auto_field_filling
  f.print_game_field()
  i = 0
  # p f.coordinates

  while i < 20
    puts "Input X"
    x = gets.to_i
    puts "Input Y"
    y = gets.to_i
    f.shoot(x,y)
    f.print_game_field()
    
    i += 1
  end
end

def manual_test2
  # my_field = GameField.new 10
  enemy_field = GameField.new 10
 
  enemy_field.auto_field_filling
  20.times { puts "Input X"
    x = gets.to_i
    puts "Input Y"
    y = gets.to_i
    enemy_field.print_game_field "enemy"
    enemy_field.shoot(x,y)
    enemy_field.print_game_field "my_field"
    enemy_field.print_game_field "enemy"}
end

if __FILE__ == $0
  main
end
