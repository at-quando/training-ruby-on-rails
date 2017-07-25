class UserMailer < ApplicationMailer
	default :from => "dhquan1910@gmail.com"

  def send_when_login

  end
	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.email}", :subject => " Registration Confirmation for Model Cart App")
	end
end
