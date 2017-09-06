class Game
  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def set_field(row, column, player)
    fail_if_invalid_player(player)
    @grid[row][column] = player
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

  def fail_if_invalid_player(player)
    raise 'Invalid player' unless ['X', 'O'].include?(player)
  end
end
