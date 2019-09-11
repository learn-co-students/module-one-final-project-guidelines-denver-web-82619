class Book < ActiveRecord::Base
    has_many :bookusers
    has_many :users, through: :bookusers

    def self.get_book_list
        all.pluck(:title)
    end 
    
end 