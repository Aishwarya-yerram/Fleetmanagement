class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :customers, :excepted_rent, :expected_rent
  end
end
