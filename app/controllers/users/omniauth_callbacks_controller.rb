class Users::OmniauthCallbacksController < ApplicationController
Devise::OmniauthCallbacksController
    def facebook
      if current_user.present?
        current_user.apply_omniauth(request.env["omniauth.auth"])
        redirect_to edit_user_registration_path, notice: "Facebook Account Linked"
      else
        if request.env["omniauth.auth"].info.email.blank?
          redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
          return # be sure to include an return if there is code after this otherwise it will be executed
        end
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
      end
    end

    def failure
      redirect_to root_path
    end
end
