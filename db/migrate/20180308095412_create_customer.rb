class CreateCustomer < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
    	t.string :username
    	t.string :email
    	t.integer :phonenum
    	t.string :trucktype_needed
    	t.integer :excepted_rent
    	t.integer :numof_trucks
    end
  end
end
