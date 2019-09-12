class Cli
    attr_reader :user

    @@all = [] 

    def self.all
        @@all
    end

    def initialize user
        @user = user
        @@all << self
    end


    def self.start
        system("clear")
        user_status = PROMPT.select("Have you been on an adventure with us before?", ["You betcha", "Nope"])
            case user_status
                when "You betcha"
                    username = PROMPT.select("My name is", User.get_user)
                        case username
                            when User.find_by_name(username).name
                            puts "Welcome back #{username}! Let's find another adventure!" 
                            sleep(3)
                            Cli.new(User.find_by_name(username))
                        end
                when "Nope"
                        system("clear")
                        new_user = User.sign_in
                        puts "Hello, #{new_user.user.name}! Let's find an adventure!"
                        sleep(3)
                        new_user
            end
    end

    
    def user_main_menu
        system("clear")
        choice = PROMPT.select("View By", ["Rivers", "Companies", "All Trips Available", "Company Headquarters' Location", "I'm ready to go rafting!!!"])
        case choice 
        when "Rivers"
            puts ""
            puts ""
            system("clear")
            choose_by_river    
        when "Companies"    
            system("clear")
            puts ""
            puts ""
            choose_by_company
        when "All Trips Available"
            system("clear")  
            puts ""
            puts ""  
            all_trips
            user_main_menu
        when "Company Headquarters' Location"
            system("clear")
            puts ""
            puts ""
            choose_by_location
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
    
    def choose_by_location
        system("clear")
        locations = Trip.all.map {|trip| trip.location}.uniq
        city_location = PROMPT.select("Select a city to view trips available in that area", locations)
        case city_location
            when "Idaho Springs"
                puts ""
                puts ""
                display_trips_by_location("Idaho Springs")
            when "Kremmling"
                puts ""
                puts ""
                display_trips_by_location("Kremmling")
            when "Fort Collins"
                puts ""
                puts ""
                display_trips_by_location("Fort Collins")
            when "Walden"
                puts ""
                puts ""
                display_trips_by_location("Walden")
            when "Canon City"
                puts ""
                puts ""
                display_trips_by_location("Canon City")
            when "Durango"
                puts ""
                puts ""
                display_trips_by_location("Durango")
            when "Telluride"
                puts ""
                puts ""
                display_trips_by_location("Telluride")
            when "Buena Vista" 
                puts ""
                puts ""
                display_trips_by_location("Buena Vista")
            end
        end

    def display_trips_by_location(location)
        puts ""
        location_trips = Trip.all.find_by location: location
        puts "Trip Name: #{location_trips.name}"
        puts "Company: #{location_trips.company.name}"
        puts "River Name: #{location_trips.river.name}"
        puts "Rapid Level: #{location_trips.rapid_level}"
        puts "Cost: $#{location_trips.cost}"
        next_action = PROMPT.select("Would you like to return to the main menu?",["Yes, fo sho!", "No, leave me alone"])
            case next_action
            when "Yes, fo sho!"
                system("clear")
                user_main_menu
            when "No, leave me alone"
                system("clear")
                exit
    end
    end

    def all_trips
        trip_list = Trip.all.map { |trip| "#{trip.name}" }
        trip_list << "BACKPADDLE!"
        select_trip = PROMPT.select("Select a trip to view details \nor select BACKPADDLE! to return to main menu", trip_list)
        case select_trip
        when "BACKPADDLE!"
            system("clear")
            user_main_menu
        when Trip.all.find_by_name(select_trip).name
            current_trip = Trip.all.find_by_name(select_trip)
            puts "#{current_trip.name}"
            puts "River: #{current_trip.river.name}"
            puts "Company: #{current_trip.company.name}"
            puts "Company Headquarters Location: #{current_trip.location}"
            puts "Minimun age requirement: #{current_trip.age}"
            puts "Cost per person: $#{current_trip.cost}"
            add_to_fav_prompt = PROMPT.select("Add this trip to your favorites?", ["Yes please!!", "Nah man, I'm good"])
                case add_to_fav_prompt
                    when "Yes please!!"
                        add_to_favorites(current_trip)
                        puts "Added to your favorites!"
                        puts ""
                        back_to_main = PROMPT.select("Where to?", ["Show me my favorites!","Show me all the trips available", "Uhm... backpaddle to main menu?"])
                        case back_to_main
                            when "Show me all the trips available"
                                system("clear")
                                all_trips
                            when "Uhm... backpaddle to main menu?"
                                user_main_menu
                            when "Show me my favorites!"
                                favorite_trips_display
                            end
                    when "Nah man, I'm good"
                        all_trips
                    end 
        end
    end

    def display_trips_per_river(river_name)
        system("clear")
        puts ""
        puts ""
        puts ""
        puts "Trips available on the #{river_name} River!"
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
                display_trips_per_river("Clear Creek")
                puts ""
                puts ""
                choose_by_river
            when "Upper Colorado"
                system("clear")
                display_trips_per_river("Upper Colorado")
                puts ""
                puts ""
                choose_by_river
            when "Cache La Poudre"
                system("clear")
                display_trips_per_river("Cache La Poudre")
                puts ""
                puts ""
                choose_by_river
            when "North Platte"
                system("clear")
                display_trips_per_river("North Platte")
                puts ""
                puts ""
                choose_by_river
            when "Animas"
                system("clear")
                display_trips_per_river("Animas")
                puts ""
                puts ""
                choose_by_river
            when "San Miguel"
                system("clear")
                display_trips_per_river("San Miguel")
                puts ""
                puts ""
                choose_by_river
            when "Backpadde one!"
                system("clear")
                puts ""
                user_main_menu
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
                display_trips_per_company("Liquid Descents")
                puts ""
                puts ""
                puts ""
                choose_by_company
    
            when "Rocky Mountain Adventures"
                system("clear")
                display_trips_per_company("Rocky Mountain Adventures")
                puts ""
                puts ""
                puts ""
                choose_by_company
    
            when "Wanderlust"
                system("clear")
                display_trips_per_company("Wanderlust")
                puts ""
                puts ""
                puts ""
                choose_by_company
    
            when "Raft Masters"
                system("clear")
                display_trips_per_company("Raft Masters")
                puts ""
                puts ""
                puts ""
                choose_by_company
    
            when "4 Corners Whitewater"
                system("clear")
                display_trips_per_company("4 Corners Whitewater")
                puts ""
                puts ""
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

    def favorites
        self.user.trips
    end

    def add_to_favorites(new_fav_trip)
        favorites << new_fav_trip
    end

    def favorite_trips_display
        system("clear")
        puts ""
        puts "Your favorite trips:"
        puts "----------------------------------------------"
        select_fav = favorites.map { |fav| "#{fav.name}"}
        trip_to_plan = PROMPT.select("Select a trip to view details and plan an adventure!", select_fav)
        case trip_to_plan
            when user.trips.find_by_name(trip_to_plan).name
                current_trip = user.trips.find_by_name(trip_to_plan)
                puts "#{current_trip.name}"
                puts "River: #{current_trip.river.name}"
                puts "Company: #{current_trip.company.name}"
                puts "Company Headquarters Location: #{current_trip.location}"
                puts "Minimun age requirement: #{current_trip.age}"
                puts "Cost per person: $#{current_trip.cost}"
                puts "----------------------------------------------"
                plan_it = PROMPT.select("Plan this trip?", ["Heck yes! Let's do it!", "No thanks, not my jam."])
                case plan_it
                    when "Heck yes! Let's do it!"
                        num_people = PROMPT.ask("How many people will be rafting?", convert: :int)
                        total_cost = current_trip.cost * num_people
                        puts "For #{num_people} people, at #{current_trip.cost} per person..."
                        puts ""
                        puts "The total cost will be $#{total_cost}!"
                        puts ""
                        return_to_menu = PROMPT.select("Where to?", ["Return to main menu", "Return to my favorites"])
                        case return_to_menu
                            when "Return to main menu"
                                user_main_menu
                            when "Return to my favorites"
                                favorite_trips_display
                            end 
                    when "No thanks, not my jam."
                        user_main_menu
                end
        end
    end

end