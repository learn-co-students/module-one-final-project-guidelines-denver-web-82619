class CreateWeaponsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :category
    end
  end
end
