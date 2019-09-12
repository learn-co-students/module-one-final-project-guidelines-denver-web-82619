class DeleteAllTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rivers
    drop_table :companies
    drop_table :users
    drop_table :trips
  end
end
