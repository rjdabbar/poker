require 'towers_of_hanoi.rb'

describe TowersOfHanoi do
  let(:game) {TowersOfHanoi.new}

  describe "#render" do

    it "should render discs and empty towers" do
      expect(game.render).to eq(
        'Tower 0:  ' + game.towers[0].join('  ') + "\n" +
        'Tower 1:  ' + game.towers[1].join('  ') + "\n" +
        'Tower 2:  ' + game.towers[2].join('  ') + "\n")
    end

  end

  describe "#move" do

    it "should move the last disc in a tower" do
      game.move(0,1)
      expect(game.towers).to eq([[3,2],[1],[]])
    end

    it "should raise error if the disc being moved is larger than the target" do
      game.move(0,1)
      expect{game.move(0,1)}.to raise_error("Illegal Move: Disc being moved is larger than target tower disc")
    end

    it "should raise error if you try to move no disc" do
      expect{game.move(2,0)}.to raise_error("Illegal Move: no disc")
    end

  end

  describe "#won?" do
    let(:finished_game) {TowersOfHanoi.new([[],[3,2,1],[]])}

    it "should be true when a tower other than starting tower has all discs" do
      expect(finished_game.won?).to be true
    end

    it "should return false unless above condition" do
      expect(game.won?).to be false
    end

  end
end
