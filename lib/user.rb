class User < ActiveRecord::Base
    has_many :bookusers
    has_many :books, through: :bookusers

    def self.get_user_name
        all.pluck(:name)
    end
    

end 