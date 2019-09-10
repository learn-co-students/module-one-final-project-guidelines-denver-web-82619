class User < ActiveRecord::Base
    has_many :useritems
    has_many :items, through: :useritems 
end
