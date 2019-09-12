class User < ActiveRecord::Base
    has_many :userweapons
    has_many :weapons, through: :userweapons 
end
