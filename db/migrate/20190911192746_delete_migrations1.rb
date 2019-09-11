class DeleteMigrations1 < ActiveRecord::Migration[5.2]
  def change
    drop_table :pokemon
    drop_table :pokeatts
  end
end
