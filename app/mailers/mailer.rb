class Mailer < ActionMailer::Base
  	default from: 'franklin2412@gmail.com'
  	def invitation(invitation, invitation_url)
    	mail(to: invitation.recipient_email, subject: "Invitation")
    	@url = invitation_url
    	invitation.update_attribute(:sent_at, Time.now)
  	end
end
