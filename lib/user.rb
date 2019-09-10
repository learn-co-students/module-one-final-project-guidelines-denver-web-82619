class User < ActiveRecord::Base
    has_many :bookusers
    has_many :books, through: :bookusers

end 