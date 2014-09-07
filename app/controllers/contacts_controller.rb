class ContactsController < ApplicationController
	def contacts_callback
		if session[:user_id]
			@contacts = request.env['omnicontacts.contacts']
		 	@user = request.env['omnicontacts.user']
		end
				
	end

	def save_contacts
		if session[:user_id]
			user = User.find(session[:user_id])
			params['form'].each do |contact|
		  	if contact[1]['status']
		  			user.contacts.create(friend_id: params[:user_id],status: "PENDING")
			  		logger.debug contact[1]['name']
			  	end
			end
		end
	end
end
