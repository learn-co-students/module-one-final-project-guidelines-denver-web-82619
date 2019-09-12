class User < ActiveRecord::Base
    has_many :book_users
    has_many :books, through: :book_users

    def self.get_user_name
        all.pluck(:user_name)
    end

    def get_bookshelf_list
        # BookUser.all.select do |bookuser|
        #     bookuser.user == self 
        # end 
        self.books.map do |book|
            # book.reload
            # binding.pry
            book.title
        end 
    end 
    

end 