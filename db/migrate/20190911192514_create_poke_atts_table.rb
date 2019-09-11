class CreatePokeAttsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :poke_atts do |t|
      t.references :pokemon, foreign_key: true
      t.references :attack, foreign_key: true
    end
  end
end
