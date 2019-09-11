class Cli

    def user_menu
        

    end 
    
    def existing_user
        
        prompt = TTY::Prompt.new
        user_list = User.get_user_name
        user_select = prompt.select("Select a user", (user_list))
        @user = User.all.find {|user| user.user_name == user_select}
        puts "Welcome back, #{@user.name}."
        print_list 
    end 
    
    def welcome_existing
        puts "Welcome back "
    
    end 
    
    def welcome_message 
        choices = ["an existing user", "a new user"]
        puts "Hello! Welcome to the Bookshelf!"
        puts ""
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
        puts ""
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
    
    
    def display_book_info(book_title)
        selected_book = Book.where(title: book_title)[0]
        puts selected_book.title
        puts selected_book.author
        puts selected_book.genre
        puts selected_book.blurb
        puts ""
    
        prompt = TTY::Prompt.new
        choices = ["Add to bookshelf.", "Return to book list."]
        choice = prompt.select("What would you like to do?", (choices))
    
        case choice
        when "Add to bookshelf."
            add_to_shelf(selected_book)
        when "Return to book list."
            print_list
        end 
    end 
    
    def add_to_shelf(book)
        BookUser.create(book: book, user: @user )
        
        binding.pry
        0
    end 
end 