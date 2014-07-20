class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def linkedin
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
    else
      session["devise.linkedink_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end