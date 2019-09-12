PokeAtt.destroy_all
Pokemon.destroy_all
Attack.destroy_all

abra = Pokemon.create(name: 'Abra', health: 50)
pikachu = Pokemon.create(name: 'Pikachu', health: 55)
confusion = Attack.create(name: 'Confusion', damage: 25)
thundershock = Attack.create(name: 'Thundershock', damage: 20)
new_att1 = PokeAtt.create(pokemon: abra, attack: confusion)
new_att2 = PokeAtt.create(pokemon: pikachu, attack: thundershock)
