require_relative 'methods.rb'

class Cli 
    attr_reader :user

    def initialize(user)
        @user = user
    end

    # def menu
    #     prompt = TTY::Prompt.new
    #     choice = prompt.select("Welcome to the DnD main menu!",("Start a game"), ("Manage users"), "Exit")
    # end

    def start
        puts "Hello, #{@user}. Lets choose a character!"
        choice = race_choice 
        if choice == "Exit"
            puts "bye"
            exit
        else 
            choice_2 = class_choice 
            if choice_2 == "Exit"
                puts "bye"
                exit
            end
        end
        created_user = User.create(name: @user, race: choice, profession: choice_2)

        puts `clear`


        def item (choice)
            items_array = ["Assassin's Dagger", "Club", "Fiery Power Staff", "Quarterstaff", "Rustblade", "Warlock’s Scepter", "Crossbow", "Spear"]
            if choice == "Barbarian" || choice == "Fighter"
                given_weapon = Weapon.create(name: items_array[1], category: "Melee Weapon")
                puts "You have been given the #{items_array[1]}"
        
            elsif choice == "Bard" || choice == "Paladin" || choice == "Monk"
                given_weapon = Weapon.create(name: items_array[7], category: "Melee Weapon")
                puts "You have been given the #{items_array[7]}"
        
            elsif choice == "Ranger" || choice == "Rogue" || choice == "Druid"
                given_weapon = Weapon.create(name: items_array[6], category: "Melee Weapon")
                puts "You have been given the #{items_array[6]}"
        
            elsif choice == "Sorcerer" || choice == "Warlock" || choice == "Wizard" || choice == "Cleric"
                given_weapon = Weapon.create(name: items_array[3], category: "Melee Weapon")
                puts "You have been given the #{items_array[3]}"
            end
            
        end

        puts item(choice_2)
        Userweapon.create(user: created_user, weapon: Weapon.all.last)
        puts "Welcome to town, #{choice.downcase}!" 

        adventure_path1 

        puts `clear`





    end
end 