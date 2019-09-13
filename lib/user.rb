class User < ActiveRecord::Base
    has_many :book_users
    has_many :books, through: :book_users

    def self.get_user_name
        all.pluck(:user_name)
    end

    def get_bookshelf_list
        books.map do |book|
            book.title
        end 
    end 
    

end 