class Book < ActiveRecord::Base
    has_many :book_users
    has_many :users, through: :book_users

    def self.get_book_list
        all.pluck(:title)
    end 

   

end 