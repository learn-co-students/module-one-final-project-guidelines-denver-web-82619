class CreatePlayersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :points
    end 
  end
end
