require_relative "game"

puts "Welcome to the game of life."
puts "Please enter the height of the grid."
height = gets.chomp.to_i
puts "please enter the width of the grid."
width = gets.chomp.to_i
game = Game.new(height, width)
puts "Thank you. Here is your starting grid."
puts game
