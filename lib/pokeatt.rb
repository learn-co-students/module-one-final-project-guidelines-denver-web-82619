# frozen_string_literal: true

class PokeAtt < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :attack

  def self.damage_value(move)
    value = all.select do |pokemonattack|
      pokemonattack.attack.name == move
    end
    value.map do |pokeattack|
      pokeattack.attack.damage
    end[0]
  end
end
