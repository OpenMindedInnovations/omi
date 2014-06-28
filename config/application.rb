require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Omi1
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass
  end
end
