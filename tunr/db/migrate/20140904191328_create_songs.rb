class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :title
    	t.float :price
    	t.text :preview_url
    	t.text :song_url
    	t.integer :artist_id
    	t.integer :year
    end
  end
end
