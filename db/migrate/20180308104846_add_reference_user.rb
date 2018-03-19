class AddReferenceUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :vendors, :created_by_id, :integer
  	add_column :customers, :created_by_id, :integer 
  end
end
