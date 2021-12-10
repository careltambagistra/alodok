class ProfilController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        profil = Profil.all

        render :json =>profil
    end

    def create
        profil = Profil.create(create_params)

        render json: {
            data: profil
        },status: :created

    rescue StandardError => e
        render json: {
            message: e
        }, status: :bad_request
    end

    def show
        profil = Profil.find(params[:id])

        render :json => profil, status: :ok

        rescue ActiveRecord::RecordNotFound => e
            render json: {
                message: e
            }, status: :not_found
    end

    def update
        profil = Profil.find(params[:id])

        profil.update(update_params)

        render :json => profil, status: :ok

        rescue ActiveRecord::RecordNotFound => e
            render json: {
                message: e
            }, status: :not_found
    end

    def destroy
        profil = Profil.find(params[:id])
        profil.destroy

        render :json => profil, status: :ok

        rescue ActiveRecord::RecordNotFound => e
            render json: {
                message: e
            }, status: :not_found
    end

    private

    def create_params
        params.permit(:name, :no_hp, :email, :tgl_lhr, :jk, :kota, :no_ktp, :alamat)
    end

    def update_params
        params.permit(:name, :no_hp, :email, :tgl_lhr, :jk, :kota, :no_ktp, :alamat)
    end
end