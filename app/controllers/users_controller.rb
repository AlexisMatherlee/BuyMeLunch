class UsersController < ApplicationController

def getProfile(number)
  user =  User.all
	return user[number-1]
end

def random
  user =  User.all
  @response = user.sample.to_json.html_safe
end

def profile
	@response = getProfile(params[:id].to_i).to_json.html_safe

end

def addtoqueue_a
  user = getProfile(params[:id].to_i)
  queue = JSON::parse(user.queue_a)
  queue.push(params[:targetid].to_i)
  #user.queue.push(params[:targetid].to_i)
  user.queue_a = queue.uniq.to_json
  user.save
end

def addtoqueue_b
  user = getProfile(params[:id].to_i)
  queue = JSON::parse(user.queue_b)
  queue.push(params[:targetid].to_i)
  #user.queue.push(params[:targetid].to_i)
  user.queue_b = queue.uniq.to_json
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
  @response = user.to_json.html_safe
  return @response
end

def resetallmatches
  user =  User.all
  user.each do |thing|
    thing.queue_a = []
    thing.queue_b = []
    thing.save
  end

  @response = "done"
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
	@response = user.to_json.html_safe
end
end