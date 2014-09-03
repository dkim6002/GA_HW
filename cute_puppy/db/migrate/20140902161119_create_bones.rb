class CreateBones < ActiveRecord::Migration
  def change
    create_table :bones do |t|
    	t.string :size
    	t.belongs_to :puppy
    end
  end
end
