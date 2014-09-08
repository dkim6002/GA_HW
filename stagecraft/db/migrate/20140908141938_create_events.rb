class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.date :date
    	t.time :time
    	t.string :type
    	t.belongs_to :artist
    	t.belongs_to :venue
    end
  end
end
