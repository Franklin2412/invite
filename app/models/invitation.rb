class Invitation < ActiveRecord::Base
	belongs_to :sender, :class_name => 'User'
	has_one :recipient, :class_name => 'User'

	validates_presence_of :recipient_email

	before_create :generate_token

private
	
	def generate_token
    	self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  	end

end
