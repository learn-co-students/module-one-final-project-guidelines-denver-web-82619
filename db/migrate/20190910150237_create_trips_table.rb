class CreateTripsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.references :river, foreign_key: true
      t.references :company, foreign_key: true
    end
  end
end
