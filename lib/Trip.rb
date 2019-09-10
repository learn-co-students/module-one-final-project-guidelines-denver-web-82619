class Trip < ActiveRecord::Base
    belongs_to :river
    belongs_to :company
end