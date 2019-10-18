require "./sea_battle/GameField.rb"

def main
  f = GameField.new 10
  p f.coordinates
  f.print_game_field
  # f.create_game_field
  # p f.coordinates
end


if __FILE__ == $0
  main
end