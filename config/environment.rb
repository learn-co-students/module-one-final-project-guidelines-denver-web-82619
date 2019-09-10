require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'

require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', database: 'db/project.db')
ActiveRecord::Base.logger = nil
prompt = TTY::Prompt.new

#User.sign_in


choice = prompt.select("View By", ["Rivers", "Companies", "Trips Available"])
case choice 
when "Rivers"
    system("clear")
    puts River.all.map{|river| river.name}.join( )     
when "Companies"    
    puts Company.all.map{|company| company.name}.join( )

when "Trips Available"    
    puts Trip.all.map{|trip| trip.name}.join( )
     
end


1