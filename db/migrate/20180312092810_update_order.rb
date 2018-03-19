class UpdateOrder < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :vendor_rent, :integer
  	change_column :customers, :phonenum, :bigint
  	change_column :vendors, :phonenum, :bigint

  end
end
