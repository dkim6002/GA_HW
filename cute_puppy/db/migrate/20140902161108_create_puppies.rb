class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
    	t.string :name
    	t.integer :age
    	t.string :img_url
    	t.boolean :clean
    end
  end
end
