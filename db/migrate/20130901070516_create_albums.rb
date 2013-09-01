class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :caption
      t.integer :user_id
      t.text :description
      t.timestamps
    end
    add_index :albums, :user_id
  end
end
