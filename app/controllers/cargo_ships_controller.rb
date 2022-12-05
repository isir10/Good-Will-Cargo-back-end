class CargoShipsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_method
    def index
        render json: CargoShip.all
    end
    def show
        render json: CargoShip.find(params[:id])
    end
    def update
        cargo_ship = CargoShip.find(params[:id])
        cargo_ship.update!(cargo_ship_params)
        render json: cargo_ship, status: :accepted
    end
    private
    def record_not_found_method
        render json: { error: "Cargo-ship Not Found" }, status: :not_found
    end
    def cargo_ship_params
        params.permit(:remaining)
    end

end
