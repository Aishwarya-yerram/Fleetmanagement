class AddDetailsUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :DOB, :date
  	add_column :users, :Gender, :text 
  end
end
