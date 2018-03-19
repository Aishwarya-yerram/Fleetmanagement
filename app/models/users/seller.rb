class Seller < User
	has_many :vendors, :class_name => 'Vendor', :foreign_key => 'created_by_id'
end