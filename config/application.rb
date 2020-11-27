require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MeuTeste
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # config.autoload_paths += %W(#{config.root}/app/providers)

    config.time_zone = "America/Sao_Paulo"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators.stystem_tests = nil

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        routing_specs: false
    end
  end
end