class GameField
  @@cell_default = " ~ "
  @@cell_shooted = " - "
  @@cell_ship = "[ ]"
  @@cell_damaged = " x "
  
  attr_reader :coordinates

  def initialize(size)
    @size = size
    @coordinates = create_game_field
  end
  
  def print_game_field
    print " "
    (0...@size).each {|i| print " #{i} "}
    puts
    print "0"
    @coordinates.each {|i| 
      if  i[1] != @size - 1
        print i[2]
      else
        puts i[2]
        if i[0].next < @size
          print i[0].next
        end
      end
    }
  end


  def set_ship(ship, x, y)
    # TODO Why k.replace(@@cell_ship) doesn't work correct? Replaced all field!

    # p "#{ship} in the sea!!! And has #{ship.size} boats. Vertical = #{\
    # ship.vertical}. X = #{x}, Y = #{y}"

    # @coordinates.each {|i, j, k| 
    #   p "coords!===== #{i} #{j} ==>#{k}" 
    #   if i == x && j == y 
    #     p "before!!!!!!===== #{i} #{j} ==>#{k}" 
    #     k.replace(@@cell_ship)
    #     p "after!!!!!!===== #{i} #{j} ==>#{k}" 
    #   end}

    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y
        @coordinates[i][2] = @@cell_ship
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

  
end