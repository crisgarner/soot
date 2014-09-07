DisruptHack::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  ENV['TWILIO_ACCOUNT_SID'] = 'AC10fc09ca8885bdba98a1d3e2136da9e9'
  ENV['TWILIO_TOKEN'] = 'c42b8ba6474f1f9ffe03530ce8e4323f'
  ENV['FACEBOOK_ID'] = '539552046178571'
  ENV['FACEBOOK_SECRET'] = '94061a1429be9156669b2cd30e00c39a'
  ENV['GOOGLE_ID'] = '1004199404672-f6f0a2do5ke1cke4en6n1skj0u3n2rp1.apps.googleusercontent.com'
  ENV['GOOGLE_SECRET'] = 'mmvRmWsc8qSCjh17Xtv6jSN2'
end
