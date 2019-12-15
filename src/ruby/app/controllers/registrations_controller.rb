class RegistrationsController < Devise::RegistrationsController
  before_action :check_registration_enabled, :only => [:new, :create]
  before_action :devise_params

  protected
    def after_inactive_sign_up_path_for(resource)
      new_session_path(resource)
    end

    def check_registration_enabled
      if Fulcrum::Application.config.fulcrum.disable_registration
        render_404 and return
      end
    end

    def devise_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :initials])

      devise_parameter_sanitizer.permit(:account_update, keys: [
        :email, :password, :password_confirmation, :remember_me,
        :name, :initials, :email_delivery, :email_acceptance,
        :email_rejection, :locale, :current_password
      ])
    end
end
