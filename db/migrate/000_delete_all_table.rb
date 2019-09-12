class DeleteAllTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :trips
    drop_table :rivers
    drop_table :companies
    drop_table :users
  end
end
