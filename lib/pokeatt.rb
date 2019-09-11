# frozen_string_literal: true

class PokeAtt < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :attack
end
