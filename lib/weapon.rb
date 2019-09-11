class Weapon < ActiveRecord::Base
    has_many :userwespons
    has_many :users, through: :userweapons
end