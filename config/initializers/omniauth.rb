OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'], {image_size: 'large',scope: 'email,user_friends', client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end