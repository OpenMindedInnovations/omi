module Api
  module V1
    class ApiController < ActionController::Base
      protect_from_forgery with: :null_session
      before_filter :authenticate_user!
    end
  end
end
