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
    data = current_player.to_s + "'s turn next\n---\n" + game.to_s + "\n---\n"
    return data + "Game Over! Player #{game.winner} wins!" if game.over? && game.winner
    return data + 'Game Over! It is a draw!' if game.over? && !game.winner
    data + 'Game in progress.'
  end

  private

  attr_reader :current_player, :game
end
