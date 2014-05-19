class Board
  attr_reader :grid, :size

  def initialize(n)
    raise StandardError unless n.odd? && n > 1
    @size = n
    @grid = Array.new(size) { Array.new(size) }
  end

  def array(x,y)
    [x,y].each{ |e| raise StandardError unless e >= 0 && e <= @size }
  end

  def fill_in
    @grid.map!{ |arr| arr.map!{|el| el = '.'}}
  end
end
