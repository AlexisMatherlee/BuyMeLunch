class UsersController < ApplicationController

def getProfile(number)
  user =  User.all
	return user[number-1]
end

def random
  user =  User.all
  @response = user.sample.as_json
end

def profile
	@response = getProfile(params[:id].to_i).as_json
end

def addtoqueue
  user = getProfile(params[:id].to_i)
  user.queue.push(params[:targetid].to_i)
  user.save
end

def match
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