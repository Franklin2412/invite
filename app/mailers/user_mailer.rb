class UserMailer < ActionMailer::Base
  	default from: "franklin2412@example.com"

  	def invite(user)
  		mail(:to => "#{user.name} <#{user.email}>", :subject => "Invitiation")
  	end
end
