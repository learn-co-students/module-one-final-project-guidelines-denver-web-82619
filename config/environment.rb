require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'

require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', database: 'db/project.db')
# ActiveRecord::Base.logger = nil

PROMPT = TTY::Prompt.new


#User.sign_in

def display_trips_per_river(river_name)
    puts ""
    puts ""
    puts "Trips available on the #{river_name} River!"
    puts ""
    River.find_by_name(river_name).trips.map do |trip| 
        puts ""
        puts "#{trip.name}, located in #{trip.location}" 
        puts "The company for this trip is #{trip.company.name}"
        puts ""
        puts ""
    end
    puts ""
    next_river = PROMPT.select("Would you like to view trips for another river?", ["Yes, show me more!", "No thanks!"])
    case next_river
        when "Yes, show me more!"
            system("clear")
            choose_by_river
        when "No thanks!"
            system("clear")
            user_main_menu
        end
end


def choose_by_river
    all_rivers = River.all.map{|river| river.name}
    all_rivers << "Backpadde one!"
    river = PROMPT.select("Choose a River to View Available Trips", all_rivers)
    case river 
        when "Arkansas"
            system("clear")
            puts ""
            display_trips_per_river("Arkansas")
        when "Clear Creek"
            system("clear")
            puts ""
            puts ""
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "Upper Colorado"
            system("clear")
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "Cache La Poudre"
            system("clear")
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "North Platte"
            system("clear")
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "Animas"
            system("clear")
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "San Miguel"
            system("clear")
            puts "No trips on this river currently!"
            puts ""
            puts ""
            choose_by_river
        when "Backpadde one!"
            system("clear")
            puts ""
            user_main_menu
        end
end

def user_main_menu
    choice = PROMPT.select("View By", ["Rivers", "Companies", "Trips Available", "I'm ready to go rafting!!!"])
    case choice 
    when "Rivers"
        system("clear")
        choose_by_river    
    when "Companies"    
        system("clear")
        puts ""
        puts ""
        choose_by_company
    when "Trips Available"
        system("clear")    
        puts Trip.all.map{|trip| trip.name}
        puts ""
        user_main_menu
    when "I'm ready to go rafting!!!"
        system("clear")
        puts ""
        puts ""
        puts "Chya bra! Lets do it!"
        puts ""
        puts ""
            exit
    end
end

def choose_by_company
    all_companies = Company.all.map{|river| river.name}
    all_companies << "Backpadde one!"
    company = PROMPT.select("Choose a Company to View Available Trips", all_companies)
    case company
        when "AVA"
            display_trips_per_company("AVA")

        when "Liquid Descents"
            system("clear")
            # display_trips_per_company("Liquid Descents")
            puts "No trips for this company currently!"
            puts ""
            puts ""
            puts "Please select a different company"
            puts ""
            choose_by_company

        when "Rocky Mountain Adventures"
            system("clear")
            # display_trips_per_company("Rocky Mountain Adventures")
            puts "No trips for this company currently!"
            puts ""
            puts ""
            puts "Please select a different company"
            puts ""
            choose_by_company

        when "Wanderlust"
            system("clear")
            # display_trips_per_company("Wanderlust")
            puts "No trips for this company currently!"
            puts ""
            puts ""
            puts "Please select a different company"
            puts ""
            choose_by_company

        when "Raft Masters"
            system("clear")
            # display_trips_per_company("Raft Masters")
            puts "No trips for this company currently!"
            puts ""
            puts ""
            puts "Please select a different company"
            puts ""
            choose_by_company

        when "4 Corners Whitewater"
            system("clear")
            # display_trips_per_company("4 Corners Whitewater")
            puts "No trips for this company currently!"
            puts ""
            puts ""
            puts "Please select a different company"
            puts ""
            choose_by_company
        when "Backpadde one!"
            system("clear")
            puts ""
            user_main_menu
    end
end

def display_trips_per_company(company)
    system("clear")
    puts ""
    puts "Trips #{company} offers:"
    puts ""
    Company.find_by_name(company).trips.map do |trip| 
        puts ""
        puts "#{trip.name}"
        puts ""
        puts "Located in #{trip.location}, Colorado." 
        puts ""
        puts "The river you will raft on is the #{trip.river.name}!"
        puts ""
        puts ""
    end
    next_company = PROMPT.select("Would you like to view trips for another company?", ["Yes, show me more!", "No thanks!"])
    case next_company
        when "Yes, show me more!"
            system("clear")
            choose_by_company
        when "No thanks!"
            system("clear")
            user_main_menu
        end
end


user_main_menu