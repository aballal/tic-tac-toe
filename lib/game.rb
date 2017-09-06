class Game
  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def set_field(row, column, symbol)
    @grid[row][column] = symbol
    nil
  end

  def over?
    false
  end

  def to_s
    grid.map do |row|
      row.map do |element|
        element
      end.join + "\n"
    end.join
  end

  private

  attr_reader :grid
end
