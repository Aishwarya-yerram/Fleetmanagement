class CustomersController < ApplicationController
	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		@customer.created_by_id = @current_user.id
		if @customer.save
			flash[:success] = "you have successfully created a new customer"
			redirect_to users_buyer_path
		else
			render 'new'
		end
	end

	def index
		@customers = Customer.all
	end
	
	private
		def customer_params
			params.require(:customer).permit(:username, :email, :phonenum, :numof_trucks, :trucktype_needed, :expected_rent)
		end
end