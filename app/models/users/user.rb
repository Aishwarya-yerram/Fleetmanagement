class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :name
	validates :name, presence: true, length: {minimum:4, maximum:10}
	validates :password, length: {minimum:7, maximum:20}, on: :create
	validates :email, presence: true, format:  /\w+@\w+\.{1}[a-zA-Z]{2,}/
	enum status: [ :pending, :accepted, :rejected]

	# validates :password, confirmation: true
end