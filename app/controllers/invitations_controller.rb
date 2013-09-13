class InvitationsController < ApplicationController
  	def new
  		@invitation = Invitation.new
    end
  	def create
      email_collections = []
  		@invitation = Invitation.new(:recipient_email => params[:recipient_email])
  		if @invitation.save
        email_collections = @invitation.recipient_email.split(" ")
        email_collections.each do 
          Mailer.invitation(@invitation, invitation_url(@invitation.token)).deliver
        end        
        flash[:notice] = "Thank you, invitation sent."
        redirect_to current_user
  		else
  			render :action => 'new'
  		end
  	end

  	private

  	
end
