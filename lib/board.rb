class Board
  attr_reader :grid, :size, :position

  def initialize(n)
    raise StandardError unless n.odd? && n > 1
    @size = n
    @grid = Array.new(size) { Array.new(size) }
    @position ||= {x: size / 2, y: size / 2}
  end

  def array(x,y)
    [x,y].each{ |e| raise StandardError unless e >= 0 && e <= @size }
  end
end
