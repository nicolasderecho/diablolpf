require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
#require "action_view/railtie"
#require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DiablolpfApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.time_zone = 'Buenos Aires'

    config.i18n.default_locale = 'es-AR'
    config.i18n.available_locales = ['en', 'es-AR']
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{yml}')]

    config.autoload_paths += Dir[Rails.root.join('app', 'controllers', '{**}', '*.{rb}')]
    config.autoload_paths += %W(#{config.root}/app/concerns/**)
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/classes/**)
    config.autoload_paths += %W(#{config.root}/searches/**)
    config.autoload_paths += %W(#{config.root}/serializers/**)
    config.autoload_paths += %W(#{config.root}/uploaders/**)

    config.generators do |g|
      g.orm :mongoid
    end

    config.public_file_server.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS PUT PATCH DELETE HEAD}.join(",")
    }

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :put, :patch, :delete, :head]
      end
    end

  end
end
