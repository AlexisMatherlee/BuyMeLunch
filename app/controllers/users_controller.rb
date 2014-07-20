class UsersController < ApplicationController
	def new
		@response = "testetstsetsetsetsets"
	end

	def profile
		id[:request.env["omniauth.auth"]]
		@response = "requested profile #" + params[:id]
	end

	def edit
		@response = "testetstsetsetsetsets"

	end

	def location
		@response = "testetstsetsetsetsets"
	end

	def message
		@response = "testetstsetsetsetsets"
	end
end