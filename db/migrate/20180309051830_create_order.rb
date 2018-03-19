class CreateOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.integer :buyer_id
    	t.integer :customer_id
    	t.string :cust_trucktype
    	t.string :vendor_rent
    	t.string :status
    end
  end
end
