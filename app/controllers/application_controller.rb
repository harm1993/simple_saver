class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :avatar, :email, :password, :current_password)
    end
    # app/controllers/application_controller.rb
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
