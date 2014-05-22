require_relative '../../lib/main'

describe 'Main' do

  it 'should initialize(with  no params)' do
    expect {
      Main.new
    }.not_to raise_error
  end

  describe '#command' do
    it 'does not accept commands not in [uldr] digit pattern' do
      expect{
        Main.new.command("x")
      }.to raise_error(WrongInput)
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
