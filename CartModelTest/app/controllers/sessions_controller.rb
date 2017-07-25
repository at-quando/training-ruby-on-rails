class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end
  def create
   user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed == true
      # Log the user in and redirect to the user's show page.
          flash[:success] = "Login success"
          log_in user
          redirect_to user
      else
          flash[:alert] = "Your email is not confirmed"
          redirect_to login_path
      end
    else
      # Create an error message.
       # Not quite right!
      flash[:alert] = 'Invalid email/password combination'
      render 'new'
      
  	end
 	end
  
 	def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
