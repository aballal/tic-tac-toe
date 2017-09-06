class Controller

  def initialize(first_player = 'X', game)
    @current_player = first_player
    @game = game
  end

  def execute_turn(row, column)
    game.set_field(row, column, current_player)
    @current_player = current_player == 'X' ? 'O' : 'X'
  end

  def to_s
    return "Game Over! Player #{game.winner} wins!" if game.over? && game.winner
    return 'Game Over! It is a draw!' if game.over? && !game.winner
    current_player.to_s + "\n" + game.to_s
  end

  private

  attr_reader :current_player, :game
end
