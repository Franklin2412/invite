class UsersController < ApplicationController
  	before_action :signed_in_user, only: [:edit, :update, :show]
    before_action :correct_user, only: [:edit, :update, :show]
    def new
  		@user = User.new
  	end
  	def show
  		@user = User.find(params[:id])
      respond_to do |format|
        format.html 
      end
  	end
  	def create
  		@user = User.new(user_params)
  		if @user.save
  			sign_in @user
  			flash[:success] = "Welcome to the Invite!"
  			redirect_to @user
  		else
  			render 'new'
  		end
  	end

    def callback
     
      @contacts = request.env['omnicontacts.contacts']
      
    end
    
  	private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
