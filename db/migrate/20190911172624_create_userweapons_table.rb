class CreateUserweaponsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :userweapons do |t|
      t.references :user, foreign_key: true
      t.references :weapon, foreign_key: true
    end
  end
end
