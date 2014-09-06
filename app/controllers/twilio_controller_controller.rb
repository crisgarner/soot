require 'twilio-ruby'
require 'text_message'

class TwilioControllerController < ApplicationController

	 include Webhookable

	 after_filter :set_header
	 skip_before_action :verify_authenticity_token

	 #process the instructions sent to the twilio number
	 def request
	 	sender = params[:From]
	 	messages_array = []
	    sms_receiver = TextMessage.new  #Class TextMessage is on lib folder 
	    sms_receiver.body = ""  
	    sms_receiver.from = "+18316847481"  #twilio number
	    sms_receiver.to = receiver
	    messages_array[0] = sms_receiver
	    #splits the received message
	    instructions = params[:Body].upcase.split
	  	case instructions[0]
	  	#TODO: Instructions 1 - email, 2- text, 3- request
	  	when ""
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
