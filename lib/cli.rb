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
        User.create(name: @user, race: choice, profession: choice_2)

        puts item(choice_2)




    end
end 