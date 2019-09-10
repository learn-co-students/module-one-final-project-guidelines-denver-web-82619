require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'

require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', database: 'db/project.db')
ActiveRecord::Base.logger = nil
prompt = TTY::Prompt.new

answer = prompt.ask("Welcome to your next adventure! What is your name?")
username = User.new(answer)
puts "Welcome #{username.name}!"

choice = prompt.select("Where do you want to go?? your options:", ["numero 1", "numer 2", "or three!"])
case choice 
when "numero 1"
    system("clear")
     "yay you picked number one"
  
     
when "numer 2"    
     "the second"
when "or three!"    
     "oh snap!"
    
     
end

#binding.pry



1