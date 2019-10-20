class GameField
  @@cell_default = " ~ "
  @@cell_shooted = " + "
  @@cell_ship = "[ ]"
  @@cell_border = " $ "
  @@cell_damaged = " x "

  attr_reader :coordinates

  def initialize(size)
    @size = size
    @coordinates = create_game_field
  end

  def print_game_field
    print " "
    (0...@size).each { |i| print " #{i} " }
    puts
    i = 0
    while i < @size
      print i
      j = 0
      while j< @size
        print @coordinates[i + @size*j][2]
        # print " #{@coordinates[i+@size*j][0]} <=> #{@coordinates[i+@size*j][1]} "
        j += 1
      end
      j = 0
      puts
      i += 1
    end

  end


  def ship_set(ship, x, y)
    if !ship_check(ship, x, y)
      return
    end
    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y
        j = 0
        while j < ship.size
          if ship.vertical
            @coordinates[i + j][2] = @@cell_ship
            
            @coordinates[i - 1][2] = @@cell_border
            @coordinates[i - 1 - @size][2] = @@cell_border
            @coordinates[i + ship.size - @size][2] = @@cell_border
            @coordinates[i + j - @size][2] = @@cell_border

            @coordinates[i + ship.size][2] = @@cell_border
            @coordinates[i - 1 + @size][2] = @@cell_border 
            @coordinates[i + j + @size][2] = @@cell_border 
            @coordinates[i  + ship.size + @size][2] = @@cell_border
          else
            @coordinates[i + @size*j][2] = @@cell_ship

          end
          j += 1
        end
      end
      i += 1
    end

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


  def ship_check(ship, x, y)
    sum_x = x + ship.size
    sun_y = y + ship.size
    if sum_x > @size or sun_y > @size
      p "Wrong coordinate, ship is too big!"
      return false
    end

    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y \
          and @coordinates[i][2] != @@cell_default
        p "Cell is already filled"
        return false
      end
      i += 1
    end
    true
  end


end
