class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :kind, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.references :albums, index: true

      t.timestamps null: false
    end
    add_foreign_key :tracks, :albums
  end
end
