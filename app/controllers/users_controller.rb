class UsersController < ApplicationController
	# before_action :require_login 

	def home 
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "you are successfully created an account,wait until admin accepted your request"
			flash[:success] = "When admin accepted you can login"
			redirect_to users_signin_path
		else 
			render 'new'
		end
	end

	def signin

	end

	def login
		@user = User.find_by(status: :accepted, name: params[:name]).try(:authenticate, params[:password])
		if @user
			flash[:success] = "you are logged in"
			session[:user_id] = @user.id
			if @user.type == "Seller"
				redirect_to users_seller_path
			else
				redirect_to users_buyer_path
			end
		else
			flash[:danger] = "Invalid username/password or Admin didn't accepted the request"
			render 'signin'
		end
	end

	def index
		@usersb = Buyer.where(status: :pending)
		@users = Seller.where(status: :pending)
	end

	def admin
	end
	
	def adminlogin
		@user = Admin.find_by(name: params[:name]).try(:authenticate, params[:password])
		if @user
			flash[:success] = "you are successfully logged in"
			session[:user_id] = @user.id
			redirect_to users_path
		else
			flash[:danger] = "Invalid username/password "
			render 'admin'
		end
	end

	def accept
		@user = Seller.find_by(:status => "pending")
		@user.update(status: :accepted)
		UserMailer.welcome_email(@user).deliver_now
		flash[:success] = "You accepted the request of Seller"
		redirect_to users_path
	end
	def decline
		@user = Seller.find_by(status: :pending)
		@user.update(status: :rejected)
		flash[:danger] = "You rejected the request of Seller"
		redirect_to users_path
	end

	def buyeraccept
		@user = Buyer.find_by(status: :pending)
		@user.update(status: :accepted)
		UserMailer.welcome_email(@user).deliver_now
		flash[:success] = "You accepted the request of Buyer"
		redirect_to users_path
	end

	def buyerdecline
		@userb = Buyer.find_by(status: :pending)
		flash[:danger] = "You rejected the request of Buyer"
		redirect_to users_path
	end

	
	def seller
	end

	def sellershow
		@seller = Seller.find(@current_user.id)
	end
 
	def buyer
	end


	def buyershow
		@buyer = Buyer.find(@current_user.id)
	end
 

	def logout
		reset_session
		flash[:danger] = "You are successfully logged out"
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :type,:status, :password, :DOB, :Gender, :password_confirmation)
		end
	
end