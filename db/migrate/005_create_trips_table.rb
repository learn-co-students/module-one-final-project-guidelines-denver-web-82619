class CreateTripsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :company, foreign_key: true
      t.string :location
      t.references :river, foreign_key: true
      t.string :name
      t.integer :rapid_level
      t.integer :age
      t.integer :cost
      t.references :user, foreign_key: true, default: nil
    end
  end
end
