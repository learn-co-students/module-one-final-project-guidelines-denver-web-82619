# frozen_string_literal: true

class Pokemon < ActiveRecord::Base
  has_many :pokeatts
  has_many :attacks, through: :pokeatts

  def attacks
    value = PokeAtt.all.select do |pokemonattacks|
      pokemonattacks.pokemon.name == self.name
    end
  end
end
