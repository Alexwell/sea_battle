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
    print "0"
    @coordinates.each { |i|
      if i[1] != @size - 1
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


    # @coordinates.each do |i|
    #   if i[0] == x && i[1] == y
    #     i[2] = @@cell_ship
    #   end
    # end


    i = 0
    while i < @coordinates.length
      if @coordinates[i][0] == x and @coordinates[i][1] == y
        if @coordinates[i][2] != @@cell_default
          # @coordinates[i][2] = @@cell_ship
          p "A1"
          return
        end
        if !ship.vertical
          p "AA"
          j = 1
          trigger = false
          # if  @coordinates[i+ship.size - 1][1] <=  @coordinates[i][1]
          #   p "aaa"
          #   trigger = true
          # end
          while j < ship.size

            # if @coordinates[i + ship.size - 1] == nil

            #   p 'a100'
            #   return
            # end

            if @coordinates[i + ship.size - 1] == nil  or @coordinates[i + j][2] != @@cell_default  or @coordinates[i + ship.size - 1][1] <= @coordinates[i][1]
              # @coordinates[i + j][2] = @@cell_ship
              p "A2"
              trigger = true
              # p trigger
              # return
            end
            j += 1
          end
          if !trigger
            p "A3"
            j = 0
            while j < ship.size
              @coordinates[i + j][2] = @@cell_ship
              @coordinates[i + j - @size][2] = @@cell_border if @coordinates[i + j - @size][0] != (@size - 1 or nil)
              @coordinates[i + j + @size][2] = @@cell_border if @coordinates[i + j + @size] != nil
              j += 1
            end
            @coordinates[i - 1][2] = @@cell_border if @coordinates[i - 1][1] != (@size - 1 or nil)
            @coordinates[i - 1 - @size][2] = @@cell_border if @coordinates[i - 1-@size][0] != (@size - 1 ) and  @coordinates[i - 1-@size][1] != (@size - 1 ) 
            @coordinates[i - 1 + @size][2] = @@cell_border unless @coordinates[i - 1 + @size] == nil or @coordinates[i - 1 + @size][1] == (@size - 1 or nil)
            @coordinates[i + j][2] = @@cell_border if @coordinates[i + j] != nil and @coordinates[i + j][0] == @coordinates[i][0]

            # @coordinates[i + j - @size][2] = @@cell_border unless @coordinates[i + j - @size] == nil or @coordinates[i + j- @size][0] == @coordinates[i ][0]
            @coordinates[i + j - @size][2] = @@cell_border if @coordinates[i + j - @size] != nil or @coordinates[i + j- @size][0] == @coordinates[i ][0] and @coordinates[i + j- @size][0] != @size -1
            # @coordinates[i + j + @size][2] = @@cell_border unless @coordinates[i + j + @size] == nil or @coordinates[i+ @size * 2 ] == nil or @coordinates[i + j+ @size][0] == @coordinates[i+ @size * 2 ][0]

            if @coordinates[i + j + @size] != nil
                    @coordinates[i + j + @size][2] = @@cell_border
            end

          else
            p "A4"
            return
          end
        else
          j = 1
          k = i
          while j < ship.size
            if @coordinates[k + @size][2] == @@cell_default
              @coordinates[k + @size][2] = @@cell_ship
              k = k + @size
              j += 1
            else
              p "A3"
              return
            end
          end
        end
        # @coordinates[i+ship.size][2] = @@cell_ship

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
