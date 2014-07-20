class UsersController < ApplicationController
	def new
    # user = User.create(name:auth.info.first_name,
    #                        provider:auth.provider,
    #                                uid:auth.uid,
    #                                   email:auth.info.email,
    #                                        password:Devise.friendly_token[0,20]
    # )
    @user = User.new(params[:user])
    @user.save
    @response = 'testetstsetsetsetsets'
	end

	def profile
    testProfiles = [
        'L',
        'O',
        'L'
    ]
		@response = 'requested profile ' + testProfiles[params[:id].to_i]
	end

	def edit
		@response = 'testetstsetsetsetsets'

	end

	def location
		@response = 'testetstsetsetsetsets'
	end

	def message
		@response = 'testetstsetsetsetsets'
	end
end