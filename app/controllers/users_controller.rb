class UsersController < ApplicationController

def getProfile(number)
  user =  User.all
	return user[number-1]
end

def random
  user =  User.all
  @response = user.sample.to_json
end

def profile
	@response = getProfile(params[:id].to_i).to_json

end

def addtoqueue_a
  user = getProfile(params[:id].to_i)
  queue = JSON::parse(user.queue_a)
  queue.push(params[:targetid].to_i)
  #user.queue.push(params[:targetid].to_i)
  user.queue_a = queue.to_json
  user.save
end

def addtoqueue_b
  user = getProfile(params[:id].to_i)
  queue = JSON::parse(user.queue_b)
  queue.push(params[:targetid].to_i)
  #user.queue.push(params[:targetid].to_i)
  user.queue_b = queue.to_json
  user.save
end

def comparequeue
  user = getProfile(params[:id].to_i)
  queue_a = JSON::parse(user.queue_a)
  queue_b = JSON::parse(user.queue_b)

  common_elements = queue_a & queue_b

  returnstring = []
  common_elements.each {|x| returnstring.push(getProfile(x))}
  user.matches = returnstring
  @response = user.to_json
  return @response
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
	@response = user.to_json
end
end