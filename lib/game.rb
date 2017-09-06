class Game
  GRID_SIZE = 3

  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def set_field(row, column, player)
    fail_if_invalid_field(row, column)
    fail_if_invalid_player(player)
    fail_if_field_taken(row, column)
    @grid[row][column] = player
    nil
  end

  def over?
    all_fields_taken?
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

  def fail_if_invalid_field(row, column)
    raise 'Invalid field' if row >= GRID_SIZE || column >= GRID_SIZE
  end

  def fail_if_invalid_player(player)
    raise 'Invalid player' unless ['X', 'O'].include?(player)
  end

  def fail_if_field_taken(row, column)
    raise 'Field has been taken' unless grid[row][column] == ' '
  end

  def all_fields_taken?
    grid.flatten.select { |element| element == ' ' }.empty?
  end
end
