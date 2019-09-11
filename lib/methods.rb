
# Menu
def menu
    prompt = TTY::Prompt.new
    choice = prompt.select("Welcome to the DnD main menu!",("Start a Game"), ("Delete Users"), "Exit")
    if choice == "Exit"
        exit
    elsif choice == "Delete Users"
        user_names = User.all.map do |user|
            user.name
        end
        delete = prompt.select("Which user would you like to delete?", (user_names), "Exit") 
        if delete == delete
            delete_id = User.find_by(name: delete).id
            Userweapon.find_by(user_id: delete_id).destroy
            User.find_by(id: delete_id).destroy
            puts "You successfully deleted #{delete}"
            menu
        elsif delete == "Exit"
            exit
        end 

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

# Adventure Methods 

def adventure_path1
    prompt = TTY::Prompt.new
    choice = prompt.select("What would you like to do first?","Explore the town!", "Start your adventure on the beaten path!", "Quit Game") 
    if choice == "Explore the town!"
        #add choice 
    elsif choice == "Start your adventure on the beaten path!" 
        puts `clear`
        puts "As you walk the path, you notice a lush forest and an old, abandoned house."
        prompt2 = TTY::Prompt.new
        path_choice = prompt2.select("Would you like to inspect the house or follow the path into the forest?", "Inspect the house", "Follow the path into the forest")
        if path_choice == "Inspect the house" 
            puts `clear`
            puts "As you inspect the house, you notice that it is sealed shut. The windows are borded and the house is locked."
            puts "You continue walking around the house, and notice a sack with something inside."
            puts "Upon further inspection you find a mace!" 

        elsif path_choice == "Follow the path into the forest"
        end

    elsif choice == "Quit Game"
        exit
    end

end 


