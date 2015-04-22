class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :kind, null: false
      t.integer :band_id, null: false
      t.references :bands, index: true

      t.timestamps null: false
    end
    add_foreign_key :albums, :bands
  end
end
