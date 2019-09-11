require_relative '../config/environment'
require_all 'lib'

def welcome_message
    puts "Hello! Welcome to the Bookshelf"
    puts "What is your name?"
    user_name = gets.chomp
    User.create(name: user_name)
    puts "Welcome, #{user_name}! Please select a title to view info." 
    puts ""

    # print_list
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

welcome_message
print_list


