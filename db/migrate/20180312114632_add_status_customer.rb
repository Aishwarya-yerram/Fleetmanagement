class AddStatusCustomer < ActiveRecord::Migration[5.1]
  def change
  	add_column :customers, :status, :string, default: :pending
  end
end
