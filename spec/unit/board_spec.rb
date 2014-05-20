require_relative '../../lib/board'

describe Board do
  let(:board) { Board.new(5) }

  it 'should initialize with single, odd, >1 argument' do
    expect {
      Board.new(3)
    }.not_to raise_error
  end

  it 'should assign 2-dimensional @grid array from n' do
    expect(
      board.grid
      ).to match_array(Array.new(5) { Array.new(5) })
  end

  describe '#array' do
    it 'should be initialize with 2 params n>=0; n<=Board.size' do
      expect{
        board.array(0,0)
      }.not_to raise_error
    end
  end

  it 'fills a board with "."' do
    expect{
      board.grid.flatten.count('.')
    }.to eq(board.size ** 2)
  end

  it 'puts "X" in the center of a board' do
    expect{
      board.grid[board.size/2][board.size/2]
    }.to eq('X')
  end

  it 'creates a hash @position to store current position' do
    expect(board.position).to be_kind_of(Hash)
  end

  it 'forbids to move out of range' do
    expect(board.position[:x] = 5).to raise_error
    expect(board.position[:y] = 5).to raise_error
  end
end
