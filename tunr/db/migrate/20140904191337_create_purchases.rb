class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.belongs_to :user
    	t.belongs_to :song
    	t.timestamps
    end
  end
end
