require_relative '../../lib/main'

describe 'Main' do
  it 'should initialize(with  no params)' do
    expect {
      Main.new
    }.not_to raise_error
  end

  describe '#command' do
    it 'does not accept commands not in [quldr] digit pattern' do
      %w(q u a l d r).each do |w|
        expect{
          Main.new.command(w)
        }.to raise_error(WrongInput)
      end
    end

    it 'quits with "q" command' do
      expect{
        Main.new.command("q")
      }.to raise_error SystemExit
    end

    it 'quits with "Q" command' do
      expect{
        Main.new.command("Q")
      }.to raise_error SystemExit
    end

    it 'accepts commands in [uldr] format' do
      expect{
        Main.new.command("u")
      }.not_to raise_error
    end

    it 'accepts case insensitive commands in [uldr] format' do
      expect{
        Main.new.command("U")
      }.not_to raise_error
    end
  end
end
