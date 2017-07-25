class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create] 
	def new
		@user= User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
      @user.set_confirmation_token
      @user.save(validate: false)
      UserMailer.registration_confirmation(@user).deliver_now
      flash.now[:success] = "Please confirm your email address to continue"
			redirect_to login_path
		else
      flash[:alert] = "Invalid, please try again"
			render :new
		end
	end

  def index
  	page = params[:page].to_i > 0 ? params[:page] :1
  	@users=User.all.limit(10).offset((params[:page].to_i-1) *10 )
  end

  def show

  end

  def edit

 	end

 	def update
 		render :edit
 	end

  def destroy
  redirect_to users_path 
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user
      user.validate_email
      user.save(validate: false)
      redirect_to user
    else 
       flash[:error] = "Sorry. User does not exist"
     redirect_to root_url
    end
  end

  private
  def user_params
  	params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :name)
  end


end
