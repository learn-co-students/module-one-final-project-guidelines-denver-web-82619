class CreateTeamsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :users, foreign_key: true
      t.references :players, foreign_key: true
    end 
  end
end
