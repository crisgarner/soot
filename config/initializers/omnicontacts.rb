require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET'], {:redirect_path => "/contacts/gmail/callback"}
end
