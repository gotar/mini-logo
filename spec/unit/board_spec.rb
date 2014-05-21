require_relative '../../lib/board'

describe Board do
  let(:board) { Board.new(5) }

  it 'should initialize with single, odd, >1 argument' do
    expect {
      Board.new(3)
    }.not_to raise_error
  end

  it 'returns array' do
    expect(
      board.grid
    ).to be_an(Array)
  end

  it 'fills a board with "."' do
    expect(board.grid.flatten.count('.')).to eq((board.size**2)-1)
  end

  it 'puts "X" in the center of a board' do
    expect(board.grid[board.size/2][board.size/2]).to eq(Board::USED_CHAR)
  end

  it 'creates a hash with #current_position' do
    expect(board.current_position).to eq({x: 2, y: 2})
  end

  describe '#array' do
    it 'should be initialize with 2 params n>=0; n<=Board.size' do
      expect{
        board.array(0,0)
      }.not_to raise_error
    end
  end

  describe '#move' do
    it 'should be initialize with 2 params' do
      expect{
        board.move(0, 0)
      }.not_to raise_error
    end

    # Marta B
    it 'change current_position to position after move' do
      expect{
        board.move(1, 1)
      }.to change(board.current_position).from({x: 5, y: 5}).to({x: 1, y: 1})
    end

    it 'forbids to go out of range' do
      expect{
        board.move(10, 10)
      }.to raise_error(OutOfBoard)
    end

    it 'forbids to go negative positions' do
      expect{
        board.move(-1, -1)
      }.to raise_error(OutOfBoard)
    end

    it 'changes EMPTY_CHAR to USED_CHAR after move' do
      expect{
        board.move(1,1)
      }.to change(board.current_position).from(Board::EMPTY_CHAR).to(Board::USED_CHAR)
    end
  end
end
