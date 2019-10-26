# frozen_string_literal: true

# game field basic class
class GameField
  @@cell_default = ' ~ '
  @@cell_shooted = ' + '
  @@cell_ship = '[ ]'
  @@cell_border = ' - '
  @@cell_damaged = '[x]'

  attr_reader :coordinates

  def initialize(size)
    @size = size + 1
    @coordinates = create_game_field
    @helping_field = create_game_field
  end

  def print_game_field(helping = false)
    print ' '
    print ' ' if @size > 9
    (1...@size).each { |i| print " #{i} " }
    puts
    print_inner_field(helping)
  end

  def ship_set(ship, coord_x, coord_y)
    coord_x -= 1
    return unless ship_check(ship, coord_x, coord_y)

    i = 0
    while i < @coordinates.length
      if (@coordinates[i][0] == coord_x) && (@coordinates[i][1] == coord_y)
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
            unless @coordinates[i + ship.size + @size].nil?
              @coordinates[i + ship.size + @size][2] = @@cell_border
            end
          else
            @coordinates[i + @size * j][2] = @@cell_ship

            @coordinates[i - 1 - @size][2] = @@cell_border
            @coordinates[i - @size][2] = @@cell_border
            unless @coordinates[i - 1 + @size * ship.size].nil?
              @coordinates[i - 1 + @size * ship.size][2] = @@cell_border
            end
            @coordinates[i - 1 + @size * j][2] = @@cell_border

            @coordinates[i + 1 - @size][2] = @@cell_border
            unless @coordinates[i + @size * ship.size].nil?
              @coordinates[i + @size * ship.size][2] = @@cell_border
            end
            unless @coordinates[i + 1 + @size * ship.size].nil?
              @coordinates[i + 1 + @size * ship.size][2] = @@cell_border
            end
            @coordinates[i + 1 + @size * j][2] = @@cell_border
          end
          j += 1
        end
      end
      i += 1
    end
    p 'Ship successfully set'
    true
  end

  def auto_field_filling
    fleat = []
    fleat << Ship.new(4, [true, false].sample)
    2.times { fleat << Ship.new(3, [true, false].sample) }
    3.times { fleat << Ship.new(2, [true, false].sample) }
    4.times { fleat << Ship.new(1, [true, false].sample) }
    fleat.each { |i| p i.size, i.vertical }

    i = 0
    while i < fleat.length
      i += 1 if ship_set(fleat[i], rand(1...@size), rand(1...@size))
    end
  end

  def shoot(x, y)
    x -= 1
    i = 0
    while i < @coordinates.length
      if (@coordinates[i][0] == x) && (@coordinates[i][1] == y)
        # @helping_field[i][2] =  @@cell_shooted
        @helping_field[i][2] = @coordinates[i][2] == @@cell_ship ? @@cell_damaged : @@cell_shooted
      end
      i += 1
    end
  end

  private

  def create_game_field
    coordinates = []
    @size.times do |x|
      @size.times { |y| coordinates << [x, y, @@cell_default] }
    end
    coordinates
  end

  def print_inner_field(helping)
    @size.times do |i|
      print i
      print ' ' if i < 10
      (@size - 1).times do |j|
        print ' ' if j > 9
        print @coordinates[i + @size * j][2] unless helping
        print @helping_field[i + @size * j][2] if helping
      end
      puts
    end
  end

  def ship_check(ship, coord_x, coord_y)
    if ship.vertical
      if coord_y + ship.size > @size
        p "Wrong coordinate 'y', ship is too big!"
        return false
      end
    elsif coord_x + ship.size >= @size
      p "Wrong coordinate 'x', ship is too big!"
      return false
    end
    @coordinates.length.times do |i|
      next unless @coordinates[i][0] == coord_x && @coordinates[i][1] == coord_y

      ship.size.times do |j|
        if ship.vertical && @coordinates[i + j][2] != @@cell_default
          p 'Cell is already filled, vertical'
          return false
        elsif @coordinates[i + @size * j][2] != @@cell_default
          p 'Cell is already filled, horizontal'
          return false
        end
      end
    end
    true
  end
end
