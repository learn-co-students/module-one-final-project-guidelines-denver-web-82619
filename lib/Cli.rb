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
        Graphics.header 
        user_status = PROMPT.select("Have you been on an adventure with us before?", ["You betcha", "Nope"])
            case user_status
                when "You betcha"
                    username = PROMPT.select("My name is", User.get_user)
                        case username
                            when User.find_by_name(username).name
                                system("clear")
                                Graphics.header 
                                puts "Welcome back #{username}! Let's find another adventure!" 
                                sleep(3)
                                Cli.new(User.find_by_name(username))
                        end
                when "Nope"
                        system("clear")
                        Graphics.header 
                        new_user = User.sign_in
                        puts "Hello, #{new_user.user.name}! Let's find an adventure!"
                        sleep(3)
                        new_user
            end
    end

    
    def user_main_menu
        system("clear")
        Graphics.header
        choice = PROMPT.select("View By", ["Rivers", "Companies", "All Trips Available", "Company Headquarters' Location", "My Favorites", "I'm ready to go rafting!!!"])
        case choice 
        when "Rivers"
            choose_by_river    
        when "Companies"    
            choose_by_company
        when "All Trips Available"
            all_trips
            user_main_menu
        when "Company Headquarters' Location"
            choose_by_location
        when "My Favorites"
            favorite_trips_display
        when "I'm ready to go rafting!!!"
            system("clear")
            puts ""
            puts ""
            puts "Chya bra! Lets do it!".center(50)
            puts ""
            puts ""
                exit
        end
    end
    
    def choose_by_location
        system("clear")
        Graphics.header
        locations = Trip.all.map {|trip| trip.location}.uniq
        city_location = PROMPT.select("Select a city to view trips available in that area", locations)
        case city_location
            when "Idaho Springs"
                display_trips_by_location("Idaho Springs")
            when "Kremmling"
                display_trips_by_location("Kremmling")
            when "Fort Collins"
                display_trips_by_location("Fort Collins")
            when "Walden"
                display_trips_by_location("Walden")
            when "Canon City"
                display_trips_by_location("Canon City")
            when "Durango"
                display_trips_by_location("Durango")
            when "Telluride"
                display_trips_by_location("Telluride")
            when "Buena Vista" 
                display_trips_by_location("Buena Vista")
            end
        end

    def display_trips_by_location(location)
        system("clear")
        Graphics.header
        puts ""
        puts ""
        Trip.where(location: location).map do |trip|
            puts "Trip Name: #{trip.name}"
            puts "----------------------------------------------"
            puts "Company: #{trip.company.name}"
            puts "River Name: #{trip.river.name}"
            puts "Rapid Level: #{trip.rapid_level}"
            puts "Cost: $#{trip.cost}"
            puts ""
        end 
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
            Graphics.header
            user_main_menu
        when Trip.all.find_by_name(select_trip).name
            current_trip = Trip.all.find_by_name(select_trip)
            system("clear")
            Graphics.header 
            puts "#{current_trip.name}"
            puts "----------------------------------------------"
            puts "River: #{current_trip.river.name}"
            puts "Company: #{current_trip.company.name}"
            puts "Company Headquarters Location: #{current_trip.location}"
            puts "Minimun age requirement: #{current_trip.age}"
            puts "Cost per person: $#{current_trip.cost}"
            puts "----------------------------------------------"
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
        Graphics.header
        puts ""
        puts "Trips available on the #{river_name} River!"
        puts "----------------------------------------------"
        River.find_by_name(river_name).trips.map do |trip| 
            puts "#{trip.name}, located in #{trip.location}" 
            puts "The company for this trip is #{trip.company.name}"
            puts "----------------------------------------------"
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
        system("clear")
        Graphics.header
        all_rivers = River.all.map{|river| river.name}
        all_rivers << "Backpadde one!"
        river = PROMPT.select("Choose a River to View Available Trips", all_rivers)
        case river 
            when "Arkansas"
                display_trips_per_river("Arkansas")
            when "Clear Creek"
                display_trips_per_river("Clear Creek")
                choose_by_river
            when "Upper Colorado"
                display_trips_per_river("Upper Colorado")
                choose_by_river
            when "Cache La Poudre"
                display_trips_per_river("Cache La Poudre")
                choose_by_river
            when "North Platte"
                display_trips_per_river("North Platte")
                choose_by_river
            when "Animas"
                display_trips_per_river("Animas")
                choose_by_river
            when "San Miguel"
                display_trips_per_river("San Miguel")
                choose_by_river
            when "Backpadde one!"
                user_main_menu
            end
    end



    def choose_by_company
        system("clear")
        Graphics.header
        all_companies = Company.all.map{|river| river.name}
        all_companies << "Backpadde one!"
        company = PROMPT.select("Choose a Company to View Available Trips", all_companies)
        case company
            when "AVA"
                display_trips_per_company("AVA")
            when "Liquid Descents"
                display_trips_per_company("Liquid Descents")
                choose_by_company
            when "Rocky Mountain Adventures"
                display_trips_per_company("Rocky Mountain Adventures")
                choose_by_company
            when "Wanderlust"
                display_trips_per_company("Wanderlust")
                choose_by_company
            when "Raft Masters"
                display_trips_per_company("Raft Masters")
                choose_by_company
            when "4 Corners Whitewater"
                display_trips_per_company("4 Corners Whitewater")
                choose_by_company
            when "Backpadde one!"
                user_main_menu
        end
    end
    
    def display_trips_per_company(company)
        system("clear")
        Graphics.header 
        puts ""
        puts "Trips #{company} offers:"
        puts "----------------------------------------------"
        Company.find_by_name(company).trips.map do |trip| 
            puts "#{trip.name}"
            puts "Located in #{trip.location}, Colorado." 
            puts "The river you will raft on is the #{trip.river.name}!"
            puts "----------------------------------------------"
        end
        next_company = PROMPT.select("Would you like to view trips for another company?", ["Yes, show me more!", "No thanks!"])
        case next_company
            when "Yes, show me more!"
                choose_by_company
            when "No thanks!"
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
        Graphics.header
        puts ""
        puts "Your favorite trips:"
        puts "----------------------------------------------"
        select_fav = favorites.map { |fav| "#{fav.name}"}
        trip_to_plan = PROMPT.select("Select a trip to view details and plan an adventure!", select_fav)
        case trip_to_plan
            when user.trips.find_by_name(trip_to_plan).name
                current_trip = user.trips.find_by_name(trip_to_plan)
                system("clear")
                Graphics.header
                puts "#{current_trip.name}"
                puts "----------------------------------------------"
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
                        puts "----------------------------------------------"
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