class User < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy

  def self.from_omniauth(auth)
    user = nil
  	if auth["provider"] == "facebook"
  		user = create_with_omniauth_facebook(auth)
  	end
    user 
  end

  def self.create_with_omniauth_facebook(auth)
      user = User.new
	    user.name = auth.info.name
	    user.image = auth.info.image
	    user.email = auth.info.email
	    user.save!
      user
  end

  #todo: identity and google omni auth
  
end