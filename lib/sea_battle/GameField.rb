class GameField
  @@cell_default = "~"
  @@cell_shooted = "-"
  @@cell_ship = "="
  @@cell_damaged = "x"

  attr_reader :coordinates
  def initialize(size)
    @size = size
    @coordinates = create_game_field
  end
  
  def print_game_field
    @coordinates.each {|i| puts "i = #{i[2]}"}
  end

  private

  def create_game_field
    coordinates = []
    x = 0
    y = 0
    while x < @size
      while y < @size
        coordinates << [x, y, @@cell_default]
        y += 1
      end
      x += 1
      y = 0
    end
      coordinates
  end

  
end