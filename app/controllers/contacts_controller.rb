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
		  			user.contacts.create(name: contact[1]['name'],phone: contact[1]['number'],email: contact[1]['email'])
			  	end
			end
		end
	end

	def show_all
		if session[:user_id]
			@user = User.find(session[:user_id])
			@contacts = @user.contacts.find_all
		end
	end

	def remove
		if session[:user_id]
			@contact = Contact.find(params['contact_id'])
		@contact.destroy
		end
		redirect_to '/contacts/show_all'
		
	end
end
