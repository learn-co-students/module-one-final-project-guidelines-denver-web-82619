class Book < ActiveRecord::Base
    has_many :bookusers
    has_many :users, through: :bookusers
end 