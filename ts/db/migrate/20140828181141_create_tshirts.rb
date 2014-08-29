class CreateTshirts < ActiveRecord::Migration
  def change
    create_table :tshirts do |t|
      t.string :title
      t.string :photo_url

      t.timestamps
    end
  end
end
