class ApplicationController < ActionController::API
  include Pundit

  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  acts_as_token_authentication_handler_for User

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password])
  end
end
