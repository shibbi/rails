class ChangeAlbumsTracksTables < ActiveRecord::Migration
  def change
    remove_column :albums, :bands_id
    remove_column :tracks, :albums_id
  end
end
