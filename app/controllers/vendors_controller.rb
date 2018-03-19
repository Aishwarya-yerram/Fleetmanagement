class VendorsController < ApplicationController
	def new
		@vendor = Vendor.new
	end
	def create
		@vendor = Vendor.new(vendor_params)
		@vendor.created_by_id = @current_user.id
		if @vendor.save
			flash[:success] = "you have successfully created a new vendor"
			redirect_to users_seller_path
		else
			render 'new'
		end
	end

	def index
		@vendors = Vendor.all
	end

	def show
		@vendor = Vendor.find(params[:id])
	end

	private
		def vendor_params
			params.require(:vendor).permit(:companyname, :email, :phonenum, :numof_trucks, :trucktype, :rentof_truck, :taxid, :gstid)
		end
end