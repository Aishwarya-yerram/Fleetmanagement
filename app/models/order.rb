class Order < ApplicationRecord
	belongs_to :customer, :class_name => 'Customer'
	belongs_to :buyer, :class_name => 'Buyer'

end