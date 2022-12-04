class CargoShipsController < ApplicationController
    def index
        render json: CargoShips.all
    end
    def show
        render json: CargoShips.find(params[:id])
    end
end
