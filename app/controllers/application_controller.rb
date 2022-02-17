class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio])
  end
end
