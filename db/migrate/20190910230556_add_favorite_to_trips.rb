class AddFavoriteToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :favorites, :boolean, default: false
  end
end
