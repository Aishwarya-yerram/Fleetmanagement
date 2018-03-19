class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(buyer_id: params[:buyer_id], customer_id: params[:customer_id], cust_trucktype: params[:cust_trucktype], status: params[:status])
		if @order.save
			flash[:success] = "your order has been sent"
			redirect_to users_buyer_path
		end
	end

	def index
		@orders = Order.where(status: :pending)
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])

		@order.update!(vendor_rent: params[:order][:vendor_rent])
		flash[:success] = "you have confirmed the order"
		redirect_to users_seller_path
	end

	def buyernotif
		@order = Order.where(status: :pending)
	end

	def accept
		@order = Order.find_by(status: :pending)
		@customer = Customer.find_by(status: :pending)
		@order.update(status: :accepted)
		@customer.update(status: :accepted)
		flash[:success] = "You accepted"
		redirect_to users_buyer_path
	end

	def decline
		@order = Order.find_by(status: :pending)
		# @order.update(status: :rejected)
		flash[:danger] = "You rejected"
		redirect_to users_buyer_path
	end


end
