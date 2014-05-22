# Mateusz
describe Main do
  describe '#command' do
    it 'does not accept commands not in [uldr] digit pattern' do
      expect{
        Main.new.command(x)
      }.to raise_error(WrongInput)
    end

    it 'quits with "q" command' do
      expect{
        Main.new.command("q")
      }.to raise_error SystemExit
    end
  end
end

