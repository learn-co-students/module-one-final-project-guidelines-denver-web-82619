class River < ActiveRecord::Base
    has_many :trips
    has_many :companies, through: :trips
end