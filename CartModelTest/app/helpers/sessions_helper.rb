module SessionsHelper
	def log_in user
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete :user_id
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
 def logged_in?
    !current_user.nil?
  end

   # Confirms a logged-in user.
  # def user_signed_in?
  #   unless logged_in?
  #     flash[:danger] = "Please log in."
  #     redirect_to login_path
  #   end
  # end

  

end
