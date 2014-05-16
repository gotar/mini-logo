class Board
  def initialize(n)
    raise StandardError unless n.odd? && n > 1
    @size = n
  end

  def array(x,y)
    [x,y].each{ |e| raise StandardError unless e >= 0 && e <= @size }
  end
end
