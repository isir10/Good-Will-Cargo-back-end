class UserCargosController < ApplicationController
    before_action :authorize
    def index
        user  = User.find(session[:user_id]) 
        userCargo = user.user_cargos
        cargo_ships = user.cargo_ships
        render json: {cargo: userCargo, cargo_ships: cargo_ships}
    end

    def create
        user_cargo = UserCargo.create!(user_id: session[:user_id], cargo_ship_id: params[:cargo_ship_id], count: params[:count], params[:amount])
        render json: {cargo: user_cargo}, status: :created
    end

    def update
        cargo_ship = UserCargo.find(params[:id])
        cargo_ship.update!(cargo_ship_params)
        render json: cargo_ship, status: :accepted
    end
    
    private
    def authorize
        return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
end
