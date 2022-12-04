class CargoShipsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_method
    def index
        render json: CargoShip.all
    end
    def show
        render json: CargoShip.find(params[:id])
    end
    private
    def record_not_found_method
        render json: { error: "Cargo-ship Not Found" }, status: :not_found
    end
end
