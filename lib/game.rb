class Game
  GRID_SIZE = 3

  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def set_field(row, column, player)
    raise 'Invalid field' if row >= GRID_SIZE || column >= GRID_SIZE
    raise 'Invalid player' unless ['X', 'O'].include?(player)
    raise 'Field has been taken' unless grid[row][column] == ' '
    @grid[row][column] = player
    nil
  end

  def over?
    grid.flatten.select { |element| element == ' ' }.empty? || !!winner
  end

  def winner
    (grid + grid.transpose + diagonals).map do |row|
      return 'X' if row.join == 'XXX'
      return 'O' if row.join == 'OOO'
    end
    false
  end

  def to_s
    grid.map { |row| row.map { |element| element }.join + "\n" }.join
  end

  private

  attr_reader :grid

  def diagonals
    [(0...GRID_SIZE).collect { |i| grid[i][i] }.to_a,
     (0...GRID_SIZE).collect { |i| grid[i][GRID_SIZE - 1 - i] }.to_a]
  end
end
