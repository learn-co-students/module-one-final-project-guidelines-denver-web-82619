# Menu
def menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Welcome to the DnD main menu!",("Start a Game"), ("Delete Users"), "Exit")
    if choice == "Exit"
        exit
    elsif choice == "Delete Users"
        #another method 
    end 
end


#Creating Class Methods
    def class_names
        response = RestClient.get('http://dnd5eapi.co/api/classes/')
        parsed = JSON.parse(response)
        parsed["results"].map do |prof|
            prof["name"]
        end
    end

    def class_choice
        prompt = TTY::Prompt.new
        choice = prompt.select("Choose your class", (class_names), "Exit")
    end

#Creating Race Methods
    def race_names
        response = RestClient.get('http://dnd5eapi.co/api/races/')
        parsed = JSON.parse(response)
        parsed["results"].map do |race|
            race["name"]
        end
    end

    def race_choice
        prompt = TTY::Prompt.new
        choice = prompt.select("Choose your race", (race_names), "Exit")
    end 

#Items Methods 


def item (choice_2)
    items_array = ["Assassin's Dagger", "Club", "Fiery Power Staff", "Quarterstaff", "Rustblade", "Warlock’s Scepter", "Crossbow", "Spear"]
    if choice_2 == "Barbarian" || choice_2 == "Fighter"
        items_array[1]
    elsif choice_2 == "Bard" || choice_2 == "Paladin" || choice_2 == "Monk"
        items_array[7]
    elsif choice_2 == "Ranger" || choice_2 == "Rogue" 
        items_array[6]
    elsif choice_2 == "Sorcerer" || choice_2 == "Warlock" || choice_2 == "Wizard"
        items_array[3]
    end
end
