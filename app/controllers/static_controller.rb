class StaticController < ApplicationController
	def index
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
	end

	def home
		if session[:user_id]
			@user = User.find(session[:user_id])
		else
			redirect_to root_path
		end
	end
end
