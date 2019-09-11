class CreatePokemonTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.integer :health
    end
  end
end
