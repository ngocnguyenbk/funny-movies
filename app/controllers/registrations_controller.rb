# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    email = "#{sign_up_params[:username]}@example.com"
    self.resource = User.new(sign_up_params.merge(email: email))
    if resource.save
      flash[:notice] = "Welcome #{resource.username}!"
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      flash[:alert] = resource.errors.full_messages.join(", ")
      respond_with resource
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username password password_confirmation])
  end
end
