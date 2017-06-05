class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :email, :password, :password_confirmation,
        :current_password, profile_attributes: [:name, :birthday,
        :address, :phone_number, :description, :avatar]
    end
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      binding.pry
      user_params.permit :email, :password, :password_confirmation,
        profile_attributes: [:name, :birthday,
        :address, :phone_number, :description, :avatar]
    end
  end
end
