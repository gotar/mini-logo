class OutOfBoard < StandardError; end

class Board
  attr_reader :size, :grid
  attr_accessor :current_position

  EMPTY_CHAR = '.'
  USED_CHAR = 'X'

  def initialize(n)
    raise StandardError unless n.odd? && n > 1
    @size = n
    @current_position = {x: size/2, y: size/2}
    fill_initial_grid
  end

  def array(x,y)
    [x,y].each{|e| raise StandardError unless e >= 0 && e <= size}
  end

  def move(x,y)
    [x,y].each do |e|
      raise ArgumentError unless e.is_a?(Integer)
      raise OutOfBoard if (e >= size-1 || e < 0)
    end
    @current_position = {x: x, y: y}
    @grid[y][x] = USED_CHAR
  end

  def draw
    @grid.each_with_index do |row, i|
      print "\\033c"
      print "#{row.join(' ')}"
      print "\n" unless i == grid.size - 1
    end
  end

  private
  def fill_initial_grid
    @grid = Array.new(size) do |x|
      Array.new(size) do |y|
        (x == size/2 && y == size/2) ? USED_CHAR : EMPTY_CHAR
      end
    end
  end
end
