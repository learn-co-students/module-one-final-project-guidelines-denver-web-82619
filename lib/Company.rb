class Company < ActiveRecord::Base
    has_many :trips
    has_many :rivers, through: :trips
end