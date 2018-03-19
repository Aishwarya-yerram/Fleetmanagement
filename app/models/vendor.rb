class Vendor < ApplicationRecord
	validates :companyname, presence: true
	validates :email, presence: true, format:  /\w+@\w+\.{1}[a-zA-Z]{2,}/
	validates :taxid, presence: true
	validates :gstid, presence: true
	validates :phonenum, presence: true, length: {minimum:10}
	belongs_to :created_by, :class_name => 'Seller'

end