require_relative '../../lib/board'

describe Board do
  let(:board) { Board.new(5) }

  it 'should initialize with single, odd, >1 argument' do
    expect {
      Board.new(3)
    }.not_to raise_error
  end

  it "should assign 2-dimensional @grid array from n" do
    expect(
      board.instance_variable_get(:@grid)
      ).to match_array(Array.new(5) { Array.new(5) })
  end

  describe '#array' do
    it 'should be initialize with 2 params n>=0; n<=Board.size' do
      expect{
        board.array(0,0)
      }.not_to raise_error
    end
  end
end
