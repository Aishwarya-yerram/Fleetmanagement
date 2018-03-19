class Buyer < User
	has_many :customers, :class_name => 'Customer', :foreign_key => 'created_by_id'
	has_many :orders, :class_name => 'Order', :foreign_key => 'buyer_id'
end