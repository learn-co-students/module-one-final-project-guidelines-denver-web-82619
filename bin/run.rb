require_relative '../config/environment'
require_all 'lib'
require 'pry'

def user_menu

end 

def existing_user
    prompt = TTY::Prompt.new
    user_list = User.get_user_name
    user_select = prompt.select("Select a user", (user_list))
    puts "Welcome back, #{User.all.find do |user| user.user_name == user_select end.name}."
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
    name_user = gets.chomp
    puts "Create a username"
    user_name = gets.chomp
    User.create(name: name_user, user_name: user_name)
    puts "Welcome, #{name_user}! Please select a title to view info."
 
    print_list 

end 

def print_list
    prompt = TTY::Prompt.new
    book_list = Book.get_book_list
    select_book = prompt.select("Choose a title", (book_list))
    display_book_info(select_book)

end 


def display_book_info(book)
    puts Book.where(title: book)[0].title
    puts Book.where(title: book)[0].author
    puts Book.where(title: book)[0].genre
    puts Book.where(title: book)[0].blurb
    puts ""

    prompt = TTY::Prompt.new
    choices = ["Add to bookshelf.", "Return to book list."]
    choice = prompt.select("What would you like to do?", (choices))

    case choice
    when "Add to bookshelf."
        puts "added!"
    when "Return to book list."
        print_list
    end 
end 

def add_to_shelf

end 

# binding.pry 

# existing_user
# welcome_message 
# print_list


welcome_message


