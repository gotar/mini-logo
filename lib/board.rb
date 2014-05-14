class Board
  def initialize(n)
    if n.odd? && n>1
      @array = Array.new(n) { Array.new(n,".")}
    end
  end
end
