require_relative '../config/environment'
require_all 'lib'
require 'pry'

def home_menu
    puts "Home Menu" "\n"
    puts ""
    puts "Existing User" "\n"
    puts "New User" "\n"
    puts "Exit Program" "\n"

end 

def existing_user_list
    prompt = TTY::Prompt.new
    user_list = User.get_user_name
    user_select = prompt.select("Select a user", (user_list))
    
end 

def welcome_existing
    puts "Welcome back "

end 

def welcome_new
    puts "Hello! Welcome to the Bookshelf"
    puts "What is your name?"
    user_name = gets.chomp
    User.create(name: user_name)
    puts "Welcome, #{user_name}! Please select a title to view info." 
    puts ""
end 

def book_list
    Book.all.map do |book|
        book.title
    end 
end 

def print_list
    list = ""
    counter = 0
    while book_list[counter] do 
        list += "#{counter + 1}. #{book_list[counter]}" + "\n"
        counter += 1
    end
    puts list
    choose_title
    
end 

def choose_title
    user_input = gets.chomp
    case user_input
    when "1"
        puts "You chose 1!"
    when "2"
        puts "You chose 2"
    when "3"
        puts "You chose 3"
    when "4"
        puts "You chose 4"
    when "5"
        puts "You chose 5"
    else
        puts "Not a valid option"

    print_list

    end 


end 


def display_book_info

end 

# binding.pry

existing_user_list
welcome_new
print_list


