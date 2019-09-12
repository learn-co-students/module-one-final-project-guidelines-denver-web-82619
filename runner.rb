require './config/environment' 
require 'tty-prompt'
require 'pry'
require_relative './lib/methods.rb'

menu

puts "Welcome! What is your name?"
user_name = gets.chomp

new_game = Cli.new(user_name)

#new_game.menu 

new_game.start

prompt = TTY::Prompt.new

# binding.pry
0