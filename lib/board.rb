class Board
  attr_accessor :cells

  def initialize
     @cells = [
       1, 2, 3,
       4, 5, 6,
       7, 8, 9
     ]
  end

  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "---+---+---"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "---+---+---"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
  end

  def full?
    @cells.all? { |cell| cell == "X" || cell == "O"}
  end

  def winner
    line_made = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    line_made.each do |line| 
      return "X" if line.all? { |cell| @cells[cell] == "X"}
      return "O" if line.all? { |cell| @cells[cell] == "O"}
    end
    false
  end
end