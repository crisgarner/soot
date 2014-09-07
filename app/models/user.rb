class User < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy
  before_create :generate_access_pin
  def self.from_omniauth(auth)
    user = nil
  	if auth["provider"] == "facebook"
  		user = create_with_omniauth_facebook(auth)
  	end
    user 
  end

  def self.create_with_omniauth_facebook(auth)
      user = User.new
      user.facebook_uid = auth.uid
      user.facebook_oauth_token = auth.credentials.token
      user.facebook_oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.name = auth.info.name
	    user.image = auth.info.image
	    user.email = auth.info.email
	    user.save!
      user
  end

  private 
  def generate_access_pin
      begin
      id = rand(9999).to_s.center(4, rand(9).to_s)
        self.pin = id
      end while self.class.exists?(pin: pin)
  end

  #todo: identity and google omni auth
  
end
