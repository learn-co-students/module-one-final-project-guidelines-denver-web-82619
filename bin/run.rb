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

def user_menu

end 

def existing_user
    prompt = TTY::Prompt.new
    user_list = User.get_user_name
    user_select = prompt.select("Select a user", (user_list))

    print_list 
end 

def welcome_existing
    puts "Welcome back "

end 

def welcome_message 
    choices = ["an existing user", "a new user"]
    puts "Hello! Welcome to the Bookshelf"
    prompt = TTY::Prompt.new 
    user_type = prompt.select("Are you:", (choices))

    
    case user_type
    when "an existing user"
        existing_user
    when "a new user"
        new_user
    end 
    
end 


def new_user
    puts "Welcome! What is your name?"
    user_name = gets.chomp
    User.create(name: user_name)
    puts "Welcome, #{user_name}! Please select a title to view info."

    print_list 

end 

def print_list
    prompt = TTY::Prompt.new
    book_list = Book.get_book_list
    select_book = prompt.select("Choose a title", (book_list))
    exit 
end 


def display_book_info

end 

binding.pry

# existing_user
# welcome_message 
# print_list


welcome_message


