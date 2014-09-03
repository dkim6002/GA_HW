class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.string :blogtile
      t.text :bio
      t.text :photo_url

      t.timestamps
    end
  end
end