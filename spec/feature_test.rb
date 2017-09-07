require_relative '../lib/game'
require_relative '../lib/controller'

game = Game.new
controller = Controller.new('X', game)

sequence = [[1, 1], [0, 0], [1, 0], [1, 2], [0, 2], [2, 0], [2, 1], [0, 1], [2, 2]]

puts controller
puts ""
sequence.each do |row, column|
  controller.execute_turn(row, column)
  puts controller
  puts ""
end
