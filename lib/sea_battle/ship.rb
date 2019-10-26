# frozen_string_literal: true

# basic ship class
class Ship
  attr_reader :size, :vertical
  def initialize(size = 4, vertical = true)
    @size = size
    @vertical = vertical
  end
end
