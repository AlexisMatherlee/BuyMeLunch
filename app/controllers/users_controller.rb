class UsersController < ApplicationController
	def new
    # user = User.create(name:auth.info.first_name,
    #                        provider:auth.provider,
    #                                uid:auth.uid,
    #                                   email:auth.info.email,
    #                                        password:Devise.friendly_token[0,20]
    # )
    #
    @user = User.new(params[:user])
    @user.save
    @response = @user
	end

  def getProfile(number)
    testProfiles = [
        'LOLOLOLOLOLOL',
        'OLOLOLOLOLOLO',
        'TROLLOLOLOLOL'
    ]
    return testProfiles[number]
  end

	def profile
    # @profiles = User.find(:all)
    #@profiles = User.all



		@response = getProfile(params[:id].to_i)
    #@response = 'requested profile ' + @profiles[params[:id].to_i]
  end

  def random
    # @profiles = User.find(:all)

    @response = getProfile(rand())
    #@response = 'requested profile ' + @profiles[params[:id].to_i]
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

  private
  def app_params
    params.require(:user).permit(:name, :gender, :occupation, :isActive)
  end
end