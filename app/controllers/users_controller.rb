class UsersController < ApplicationController
	
  def getProfile(number)
    testProfiles = [
        'LOLOLOLOLOLOL',
        'OLOLOLOLOLOLO',
        'TROLLOLOLOLOL'
    ]
    return testProfiles[number]
  end

	def profile
		id[:request.env["omniauth.auth"]]
		@response = "requested profile #" + params[:id]
	end

	def edit
		@response = 'testetstsetsetsetsets'

	end

	def location
		@response = 'testetstsetsetsetsets'
	end

	def message
		user =  User.all
		@response = user.as_json 
	end
end