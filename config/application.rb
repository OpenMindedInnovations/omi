require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module OMI
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass

    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.remove_unused_tags = true

    config.to_prepare do
      Devise::SessionsController.layout 'landing'
      Devise::RegistrationsController.layout proc{ |controller| 'landing' }
      Devise::ConfirmationsController.layout 'landing'
      Devise::PasswordsController.layout 'landing'
    end

    config.generators do|g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end