class AuthController < ApplicationController
    skip_before_action :verify_authenticity_token

    def register
        @user = User.new(user_params)
        if @user.save

            redirect_to form_register_path, notice: "Berhasil membuat akun!"
        else
            render :form_register
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :phone, :email, :password)
    end

end
