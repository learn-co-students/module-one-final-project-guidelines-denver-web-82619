class Item < ActiveRecord::Base
    has_many :useritems
    has_many :users, through: :useritems
end