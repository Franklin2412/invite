require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  	importer :gmail, "516386906867.apps.googleusercontent.com", "ZXXdahwyimlOol9nzF4WbzDU", {:redirect_path => "/users/gmail/callback"}
end
