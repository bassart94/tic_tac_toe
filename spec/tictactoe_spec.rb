# Dir['./lib/*.rb'].each { |file| require file }
require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'

describe "#winner" do
  before(:each) {@board = Board.new}
  
  it "declares a winner if every cell in top row contains an 'X'" do
    for i in 0..2
      @board.cells[i] = "X"
    end
    expect(@board.winner).to eql("X")
  end

  it "declares a winner if a diagonal is filled with 'X' marks" do
    line = [1, 5, 9]
    line.each { |cell| @board.cells[cell-1] = "X" }
    expect(@board.winner).to eql("X")
  end
end

describe "#full?" do
  it "returns true if all cells are occupied" do
    board = Board.new
    x_marks = [0, 1, 4, 5, 6]
    o_marks = [2, 3, 7, 8] 
    x_marks.each { |cell| board.cells[cell] = "X" }
    o_marks.each { |cell| board.cells[cell] = "O" }
    expect(board.full?).to eql(true)
  end
end

describe "Player" do
  before(:each) {@player = Player.new("player_one", "X")}
  
  it "holds a player's name" do
    expect(@player.name).to eql("player_one")
  end

  it "holds a player's mark" do
    expect(@player.mark).to eql("X")
  end

end