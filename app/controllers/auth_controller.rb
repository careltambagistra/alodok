class AuthController < ApplicationController
    skip_before_action :verify_authenticity_token

    def register
        @auth = Auth.create(auth_params)
        

            render json: {
            data: @auth
        },status: :created
        
    end

    private

    def auth_params
        params.permit(:name, :phone, :email, :password)
    end

    def form_login

    end

    def login
        email = params[:email]
        password = params[:password]
        
        user = Auth.find_by(email: email)
        if user
            if user.authenticate(password)

                # membuat session dengan key = :user_id
                session[:user_id] = user.id
                redirect_to profil_path
            else
                redirect_to form_login_path, alert: "Password tidak sesuai"
            end
        else
            redirect_to form_login_path, alert: "email tidak ditemukan"
        end
        
    end

end
