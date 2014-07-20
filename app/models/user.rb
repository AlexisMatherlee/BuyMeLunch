class User < ActiveRecord::Base
	devise :omniauthable, :omniauth_providers => [:linkedin]

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end


	def self.from_omniauth(auth)
		where(auth.slice('uid', 'provider')).first_or_create do |user|
			user.email = auth.info.email
			user.name = auth.info.name
			user.headline = auth.info.headline
			user.image = auth.info.image
			user.encrypted_password = Devise.friendly_token[0,20]
		end
	end

end
