# frozen_string_literal: true

class Pokemon < ActiveRecord::Base
  has_many :pokeatts
  has_many :attacks, through: :pokeatts
end
