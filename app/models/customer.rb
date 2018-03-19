class Customer < ApplicationRecord
	validates :username, presence: true
	validates :phonenum, presence: true
	belongs_to :created_by, :class_name => 'Buyer'
	has_many :cutomer, :class_name => 'Order', :foreign_key => 'customer_id'

end