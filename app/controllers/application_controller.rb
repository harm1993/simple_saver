class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["www.simplesaver.online"] || "localhost:3000" }
  end
end
