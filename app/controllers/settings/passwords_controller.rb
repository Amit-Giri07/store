class Settings::PasswordsController < ApplicationController
    def show
    end

    def update
        if Current.user.update(password_params)
            redirect_to setting_profile_path, status: :see_other, notice: "Your password has beem updated."
        else
            render :show, status: :unprocessable_entity
        end
    end

    private
    def password_params
        params.expect(user: [ :password, :password_confirmation, :password_challange]).with_defaults(password_challange: "")
    end
end