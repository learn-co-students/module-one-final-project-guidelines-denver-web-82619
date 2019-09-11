# frozen_string_literal: true

class Pokemon < ActiveRecord::Base
  has_many :pokeatts
  has_many :attacks, through: :pokeatts

  def attacks
    value = PokeAtt.all.select do |pokemonattacks|
      pokemonattacks.pokemon.name == self.name
    end
    value.map do |pokeatt|
      pokeatt.attack.name
    end[0]
  end

  def enemy_attack
    value = PokeAtt.all.select do |pokemonattacks|
      pokemonattacks.pokemon.name == self.name
    end
    value.map do |pokeatt|
      pokeatt.attack.name
    end
  end
end
