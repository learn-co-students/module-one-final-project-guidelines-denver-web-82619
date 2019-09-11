class Userweapon < ActiveRecord::Base
    belongs_to :user
    belongs_to :weapon
end
