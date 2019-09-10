class Trip < ActiveRecord::Base
    belongs_to :river
    belongs_to :company
    belongs_to :user
end