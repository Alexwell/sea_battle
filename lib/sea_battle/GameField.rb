class GameField
  @@cell_default = " ~ "
  @@cell_shooted = " + "
  @@cell_ship = "[ ]"
  @@cell_border = " - "
  @@cell_damaged = "[x]"

  attr_reader :coordinates

  def initialize(size)
    @size = size + 1
    @coordinates = create_game_field
  end


  def print_game_field(flag = "my_field")
    print " "
    print " " if @size > 9
    (1...@size).each { |i| print " #{i} " }
    puts
    i = 1
    while i < @size
      print i
      print " " if i < 10
      j = 0
      while j< @size - 1
        print " " if j > 9
        if flag == "my_field"
          print @coordinates[i + @size*j][2]
        else
          if @coordinates[i + @size*j][2] == @@cell_damaged
            print @@cell_damaged
          elsif @coordinates[i + @size*j][2] == @@cell_shooted
            print @@cell_shooted
          else
            print @@cell_default
          end
        end
        j += 1
      end
      j = 0
      puts
      i += 1
    end
  end



  def ship_set(ship, x, y)
    x -= 1
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
            @coordinates[i  + ship.size + @size][2] = @@cell_border unless @coordinates[i  + ship.size + @size] == nil
          else
            @coordinates[i + @size*j][2] = @@cell_ship

            @coordinates[i - 1 - @size][2] = @@cell_border
            @coordinates[i - @size][2] = @@cell_border
            @coordinates[i - 1 + @size*ship.size][2] = @@cell_border unless @coordinates[i - 1 + @size*ship.size] == nil
            @coordinates[i - 1 + @size * j][2] = @@cell_border

            @coordinates[i + 1 - @size][2] = @@cell_border
            @coordinates[i + @size*ship.size][2] = @@cell_border unless @coordinates[i + @size*ship.size] == nil
            @coordinates[i + 1 + @size*ship.size][2] = @@cell_border unless @coordinates[i + 1 + @size*ship.size] == nil
            @coordinates[i + 1 + @size * j][2] = @@cell_border
          end
          j += 1
        end
      end
      i += 1
    end
    p "Ship successfully set"
    return true
  end

  def auto_field_filling
    fleat = []
    fleat << Ship.new(4, [true, false].sample)
    2.times {fleat << Ship.new(3, [true, false].sample)}
    3.times {fleat << Ship.new(2, [true, false].sample)}
    4.times {fleat << Ship.new(1, [true, false].sample)}
    fleat.each{|i| p i.size , i.vertical}

    i = 0
    while i < fleat.length
      i += 1 if ship_set(fleat[i], rand(1...@size), rand(1...@size))
    end
  end

  def shoot(x,y)
    x -= 1
    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y
        @coordinates[i][2] = @coordinates[i][2] == @@cell_ship ? @@cell_damaged : @@cell_shooted
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
    if ship.vertical
      if y  + ship.size > @size
        p "Wrong coordinate 'y', ship is too big!"
        return false
      end
    else
      if x  + ship.size >= @size
        p "Wrong coordinate 'x', ship is too big!"
        return false
      end
    end
    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y
        j = 0
        while j < ship.size
          if ship.vertical
            if  @coordinates[i + j][2] != @@cell_default
              p "Cell is already filled, vertical"
              return false
            end
          else
            if @coordinates[i + @size * j][2] != @@cell_default
              p "Cell is already filled, horizontal"
              return false
            end
          end
          j += 1
        end
      end
      i += 1
    end
    true
  end


end
