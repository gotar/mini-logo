require_relative '../../lib/main'

describe 'Main' do
  it 'should initialize(with  no params)' do
    expect {
      Main.new
    }.not_to raise_error
  end

  it 'puts "Enter command:" prompt' do
    expect(
      capture_stdout
      ).to match("Enter command:")
  end

  describe '#command' do
    let(:main) { Main.new }

    it 'does not accept commands not in [uldr] digit pattern' do
      expect{
        main.command('foo')
      }.to raise_error(WrongInput)
    end

    it 'quits with "q" command' do
      expect{
        main.command("q")
      }.to raise_error SystemExit
    end

    it 'quits with "Q" command' do
      expect{
        main.command("Q")
      }.to raise_error SystemExit
    end

    it 'accepts commands in [uldr] format' do
      expect{
        main.command("u")
      }.not_to raise_error
    end

    it 'accepts case insensitive commands in [uldr] format' do
      expect{
        main.command("U")
      }.not_to raise_error
    end

    # Jacek
    it 'accepts commands with a digit after a letter' do
      expect{
        main.command("u 3")
      }.not_to raise_error
    end

    # Jacek
    it 'does not accept commands with negative numbers' do
      expect{
        main.command("d -7")
      }.to raise_error WrongInput
    end

    before { main.command("d 2") }

    it 'stores a valid command for internal processing' do
      expect(
        main.instance_variable_get(:@command)
      ).not_to eq nil
    end

    it 'splits the command into processable chunks' do
      expect(
        main.instance_variable_get(:@command)
      ).to eq ["d", "2"]
    end

    context 'to move left' do
      let(:board) { Board.new(5) }
      before { Main.new.command("L 1") }

      it 'changes current_position after movement' do
        expect (board.current_position).to eq({x: 1, y: board.size/2})
      end
    end
  end
end
