require 'twilio-ruby'
require 'text_message'

class TwilioController < ApplicationController

	 include Webhookable

	 after_filter :set_header
	 skip_before_action :verify_authenticity_token

	 #process the instructions sent to the twilio number
	 def request_sms
	 	sender = params[:From]
	 	receiver = params[:From]
	 	messages_array = []
	    sms_receiver = TextMessage.new  #Class TextMessage is on lib folder 
	    sms_receiver.body = ""  
	    sms_receiver.from = "+18316847481"  #twilio number
	    sms_receiver.to = receiver
	    messages_array[0] = sms_receiver
	    #splits the received message
	    instructions = params[:Body].upcase.split('/')
	  	case instructions[0]
	  	#TODO: Pin
	  	when "REQUEST"
	  		#request number
	  		#instruction: request/mom/email/pin
	  		user = User.where("lower(email) = ? AND pin = ?", instructions[2].downcase,instructions[3]).first
	  		if user
	  			contact = user.contacts.where("lower(name) = ?", instructions[1].downcase).first
	  			sms_receiver.body = "Hello #{user.name} the number of #{instructions[1]} is #{contact.phone}; Remember to delete the messages for security"
	  		else
	  			sms_receiver.body = "Sorry the email or pin are wrong!"
	  		end		
	  	else
			#send SMS
			#instruction: mom/body/email/pin
			if instructions.size == 4
				user = User.where("lower(email) = ? AND pin = ?", instructions[2].downcase,instructions[3]).first
				if user
		  			contact = user.contacts.where("lower(name) = ? ", instructions[0].downcase).first
					sms_receiver.body = "the message was sent to the phone number of #{instructions[0]} which is #{contact.phone}; Remember to delete the messages for security"
					sms_sender = TextMessage.new
		            sms_sender.body = instructions[1].downcase
		            sms_sender.from = "+18316847481"
		            sms_sender.to = contact.phone
		            messages_array[1] = sms_sender	
		  		else
		  			sms_receiver.body = "Sorry the email or pin are wrong!"
		  		end	
		  	else
		  		sms_receiver.body = "Wrong instruction!"
		  	end
			
	  	end
	  	response = ""
	    account_sid = ENV['TWILIO_ACCOUNT_SID']
	    auth_token =  ENV['TWILIO_TOKEN']
	    @client = Twilio::REST::Client.new account_sid, auth_token  
	    messages_array.each do |message|
	      @client.account.messages.create(
	        :from => message.from,
	        :to => message.to,
	        :body => message.body
	      ) 
	      response = "Sent message to #{message.from}"
	    end
	    render xml: response
	 end
end
