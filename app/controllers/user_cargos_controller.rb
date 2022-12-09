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
        cargo_ship = CargoShip.find(params[:cargo_ship_id])
        cargo_amount = cargo_ship.rate_per_cargo
        total_amount = cargo_amount.to_i * params[:count].to_i
        cargo_ship.update(remaining: (cargo_ship.remaining.to_i - params[:count].to_i))
        total_amount = cargo_amount.to_i * params[:count].to_i
        user_cargo = UserCargo.create!(user_id: user_id, cargo_ship_id: params[:cargo_ship_id], count: params[:count], amount: total_amount)
        render json: user_cargo, status: :created
    end

    def update
        user_id = decoded_token[0]['user_id']
        user_cargo = UserCargo.find_by!(id: params[:id], user_id: user_id)
        cargo_ship = CargoShip.find(params[:cargo_ship_id])
        cargo_amount = cargo_ship.rate_per_cargo
        total_amount = cargo_amount.to_i * params[:count].to_i 
        cargo_ship.update(remaining: (cargo_ship.remaining.to_i - (cargo_ship.remaining.to_i - params[:count].to_i)))
        user_cargo.update!(count: params[:count], amount: total_amount)
        render json: user_cargo, status: :accepted
    end

    def destroy
        user_id = decoded_token[0]['user_id']
        user_cargo = UserCargo.find_by!(id: params[:id], user_id: user_id)
        cargo_ship user_cargo.cargo_ship
        cargo_ship.update(remaining: (cargo_ship.remaining.to_i) - user_cargo.count.to_i)
        user_cargo.destroy
        head :no_content
    end
    private
    def record_not_found_method
        render json: { error: "Cargo Not Found" }, status: :not_found
    end
end
