require 'spec_helper'

describe Board do
  let(:board) { Board.new(5) }
  it 'should initialize with single, odd, >1 argument' do
    expect {
      Board.new(3)
    }.not_to raise_error
  end

  it 'should contain X at the intersection of the diagonals' do
    expect(board.array[2][2]).to include("X")
  end
end
