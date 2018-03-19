class CreateVendor < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
    	t.string :companyname
    	t.string :email
    	t.integer :phonenum
    	t.integer :numof_trucks
    	t.string :trucktype
    	t.integer :rentof_truck
    	t.string :taxid
    	t.string :gstid
    end
  end
end
