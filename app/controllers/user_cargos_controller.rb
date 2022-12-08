class UserCargosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_method
    before_action :authorized
    def index
        user_id = decoded_token[0]['user_id']
        user = User.find(user_id)
        userCargo = user.user_cargos
        render json: userCargo
    end

    def create
        user_id = decoded_token[0]['user_id']
        cargo_amount = CargoShip.find(params[:cargo_ship_id]).rate_per_cargo
        total_amount = cargo_amount * params[:count]
        user_cargo = UserCargo.create!(user_id: user_id, cargo_ship_id: params[:cargo_ship_id], count: params[:count], amount: total_amount)
        render json: user_cargo, status: :created
    end

    def update
        user_id = decoded_token[0]['user_id']
        cargo_ship = UserCargo.find_by!(id: params[:id], user_id: user_id)
        cargo_amount = CargoShip.find(params[:cargo_ship_id]).rate_per_cargo
        total_amount = cargo_amount * params[:count]
        cargo_ship.update!(count: params[:count], amount: total_amount)
        render json: cargo_ship, status: :accepted
    end

    def destroy
        user_id = decoded_token[0]['user_id']
        cargo_ship = UserCargo.find_by!(id: params[:id], user_id: user_id)
        cargo_ship.destroy
        head :no_content
    end
    private
    def record_not_found_method
        render json: { error: "Cargo Not Found" }, status: :not_found
    end
end
