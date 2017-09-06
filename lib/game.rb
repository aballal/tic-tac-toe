class Game
  def initialize
    @grid = empty_grid
  end

  def isOver?
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

  def empty_grid
    [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end
end
