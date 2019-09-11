# frozen_string_literal: true

class Attack < ActiveRecord::Base
  has_many :pokeatts
  has_many :pokemon, through: :pokeatts
end
