class User < ActiveRecord::Base
	devise :omniauthable, :omniauth_providers => [:linkedin]
	#@user = User.from_omniauth(request.env["omniauth.auth"])

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name   # assuming the user model has a name
			user.image = auth.info.image # assuming the user model has an image
		end
	end
end
