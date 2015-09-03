require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module OMI
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass

    ActsAsTaggableOn.force_lowercase = true

    config.to_prepare do
      Devise::SessionsController.layout 'landing'
      Devise::RegistrationsController.layout proc{ |controller| 'landing' }
      Devise::ConfirmationsController.layout 'landing'
      Devise::PasswordsController.layout 'landing'
    end
  end
end
