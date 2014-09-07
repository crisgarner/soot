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
		redirect_to '/contacts/show_all'
	end

	def save_new
		if session[:user_id]
			user = User.find(session[:user_id])
		  	user.contacts.create(name: params['name'],phone: params['number'],email: params['email'])
		end
		redirect_to '/contacts/show_all'
	end

	

	def update_contact
		if session[:user_id]
			@contact = Contact.find(params['contact_id'])
			@contact.name = params['name']
			@contact.phone = params['phone']
			@contact.email = params['email']
			@contact.save
		end
		redirect_to '/contacts/show_all'
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

	def edit
		if session[:user_id]
			@contact = Contact.find(params['contact_id'])
		end
	end

	def new

	end
end
