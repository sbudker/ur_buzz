require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UrBuzz
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

     # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.action_mailer.smtp_settings = {
        address:              'smtp.gmail.com',
        port:                 587,
        domain:               'gmail.com',
        user_name:            'urbuzzapp@gmail.com',
        password:             'urbuzz2016',
        authentication:       :plain,
        enable_starttls_auto: true
    }

    config.action_mailer.default_url_options = {
        host: "localhost:3000"
    }
  end
end
