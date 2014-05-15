class Board
  def initialize(n)
    raise StandardError unless n.odd? && n > 1
  end
end
