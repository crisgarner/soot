class SessionsController < ApplicationController
  
  def create
  	auth = env["omniauth.auth"]
  	authentication = User.find_by_facebook_uid(auth.uid)
    if authentication
    	 user = authentication
    else
    	 user = User.from_omniauth(env["omniauth.auth"])
    end
   
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
