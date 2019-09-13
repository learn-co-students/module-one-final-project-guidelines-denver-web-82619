class Cli
    def user_menu
        choices = ["view my shelf", "view book list", "switch user", "log out"]
        prompt = TTY::Prompt.new
        user_choice = prompt.select("Would you like to:", (choices))
            case user_choice
            when "view my shelf"
                view_shelf
            when "view book list"
                print_list
            when "switch user"
                existing_user
            when "log out"
                welcome_message 
            end 

    end 
    
    def existing_user
        
        prompt = TTY::Prompt.new
        user_list = User.get_user_name
        user_select = prompt.select("Select a user", (user_list))
        @user = User.all.find {|user| user.user_name == user_select}
        puts "Welcome back, #{@user.name}."
        user_menu 
    end 
    
    
    def welcome_message 
        choices = ["an existing user", "a new user", "exit"]
        puts "Hello! Welcome to the Bookshelf!"
        puts ""
        prompt = TTY::Prompt.new 
        user_type = prompt.select("Are you:", (choices))
    
        
        case user_type
        when "an existing user"
            existing_user
        when "a new user"
            new_user
        when "exit"
            exit
        end 
        
    end 
    
    
    def new_user
        puts "Welcome! What is your name?"
        name_user = gets.chomp
        puts "Create a username"
        user_name = gets.chomp
        puts ""
        @user = User.create(name: name_user, user_name: user_name)
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
        
        in_bookshelf = @user.books.include?(selected_book)
        
        prompt = TTY::Prompt.new
        if in_bookshelf == true
            choices = ["Remove from bookshelf.", "Return to menu."]
        elsif in_bookshelf == false
            choices = ["Add to bookshelf.", "Return to menu."]
        end
        choice = prompt.select("What would you like to do?", (choices))
    
        case choice
        when "Add to bookshelf."
            add_to_shelf(selected_book)
        when "Remove from bookshelf."
            remove_from_shelf(selected_book)
        when "Return to menu."
            user_menu
        end 
    end 

    def view_shelf
        @user.reload
        prompt = TTY::Prompt.new        
        list = prompt.select("Your bookshelf:", (@user.get_bookshelf_list))

        display_book_info(list) 
    end 
    
    def add_to_shelf(book)
        
        BookUser.create(book: book, user: @user)
        view_shelf

    end 

    def remove_from_shelf(book)
        BookUser.all.find do |bookuser|
            bookuser.book == book
        end.destroy    
        view_shelf
    end 
end 