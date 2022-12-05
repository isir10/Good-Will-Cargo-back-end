class UserCargosController < ApplicationController
    before_action :authorize
    def index
        user  = User.find(session[:user_id]) 
        userCargo = user.userCargos
        cargo_ships = user.cargo_ships
        render json: {cargo: userCargo, cargo_ships: cargo_ships}
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
