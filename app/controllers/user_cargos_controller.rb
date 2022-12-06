class UserCargosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_method
    before_action :authorize
    def index
        user  = User.find(session[:user_id]) 
        userCargo = user.user_cargos
        cargo_ships = user.cargo_ships
        render json: userCargo
    end

    def create
        user_cargo = UserCargo.create!(user_id: session[:user_id], cargo_ship_id: params[:cargo_ship_id], count: params[:count], amount: params[:amount])
        render json: user_cargo, status: :created
    end

    def update
        cargo_ship = UserCargo.find_by!(id: params[:id], user_id: session[:user_id])
        cargo_ship.update!(cargo_ship_params)
        render json: cargo_ship, status: :accepted
    end

    def destroy
        cargo_ship = UserCargo.find_by!(id: params[:id], user_id: session[:user_id])
        cargo_ship.destroy
        head :no_content
    end
    private
    def authorize
        return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
    def record_not_found_method
        render json: { error: "Cargo Not Found" }, status: :not_found
    end
end
